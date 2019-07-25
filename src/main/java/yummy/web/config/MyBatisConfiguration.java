package yummy.web.config;

import com.github.pagehelper.PageHelper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Properties;

@Configuration
public class MyBatisConfiguration {
	
	/*
	@Bean
	public SqlSessionFactory sqlSessionFactoryBean(DataSource dataSource) throws Exception {
		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(dataSource);
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
		Interceptor[] plugins =  new Interceptor[]{pageHelper()};
		sqlSessionFactoryBean.setPlugins(plugins);
		// 指定mybatisxml文件路径
	   sqlSessionFactoryBean.setMapperLocations(resolver
				.getResources("classpath:/mybatis/*.xml"));
		return sqlSessionFactoryBean.getObject();
	}
	*/

	
	
	/**
	 * 注册MyBatis分页插件PageHelper
	 * @return
     * */
	// 因已使用springboot start的方式集成pagehelper 这部分工作pagehelper-spring-boot-starter帮你做了,所以不需要我们自己配置pagehelper了
//	@Bean
//    public PageHelper pageHelper() {
//		System.out.println("MyBatisConfiguration.pageHelper()");
//        PageHelper pageHelper = new PageHelper();
//        Properties p = new Properties();
//        //offsetAsPageNum：默认值为 false，该参数对使用 RowBounds 作为分页参数时有效。 当该参数设置为 true 时，会将 RowBounds 中的 offset 参数当成 pageNum 使用，可以用页码和页面大小两个参数进行分页
//        p.setProperty("offsetAsPageNum", "true");
//
//        //rowBoundsWithCount：默认值为false，该参数对使用 RowBounds 作为分页参数时有效。 当该参数设置为true时，使用 RowBounds 分页会进行 count 查询
//        p.setProperty("rowBoundsWithCount", "true");
//
//        //reasonable：分页合理化参数，默认值为false。当该参数设置为 true 时，pageNum<=0 时会查询第一页， pageNum>pages（超过总数时），会查询最后一页。默认false 时，直接根据参数进行查询
//        p.setProperty("reasonable", "true");
//        pageHelper.setProperties(p);
//        return pageHelper;
//    }


}
