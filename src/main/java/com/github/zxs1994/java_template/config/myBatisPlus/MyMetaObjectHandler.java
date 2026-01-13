package com.github.zxs1994.java_template.config.myBatisPlus;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;

import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.OffsetDateTime;

@Component
public class MyMetaObjectHandler implements MetaObjectHandler {

    @Override
    public void insertFill(MetaObject metaObject) {
        OffsetDateTime now = OffsetDateTime.now();
        // 无论是否传值，都覆盖
        this.setFieldValByName("createdAt", now, metaObject);
        this.setFieldValByName("updatedAt", now, metaObject);
        this.setFieldValByName("deleted", false, metaObject);

        if (metaObject.hasGetter("id") && metaObject.getValue("id") != null) {
            System.out.println("插入具有预设 ID 的实体, id= " + metaObject.getValue("id"));
        }
    }

    @Override
    public void updateFill(MetaObject metaObject) {
        OffsetDateTime now = OffsetDateTime.now();
        // 无论是否传值，都覆盖
        this.setFieldValByName("updatedAt", now, metaObject);
    }
}
