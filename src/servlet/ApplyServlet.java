package servlet;

import java.io.File;
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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.ApplyDao;
import dao.OpinionDao;
import dao.PaperDao;
import dao.UserDao;
import entity.Apply;
import entity.Opinion;
import entity.Paper;
import entity.User;

/**
 * Servlet implementation class ApplyServlet
 */
@WebServlet("/ApplyServlet")
public class ApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Apply apply = null;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ApplyServlet() {
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
		String id = user.getId();
		String action = request.getParameter("action");
		System.out.println("request路径："+request.getRequestURL()+"action:"+action);
		switch (action) {
		case "apply":
			apply = new Apply(UUID.randomUUID().toString());
			apply.setUserId(id);
			ApplyDao applyDao = new ApplyDao();
			upload(request, response);
			if (applyDao.getApply(id) != null) {
				applyDao.update(apply);
			} else {
				applyDao.addPaper(apply);
			}
			request.getRequestDispatcher("apply/schedule.jsp").forward(request, response);
			break;
		case "schedule":
			request.getRequestDispatcher("apply/schedule.jsp").forward(request, response);
			break;
		case "query":
			query(request,response);
			break;
		case "pass":
			pass(request,response);
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
		List<Paper> papers = paperDao.getPapersByUser(userId);
		request.setAttribute("papers",papers);
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

	private void upload(HttpServletRequest request, HttpServletResponse response) {
		try {
			// 1. 创建工厂对象
			FileItemFactory factory = new DiskFileItemFactory();
			// 2. 文件上传核心工具类
			ServletFileUpload upload = new ServletFileUpload(factory);
			// 设置大小限制参数
			upload.setFileSizeMax(10 * 1024 * 1024); // 单个文件大小限制
			upload.setSizeMax(50 * 1024 * 1024); // 总文件大小限制
			upload.setHeaderEncoding("UTF-8"); // 对中文文件编码处理

			System.out.println("当前表单是否是文件上传表单：" + upload.isMultipartContent(request));
			// 判断
			if (upload.isMultipartContent(request)) {
				// 3. 把请求数据转换为list集合
				List<FileItem> list = upload.parseRequest(request);
				// 遍历
				for (FileItem item : list) {
					// 判断：普通文本数据
					if (item.isFormField()) {
						// 获取名称
						String name = item.getFieldName();
						item.getString("UTF-8");

						// 获取值
						String value = item.getString("utf-8");
						switch (name) {
						case "category":
							apply.setCategory(value);
							break;
						case "oneSubject":
							apply.setOneSubject(value);
							break;
						case "twoSubject":
							apply.setTwoSubject(value);
							break;
						case "research":
							apply.setResearch(value);
							break;
						default:
							break;
						}
						System.out.println(name + " " + value);
					}
					// 文件表单项
					else {
						/******** 文件上传 ***********/
						// a. 获取文件名称
						String name = item.getName();

						// ----处理上传文件名重名问题----
						// a1. 先得到唯一标记
						String id = UUID.randomUUID().toString();
						// a2. 拼接文件名
						name = id  + name;
						apply.setFile(name);
						apply.setFile(name);
						// b. 得到上传目录
						String basePath = getServletContext().getRealPath("/upload");
						System.out.println("文件上传路径：" + basePath);
						// c. 创建要上传的文件对象
						File file = new File(basePath, name);
						// d. 上传
						item.write(file);
						item.delete(); // 删除组件运行时产生的临时文件
					}
				}
			}
		} catch (Exception e) {
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
