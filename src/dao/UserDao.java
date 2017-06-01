package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;

import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.mchange.v2.c3p0.impl.C3P0ImplUtils;

import entity.Power;
import entity.User;
import util.DataBaseUtils;
import util.JdbcUtils;

public class UserDao {
	private static QueryRunner queryRunner = new QueryRunner(JdbcUtils.dataSource);
	static Connection conn = null;
	static {
		try {
			conn = JdbcUtils.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public User getUser(String id) {
		String sql = "select * from user where id = ?";
		User user = null;
		try {
			user = queryRunner.query(sql, new BeanHandler<User>(User.class), id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("查询的用户为:" + user);
		if (user == null) {
			return null;
		}
		return user;
	}

	public boolean insertUser(User user) {
		String sql = "insert into user(id,name,password) values(?,?,?)";
		try {
			queryRunner.update(sql, user.getId(), user.getName(), user.getPassword());
		} catch (SQLException e) {

			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean update(User user) {
		String sql = "update user set name=?,email=?,sex=?,titleSubject=?,birth=?,nation=?,face=?,telephone=?,address=?,"
				+ "title=?,eduBackground=?,graduatedSchool=?,graduatedTime=?,graduatedMajor=?,pic=? where id=?";
		try {
			queryRunner.update(sql, user.getName(), user.getEmail(), user.getSex(), user.getTitleSubject(),
					user.getBirth(), user.getNation(), user.getFace(), user.getTelephone(), user.getAddress(),
					user.getTitle(), user.getEduBackground(), user.getGraduatedSchool(), user.getGraduatedTime(),
					user.getGraduatedMajor(),user.getPic(), user.getId());

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public boolean changePassword(String password,String id){
		String sql = "update user set password=? where id=?";
		try {
			queryRunner.update(sql, password,id);
		} catch (SQLException e) {
			
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public List<User> queryAll(){
		List<User> users = new ArrayList<User>();
		String sql = "select * from user";
		try {
			users = queryRunner.query( sql, new BeanListHandler<User>(User.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return users;
	}
	public List<User> queryName(String name){
		List<User> users = new ArrayList<User>();
		//实现  名字  的模糊查询  
        if(name == null){  
            name ="%%";  
        }else{  
            name ="%"+ name +"%";  
        }  
		String sql = "select * from user where name like ?";
		try {
			users = queryRunner.query( sql, new BeanListHandler<User>(User.class),name);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return users;
	}
	public boolean checkTechnology(String userId){
		String sql = "select * from power where userId=?";
		Power power=null;
		try {
			 power= queryRunner.query(sql, new BeanHandler<Power>(Power.class),userId);
		} catch (SQLException e) {
			return false;
		}
		if(power==null){return false;}
		if(power.getTechnology()==1){return true;}
		return false;
	}
	public Power getPower(String userId){
		String sql = "select * from power where userId=?";
		Power power=null;
		try {
			power = queryRunner.query(sql, new BeanHandler<Power>(Power.class),userId);
			if(power==null){
				sql = "insert into power(userId) values(?)";
				queryRunner.update(sql,userId);
				power = new Power();
				power.setUserId(userId);
				return power;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return power;
	}
	public void updatePower(Power power){
		String sql = "update power set technology=? , academy=? , degree=? ,schoolDegree=? where userId=?";
		try {
			queryRunner.update(sql,power.getTechnology(),power.getAcademy(),power.getDegree(),power.getSchoolDegree(),power.getUserId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public boolean checkAcademy(String userId){
		String sql = "select academy from power where userId=?";
		Power power=null;
		try {
			 power= queryRunner.query(sql, new BeanHandler<Power>(Power.class),userId);
		} catch (SQLException e) {
			return false;
		}
		if(power==null){return false;}
		if(power.getAcademy()==1){return true;}
		return false;
	}
	public boolean checkSchoolDegree(String userId){
		String sql = "select schoolDegree from power where userId=?";
		Power power=null;
		try {
			 power= queryRunner.query(sql, new BeanHandler<Power>(Power.class),userId);
		} catch (SQLException e) {
			return false;
		}
		if(power==null){return false;}
		if(power.getSchoolDegree()==1){return true;}
		return false;
	}
	public boolean checkDegree(String userId){
		String sql = "select degree from power where userId=?";
		Power power=null;
		try {
			 power= queryRunner.query(sql, new BeanHandler<Power>(Power.class),userId);
		} catch (SQLException e) {
			return false;
		}
		if(power==null){return false;}
		if(power.getDegree()==1){return true;}
		return false;
	}
	public boolean checkSys(String sysusername,String syspassword){
		String sql = "select password from sysuser where username=?";
		try {
			String password =queryRunner.query(sql, new ScalarHandler<String>(),sysusername);
			if(password!=null&&password.equals(syspassword)){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
	public boolean updateSysPassword(String oldPassword,String passworld,String username){
		String sql = "update sysuser set password=? where username=?";
		try {
			int count=queryRunner.update(sql,passworld,username);
			if(count==1){
				return true;
			}
		} catch (SQLException e) {
			return false;
		}
		return false;
	}
	
}
