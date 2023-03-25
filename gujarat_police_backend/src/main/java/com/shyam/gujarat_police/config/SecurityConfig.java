package com.shyam.gujarat_police.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    private static final String[] AUTH_WHITELIST = {
            "/v2/api-docs", "/swagger-resources", "/swagger-resources/**", "/**"
    };

    @Bean
    ApplicationFilter corsFilter() {
        ApplicationFilter filter = new ApplicationFilter();
        return filter;
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
//        http.authorizeRequests()
//                .mvcMatchers(HttpMethod.GET, "/api/menu/items/**").permitAll() // GET requests don't need auth
//                .anyRequest()
//                .authenticated()
//                .and()
//                .oauth2ResourceServer()
//                .jwt();
//        http.authorizeRequests().antMatchers("/**").permitAll();
        http.csrf().disable().authorizeRequests()
                .antMatchers(AUTH_WHITELIST).permitAll()
                .antMatchers("/csrf").permitAll()
                .anyRequest().authenticated();
    }
}
