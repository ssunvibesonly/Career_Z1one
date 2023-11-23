package boot.last.project;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Component;

@ComponentScan("boot.data.*")
@ComponentScan("boot.last.project")
@MapperScan("boot.data.mapper")
@EnableAsync(proxyTargetClass=true)
@SpringBootApplication
public class FinalProjeceZ1oneApplication {

	public static void main(String[] args) {
		SpringApplication.run(FinalProjeceZ1oneApplication.class, args);
	}

}
