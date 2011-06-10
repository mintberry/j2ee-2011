package com.tongji.j2ee.sp;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;

public class ChnFilter implements Filter {

	protected FilterConfig filterConfig;
	private String targetEncoding;

	public ChnFilter() {
		targetEncoding = "utf-8";// 直接初始化utf8
	}

	public void init(FilterConfig filterconfig) throws ServletException {
		filterConfig = filterconfig;
		// targetEncoding =
		// filterconfig.getInitParameter("encoding");//web.xml挂参初始化
	}

	public void doFilter(ServletRequest servletrequest,
			ServletResponse servletresponse, FilterChain filterchain)
			throws IOException, ServletException {
		HttpServletRequest httpservletrequest = (HttpServletRequest) servletrequest;
		httpservletrequest.setCharacterEncoding(targetEncoding);
		//System.out.println("使用" + targetEncoding + "对请求进行编码过滤");
		filterchain.doFilter(servletrequest, servletresponse);
	}

	public void setFilterConfig(FilterConfig filterconfig) {
		filterConfig = filterconfig;
	}

	public void destroy() {
		filterConfig = null;
	}
}
