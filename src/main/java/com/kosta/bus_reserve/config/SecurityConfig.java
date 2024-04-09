package com.kosta.bus_reserve.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter{

    @Bean
    public BCryptPasswordEncoder encoder(){
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable();    //CSRF 보호 비활성화
        http.authorizeRequests()  //요청에 관한 인증규칙 정의
                .antMatchers("/mypage/**").access("hasRole('ROLE_MEMBER')")  //url 패턴에 따른 권한(member) 설정
                .antMatchers("/manager/**").access("hasRole('ROLE_ADMIN')")  //url 패턴에 따른 권한(admin) 설정
                .anyRequest().permitAll()  //다른 모든 요청은 모든 사용자 허용

                .and()
                .formLogin()
                .loginPage("/member/login") //사용자가 인증되지 않은 경우 로그인 폼으로 이동
                .loginProcessingUrl("/login")  //로그인 창에 입력한 데이터 처리
                .defaultSuccessUrl("/reserve/reserve_main"); //로그인 성공후 이동할 페이지

    }
}
