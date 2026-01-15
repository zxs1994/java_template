package com.github.zxs1994.java_template.service;

import com.github.zxs1994.java_template.dto.LoginDTO;
import com.github.zxs1994.java_template.vo.LoginVO;
import com.github.zxs1994.java_template.entity.SysUser;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 系统--用户表 服务类
 * </p>
 *
 * @author xusheng
 * @since 2026-01-10 01:41:52
 */
public interface ISysUserService extends IService<SysUser> {
    LoginVO login(LoginDTO req);
}
