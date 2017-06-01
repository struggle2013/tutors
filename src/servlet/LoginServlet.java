package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ApplyDao;
import entity.Schedule;
import entity.User;
import service.UserService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

private void userlogin(HttpServletRequest request, HttpServletResponse response) throws IOException{
	String username = request.getParameter("username");
	String password = request.getParameter("password");

	User user = userService.getUser(username, password);

	PrintWriter out = response.getWriter();

	// 返回空则表示登录不成功，密码或邮箱错误，用Ajax + jQuery 给出提示信息
	if (user != null) {
		request.getSession().setAttribute("user", user);
		request.getSession().setAttribute("name", user.getName());
		// 重定向到不同身份用户的主页
		if (user.getIsTutor()==1) {
//			ApplyDao applyDao = new ApplyDao();
//			Schedule schedule =applyDao .getSchedule(user.getId());
//			request.setAttribute("schedule", schedule);
//			System.out.println("schedule:"+schedule);
//			response.sendRedirect("");
			out.write("IndexServlet?param=tutor");
		} else if (user.getIsTutor()==0) {
			out.write("IndexServlet?param=user");
		} 

	} else {
		out.write("NO");
	}

	out.flush();
	out.close();
}
private void sysUserLogin(HttpServletRequest request, HttpServletResponse response){
	
}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String identity = request.getParameter("identity");
		//System.out.println("用户的身份是："+identity);
		if (identity.equals("user")) {
			userlogin(request,response);
		} else if (identity.equals("sysUser")) {
			sysUserLogin(request,response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
