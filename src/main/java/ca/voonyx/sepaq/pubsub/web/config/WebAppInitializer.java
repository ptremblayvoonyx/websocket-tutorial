package ca.voonyx.sepaq.pubsub.web.config;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

public class WebAppInitializer implements WebApplicationInitializer {

    private static final String SPRING_PROFILES_DEFAULT = "dev";
    private static final String BASE_PACKAGE_TO_SCAN = "ca.voonyx.sepaq.pubsub";

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {

        AnnotationConfigWebApplicationContext mvcContext = new AnnotationConfigWebApplicationContext();
        mvcContext.scan(BASE_PACKAGE_TO_SCAN);
        mvcContext.register(MvcConfig.class);
        mvcContext.register(SecurityConfig.class);

        servletContext.addListener(new ContextLoaderListener(mvcContext));
        servletContext.setInitParameter("spring.profiles.default", SPRING_PROFILES_DEFAULT);
        servletContext.setInitParameter("spring.liveBeansView.mbeanDomain", SPRING_PROFILES_DEFAULT);

        ServletRegistration.Dynamic dispatcherServlet = servletContext.addServlet(
                "dispatcher", new DispatcherServlet(mvcContext));

        // AnnotationConfigWebApplicationContext dispatcherContext = new AnnotationConfigWebApplicationContext();

        // spring servlet, wrapped by atmosphere
        // Dynamic servlet = servletContext.addServlet("spring-atmosphere",
        // new MeteorServlet(new DispatcherServlet(mvcContext), "/"));
        // servlet.setAsyncSupported(true);

        // servlet.setInitParameter(org.atmosphere.cpr.ApplicationConfig.BROADCASTER_CLASS,
        // DefaultBroadcaster.class.getName());
        // servlet.setInitParameter(org.atmosphere.cpr.ApplicationConfig.DEFAULT_CONTENT_TYPE, "application/json");
        // servlet.setInitParameter(org.atmosphere.cpr.ApplicationConfig.NO_CACHE_HEADERS, "true");
        // servlet.setInitParameter(org.atmosphere.cpr.ApplicationConfig.JSR356_MAPPING_PATH, "/sprint-atmosphere");

        dispatcherServlet.setLoadOnStartup(1);
        dispatcherServlet.addMapping("/");

    }

}
