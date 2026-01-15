package com.github.zxs1994.java_template.vo;

import com.github.zxs1994.java_template.entity.SysPermission;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.util.ArrayList;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@Data
public class SysPermissionTreeNode extends SysPermission {

    @Schema(description = "🌿树枝", example = "[]")
    private List<SysPermissionTreeNode> children = new ArrayList<>();
}
