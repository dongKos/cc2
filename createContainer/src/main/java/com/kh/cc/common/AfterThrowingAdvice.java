package com.kh.cc.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AfterThrowingAdvice {

	@Pointcut("execution(* com.kh.cc..*ServiceImpl.*(..))")
	public void allPointcut() {}
	
	@AfterThrowing(pointcut="allPointcut()", throwing="exceptObj")
	public void exceptionLog(JoinPoint jp, Exception exceptObj) {
		//비즈니스 메소드 실행 중에 예외가 발생했을 때,
		//공통적인 예외 처리 로직을 제공할 목적으로 사용하는 어드바이스이다.
		String methodName = jp.getSignature().getName();
		
		System.out.println(methodName + "()메소드 수행 중 예외 발생!");
				
		if(exceptObj instanceof IllegalArgumentException) {
			System.out.println("부적절한 값 입력됨");
		}else if(exceptObj instanceof NumberFormatException) {
			System.out.println("숫자 형식의 값이 아닙니다");
		}else if(exceptObj instanceof Exception) {
			System.out.println("예외가 발생했습니다");
			System.out.println("예외명 : " + exceptObj.getMessage());
		}else {
			System.out.println(exceptObj.getMessage());
		}
	}
}
