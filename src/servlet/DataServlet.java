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
import dao.PaperDao;
import entity.Book;
import entity.Paper;
import entity.User;

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

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DataServlet() {
		super();
		paperDao = new PaperDao();
		bookDao = new BookDao();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		session = request.getSession();
		user = (User) session.getAttribute("user");
		String id = user.getId();

		String action = request.getParameter("action");
		switch (action) {
		case "paper":
			List<Paper> papers = paperDao.getPapersByUser(id);
			request.setAttribute("papers", papers);
			System.out.println("论文是:" + papers);
			request.getRequestDispatcher("data/paper.jsp").forward(request, response);
			break;
		case "book":
			List<Book> books = bookDao.getBooksByUser(id);
			request.setAttribute("books", books);
			System.out.println("书籍是:" + books);
			request.getRequestDispatcher("data/book.jsp").forward(request, response);
			break;
		case "fruit":
			request.getRequestDispatcher("data/fruit.jsp").forward(request, response);
			break;
		case "project":
			request.getRequestDispatcher("data/project.jsp").forward(request, response);
			break;
		case "teach":
			request.getRequestDispatcher("data/teach.jsp").forward(request, response);
			break;
		case "save":
			save(request, response);
			break;
		case "del":
			del(request,response);
		default:
			break;
		}
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());
	}

	private void del(HttpServletRequest request, HttpServletResponse response) {
		String param = request.getParameter("param");
		switch (param) {
		case "paper":
			delPaper(request,response);
			break;

		default:
			break;
		}
		
	}

	private void delPaper(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		boolean ok =paperDao.del(id);
		if (ok) {
			List<Paper> papers = paperDao.getPapersByUser(user.getId());
			request.removeAttribute("papers");
			request.setAttribute("papers", papers);
			try {
				
				System.out.println("删除后论文是:"+papers);
				request.getRequestDispatcher("data/paper.jsp").forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	private void save(HttpServletRequest request, HttpServletResponse response) {
		String param = request.getParameter("param");
		switch (param) {
		case "paper":
			savePaper(request,response);
			break;

		default:
			break;
		}
		
		
	}

	private void savePaper(HttpServletRequest request, HttpServletResponse response) {
		Map<String, String[]> map = request.getParameterMap();
		Paper paper = new Paper(UUID.randomUUID().toString());
		paper.setUserId(user.getId());
		
		try {
			BeanUtils.populate( paper, map);
			if(paper.getPublicationTime().equals("")){paper.setPublicationTime(null);}
			System.out.println("插入的论文:"+paper);
			boolean ok =paperDao.addPaper(paper);
			if(ok){
				List<Paper> papers = paperDao.getPapersByUser(user.getId());
				request.setAttribute("papers", papers);
				request.getRequestDispatcher("data/paper.jsp").forward(request, response);
			}
		} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	private void teach() {
		// TODO Auto-generated method stub

	}

	private void project() {
		// TODO Auto-generated method stub

	}

	private void fruit() {
		// TODO Auto-generated method stub

	}

	private void book() {
		// TODO Auto-generated method stub

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
