package com.jsj.bs.captcha.interceptor;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;


/**
 * 验证码拦截器
 *
 * @author 王庆丰
 */
public class CaptchaAuthenticationInterceptor implements HandlerInterceptor {

 private static final Logger LOGGER= LogManager.getLogger(CaptchaAuthenticationInterceptor.class);

  @Override
  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
      LOGGER.info("请求路径:" + request.getRequestURI());
      LOGGER.info("ContentType:" + request.getContentType());
    if (handler instanceof HandlerMethod) {
      HandlerMethod handlerMethod = (HandlerMethod) handler;
        LOGGER.info("拦截的方法是:" + handlerMethod.getBeanType().getName() + "." + handlerMethod.getMethod().getName());
    } else {
        LOGGER.info("拦截的控制器是:" + handler.getClass());
    }

    String url = request.getRequestURI();

      LOGGER.info("====================="+request.getSession().getAttribute("captcha"));
    String expect = request.getSession().getAttribute("captcha").toString();

    //销毁验证码
    request.getSession().removeAttribute("captcha");

    if (expect != null && !expect.equals(request.getParameter("verifyCode"))) {
      //URLEncoder
      String message="验证码错误";
      message=URLEncoder.encode(message,"utf-8");
      response.sendRedirect(request.getServletContext().getContextPath() + "/tbUser/loginView?message="+message);
      return false;
    }
    return true;
  }

  @Override
  public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {

  }

  @Override
  public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3) throws Exception {

  }

}
