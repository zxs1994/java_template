package com.github.zxs1994.java_template.service.impl;

import com.github.zxs1994.java_template.cache.SysPermissionCache;
import com.github.zxs1994.java_template.config.AuthLevelResolver;
import com.github.zxs1994.java_template.enums.AuthLevel;
import com.github.zxs1994.java_template.util.SysPermissionMatcher;
import com.github.zxs1994.java_template.vo.SysPermissionTreeNode;
import com.github.zxs1994.java_template.entity.SysPermission;
import com.github.zxs1994.java_template.mapper.SysPermissionMapper;
import com.github.zxs1994.java_template.service.ISysPermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * <p>
 * 系统--权限表 服务实现类
 * </p>
 *
 * @author xusheng
 * @since 2026-01-10 01:41:52
 */
@RequiredArgsConstructor
@Service
public class SysPermissionServiceImpl extends ServiceImpl<SysPermissionMapper, SysPermission> implements ISysPermissionService {

    private final SysPermissionMapper sysPermissionMapper;
    private final SysPermissionCache sysPermissionCache;
    private final AuthLevelResolver authLevelResolver;

    @Override
    public List<SysPermissionTreeNode> getPermissionTree() {

        // 1️⃣ 查询所有权限
        List<SysPermission> permissions = sysPermissionCache.listAll();

        // 2️⃣ 转成 nodeMap（id -> node）
        Map<Long, SysPermissionTreeNode> nodeMap = getTreeNodeMap(permissions);

        // 3️⃣ 组装成树
        List<SysPermissionTreeNode> roots = new ArrayList<>();

        for (SysPermission p : permissions) {
            SysPermissionTreeNode current = nodeMap.get(p.getId());

            Long parentId = p.getParentId();
            if (parentId == null || parentId == 0) {
                // 顶级节点
                roots.add(current);
            } else {
                SysPermissionTreeNode parent = nodeMap.get(parentId);
                if (parent != null) {
                    parent.getChildren().add(current);
                }
            }
        }

        return roots;
    }

    @Override
    public List<String> getCodesByUserId(Long userId) {

        List<SysPermission> userPermissions =
                sysPermissionMapper.selectByUserId(userId);

        List<SysPermission> allPermissions =
                sysPermissionCache.listAll();

        Set<String> result = new HashSet<>();

        for (SysPermission userPerm : userPermissions) {
            for (SysPermission perm : allPermissions) {
                // 只给前端用的，必须有 code
                if (perm.getCode() == null || perm.getCode().isBlank()) {
                    continue;
                }

                AuthLevel authLevel = authLevelResolver.resolve(perm.getPath());
                if (authLevel == AuthLevel.WHITELIST || authLevel == AuthLevel.LOGIN_ONLY) {
                    // permission.code = 授权能力 不是 是否可使用功能, 所以这些code不用给前端
                    continue;
                }

                // ⭐ 核心：权限规则匹配
                if (SysPermissionMatcher.cover(userPerm, perm)) {
                    result.add(perm.getCode());
                }
            }
        }

        return new ArrayList<>(result);
    }

    private static Map<Long, SysPermissionTreeNode> getTreeNodeMap(List<SysPermission> permissions) {
        Map<Long, SysPermissionTreeNode> nodeMap = new LinkedHashMap<>();

        for (SysPermission p : permissions) {
            SysPermissionTreeNode node = new SysPermissionTreeNode();
            BeanUtils.copyProperties(p, node);

            nodeMap.put(p.getId(), node);
        }
        return nodeMap;
    }
}
