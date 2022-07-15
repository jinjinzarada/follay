package kh.spring.follay.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import kh.spring.follay.common.AdviceLog;

@Component
@Aspect
public class AdviceLog {
	private static final Logger logger = LoggerFactory.getLogger(AdviceLog.class);
	
	@Pointcut("execution(public * kh.spring.follay..*Dao.*(..)) ")
	public void commonDaoPointCut() {}
	@Pointcut("execution(public * kh.spring.follay..*Service.*(..))")
	public void commonServicePointCut() {}
	@Pointcut("execution(public * kh.spring.follay..*Controller.*(..)) ")
	public void commonControllerPointCut() {}
	
	@Around("commonDaoPointCut()")
	public Object aroundLogMethod(ProceedingJoinPoint pjp) throws Throwable {
		Object ro = null;
		
//		System.out.println("aroundDao:"+pjp.getThis()+pjp.getSignature().getName());
		logger.debug("\t\t▶▶▶["+pjp.getTarget()+":"+pjp.getSignature().getName()+"]");
		
		Object[] args = pjp.getArgs();
		for(int i=0; i<pjp.getArgs().length; i++) {
//			System.out.println("args:"+pjp.getArgs()[i]);
			logger.debug("\t\t▶▶args["+i+"] "+args[i]);
		}
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		
		ro = pjp.proceed();
		
		stopWatch.stop();
		
		logger.info("\t\t▶▶▶[DAO Ret:"+stopWatch.getTotalTimeMillis()+"ms] "+ ro);
		
		return ro;
	}
	
//	@Around("pointcutController()")
//	public Object aroundController(ProceedingJoinPoint pjp) throws Throwable{
//		Object ro =null;
//		System.out.println("aroundController:"+pjp.getThis()+pjp.getSignature().getName());
//		for(int i=0; i<pjp.getArgs().length; i++) {
//			System.out.println("args:"+pjp.getArgs()[i]);
//		}
//		ro = pjp.proceed();
//		System.out.println("aroundController ro:"+ro);
//		return ro;
//	}

}
