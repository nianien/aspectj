package com.scorpio.aspectj.example;


import com.scorpio.aspectj.annotations.Loggable;

/**
 * @author scorpio
 * @version 1.0.0
 */
@Loggable
public class BaseHelloService {
  public void sayHello() {
    System.out.println("Hello AspectJ.");
  }

  public void sayHello(String msg) {
    System.out.println("Hello " + msg);
  }


}
