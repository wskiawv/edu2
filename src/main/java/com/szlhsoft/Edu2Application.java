package com.szlhsoft;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;
@EnableScheduling
@SpringBootApplication
@EnableAutoConfiguration
@EnableTransactionManagement
public class Edu2Application   {
	public static void main(String[] args) {
		SpringApplication.run(Edu2Application.class, args);
	}
}
