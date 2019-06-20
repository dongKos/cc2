package com.kh.cc.common;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

@Component
@Aspect
public class AroundAdvice {

	@Pointcut("execution(* com.kh.cc..*ServiceImpl.*(..))")
	public void allPointcut() {}
	
	@Around("allPointcut()")
	public Object aroundLog(ProceedingJoinPoint pj) throws Throwable {
		//사전, 사후 처리를 모두 해결하고자 할 때 사용하는 어드바이스이다.
		//around의 경우는 joinpoint의 후손인 proceedingjoinpoint를 첫 파라미터로 선언한다.
		String methodName = pj.getSignature().getName();
		
		//사전에 처리할 내용
		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		
		//다시 원래 흐름대로 진행
		Object obj = pj.proceed();
		//돌아오고 나서 사후에 처리할 내용 수행
		
		//사후에 처리할 내용
		stopWatch.stop();
		
		System.out.println(methodName + "메소드 수행시간 : " 
							+ stopWatch.getTotalTimeMillis() + "(ms)초");
		
		
		return obj;
	}
	
}





















