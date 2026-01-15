package com.github.zxs1994.java_template.cache;

import com.github.zxs1994.java_template.entity.SysPermission;
import com.github.zxs1994.java_template.mapper.SysPermissionMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@RequiredArgsConstructor
public class SysPermissionCache {

    private final SysPermissionMapper sysPermissionMapper;
    /**
     * 所有启用的权限（不可变快照）
     */
    private volatile List<SysPermission> allPermissions;

    public void reload() {
        this.allPermissions = sysPermissionMapper.selectList(null);
    }

    /**
     * 给 Service / 前端用
     */
    public List<SysPermission> listAll() {
        return allPermissions;
    }
}
