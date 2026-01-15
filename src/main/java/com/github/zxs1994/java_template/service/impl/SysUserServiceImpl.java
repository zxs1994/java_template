package com.github.zxs1994.java_template.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.github.zxs1994.java_template.common.BizException;
import com.github.zxs1994.java_template.dto.LoginDTO;
import com.github.zxs1994.java_template.vo.LoginVO;
import com.github.zxs1994.java_template.entity.SysUser;
import com.github.zxs1994.java_template.mapper.SysUserMapper;
import com.github.zxs1994.java_template.service.ISysUserService;
import com.github.zxs1994.java_template.config.security.jwt.JwtUtils;
import com.github.zxs1994.java_template.service.SystemProtectService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 系统--用户表 服务实现类
 * </p>
 *
 * @author xusheng
 * @since 2026-01-10 01:41:52
 */
@RequiredArgsConstructor
@Service
public class SysUserServiceImpl extends SystemProtectService<SysUserMapper, SysUser> implements ISysUserService {

    private final PasswordEncoder passwordEncoder;
    private final JwtUtils jwtUtils;

    public LoginVO login(LoginDTO req) {
        System.out.println(req.toString());
        QueryWrapper<SysUser> wrapper = new QueryWrapper<>();
        wrapper.eq("email", req.getEmail());
        SysUser sysUser = getOne(wrapper, false);
        if(sysUser == null || !passwordEncoder.matches(req.getPassword(), sysUser.getPassword())) {
            // 登录失败，抛业务异常
            throw new BizException(400, "邮箱或密码错误");
        }
        // 登录成功后

        // 1️⃣ tokenVersion 自增（数据库）
        increaseTokenVersion(sysUser.getId());
        // 2️⃣ 内存同步
        sysUser.setTokenVersion(sysUser.getTokenVersion() + 1);
        // 3️⃣ 生成 token
        String token = jwtUtils.generateToken(sysUser);

        LoginVO res = new LoginVO();
        res.setToken(token);
        return res;
    }

    @Override
    public boolean save(SysUser sysUser) {
        validateEmail(sysUser.getEmail());
        checkEmailDuplicate(sysUser.getEmail(), null);
        validatePassword(sysUser.getPassword());

        sysUser.setPassword(passwordEncoder.encode(sysUser.getPassword()));

        return super.save(sysUser);
    }

    @Override
    public boolean updateById(SysUser sysUser) {
        sysUser.setPassword(null);
        String email = sysUser.getEmail();
        // 1️⃣ 校验 email
        if (email != null) {
            validateEmail(sysUser.getEmail());
            checkEmailDuplicate(email, sysUser.getId());
        }

        // 如果密码不为空，才加密更新
        if (sysUser.getPassword() != null && !sysUser.getPassword().isBlank()) {
            validatePassword(sysUser.getPassword());
            sysUser.setPassword(passwordEncoder.encode(sysUser.getPassword()));
        } else {
            sysUser.setPassword(null); // 保持原密码
        }

        return super.updateById(sysUser);
    }


    private void validateEmail(String email) {
        if (email == null || email.isBlank()) {
            throw new BizException(400, "邮箱不能为空");
        }
        if (!email.matches("^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$")) {
            throw new BizException(400, "邮箱格式不正确");
        }
    }

    private void checkEmailDuplicate(String email, Long excludeId) {
        boolean exists = this.lambdaQuery()
                .eq(SysUser::getEmail, email)
                .ne(excludeId != null, SysUser::getId, excludeId)
                .exists();
        if (exists) {
            throw new BizException(400, "该邮箱已被注册");
        }
    }

    private void validatePassword(String password) {
        if (password == null || password.isBlank()) {
            throw new BizException(400, "密码不能为空");
        }
        if (password.length() < 6) {
            throw new BizException(400, "密码长度不能少于6位");
        }
    }

    public void increaseTokenVersion(Long userId) {
        baseMapper.update(
                null,
                new UpdateWrapper<SysUser>()
                        .eq("id", userId)
                        .setSql("token_version = token_version + 1")
        );
    }
}
