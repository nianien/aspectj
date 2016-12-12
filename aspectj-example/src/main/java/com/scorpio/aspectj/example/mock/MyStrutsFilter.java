package com.scorpio.aspectj.example.mock;

import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * @author scorpio
 * @version 1.0.0
 */
public class MyStrutsFilter extends StrutsPrepareAndExecuteFilter {
  public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) {
    System.out.println("do filter....");
  }
}
