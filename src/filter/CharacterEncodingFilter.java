package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

/**
 * 
 * 功能：处理的字符编码
 * 实现:处理get与post方式提交的编码
 * 
 */
@WebFilter(description = "对字符编码进行过滤")
public class CharacterEncodingFilter implements Filter {
	private String defaultCharset = "UTF-8";
	private FilterConfig filterConfig;
    /**
     * Default constructor. 
     */
    public CharacterEncodingFilter() {
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
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) res;
		
		//获取web.xml配置文件中配置编码
		String charset = filterConfig.getInitParameter("charset");
		if (charset == null) {
			charset = defaultCharset;
		}
		
		//-----------post-----------
		request.setCharacterEncoding(charset);
		response.setCharacterEncoding(charset);
		response.setContentType("text/html;charset=" + charset);
		
		chain.doFilter(new MyRequest(request), response);
		
	}
	/* *
	 * ---------get---------
	 * 采用包装模式（decorator）增加request功能，即
	 * 解决request提交数据中get方式提交问处理的编码格式
	 * */
	class MyRequest extends HttpServletRequestWrapper {

		private HttpServletRequest request;
		
		public MyRequest(HttpServletRequest request) {
			super(request);
			this.request = request;
		}
		
		
		@Override
		public String getParameter(String name) {
			
			String value = request.getParameter(name);
			if (value == null) {
				return null;
			}
			if (!request.getMethod().equalsIgnoreCase("get")) {
				return value;
			}
			try {
				value = new String(value.getBytes("iso8859-1"), "utf-8");
				return value;
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
		
	}
	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		this.filterConfig = fConfig;
	}

}
