package com.github.zxs1994.java_template.util;

import com.github.zxs1994.java_template.entity.SysPermission;
import org.springframework.util.AntPathMatcher;

import java.util.List;
import java.util.Optional;

public class SysPermissionMatcher {

    private static final AntPathMatcher antPathMatcher = new AntPathMatcher();

    /**
     * 匹配权限规则：
     * 1️⃣ 尝试精确匹配请求的 method + path
     * 2️⃣ 如果没有匹配到，再尝试全局通配规则（如 /**）
     */
    public static SysPermission matchExactThenGlobal(List<SysPermission> allPermissions, String method, String path) {

        // 1️⃣ 尝试精确匹配（不包含通配符）
        SysPermission exact = allPermissions.stream()
                .filter(p -> !p.getPath().contains("*") && antPathMatcher.match(p.getPath(), path))
                .findFirst().orElse(null);

        if (exact != null) return exact;

        // 通配符匹配
        return allPermissions.stream()
                .filter(p -> p.getMethod().equalsIgnoreCase(method) && antPathMatcher.match(p.getPath(), path))
                .findFirst().orElse(null);
    }

    /**
     * 用于请求鉴权
     */
    public static boolean match(SysPermission rule, String method, String path) {

        // 方法匹配
        if (!"*".equals(rule.getMethod())
                && !rule.getMethod().equalsIgnoreCase(method)) {
            return false;
        }

        // 路径匹配（/** 覆盖一切）
        return antPathMatcher.match(rule.getPath(), path);
    }

    /**
     * rule 是否覆盖 target（仅用于权限模型推导，不用于请求鉴权）
     */
    public static boolean cover(SysPermission rule, SysPermission target) {

        // method 覆盖
        if (!"*".equals(rule.getMethod())
                && !rule.getMethod().equalsIgnoreCase(target.getMethod())) {
            return false;
        }

        // path 覆盖：rule 必须更“宽”
        if (rule.getPath().equals(target.getPath())) {
            return true;
        }

        // 只有 rule 是 /** 或 /xxx/** 这种，才允许覆盖
        if (rule.getPath().endsWith("/**")) {
            return antPathMatcher.match(rule.getPath(), target.getPath());
        }

        return false;
    }
}
