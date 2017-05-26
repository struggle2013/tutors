package servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import entity.Apply;
import entity.User;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String filename = null;
		// TODO Auto-generated method stub
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
						
						System.out.println(name + " " + value);
					}
					// 文件表单项
					else {
						/******** 文件上传 ***********/
						// a. 获取文件名称
						filename = item.getName();

						// ----处理上传文件名重名问题----
						// a1. 先得到唯一标记
						String id = UUID.randomUUID().toString();
						// a2. 拼接文件名
						filename = id  + filename;
						
						// b. 得到上传目录
						String basePath = "D:/server/apache-tomcat-9.0.0.M15/webapps/upload";
						//getServletContext().getRealPath("/upload");
						System.out.println("文件上传路径：" + basePath);
						 // 如果目录不存在则创建
				        File uploadDir = new File(basePath);
				        if (!uploadDir.exists()) {
				            uploadDir.mkdir();
				        }
						// c. 创建要上传的文件对象
						File file = new File(basePath, filename);
						// d. 上传
						item.write(file);
						item.delete(); // 删除组件运行时产生的临时文件
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONObject jsonobj = new JSONObject();
		jsonobj =jsonobj.element("filename", filename);
		response.getWriter().append(jsonobj.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
