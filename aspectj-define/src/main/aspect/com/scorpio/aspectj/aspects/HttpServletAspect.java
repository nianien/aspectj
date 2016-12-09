package com.scorpio.aspectj.aspects;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

/**
 * 拦截{@link javax.servlet.http.HttpServlet}及其子类方法
 *
 * @author scorpio
 * @version 1.0.0
 */
@SuppressWarnings("JavadocReference")
@Aspect
public abstract class HttpServletAspect {

  public static final String POINTCUT_ON_SERVLET = "execution(*(javax.servlet.http.HttpServlet+).*(..))";


  @Pointcut(POINTCUT_ON_SERVLET)
  final void scope() {
  }

}
