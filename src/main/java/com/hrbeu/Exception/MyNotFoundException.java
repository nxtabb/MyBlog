package com.hrbeu.Exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.NOT_FOUND)
public class MyNotFoundException extends RuntimeException {
    public MyNotFoundException(){}

    public MyNotFoundException(String message){
        super(message);
    }
    public MyNotFoundException(String message,Exception e){
        super(message,e);
    }

}
