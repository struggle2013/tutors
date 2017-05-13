package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ApplyDao;
import dao.UserDao;
import entity.Apply;
import entity.User;

/**
 * Servlet implementation class CheckServlet
 */
@WebServlet("/CheckServlet")
public class CheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String userId;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String param = request.getParameter("param");
		User user = (User) request.getSession().getAttribute("user");
		userId = user.getId();
		System.out.println(param + "\n");
		switch (param) {
		case "technology":
			technology(request, response);
			break;
		case "academy":
			academy(request, response);
			break;
		case "degree":
			degree(request, response);
			break;
		case "schoolDegree":
			schoolDegree(request, response);
		default:
			break;
		}
	}

	private void schoolDegree(HttpServletRequest request, HttpServletResponse response) {
		
		UserDao userdao = new UserDao();
		boolean ok = userdao.checkSchoolDegree(this.userId);
		System.out.println("是否有用户：" + ok);
		if (!ok) {
			try {
				request.getRequestDispatcher("apply/missPower.html").forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		} else {

		}

	}

	private void degree(HttpServletRequest request, HttpServletResponse response) {
		UserDao userdao = new UserDao();
		boolean ok = userdao.checkDegree(this.userId);
		if (!ok) {
			try {
				request.getRequestDispatcher("apply/missPower.html").forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		} else {

		}

	}

	private void academy(HttpServletRequest request, HttpServletResponse response) {
		UserDao userdao = new UserDao();
		boolean ok = userdao.checkAcademy(userId);
		if (!ok) {
			try {
				request.getRequestDispatcher("apply/missPower.html").forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return;
		} else {
			try {
				ApplyDao applyDao = new ApplyDao();
				List<Apply> applys= applyDao.getAllIsNotTutor();
				request.setAttribute("applys", applys);
				System.out.println("获取到的提交名单："+applys);
				request.getRequestDispatcher("apply/academy.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	private void technology(HttpServletRequest request, HttpServletResponse response) {
		
		UserDao userdao = new UserDao();
		boolean ok = userdao.checkTechnology(this.userId);
		System.out.println("检查：" + ok);
		try {
			if (!ok) {
				request.getRequestDispatcher("apply/missPower.html").forward(request, response);
				return;
			} else {
				ApplyDao applyDao = new ApplyDao();
				List<Apply> applys= applyDao.getAllIsNotTutor();
				request.setAttribute("applys", applys);
				System.out.println("获取到的提交名单："+applys);
				request.getRequestDispatcher("apply/technology.jsp").forward(request, response);
			}
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
