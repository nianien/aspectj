package com.scorpio.aspectj.aspects;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

/**
 * 针对声明{@link com.scorpio.aspectj.annotations.Loggable}注解的方法实现切面<br/>
 * 子类通过{@link #condition()}进行附加拦截条件
 * @author scorpio
 * @version 1.0.0
 * @email tengzhe.ln@alibaba-inc.com
 */
@Aspect
public abstract class AnnotationLogAspect extends BaseLogAspect {

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


}
