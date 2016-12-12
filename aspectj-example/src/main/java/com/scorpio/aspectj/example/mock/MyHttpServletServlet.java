package com.scorpio.aspectj.example.mock;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author scorpio
 * @version 1.0.0
 */
public class MyHttpServletServlet extends HttpServlet {


  @Override
  protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    System.out.println("==============MyHttpServletServlet#service(HttpServletRequest req, HttpServletResponse resp)");
  }
}
