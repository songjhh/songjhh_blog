package cn.songjhh.project.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by song9 on 2016/12/29.
 */
public class CustomExceptionResolver implements HandlerExceptionResolver {

    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {

        ModelAndView modelAndView = new ModelAndView();
        if(e instanceof IOException) {
            modelAndView.addObject("message", "IOException");
            modelAndView.setViewName("error/error");
        }
         else if(e instanceof SQLException) {
            modelAndView.addObject("message", "SQLException");
            modelAndView.setViewName("error/error");
        } else {
            e.getMessage();
            modelAndView.addObject("message", e.getMessage());
            modelAndView.setViewName("error/error");
        }
        return modelAndView;

    }

}
