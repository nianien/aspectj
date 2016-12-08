package com.scorpio.aspectj.example;


import com.scorpio.aspectj.annotations.LogOff;
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


  @LogOff
  public static void main(String[] args) {
    HelloService he = new HelloService();
    he.sayHello();
  }
}
