package com.ky.clothing.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * @author cyan-bw
 */
@ControllerAdvice
public class MyException {
	private static final Logger LOGGER = LoggerFactory.getLogger(MyException.class);

	@ExceptionHandler({Exception.class})
	public String localException(Exception ex){	
		LOGGER.error(ex.getMessage(), ex);
		return "/pages/500";
	}
}
