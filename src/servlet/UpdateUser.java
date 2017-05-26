package servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.Converter;

import entity.User;
import service.UserService;

/**
 * Servlet implementation class UpdateUser
 */
@WebServlet("/UpdateUser")
public class UpdateUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService=null;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateUser() {
		super();
		 userService = new UserService();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equals("updatePassword")) {
			String oldPassword = request.getParameter("oldPassword");
			String password = request.getParameter("password");
			
			User user =(User) request.getSession().getAttribute("user");
			String id = user.getId();
			boolean ok =userService.updatePassword(oldPassword, password, id);
			if(ok){
				request.getRequestDispatcher("baseinfo/changePasswordSuccess.jsp").forward(request, response);
			}else{
				request.getRequestDispatcher("baseinfo/passwordError.jsp").forward(request, response);
			}
		} else {
			Map<String, String[]> map = request.getParameterMap();
			User user = new User();
			HttpSession session = null;
			System.out.println("提交的用户信息为:" + map);
			try {
				session = request.getSession();
				User oldUser = (User) session.getAttribute("user");
				ConvertUtils.register(new Converter() {
					@Override
					public Object convert(Class type, Object value) {
						if (value == null) {
							return null;
						}
						String str = (String) value;
						if (str.trim().equals("")) {
							return null;
						}
						SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
						try {
							return sf.parse(str);
						} catch (Exception e) {
							throw new RuntimeException(e);
						}
					}
				}, Date.class);
				BeanUtils.setProperty(user, "id", oldUser.getId());

				BeanUtils.populate(user, map);
				if (user.getBirth().equals("")) {
					user.setBirth(null);
				}
				if (user.getGraduatedTime().equals(""))
					user.setGraduatedTime(null);
				System.out.println("更新的用户：" + user);
				
				boolean ok = userService.updateUser(user);
				if (ok) {
					session.setAttribute("user", user);
					session.setAttribute("name", user.getName());
					request.getRequestDispatcher("baseinfo/info.jsp").forward(request, response);
				} else {
				}

			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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
