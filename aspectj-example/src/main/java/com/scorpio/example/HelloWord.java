package com.scorpio.example;


import com.scorpio.aspectj.annotations.Loggable;

/**
 * @author scorpio
 * @version 1.0.0
 */
@Loggable
public class HelloWord extends BaseHelloWord {

  @Loggable
  public void sayHello(String msg) {
    super.sayHello(msg);
  }


//  @LogOff
  public static void main(String[] args) {
    HelloWord he = new HelloWord();
    he.sayHello("lining");
  }
}
