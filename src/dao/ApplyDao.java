package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import entity.Apply;
import entity.Schedule;
import entity.User;
import util.DataBaseUtils;
import util.JdbcUtils;

public class ApplyDao {
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

	public boolean addApply(Apply apply) {
		String sql = "insert into apply(id,userId,category,oneSubject,twoSubject,direction,file) values(?,?,?,?,?,?,?)";
		try {
			queryRunner.update(sql, apply.getId(), apply.getUserId(), apply.getCategory(), apply.getOneSubject(),
					apply.getTwoSubject(), apply.getDirection(), apply.getFile());
			insertSchedule(apply.getUserId());
		} catch (SQLException e) {
			System.out.println("数据库添加错误");
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public List<Apply> getAllIsNotTutor() {
		List<Apply> applys = new ArrayList<Apply>();
		String sql = "select apply.id,userId,category,file,oneSubject,direction,twoSubject,user.name as username from "
				+ "apply,user where user.isTutor=0 and apply.userId=user.id";
		try {
			applys = queryRunner.query(sql, new BeanListHandler<Apply>(Apply.class));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return applys;
	}

	public List<Apply> getTechnologyCheck() {
		List<Apply> applys = new ArrayList<Apply>();
		String sql = "select apply.id,userId,category,oneSubject,twoSubject,direction,user.name as username,file from "
				+ "apply,user,schedule where schedule.technology=0 and apply.userId=user.id and apply.userId = schedule.id";
		try {
			applys = queryRunner.query(sql, new BeanListHandler<Apply>(Apply.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return applys;
	}

	public List<Apply> getAcademyCheck() {
		List<Apply> applys = new ArrayList<Apply>();
		String sql = "select apply.id,userId,category,oneSubject,twoSubject,direction,user.name as username,file from "
				+ "apply,user,schedule where schedule.academy=0 and schedule.technology=1 and apply.userId=user.id and apply.userId = schedule.id";
		try {
			applys = queryRunner.query(sql, new BeanListHandler<Apply>(Apply.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return applys;
	}

	public List<Apply> getDegreeCheck() {
		List<Apply> applys = new ArrayList<Apply>();
		String sql = "select apply.id,userId,category,oneSubject,twoSubject,direction,user.name as username,file from "
				+ "apply,user,schedule where schedule.degree=0 and schedule.academy=1 and schedule.technology=1 and apply.userId=user.id and apply.userId = schedule.id";
		try {
			applys = queryRunner.query(sql, new BeanListHandler<Apply>(Apply.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return applys;
	}

	public List<Apply> getSchoolDegreeCheck() {
		List<Apply> applys = new ArrayList<Apply>();
		String sql = "select apply.id,userId,category,oneSubject,twoSubject,direction,user.name as username,file from "
				+ "apply,user,schedule where schedule.schoolDegree=0 and schedule.degree=1 and schedule.academy=1 and schedule.technology=1 and and apply.userId=user.id and apply.userId = schedule.id";
		try {
			applys = queryRunner.query(sql, new BeanListHandler<Apply>(Apply.class));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return applys;
	}

	public Apply getApply(String userId) {
		String sql = "select * from apply where userId = ?";
		Apply apply = null;
		try {
			apply = queryRunner.query(sql, new BeanHandler<Apply>(Apply.class), userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("查询的用户为:" + apply);
		if (apply == null) {
			return null;
		}
		return apply;
	}

	public void update(Apply apply) {
		System.out.println("更新");
		String sql = "update apply set category=?,oneSubject=?,twoSubject=?,direction=?,file=? where id=?";
		try {
			queryRunner.update(sql, apply.getCategory(), apply.getOneSubject(), apply.getTwoSubject(),
					apply.getDirection(), apply.getFile(), apply.getId());

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}

	}

	private boolean insertSchedule(String id) {
		String sql = "insert into schedule(id) values(?)";
		try {
			queryRunner.update(sql, id);
		} catch (SQLException e) {
			System.out.println("数据库添加错误");
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public Schedule getSchedule(String id) {
		String sql = "select * from schedule where id=?";
		Schedule schedule =null;
		try {
			schedule = queryRunner.query(sql, new BeanHandler<Schedule>(Schedule.class), id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return schedule;
	}
}
