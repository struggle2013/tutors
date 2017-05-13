package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.User;
import service.UserService;

/**
 * Servlet implementation class UserInfoQuery
 */
@WebServlet("/UserInfoQuery")
public class UserInfoQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserInfoQuery() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		UserService userService = new UserService();
		List<User> users=null;
		if (action.equals("all")) {
			users= userService.queryAll();
			request.setAttribute("users", users);
			
		}else if (action.equals("some")){
			String name = request.getParameter("name");
			System.out.println("查询的姓名是:"+name);
			users = userService.queryName(name);
			request.removeAttribute("users");
			request.setAttribute("users", users);
		}
		 System.out.println("查询到的用户有:"+users);
		 request.getRequestDispatcher("baseinfo/baseinfoQuery.jsp").forward(request, response);
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
