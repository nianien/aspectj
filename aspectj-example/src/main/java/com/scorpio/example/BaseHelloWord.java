package com.scorpio.example;


import com.scorpio.aspectj.annotations.Loggable;

/**
 * @author scorpio
 * @version 1.0.0
 */
@Loggable
//@LogOff
public class BaseHelloWord {
//  @Loggable
  public void sayHello() {
    System.out.println("Hello AspectJ.");
  }

  @Loggable
  public void sayHello(String msg) {
    System.out.println("Hello " + msg);
  }



}
