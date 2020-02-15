package org.bjd.loopy.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*") // mapper에 설정해서 쓰는 방법 외에 annotation 활용
public class EncodingFilter implements Filter {

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		//post방식의 한글처리
		request.setCharacterEncoding("UTF-8");
		
		chain.doFilter(request, response);
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}
	
}//EncodingFilter end
