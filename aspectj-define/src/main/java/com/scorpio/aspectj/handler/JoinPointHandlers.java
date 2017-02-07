package com.scorpio.aspectj.handler;

import java.util.ServiceLoader;

/**
 * 用于获取指定类型对象的{@link JoinPointHandler}对象
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
