package com.scorpio.aspectj.service;

import java.util.ServiceLoader;

/**
 * JoinPoint处理接口定义
 *
 * @author scorpio
 * @version 1.0.0
 */
public class JoinPointHandlers {
  /**
   * 服务加载器
   */
  private static final ServiceLoader<JoinPointHandler> serviceLoader = ServiceLoader.load(JoinPointHandler.class);


  /**
   * 获取指定类型的服务实现
   *
   * @param serviceClass
   * @return
   */
  public static JoinPointHandler getJointHandler(Class<?> serviceClass) {
    for (JoinPointHandler joinPointHandler : serviceLoader) {
      if (joinPointHandler.support(serviceClass)) {
        return joinPointHandler;
      }
    }
    return null;
  }
}
