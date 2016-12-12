package com.scorpio.aspectj.example;

import com.scorpio.aspectj.annotations.LogOff;
import com.scorpio.aspectj.example.mock.MyHttpServletServlet;
import com.scorpio.aspectj.example.mock.MyServlet;
import com.scorpio.aspectj.example.mock.MyStrutsFilter;

import java.io.IOException;

import javax.servlet.ServletException;

/**
 * @author scorpio
 * @version 1.0.0
 */
public class MainTest {

  @LogOff
  public static void main(String[] args) throws Exception {
//    HelloService he = new HelloService();
//    he.sayHello();

//    testServlet();
    testStruts2();
//    testHttpServlet();
  }


  public static void testStruts2() {
    MyStrutsFilter filter = new MyStrutsFilter();
    filter.doFilter(null, null, null);
  }

  @LogOff
  public static void testServlet() throws ServletException, IOException {
    MyServlet servlet = new MyServlet();
    servlet.service(null, null);
  }

  @LogOff
  public static void testHttpServlet() throws ServletException, IOException {
    MyHttpServletServlet servlet = new MyHttpServletServlet();
    servlet.service(null, null);
  }
}
