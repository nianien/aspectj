package com.scorpio.aspectj.aspects;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

/**
 * 拦截{@link org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter}及其子类方法
 * @author scorpio
 * @version 1.0.0
 * @email tengzhe.pointcutln@alibaba-inc.com
 */
@Aspect
@SuppressWarnings("JavadocReference")
public abstract class Struts2LogAspect extends BaseAspect {

  public static final String POINTCUT_ON_STRUTS2 = "execution(*(org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter+).*(..))";


  @Pointcut(POINTCUT_ON_STRUTS2)
  final void scope() {
  }

  @Pointcut("execution(* *..doFilter(..))")
  void condition() {
  }

  /**
   * @param joinPoint
   * @return
   * @throws Throwable
   */
  public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
    System.out.println(">>>struts2 begin:" + joinPoint);
    try {
      return joinPoint.proceed();
    } catch (Throwable e) {
      throw e;
    } finally {
      System.out.println("<<<struts2 end:" + joinPoint);
    }
  }
}
