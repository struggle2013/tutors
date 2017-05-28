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
import dao.BookDao;
import dao.FruitDao;
import dao.OpinionDao;
import dao.PaperDao;
import dao.ProjectDao;
import dao.TeachDao;
import dao.UserDao;
import entity.Apply;
import entity.Book;
import entity.Opinion;
import entity.Paper;
import entity.Schedule;
import entity.User;

/**
 * Servlet implementation class ApplyServlet
 */
@WebServlet("/ApplyServlet")
public class ApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Apply apply = null;
	private ApplyDao applyDao=null;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ApplyServlet() {
		super();
		 applyDao= new ApplyDao();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("user");
		String id = user.getId();
		String action = request.getParameter("action");
		//System.out.println("request路径："+request.getRequestURL()+"action:"+action);
		switch (action) {
		case "apply":
			Map<String, String[]> map = request.getParameterMap();
			apply = applyDao.getApply(id);
			if (apply!= null) {
				try {
					BeanUtils.populate(apply, map);
					//System.out.println("map:"+map);
					//System.out.println("更新后的申请apply:"+apply);
				} catch (IllegalAccessException | InvocationTargetException e) {
					e.printStackTrace();
				}
				applyDao.update(apply);
			} else {
				apply = new Apply(UUID.randomUUID().toString());
				apply.setUserId(id);
				try {
					BeanUtils.populate(apply, map);
					//System.out.println("apply:"+apply);
				} catch (IllegalAccessException | InvocationTargetException e) {
					e.printStackTrace();
				}
				applyDao.addApply(apply);
			}
			request.setAttribute("msg", "提交成功！");
			request.getRequestDispatcher("apply/msg.jsp").forward(request, response);
			break;
		case "schedule":
			Apply apply= applyDao.getApply(id);
			if(apply==null){
				request.setAttribute("msg", "你还没有提交申请");
				request.getRequestDispatcher("apply/msg.jsp").forward(request, response);
				break;
			}
			//OpinionDao opinionDao = new OpinionDao();
			//List<Opinion> opinions = opinionDao.getOpinionByUser(id);
			//System.out.println(opinions);
			Schedule schedule =applyDao.getSchedule(id);
			request.setAttribute("schedule", schedule);
			System.out.println("schedule:"+schedule);
			request.getRequestDispatcher("apply/schedule.jsp").forward(request, response);
			break;
		case "query":
			query(request,response);
			break;
		default:
			break;
		}

	}

	private void pass(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		OpinionDao opinonDao = new OpinionDao();
		
		Opinion opinion=new Opinion(UUID.randomUUID().toString());
		
		
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String time =sdf.format(date);
		opinion.setTime(time);
		
		Map<String, String[]> map = request.getParameterMap();
		try {
			BeanUtils.populate(opinion, map);
		} catch (IllegalAccessException | InvocationTargetException e) {
			e.printStackTrace();
		}
		System.out.println("意见是:"+opinion);
		opinonDao.add(opinion);
		try {
			request.getRequestDispatcher("CheckServlet?param=technology").forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void query(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		//设置论文列表到request
		PaperDao paperDao = new PaperDao();
		BookDao bookDao = new BookDao();
		ProjectDao projectDao = new ProjectDao();
		FruitDao fruitDao = new FruitDao();
		TeachDao teachDao = new TeachDao();
		
		List<Paper> papers = paperDao.getPapersByUser(userId);
		request.setAttribute("papers",papers);
		request.setAttribute("books", bookDao.getBooksByUser(userId));
		request.setAttribute("projects", projectDao.getProjectsByUser(userId));
		request.setAttribute("fruits", fruitDao.getFruitsByUser(userId));
		request.setAttribute("teachs", teachDao.getTeachsByUser(userId));
		
		UserDao userdao = new UserDao();
		
		request.setAttribute("username", userdao.getUser(userId).getName());
		request.setAttribute("userId", userId);
		try {
			request.getRequestDispatcher("apply/details.jsp").forward(request, response);
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
