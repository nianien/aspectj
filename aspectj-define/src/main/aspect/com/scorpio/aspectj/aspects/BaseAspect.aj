package com.scorpio.aspectj.aspects;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

/**
 * 切面基类,提供了几个配置Pointcut的入口<br/>
 * <ol>
 *   <li>condition用于XML配置</li>
 *   <li>scope用于子类配置</li>
 * </ol>
 * @author scorpio
 * @version 1.0.0
 * @email tengzhe.ln@alibaba-inc.com
 */
@Aspect
public abstract class BaseAspect {

  public static final String POINTCUT_SKIP_PROXY = "!within(*..*$$EnhancerBy*CGLIB$$*)&&!within(com.sun.proxy.$Proxy*)";

  /**
   * 排除动态代理
   */
  @Pointcut(POINTCUT_SKIP_PROXY)
  void skipProxy() {
  }

  /**
   * 用于XML配置
   */
  @Pointcut
  abstract void condition();

  /**
   * 用于子类重写
   */
  @Pointcut
  abstract void scope();

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
