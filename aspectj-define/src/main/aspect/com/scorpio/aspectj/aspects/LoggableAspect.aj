package com.scorpio.aspectj.aspects;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

/**
 * 需要添加{@link com.scorpio.aspectj.annotations.Loggable}注解实现日志AOP
 * @author scorpio
 * @version 1.0.0
 * @email tengzhe.ln@alibaba-inc.com
 */
@Aspect
public abstract class LoggableAspect extends BaseAspect {

  public static final String POINTCUT_LOGGABLE = "execution(@*..Loggable * *(..))||execution(* (@*..Loggable *).*(..))";
  public static final String POINTCUT_LOGOFF = "within(@*..LogOff *)||execution(@*..LogOff * *(..))";


  /**
   * <ul>
   *   <li>方法被<code>@Loggable</code>注解</li>
   *   <li>方法所属类型被<code>@Loggable</code>注解</li>
   * </ul>
   *
   */
  @Pointcut(POINTCUT_LOGGABLE)
  final void loggable() {
  }


  /**
   * 方法获取类型未被<code>@LogOff</code>注解
   */
  @Pointcut(POINTCUT_LOGOFF)
  final void logOff() {
  }

  @Pointcut("loggable()&&!logOff()")
  final void scope() {
  }

  /**
   * 这里只拦截方法执行,包括构造方法
   * @param joinPoint
   * @return
   * @throws Throwable
   */
  public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
    System.out.println(">>>begin:" + joinPoint);
    try {
      return joinPoint.proceed();
    } catch (Throwable e) {
      throw e;
    } finally {
      System.out.println("<<<end:" + joinPoint);
    }
  }


}
