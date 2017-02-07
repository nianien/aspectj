package com.scorpio.aspectj.example.handler;

import com.scorpio.aspectj.aspects.BaseLogAspect;
import com.scorpio.aspectj.handler.JoinPointHandler;

import org.aspectj.lang.ProceedingJoinPoint;

/**
 * @author scorpio
 * @version 1.0.0
 */
public class DemoJointPointHandler implements JoinPointHandler {
  /**
   * 接口处理
   *
   * @param joinPoint
   * @return
   * @throws Throwable
   */
  @Override
  public Object apply(ProceedingJoinPoint joinPoint) throws Throwable {
    System.out.println(">>>" + this.getClass().getSimpleName() + ",begin:" + joinPoint);
    try {
      return joinPoint.proceed();
    } catch (Throwable e) {
      throw e;
    } finally {
      System.out.println(">>>" + this.getClass().getSimpleName() + ",end:" + joinPoint);
    }
  }

  /**
   * 是否支持指定类型
   *
   * @param type
   * @return
   */
  @Override
  public boolean support(Class<?> type) {
    boolean support = BaseLogAspect.class.isAssignableFrom(type);
    return support;
  }
}
