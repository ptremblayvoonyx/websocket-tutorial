
package ca.voonyx.sepaq.pubsub.web.config;

import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan
public class MvcConfig extends WebMvcConfigurerAdapter/* implements WebSocketConfigurer */ {

    // @Override
    // public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
    // super.configureDefaultServletHandling(configurer);
    // configurer.enable(); // so static files (html, js) will not be considered as REST resources.
    // }
    //
    // @Override
    // public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
    // // see https://groups.google.com/forum/#!topic/atmosphere-framework/uZOrfXl3Bu8
    // converters.add(new MappingJackson2HttpMessageConverter() {
    //
    // @Override
    // protected void writeInternal(Object object, HttpOutputMessage outputMessage)
    // throws IOException, HttpMessageNotWritableException {
    // outputMessage.getHeaders().setContentType(MediaType.APPLICATION_JSON);
    // super.writeInternal(object, outputMessage);
    // }
    // });
    // }
    //
    // @Override
    // public void addArgumentResolvers(
    // List<HandlerMethodArgumentResolver> argumentResolvers) {
    // argumentResolvers.add(new HandlerMethodArgumentResolver() {
    //
    // @Override
    // public boolean supportsParameter(MethodParameter parameter) {
    // return AtmosphereResource.class.isAssignableFrom(parameter.getParameterType());
    // }
    //
    // @Override
    // public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
    // NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
    //
    // Meteor m = Meteor.build(webRequest.getNativeRequest(HttpServletRequest.class));
    // if (m.transport() == TRANSPORT.LONG_POLLING) {
    // m.resumeOnBroadcast(true).suspend(-1);
    // } else {
    // m.suspend(-1);
    // }
    // AtmosphereResource resource = m.getAtmosphereResource();
    // return resource;
    //
    // }
    // });
    // }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**")
                .addResourceLocations("/resources/").setCachePeriod(31556926);
    }

    @Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
        LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
        localeChangeInterceptor.setParamName("locale");
        return localeChangeInterceptor;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(localeChangeInterceptor());
    }

    @Bean(name = "localeResolver")
    public LocaleResolver sessionLocaleResolver() {
        SessionLocaleResolver localeResolver = new SessionLocaleResolver();
        localeResolver.setDefaultLocale(new Locale("fr"));

        return localeResolver;
    }

    @Bean
    public MessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
        messageSource.setBasename("/WEB-INF/i18n/messages");
        return messageSource;
    }

    @Bean
    public InternalResourceViewResolver configureInternalResourceViewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }
}