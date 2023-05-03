package common;

import org.springframework.web.bind.annotation.ControllerAdvice;

// @Component를 포함하고 있는 Annotation
// @Controller Annotation 포함되어 있는 객체에서 에러가 발생했을 때 처리하는 Annotation
@ControllerAdvice
// 전역적으로 예외를 처리할 수 있는 Annotation

public class ErrorUtil {

	// 500 에러페이지 처리(이때, 실제 소스코드를 수정해야함)
	// @ExceptionHandler == try - catch
//	@ExceptionHandler(Exception.class)
//	public String handleException(Exception e) {
//		System.err.println("에러발생");
	// 에러메세지 띄우기
//		System.err.println(e.getMessage());
//		return "error/error500";
//	}

	// 404 에러페이지 처리(실제로 주소를 잘못 입력했을 때)
	// URL창 없는 주소 입력
//	@ExceptionHandler(NoHandlerFoundException.class)
	// HttpStatus.NOT_FOUND : 404
//	@ResponseStatus(value=HttpStatus.NOT_FOUND)
//	public String notFound(NoHandlerFoundException e) {
//		System.err.println("RequestMapping 오류");
//		System.err.println(e.getMessage());
//		return "error/error404";
//	}
}
