package com.scorpio.aspectj.aspects;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

/**
 * Aspect for {@link javax.servlet.http.HttpServlet#service(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)}
 *
 * @author scorpio
 * @version 1.0.0
 */
@SuppressWarnings("JavadocReference")
@Aspect
public class HttpServletLogAspect extends BaseLogAspect {


  public static final String EXECUTION_FOR_HTTPSERVLET = "execution(* javax.servlet.http.HttpServlet+.service(javax.servlet.http.HttpServletRequest,javax.servlet.http.HttpServletResponse))";


  /**
   * 拦截点
   */
  @Pointcut(EXECUTION_FOR_HTTPSERVLET)
  void pointcut() {
  }

}
