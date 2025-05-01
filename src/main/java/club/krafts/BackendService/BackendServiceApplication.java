package club.krafts.BackendService;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication
public class BackendServiceApplication {

	public static void main(String[] args) {
		SpringApplication.run(BackendServiceApplication.class, args);
	}

}
