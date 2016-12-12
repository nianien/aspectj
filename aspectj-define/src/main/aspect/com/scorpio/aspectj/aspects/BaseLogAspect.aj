package com.scorpio.aspectj.aspects;

import com.scorpio.aspectj.service.JoinPointHandler;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

import java.util.ServiceLoader;

/**
 * 定义切面的基类,子类可以通过{@link #condition()}和 {@link #scope()}组合匹配拦截
 * @author scorpio
 * @version 1.0.0
 * @email tengzhe.ln@alibaba-inc.com
 */
@Aspect
public abstract class BaseLogAspect {

  public static final String POINTCUT_SKIP = "!within(org.aspectj.*)&&!within(com.scorpio.aspectj.aspects..*)&&!within(*..*$$EnhancerBy*CGLIB$$*)&&!within(com.sun.proxy.$Proxy*)";

  private static final ServiceLoader<JoinPointHandler> serviceLoader = ServiceLoader.load(JoinPointHandler.class);

  /**
   * 排除动态代理
   */
  @Pointcut(POINTCUT_SKIP)
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
    JoinPointHandler jointHandler = getJointHandler(this.getClass());
    if (jointHandler != null) {
      return jointHandler.apply(joinPoint);
    }
    return joinPoint.proceed();
  }


  /**
   * 获取指定服务的实现
   *
   * @param serviceClass
   * @return
   */
  private static JoinPointHandler getJointHandler(Class<?> serviceClass) {
    for (JoinPointHandler joinPointHandler : serviceLoader) {
      if (joinPointHandler.support(serviceClass)) {
        return joinPointHandler;
      }
    }
    return null;
  }

}
