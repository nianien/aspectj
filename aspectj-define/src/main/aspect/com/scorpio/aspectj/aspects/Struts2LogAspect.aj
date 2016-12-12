package com.scorpio.aspectj.aspects;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

/**
 *Aspect for
 *
 *
 *
 *
 *
 *
 *
 * {@link org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter#doFilter(javax.servlet.ServletRequest, javax.servlet.ServletResponse, javax.servlet.FilterChain)}
 * @author scorpio
 * @version 1.0.0
 * @email tengzhe.pointcutln@alibaba-inc.com
 */
@Aspect
@SuppressWarnings("JavadocReference")
public class Struts2LogAspect extends BaseLogAspect {

  public static final String EXECUTION_FOR_STRUTS2 = "execution(* org.apache.struts2.dispatcher.ng.filter.*+.doFilter(javax.servlet.ServletRequest,javax.servlet.ServletResponse,javax.servlet.FilterChain))";


  @Pointcut(EXECUTION_FOR_STRUTS2)
  void pointcut() {
  }

}
