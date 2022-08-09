package net.member.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.*;

//특정 비즈니스 요청으로 수행하고 결과 값을 ActionForward 타입으로 반환하는 메서드가 정의되어 있다
//Action: 인터페이스 이름
//ActionForward: 반환형
public interface Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException ;
}