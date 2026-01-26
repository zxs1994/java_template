# 使用 Java 21 JDK alpine 轻量镜像
FROM eclipse-temurin:21-jdk-alpine

# 设置工作目录
WORKDIR /app

# 复制打包好的 jar 文件（带版本号）并统一重命名
COPY target/*.jar app.jar

# 暴露端口（和 Spring Boot 配置一致）
EXPOSE 8088

# 启动命令
CMD ["java", "-jar", "app.jar"]