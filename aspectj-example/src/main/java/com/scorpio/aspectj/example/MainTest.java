package com.scorpio.aspectj.example;

import com.scorpio.aspectj.annotations.LogOff;

import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

/**
 * @author scorpio
 * @version 1.0.0
 */
public class MainTest {

  @LogOff
  public static void main(String[] args) {
    HelloService he = new HelloService();
    he.sayHello();
    StrutsPrepareAndExecuteFilter filter=new StrutsPrepareAndExecuteFilter();
    filter.doFilter();
    filter.doFilter2();
  }
}
