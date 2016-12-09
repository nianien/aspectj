package com.scorpio.aspectj.aspects;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

/**
 * 拦截{@link javax.servlet.Servlet}及其子类方法
 *
 * @author scorpio
 * @version 1.0.0
 */
@Aspect
@SuppressWarnings("JavadocReference")
public class ServletAspect {

  public static final String POINTCUT_ON_SERVLET = "execution(*(javax.servlet.Servlet+).*(..))";


  @Pointcut(POINTCUT_ON_SERVLET)
  void scope() {
  }


}
