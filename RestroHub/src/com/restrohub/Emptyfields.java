package com.restrohub;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


public class Emptyfields implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
	}


	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
        Enumeration en = request.getParameterNames();
        System.out.println("m toh chla hu");
        while(en.hasMoreElements())
        {
        	String val = request.getParameter((String)en.nextElement()).trim();
        	if(val.equals(""))
        	{
        		request.setAttribute("errorname", "emptyfields");
        		RequestDispatcher rd = request.getRequestDispatcher("Registration.jsp");
        		rd.forward(request, response);
        		return;
        	}
        }
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
