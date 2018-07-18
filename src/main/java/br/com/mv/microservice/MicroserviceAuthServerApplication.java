package br.com.mv.microservice;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class MicroserviceAuthServerApplication {

	public static void main(String[] args) {
		SpringApplication.run(MicroserviceAuthServerApplication.class, args);
	}
}
