package servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import dao.BookDao;
import dao.FruitDao;
import dao.PaperDao;
import dao.ProjectDao;
import dao.TeachDao;
import entity.Book;
import entity.Fruit;
import entity.Paper;
import entity.Project;
import entity.Teach;
import entity.User;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class DataServlet
 */
@WebServlet("/DataServlet")
public class DataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HttpSession session = null;
	private User user;
	private PaperDao paperDao;
	private BookDao bookDao;
	private String sessionId;// 用户的id编号
	private FruitDao fruitDao;
	private ProjectDao projectDao;
	private TeachDao teachDao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DataServlet() {
		super();
		paperDao = new PaperDao();
		bookDao = new BookDao();
		fruitDao = new FruitDao();
		projectDao = new ProjectDao();
		teachDao = new TeachDao();
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session = request.getSession();
		user = (User) session.getAttribute("user");
		sessionId = user.getId();

		String action = request.getParameter("action");
		switch (action) {
		case "paper":
			List<Paper> papers = paperDao.getPapersByUser(sessionId);
			request.setAttribute("papers", papers);
			System.out.println("论文是:" + papers);
			request.getRequestDispatcher("data/paper.jsp").forward(request, response);
			break;
		case "book":
			List<Book> books = bookDao.getBooksByUser(sessionId);
			request.setAttribute("books", books);
			System.out.println("书籍是:" + books);
			request.getRequestDispatcher("data/book.jsp").forward(request, response);
			break;
		case "fruit":
			List<Fruit> fruits = fruitDao.getFruitsByUser(sessionId);
			System.out.println("成果是:" + fruits);

			request.setAttribute("fruits", fruits);
			request.getRequestDispatcher("data/fruit.jsp").forward(request, response);
			break;
		case "project":
			List<Project> projects = projectDao.getProjectsByUser(sessionId);
			request.setAttribute("projects", projects);
			request.getRequestDispatcher("data/project.jsp").forward(request, response);
			break;
		case "teach":
			List<Teach> teachs = teachDao.getTeachsByUser(sessionId);
			request.setAttribute("teachs", teachs);
			request.getRequestDispatcher("data/teach.jsp").forward(request, response);
			break;
		case "save":
			save(request, response);
			break;
		case "del":
			del(request, response);
			break;
		case "update":
			update(request, response);
			break;
		default:
			break;
		}
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
	}

	private void update(HttpServletRequest request, HttpServletResponse response) {
		String param = request.getParameter("param");
		switch (param) {
		case "paper":
			updatePaper(request, response);
			break;
		case "book":
			updateBook(request, response);
			break;
		case "fruit":
			updateFruit(request, response);
			break;
		case "project":
			updateProject(request, response);
			break;
		case "teach":
			updateTeach(request, response);
			break;

		default:
			break;
		}

	}

	private void updateTeach(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String[]> map = request.getParameterMap();
		Teach teach = new Teach();
		try {
			BeanUtils.populate(teach, map);
			boolean ok = teachDao.updateTeach(teach);
			if(ok){
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("msg", "success");
				response.getWriter().write(jsonObject.toString());
			}
		} catch (IllegalAccessException | InvocationTargetException | IOException e) {
			e.printStackTrace();
		}
	}

	private void updateProject(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String[]> map = request.getParameterMap();
		Project project = new Project();
		try {
			BeanUtils.populate(project, map);
			if (project.getStartTime().equals("")) {
				project.setStartTime(null);
			}
			boolean ok = projectDao.updateProject(project);
			if(ok){
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("msg", "success");
				response.getWriter().write(jsonObject.toString());
			}
		} catch (IllegalAccessException | InvocationTargetException | IOException e) {
			e.printStackTrace();
		}
	}

	private void updateFruit(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String[]> map = request.getParameterMap();
		Fruit fruit = new Fruit();
		try {
			BeanUtils.populate(fruit, map);
			if (fruit.getResultTime().equals("")) {
				fruit.setResultTime(null);
			}
			boolean ok = fruitDao.update(fruit);
			if(ok){
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("msg", "success");
				response.getWriter().write(jsonObject.toString());
			}
		} catch (IllegalAccessException | InvocationTargetException | IOException e) {
			e.printStackTrace();
		}
	}

	private void updateBook(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String[]> map = request.getParameterMap();
		Book book = new Book();
		try {
			BeanUtils.populate(book, map);
			if (book.getPressTime().equals("")) {
				book.setPressTime(null);
			}
			boolean ok = bookDao.updateBook(book);
			if(ok){
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("msg", "success");
				response.getWriter().write(jsonObject.toString());
			}
		} catch (IllegalAccessException | InvocationTargetException | IOException e) {
			e.printStackTrace();
		}
		
	}

	private void updatePaper(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String[]> map = request.getParameterMap();
		Paper paper = new Paper();
		try {
			BeanUtils.populate(paper, map);
			if (paper.getPublicationTime().equals("")) {
				paper.setPublicationTime(null);
			}
			boolean ok = paperDao.updatePaper(paper);
			if(ok){
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("msg", "success");
				response.getWriter().write(jsonObject.toString());
			}
		} catch (IllegalAccessException | InvocationTargetException | IOException e) {
			e.printStackTrace();
		}
	}

	private void del(HttpServletRequest request, HttpServletResponse response) {
		String param = request.getParameter("param");
		switch (param) {
		case "paper":
			delPaper(request, response);
			break;
		case "book":
			bookDao.del(request.getParameter("id"));
			break;
		case "fruit":
			fruitDao.del(request.getParameter("id"));
			break;
		case "project":
			projectDao.del(request.getParameter("id"));
			break;
		case "teach":
			teachDao.del(request.getParameter("id"));
			break;

		default:
			break;
		}

	}

	private void delPaper(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		boolean ok = paperDao.del(id);
		if (ok) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("msg", "success");
			try {
				response.getWriter().write(jsonObject.toString());
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	private void save(HttpServletRequest request, HttpServletResponse response) {
		String param = request.getParameter("param");
		switch (param) {
		case "paper":
			savePaper(request, response);
			break;
		case "book":
			saveBook(request, response);
			break;
		case "fruit":
			saveFruit(request, response);
			break;
		case "project":
			saveProject(request, response);
			break;
		case "teach":
			saveTeach(request, response);
			break;
		default:
			break;
		}

	}

	private void saveTeach(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String[]> map = request.getParameterMap();
		Teach teach = new Teach(UUID.randomUUID().toString());
		teach.setUserId(user.getId());

		try {
			BeanUtils.populate(teach, map);
			
			boolean ok = teachDao.addTeach(teach);
			if (ok) {
				List<Teach> teachs = teachDao.getTeachsByUser(user.getId());
				request.setAttribute("teachs", teachs);
				request.getRequestDispatcher("data/teach.jsp").forward(request, response);
			}
		} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void saveProject(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String[]> map = request.getParameterMap();
		Project project = new Project(UUID.randomUUID().toString());
		project.setUserId(user.getId());

		try {
			BeanUtils.populate(project, map);
			if (project.getStartTime().equals("")) {
				project.setStartTime(null);
			}
			boolean ok = projectDao.addProject(project);
			if (ok) {
				List<Project> projects = projectDao.getProjectsByUser(user.getId());
				request.setAttribute("projects", projects);
				request.getRequestDispatcher("data/project.jsp").forward(request, response);
			}
		} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void saveFruit(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String[]> map = request.getParameterMap();
		Fruit fruit = new Fruit(UUID.randomUUID().toString());
		fruit.setUserId(user.getId());

		try {
			BeanUtils.populate(fruit, map);
			if (fruit.getResultTime().equals("")) {
				fruit.setResultTime(null);
			}
			boolean ok = fruitDao.addFruit(fruit);
			if (ok) {
				List<Fruit> fruits = fruitDao.getFruitsByUser(user.getId());
				request.setAttribute("fruits", fruits);
				request.getRequestDispatcher("data/fruit.jsp").forward(request, response);
			}
		} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void saveBook(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String[]> map = request.getParameterMap();
		Book book = new Book(UUID.randomUUID().toString());
		book.setUserId(user.getId());

		try {
			BeanUtils.populate(book, map);
			if (book.getPressTime().equals("")) {
				book.setPressTime(null);
			}
			boolean ok = bookDao.addBook(book);
			if (ok) {
				List<Book> books = bookDao.getBooksByUser(user.getId());
				request.setAttribute("books", books);
				request.getRequestDispatcher("data/book.jsp").forward(request, response);
			}
		} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void savePaper(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String[]> map = request.getParameterMap();
		Paper paper = new Paper(UUID.randomUUID().toString());
		paper.setUserId(user.getId());

		try {
			BeanUtils.populate(paper, map);
			if (paper.getPublicationTime().equals("")) {
				paper.setPublicationTime(null);
			}
			System.out.println("插入的论文:" + paper);
			boolean ok = paperDao.addPaper(paper);
			if (ok) {
				List<Paper> papers = paperDao.getPapersByUser(user.getId());
				request.setAttribute("papers", papers);
				request.getRequestDispatcher("data/paper.jsp").forward(request, response);
			}
		} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
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
