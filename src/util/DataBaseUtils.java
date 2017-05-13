package util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.util.Date;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

/**
 * 数据库基本工具类
 * @author Luo
 *
 */
public class DataBaseUtils {
	private static QueryRunner queryRunner= new QueryRunner();
	/**
	 *该方法封装了delete insert update 操作
	 * @param sql:sql语句
	 * @param args: 填充sql语句占位符
	 * */
	public static void update(String sql, Object ... args){
		Connection connection =null;
		try{
			connection =JdbcUtils.getConnection();
			queryRunner.update(connection, sql, args);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JdbcUtils.releaseConnection(connection);
		}
	}
	/**
	 * 查询出数据，并且list返回
	 * @param sql
	 * @param objects
	 * @return
	 * @throws SQLException
	 */
	public static List<Map<String,Object>> queryForList(String sql,Object...objects){
		Connection connection =null;
		try{
			connection =JdbcUtils.getConnection();
			return queryRunner.query(connection, sql, new MapListHandler(),objects);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JdbcUtils.releaseConnection(connection);
		}		
		return null;
	}
	/**
	 * 查询出数据，并且map返回
	 * @param sql
	 * @param objects
	 * @return
	 * @throws SQLException
	 */
	public static Map<String,Object> queryForMap(String sql,Object...objects) {
		Connection connection =null;
		try{
			connection =JdbcUtils.getConnection();
			return queryRunner.query(connection, sql, new MapHandler(),objects);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JdbcUtils.releaseConnection(connection);
		}		
		return null;
	}
	/**
	 * 返回一条字段的具体值，例如：一条记录name，或该表有多少条记录
	 * @param sql
	 * @param args
	 * @return
	 */
	public static <E> E getForValue(String sql, Object ... args){
		Connection connection =null;
		try{
			System.out.println(sql+args);
			connection =JdbcUtils.getConnection();
			return (E)queryRunner.query(connection, sql, new ScalarHandler<E>(),args);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JdbcUtils.releaseConnection(connection);
		}
		
		return null;
	}
	public static List<String> getListValue(String sql, Object ... args){
		Connection connection =null;
		try{
			connection =JdbcUtils.getConnection();
			return queryRunner.query(connection, sql, new ColumnListHandler<String>(),args);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JdbcUtils.releaseConnection(connection);
		}
		
		return null;
	}
	@SuppressWarnings("unchecked")
	public static <T>T queryForBean(String sql,Class<?> clazz,Object...objects){
		T obj = null;
		Map<String,Object> map =null;
		Field field =null;
//		System.out.println(objects[0].toString());
		try {
			obj = (T) clazz.newInstance();//创建一个新的bean实例
			map = queryForMap(sql, objects);//先将结果集放在Map中
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(map==null){
			return null;
		}
		for (String columnName : map.keySet()) {
			Method method =null;
			String propertyName = StringUtils.columnToProperty(columnName);
			try {
				field =clazz.getDeclaredField(propertyName);

			} catch (Exception e) {
				e.printStackTrace();
			}

			String fieldType = field.toString().split(" ")[1];

			Object value = map.get(columnName);
//			System.out.println("ֵ:"+value);
			if(value == null){
				continue;
			}

			String setMethodName = "set"+StringUtils.upperCaseFirstCharacter(propertyName);

			try {

				String valueType = value.getClass().getName();

				if (!fieldType.equals(valueType)) {

					if(fieldType.equalsIgnoreCase("java.lang.Integer")){

	                    value = Integer.parseInt(String.valueOf(value));

	                }else if(fieldType.equalsIgnoreCase("java.lang.String")){
	                    value = String.valueOf(value);

	                }else if(fieldType.equalsIgnoreCase("java.util.Date")){
	                	valueType = "java.util.Date";

	                    String dateStr = String.valueOf(value);
	                    Timestamp ts = Timestamp.valueOf(dateStr);
	                    Date date = new Date(ts.getTime());
	                    value = date;
	                }
				}

				method = clazz.getDeclaredMethod(setMethodName, Class.forName(fieldType));
				
				method.invoke(obj, value);
			} catch (Exception e) {
				e.printStackTrace();
	            
			}
		}
		return obj;
		
	}
}

