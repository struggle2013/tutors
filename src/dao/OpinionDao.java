package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import entity.Apply;
import entity.Opinion;
import util.JdbcUtils;

public class OpinionDao {
	private static QueryRunner queryRunner = new QueryRunner(JdbcUtils.dataSource);
	static Connection conn = null;
	static {
		try {
			conn = JdbcUtils.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Opinion getOpinion(String id) {
		String sql = "select * from opinion where id = ?";
		Opinion opinion = null;
		try {
			opinion = queryRunner.query(sql, new BeanHandler<Opinion>(Opinion.class), id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("查询的用户为:" + opinion);
		if (opinion == null) {
			return null;
		}
		return opinion;
	}

	public List<Opinion> getOpinionByUser(String userId) {
		List<Opinion> opinions = null;
		String sql = "select * from opinion where userId=?";
		;
		try {
			opinions = queryRunner.query(sql, new BeanListHandler<Opinion>(Opinion.class), userId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return opinions;
	}

	public boolean add(Opinion opinion) {
		
		String sql = "insert into opinion(id,agree,suggestion,time,chargePerson,kind,userId) values(?,?,?,?,?,?,?)";
		try {
			checked(opinion);
			queryRunner.update(sql, opinion.getId(),opinion.getAgree(),opinion.getSuggestion(),
					opinion.getTime(),opinion.getChargePerson(),opinion.getKind(),opinion.getUserId());
			updateSchedule(opinion);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
	public boolean updateSchedule(Opinion opinion){
		
		String sql = "update schedule set "+opinion.getKind()+"="+opinion.getAgree()+" where id = ?";
		
		try {
			queryRunner.update(sql, opinion.getUserId());
			if(opinion.getKind().equals("schoolDegree") && opinion.getAgree()==1){
				sql = "update user set isTutor=1 where id = ?";
				queryRunner.update(sql,opinion.getUserId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return true;
	}
	private void checked(Opinion opinion){
		String sql = "select * from opinion where kind=? and userId=?";
		try {
			Opinion op =queryRunner.query(sql, new BeanHandler<Opinion>(Opinion.class),opinion.getKind(),opinion.getUserId());
			if(op!=null){
				sql = "delete from opinion where id = ?";
				queryRunner.update(sql,op.getId());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
