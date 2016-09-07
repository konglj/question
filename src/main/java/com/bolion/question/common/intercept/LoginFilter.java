package com.bolion.question.common.intercept;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter  implements Filter {
	
    public void destroy() { 
		
    }
	public void doFilter(ServletRequest sRequest, ServletResponse sResponse,      
            FilterChain filterChain) throws IOException, ServletException{
        
        HttpServletRequest request = (HttpServletRequest) sRequest;      
        HttpServletResponse response = (HttpServletResponse) sResponse;      
        HttpSession session = request.getSession();      
        String url = request.getServletPath();  
        String contextPath=request.getContextPath();  
        if(url.equals("")){
        	url+="/";
        }
        
        if(!url.equals("/login.html")&&!url.equals("/goLogin.html")&&!url.equals("/")&&!url.contains("/assets/")&&!url.contains("/images/")&&!url.contains("/image/")){//若访问后台资源 过滤到login  
        
        	Object obj = session.getAttribute("sysuser");
             if(obj == null){//转入登陆页面  
            		 response.sendRedirect(contextPath+"/login.html"); 
            		 return;
             }  
        }  
        filterChain.doFilter(sRequest, sResponse);
        
    }

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}  

}
