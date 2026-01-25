package com.github.zxs1994.java_template.cache;

import com.github.zxs1994.java_template.config.ProjectProperties;
import com.github.zxs1994.java_template.util.EnumUtils;
import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Slf4j
@Component
@RequiredArgsConstructor
public class EnumCache {

    private Map<String, List<Map<String, Object>>> enumCache;

    private final ProjectProperties projectProperties;

    @PostConstruct
    public void init() {
        this.enumCache = EnumUtils.loadAllEnums(
                STR."\{projectProperties.getBasePackage()}.enums"
        );
        log.info("enum cache init success");
    }

    public Map<String, List<Map<String, Object>>> getAll() {
        return enumCache;
    }
}
