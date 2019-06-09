package com.japanwork.exception;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.validation.ObjectError;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.method.annotation.MethodArgumentTypeMismatchException;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.japanwork.constant.MessageConstant;
import com.japanwork.payload.response.BaseErrorResponse;
import com.japanwork.payload.response.BaseMessageResponse;

@ControllerAdvice
public class GlobalExceptionHandler extends ResponseEntityExceptionHandler {
	@ExceptionHandler(ResourceNotFoundException.class)
	public ResponseEntity<?> resourceNotFoundException(ResourceNotFoundException ex, WebRequest request) {
		BaseMessageResponse error = new BaseMessageResponse(MessageConstant.ERROR_404, ex.getMessage());
		return new ResponseEntity<>(error, HttpStatus.NOT_FOUND);
	}
	
	@ExceptionHandler({ MethodArgumentTypeMismatchException.class })
	public ResponseEntity<Object> handleMethodArgumentTypeMismatch(
	  MethodArgumentTypeMismatchException ex, WebRequest request) {
	    String msg = 
	      ex.getName() + " should be of type " + ex.getRequiredType().getName();
	 
	    BaseErrorResponse error = new BaseErrorResponse(MessageConstant.INVALID_INPUT, msg);
	    return new ResponseEntity<Object>(error, HttpStatus.BAD_REQUEST);
	}
	
	@ExceptionHandler(Exception.class)
	public ResponseEntity<?> globleExcpetionHandler(Exception ex, WebRequest request) {
		BaseMessageResponse error = new BaseMessageResponse(MessageConstant.SERVER_ERROR, ex.getMessage());
		return new ResponseEntity<>(error, HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@Override
	protected ResponseEntity<Object> handleMethodArgumentNotValid(MethodArgumentNotValidException ex,
      HttpHeaders headers, HttpStatus status, WebRequest request) {
		String er = "";
		for (ObjectError error : ex.getBindingResult().getAllErrors()) {
			er += error.getDefaultMessage() + ",";
		}
		er = "{" + er.substring(0, er.length()-1) + "}";
		Gson gson = new Gson();
		JsonObject jsonObject = new JsonParser().parse(er).getAsJsonObject();
		Object object = gson.fromJson(jsonObject, Object.class);
		BaseErrorResponse error = new BaseErrorResponse(MessageConstant.INVALID_INPUT, object);
	    return new ResponseEntity<Object>(error, HttpStatus.BAD_REQUEST);
	}
	
	@Override
	protected ResponseEntity<Object> handleNoHandlerFoundException(NoHandlerFoundException ex, HttpHeaders headers, HttpStatus status, WebRequest request){
		BaseErrorResponse error = new BaseErrorResponse(MessageConstant.ERROR_404, MessageConstant.ERROR_404_MSG);
		return new ResponseEntity<Object>(error, HttpStatus.NOT_FOUND);
	}
	
	@Override
	protected ResponseEntity<Object> handleMissingServletRequestParameter(
	  MissingServletRequestParameterException ex, HttpHeaders headers, 
	  HttpStatus status, WebRequest request) {	     
	    BaseErrorResponse error = new BaseErrorResponse(MessageConstant.INVALID_INPUT, ex.getParameterName() + " parameter is missing");
	    return new ResponseEntity<Object>(error, HttpStatus.BAD_REQUEST);
	}
	
	@Override
	protected ResponseEntity<Object> handleHttpRequestMethodNotSupported(
	  HttpRequestMethodNotSupportedException ex, HttpHeaders headers, HttpStatus status, WebRequest request) {
	    StringBuilder builder = new StringBuilder();
	    builder.append(ex.getMethod());
	    builder.append(
	      " method is not supported for this request. Supported methods are ");
	    ex.getSupportedHttpMethods().forEach(t -> builder.append(t + " "));
	 
	    BaseErrorResponse error = new BaseErrorResponse(MessageConstant.INVALID_INPUT, builder.toString());
	    return new ResponseEntity<Object>(error, HttpStatus.METHOD_NOT_ALLOWED);
	}
	
	@Override
	protected ResponseEntity<Object> handleHttpMediaTypeNotSupported(
	  HttpMediaTypeNotSupportedException ex, HttpHeaders headers, HttpStatus status, WebRequest request) {
	    StringBuilder builder = new StringBuilder();
	    builder.append(ex.getContentType());
	    builder.append(" media type is not supported. Supported media types are ");
	    ex.getSupportedMediaTypes().forEach(t -> builder.append(t + ", "));
	 
	    BaseErrorResponse error = new BaseErrorResponse(MessageConstant.INVALID_INPUT, builder.toString());
	    return new ResponseEntity<Object>(error, HttpStatus.UNSUPPORTED_MEDIA_TYPE);
	}
	
	@Override
	protected ResponseEntity<Object> handleHttpMessageNotReadable(
			HttpMessageNotReadableException ex, HttpHeaders headers, HttpStatus status, WebRequest request) {

		BaseErrorResponse error = new BaseErrorResponse(MessageConstant.INVALID_INPUT, MessageConstant.INVALID_INPUT_MSG);
	    return new ResponseEntity<Object>(error, HttpStatus.BAD_REQUEST);
	}
}
