package com.scorpio.aspectj.aspects;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

/**
 * Aspect for {@link javax.servlet.Servlet#service(javax.servlet.ServletRequest, javax.servlet.ServletResponse)}
 *
 * @author scorpio
 * @version 1.0.0
 */
@Aspect
@SuppressWarnings("JavadocReference")
public class ServletLogAspect extends BaseLogAspect {

  public static final String EXECUTION_FOR_SERVLET =
          "execution(* javax.servlet.Servlet+.service(javax.servlet.ServletRequest,javax.servlet.ServletResponse))";


  /**
   * pointcut {@link javax.servlet.Servlet#service(ServletRequest, ServletResponse)}
   */
  @Override
  @Pointcut(EXECUTION_FOR_SERVLET)
  void pointcut() {
  }

}
