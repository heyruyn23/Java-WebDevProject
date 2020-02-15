package org.bjd.ggs.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bjd.ggs.vo.Member;
@WebFilter(value= {
		"/writeForm.jsp",
		"/write.jsp",
		"/writeReply.jsp",
		"/delete.jsp",
		"/deleteReply.jsp",
		"/updateForm.jsp",
		"/update.jsp",
		"/ajax/like.jsp",
		"/recommendation.jsp"})
public class LoginCheckFilter implements Filter {

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpSession session = ((HttpServletRequest)request).getSession();
		Member loginMember =  (Member)session.getAttribute("loginMember");
		
		if(loginMember==null) {
			((HttpServletResponse)response).sendRedirect("/index.jsp");
		}else {
			chain.doFilter(request, response);
		}//if~else end
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("LoginCheckFilter init");
	}

}
