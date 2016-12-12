package com.scorpio.aspectj.example.mock;

import java.io.IOException;

import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * @author scorpio
 * @version 1.0.0
 */
public class MyServlet extends GenericServlet {


  @Override
  public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
    System.out.println("==============MyServlet#service(ServletRequest req, ServletResponse res)");
  }


}
