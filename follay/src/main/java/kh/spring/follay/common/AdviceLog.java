package kh.spring.follay.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AdviceLog {
	
	@Pointcut("execution(public * kh.spring.follay..*Dao.*(..)) ")
	public void pointcutDao() {}
	@Pointcut("execution(public * kh.spring.follay..*Controller.*(..)) ")
	public void pointcutController() {}
	
	@Around("pointcutDao()")
	public Object aroundDao(ProceedingJoinPoint pjp) throws Throwable{
		Object ro =null;
		System.out.println("aroundDao:"+pjp.getThis()+pjp.getSignature().getName());
		for(int i=0; i<pjp.getArgs().length; i++) {
			System.out.println("args:"+pjp.getArgs()[i]);
		}
		ro = pjp.proceed();
		System.out.println("aroundDao ro:"+ro);
		return ro;
	}
	@Around("pointcutController()")
	public Object aroundController(ProceedingJoinPoint pjp) throws Throwable{
		Object ro =null;
		System.out.println("aroundController:"+pjp.getThis()+pjp.getSignature().getName());
		for(int i=0; i<pjp.getArgs().length; i++) {
			System.out.println("args:"+pjp.getArgs()[i]);
		}
		ro = pjp.proceed();
		System.out.println("aroundController ro:"+ro);
		return ro;
	}

}
