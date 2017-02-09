1.关于aspect
  1)子类可以重定义父类设置的pointcut
  1)父类可以使用final关键字禁止子类重定义的pointcut
  2)父类使用static关键字声明的pointcut,不会被继承static
2.关于aop.xml
  1)concrete-aspect只能继承抽象类
  2)如果父类设置了pointcut,子类可以重写,也可以不重写
  3)如果父类未指定抽象的pointcut,子类必须重写
3. jvm启动参数
 -javaagent:/Users/scorpio/aspectj1.8/lib/aspectjweaver.jar -debug -Daj.weaving.verbose=true