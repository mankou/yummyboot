# 说明
 * 创建于2018.06.26
 * 用于演示springboot与mybatis的整合,并且使用xml的方式使用mybatis

# 相关软件说明
 * jdk 1.8
 * springboot 1.5.13.RELEASE
 

# 运行方式
 * 在application.yml中配置数据库连接串
 * 运行测试类 UserTest类即可,工程启动时会自动刷sql,并在测试方法中模拟http请求 向controller发起请求 测试controller
 
 

# 关于分页插件的说明
 * 有2种集成pagehelper插件的方式 
 * 一种是直接依赖pagehelper插件,然后自己添加配置类@Bean配置pagehelper 这种方式试用于任何基于spring的工程  目前该代码我整理在 demo-pagehelper-spring 分支中
 * 另一种是基于pagehelper-spring-boot-starter, 其专门是什对springboot工程的,目前我的工程采用这种方式,所以可直接在master分支中看到.
