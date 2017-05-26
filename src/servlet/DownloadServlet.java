package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/DownloadServlet")
public class DownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 获取用户下载的文件名称(url地址后追加数据,get)
        String fileName = request.getParameter("fileName");
        fileName = new String(fileName.getBytes("ISO8859-1"),"UTF-8");
        
        // 先获取上传目录路径
        String basePath = getServletContext().getRealPath("/upload");
        System.out.println("文件上传路径"+basePath+":文件名"+fileName);
        // 获取一个文件流
        InputStream in = new FileInputStream(new File(basePath,fileName));
        
        // 如果文件名是中文，需要进行url编码
        fileName = URLEncoder.encode(fileName, "UTF-8");
        // 设置下载的响应头
        response.setHeader("content-disposition", "attachment;fileName=" + fileName);
        
        // 获取response字节流
        OutputStream out = response.getOutputStream();
        byte[] b = new byte[1024];
        int len = -1;
        while ((len = in.read(b)) != -1){
            out.write(b, 0, len);
        }
        // 关闭
        out.close();
        in.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
