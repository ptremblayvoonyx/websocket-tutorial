package ca.voonyx.sepaq.pubsub.web.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        // http.csrf().disable();

        http.exceptionHandling().accessDeniedPage("/errors/403");

        http.authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/resources/**").permitAll()
                .antMatchers("/errors/**").permitAll()
                .antMatchers("/todo/**").hasRole("USER")
                .anyRequest().authenticated()
                .and()
                .formLogin().loginPage("/login").permitAll().defaultSuccessUrl("/todo/list")
                .and()
                .logout().logoutUrl("/logout").logoutSuccessUrl("/login?logout").permitAll().invalidateHttpSession(true)
                .and()
                .exceptionHandling().accessDeniedPage("/errors/403");
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .inMemoryAuthentication()
                .withUser("patrick").password("bonjour").roles("ADMIN", "USER").and()
                .withUser("rejean").password("bonjour").roles("USER");
    }
}
