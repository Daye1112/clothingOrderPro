package com.ky.clothing.controller;

import com.ky.clothing.enums.SysParamEnum;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import javax.servlet.http.HttpServletRequest;

/**
 * @author cyan-bw
 */
@ControllerAdvice
public class MyException {
	private static final Logger LOGGER = LoggerFactory.getLogger(MyException.class);

	@ExceptionHandler({Exception.class})
	public String localException(Exception ex, HttpServletRequest request){
		LOGGER.error(ex.getMessage(), ex);
		request.setAttribute(SysParamEnum.ERROR_MSG_NAME.toString(), ex.getMessage());
		return "/pages/500";
	}
}
