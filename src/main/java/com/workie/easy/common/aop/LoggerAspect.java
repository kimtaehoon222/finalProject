package com.workie.easy.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.slf4j.LoggerFactory;
import org.springframework.util.StopWatch;

import ch.qos.logback.classic.Logger;
//xml 방식
public class LoggerAspect {
	private static final Logger logger=(Logger) LoggerFactory.getLogger(LoggerAspect.class);
	
	
		public Object aroundLogAdvice(ProceedingJoinPoint join) throws Throwable {
		
		Signature sig = join.getSignature();//메소드 정보 반환
		String type = sig.getDeclaringTypeName();//무슨 클래스 인지
		String methodName  = sig.getName();//타켓되는 메소드 명
		
		String cName  = "";
		if(type.indexOf("Controller")> -1) {
			//indexOf: 문자열이 해당하는 위치 숫자로 
			//존재하면 인덱스는 0부터 시작하니까 -1 보다 크니까 -1로 비교
			cName = "Controller : ";
		}else if(type.indexOf("Service")> -1) {
			cName = "Service : ";
		}else if(type.indexOf("Dao")> -1) {
			cName = "Dao : ";
		}
		
		logger.info("[Before] " + cName + type + "." + methodName + "()");
		Object obj = join.proceed();//전과 후를 나누는 기준
		
		logger.info("[After] " + cName + type + "." + methodName + "()");
		return obj;
	}
}
