package com.kh.cityrack.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.kh.cityrack.warpper.LoginWrapper;

/**
 * Servlet Filter implementation class IncryptFilter
 */
@WebFilter(filterName="incrypt", urlPatterns="*.do")
public class IncryptFilter implements Filter {

    /**
     * Default constructor. 
     */
    public IncryptFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("암호화 필터");
		
		request.setAttribute("password", request.getParameter("password"));
		
		HttpServletRequest h_request = (HttpServletRequest)request;
				
		LoginWrapper lw = new LoginWrapper(h_request);
		
		chain.doFilter(lw, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
