package com.scorpio.aspectj.aspects;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

/**
 * Aspect for {@link javax.servlet.Filter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)}
 *
 * @author scorpio
 * @version 1.0.0
 */
@Aspect
@SuppressWarnings("JavadocReference")
public class FilterLogAspect extends BaseLogAspect {

  public static final String EXECUTION_FOR_FILTER =
          "execution(* javax.servlet.Filter+.doFilter(javax.servlet.ServletRequest,javax.servlet.ServletResponse,javax.servlet.FilterChain))";


  /**
   * Aspect for
   */
  @Override
  @Pointcut(EXECUTION_FOR_FILTER)
  void pointcut() {
  }

}
