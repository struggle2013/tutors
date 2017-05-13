package util;

import java.sql.*;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;

/**
 * jdbc操作的工具类
 * @author luo
 *
 */
public class JdbcUtils {
	public static DataSource dataSource=null;
	static{
		dataSource= new ComboPooledDataSource("tutorapp");
	}
	/**
	 *释放链接
	 */
	public static void releaseConnection(Connection connection){
		try {
			if(connection!=null){
				connection.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 返回数据源的一个conection 对象
	 * @return
	 * @throws SQLException 
	 */
	public static Connection getConnection() throws SQLException{
		return dataSource.getConnection();
	}
	
}
