package com.workie.easy.common.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;



import ch.qos.logback.classic.Logger;

@Aspect
@Component//클래스를 감지할 수 있게
public class AfterReturningAspect {
	private static final Logger logger=(Logger) LoggerFactory.getLogger(AfterReturningAspect.class);
	
	@AfterReturning(pointcut = "execution(* com.workie.easy..*ServiceImpl.login*(..))", returning = "returnObj" )//정상적으로 비지니스 메서드가 리턴한 결과 데이터를 다른 용도로 처리할때
	public void loggerAdvice(JoinPoint join,Object returnObj) {
		
		/*if(returnObj instanceof Member ) {
			//멤버 객체로 형변환이 가능한 지 
			Member m = (Member)returnObj;
			
			if(m.getUserId().equals("admin")) {
				logger.info("[log] : 관리자님 환영합니다." );
			}else {
				logger.info("[log] : " + m.getUserId() + "로그인 성공!!");
			}
		}*/
		
	}
}
