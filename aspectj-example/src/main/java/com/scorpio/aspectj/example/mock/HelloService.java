package com.scorpio.aspectj.example.mock;


import com.scorpio.aspectj.annotations.Loggable;

/**
 * @author scorpio
 * @version 1.0.0
 */
@Loggable
public class HelloService extends BaseHelloService {

  public void sayHello(String msg) {
    super.sayHello(msg);
  }



}
