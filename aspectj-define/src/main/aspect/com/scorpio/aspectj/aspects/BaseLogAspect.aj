package com.scorpio.aspectj.aspects;

import com.scorpio.aspectj.service.JoinPointHandler;
import com.scorpio.aspectj.service.JoinPointHandlers;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

/**
 * 定义切面的基类,子类可以通过{@link #condition()}和 {@link #scope()}组合匹配拦截
 * @author scorpio
 * @version 1.0.0
 * @email tengzhe.ln@alibaba-inc.com
 */
@Aspect
public abstract class BaseLogAspect {

  public static final String POINTCUT_TO_SKIP = "!within(org.aspectj.*)&&!within(com.scorpio.aspectj.aspects..*)&&!within(*..*$$EnhancerBy*CGLIB$$*)&&!within(com.sun.proxy.$Proxy*)";

  /**
   * 所有的方法执行
   */
  public static final String EXECUTION_ALL_METHODS = "execution(* *(..))";


  /**
   * 需要排除的切入点
   */
  @Pointcut(POINTCUT_TO_SKIP)
  void skipProxy() {
  }

  /**
   * 指定拦截条件,默认不匹配
   */
  @Pointcut
  void condition() {
  }


  /**
   * 指定拦截范围,默认不匹配
   */
  @Pointcut
  void scope() {
  }


  /**
   * 拦截点
   */
  @Pointcut("scope()&&condition()&&skipProxy()")
  void pointcut() {
  }


  /**
   * 子类覆写该方法时不需要指定{@link Around}注解
   * @param joinPoint
   * @return
   * @throws Throwable
   */
  @Around("pointcut()")
  public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
    JoinPointHandler jointHandler = JoinPointHandlers.getJointHandler(this.getClass());
    if (jointHandler != null) {
      return jointHandler.apply(joinPoint);
    }
    return joinPoint.proceed();
  }

}
