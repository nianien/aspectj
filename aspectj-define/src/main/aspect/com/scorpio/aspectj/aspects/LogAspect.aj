package com.scorpio.aspectj.aspects;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

/**
 * @author scorpio
 * @version 1.0.0
 * @email tengzhe.ln@alibaba-inc.com
 */
@Aspect
public abstract class LogAspect {
    @Pointcut
    abstract void scope();


    /**
     * 排除动态代理
     */
    @Pointcut("!within(*..*$$EnhancerBy*CGLIB$$*)&&!within(com.sun.proxy.$Proxy*)")
    void skip() {

    }


    /**
     * <ul>
     *   <li>方法被<code>@Loggable</code>注解</li>
     *   <li>方法所属类型被<code>@Loggable</code>注解</li>
     * </ul>
     *
     */
    @Pointcut("execution(@*..Loggable * *(..))||execution(* (@*..Loggable *).*(..))")
    void loggable() {
    }


    /**
     * 方法获取类型未被<code>@LogOff</code>注解
     */
    @Pointcut("within(@*..LogOff *)||execution(@*..LogOff * *(..))")
    void logOff() {
    }

    /**
     * 这里只拦截方法执行,包括构造方法
     * @param joinPoint
     * @return
     * @throws Throwable
     */
    @Around("scope()&&skip()&&loggable()&&!logOff()")
    public Object around(ProceedingJoinPoint joinPoint) throws Throwable {
        System.out.println(">>>begin:" + joinPoint);
        Object result = joinPoint.proceed();
        System.out.println("<<<end:" + joinPoint);
        return result;
    }
}
