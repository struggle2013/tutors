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
 * Servlet implementation class CheckServlet
 */
@WebServlet("/CheckServlet")
public class CheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String userId;
	private ApplyDao applyDao;
	public CheckServlet() {
		super();
		applyDao = new ApplyDao();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String param = request.getParameter("param");
		User user = (User) request.getSession().getAttribute("user");
		userId = user.getId();
		System.out.println("参数："+param + "\n");
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
			break;
		case "saveOpinion":
			saveOpinion(request,response);
			break;
		case "query":
			query(request,response);
			break;
		default:
			break;
		}
	}

	private void query(HttpServletRequest request, HttpServletResponse response) {
		String power = request.getParameter("power");
		String name = request.getParameter("name");
		List<Apply> applys = applyDao.query(power,name);
		request.setAttribute("applys", applys);
		System.out.println("获取到的提交名单："+applys);
		try {
			request.getRequestDispatcher("apply/"+power+".jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	private void saveOpinion(HttpServletRequest request, HttpServletResponse response) {
		OpinionDao opinonDao = new OpinionDao();
		String power = (String) request.getSession().getAttribute("power");
		System.out.println("ssion power:"+power);
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
			List<Apply> applys= applyDao.query(power,null);
			request.setAttribute("applys", applys);
			System.out.println("获取到的提交名单："+applys);
			request.getRequestDispatcher("apply/"+power+".jsp").forward(request, response);
			
		} catch (  IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
			try {
				ApplyDao applyDao = new ApplyDao();
				List<Apply> applys= applyDao.getSchoolDegreeCheck();
				request.setAttribute("applys", applys);
				request.getSession().setAttribute("power", "schoolDegree");
				request.getRequestDispatcher("apply/schoolDegree.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	private void degree(HttpServletRequest request, HttpServletResponse response) {
		UserDao userdao = new UserDao();
		boolean ok = userdao.checkDegree(this.userId);
		if (!ok) {
			try {
				request.getRequestDispatcher("apply/missPower.html").forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
			return;
		} else {
			try {
				ApplyDao applyDao = new ApplyDao();
				List<Apply> applys= applyDao.getDegreeCheck();
				request.setAttribute("applys", applys);
				request.getSession().setAttribute("power", "degree");
				request.getRequestDispatcher("apply/degree.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
				List<Apply> applys= applyDao.getAcademyCheck();
				request.setAttribute("applys", applys);
				request.getSession().setAttribute("power", "academy");
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
				
				List<Apply> applys= applyDao.getTechnologyCheck();
				request.setAttribute("applys", applys);
				request.getSession().setAttribute("power", "technology");
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
