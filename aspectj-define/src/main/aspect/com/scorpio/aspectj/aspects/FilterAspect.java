package com.scorpio.aspectj.aspects;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

/**
 * 拦截{@link javax.servlet.Filter}及其子类方法
 *
 * @author scorpio
 * @version 1.0.0
 */
@Aspect
@SuppressWarnings("JavadocReference")
public abstract class FilterAspect {

  public static final String POINTCUT_ON_FILTER = "execution(*(javax.servlet.Filter+).*(..))";


  @Pointcut(POINTCUT_ON_FILTER)
  final void scope() {
  }


}
