package org.apache.struts2.dispatcher.ng.filter;

import com.scorpio.aspectj.annotations.Loggable;

/**
 * @author scorpio
 * @version 1.0.0
 */
@Loggable
public class StrutsPrepareAndExecuteFilter {

  public void doFilter() {
    System.out.println("do filter....");
  }
  public void doFilter2() {
    System.out.println("do filter2....");
  }
}
