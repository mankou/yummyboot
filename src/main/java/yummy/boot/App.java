package yummy.boot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {
		"com.sky.blue.web",
        "yummy.boot"
})
public class App {
	public static void main(String[] args) {
		SpringApplication.run(App.class, args);
	}
}
