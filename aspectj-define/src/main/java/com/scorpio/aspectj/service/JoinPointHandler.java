package com.scorpio.aspectj.service;

import org.aspectj.lang.ProceedingJoinPoint;

/**
 * JoinPoint处理接口定义
 *
 * @author scorpio
 * @version 1.0.0
 */
public interface JoinPointHandler {
  /**
   * 接口处理
   *
   * @param joinPoint
   * @return
   * @throws Throwable
   */
  Object apply(ProceedingJoinPoint joinPoint) throws Throwable;

  /**
   * 是否支持指定类型
   *
   * @param type
   * @return
   */
  boolean support(Class<?> type);
}
