package com.github.zxs1994.java_template.controller;

import com.github.zxs1994.java_template.dto.LoginDTO;
import com.github.zxs1994.java_template.vo.LoginVO;
import com.github.zxs1994.java_template.service.ISysUserService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * AuthController 登录/认证接口
 * </p>
 *
 * @author xusheng
 * @since 2026-01-05
 */
@RequiredArgsConstructor
@RestController
@RequestMapping("/auth")
@Tag(name = "认证", description = "登录/认证接口")
public class AuthController {

    private final ISysUserService sysUserService;

    @PostMapping("/login")
    @Operation(summary = "用户登录")
    public LoginVO login(@RequestBody LoginDTO req) {
        return sysUserService.login(req);
    }

    // 如果未来需要，可以加：
    // @PostMapping("/logout") ...
    // @PostMapping("/refresh-token") ...
}
