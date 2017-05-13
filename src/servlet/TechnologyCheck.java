package servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;

import dao.ApplyDao;
import dao.OpinionDao;
import dao.UserDao;
import entity.Apply;
import entity.Opinion;
import entity.User;

/**
 * Servlet implementation class TechnologyCheck
 */
@WebServlet("/TechnologyCheck")
public class TechnologyCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String userId;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TechnologyCheck() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		userId = user.getId();
		String action = request.getParameter("action");
		switch (action) {
		case "queryApply":
			queryApply(request, response);
			break;
		case "saveOpinion":
			saveOpinion(request, response);
			break;
		case "queryOpinion":
			queryOpinion(request, response);
			break;
		default:
			break;
		}
	}

	private void queryOpinion(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	private void saveOpinion(HttpServletRequest request, HttpServletResponse response) {
		
		OpinionDao opinonDao = new OpinionDao();

		Opinion opinion = new Opinion(UUID.randomUUID().toString());

		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String time = sdf.format(date);
		opinion.setTime(time);

		Map<String, String[]> map = request.getParameterMap();
		try {
			BeanUtils.populate(opinion, map);
			System.out.println("意见是:" + opinion);
			opinonDao.add(opinion);
			//request.getRequestDispatcher("TechnologyCheck?action=queryApply").forward(request, response);
		} catch (  IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private void queryApply(HttpServletRequest request, HttpServletResponse response) {
		UserDao userdao = new UserDao();
		boolean ok = userdao.checkTechnology(this.userId);
		System.out.println("检查：" + ok);
		try {
			if (!ok) {
				request.getRequestDispatcher("apply/missPower.html").forward(request, response);
				return;
			} else {
				ApplyDao applyDao = new ApplyDao();
				List<Apply> applys = applyDao.getAllIsNotTutor();
				request.setAttribute("applys", applys);
				System.out.println("获取到的提交名单：" + applys);
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
