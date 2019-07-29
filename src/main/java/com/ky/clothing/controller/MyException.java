package com.ky.clothing.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class MyException {
	private static final Logger LOGGER = LoggerFactory.getLogger(GoodsHandler.class);
	@ExceptionHandler({Exception.class})
	public String localException(Exception ex){	
		LOGGER.error(ex.getMessage(), ex);
		//System.out.println("异常信息是" + ex.getMessage());
		return "/pages/500";
	}
}
