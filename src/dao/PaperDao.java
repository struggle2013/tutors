package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import entity.Paper;
import util.JdbcUtils;

public class PaperDao {
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

	public Paper getPaper(String id) {
		String sql = "select * from paper where id = ?";
		Paper paper = null;
		try {
			paper = queryRunner.query(sql, new BeanHandler<Paper>(Paper.class), id);
		} catch (SQLException e) {
			System.out.println("数据根据id查询错误");
			e.printStackTrace();
		}
		System.out.println("数据查到的论文为:" + paper);
		if (paper == null) {
			return null;
		}
		return paper;
	}

	public List<Paper> getPapers(String name) {
		List<Paper> papers = new ArrayList<Paper>();
		// 实现 名字 的模糊查询
		if (name == null) {
			name = "%%";
		} else {
			name = "%" + name + "%";
		}
		String sql = "select * from paper where name like ?";
		try {
			papers = queryRunner.query(sql, new BeanListHandler<Paper>(Paper.class), name);
		} catch (SQLException e) {
			System.out.println("数据库名字模糊查询错误");
			e.printStackTrace();
		}
		return papers;
	}
	public List<Paper> getPapersByUser(String userId) {
		List<Paper> papers = new ArrayList<Paper>();
		String sql = "select * from paper where userId=?";
		try {
			papers = queryRunner.query(sql, new BeanListHandler<Paper>(Paper.class), userId);
		} catch (SQLException e) {
			System.out.println("数据库名字模糊查询错误");
			e.printStackTrace();
		}
		return papers;
	}
	public boolean addPaper(Paper paper) {
		String sql = "insert into paper(id,name,publication,publicationTime,retrieval,signatureOrder,"
				+ "school,userId) values(?,?,?,?,?,?,?,?)";
		try {
			queryRunner.update(sql, paper.getId(), paper.getName(), paper.getPublication(), paper.getPublicationTime(),
					paper.getRetrieval(), paper.getSignatureOrder(), paper.getSchool(), paper.getUserId());
		} catch (SQLException e) {
			System.out.println("数据库添加错误");
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean updatePaper(Paper paper) {
		String sql = "update paper set name=?,publication=?,publicationTime=?,retrieval=?,signatureOrder=?,"
				+ "school=? where id=?";
		try {
			queryRunner.update(sql, paper.getName(), paper.getPublication(), paper.getPublicationTime(),
					paper.getRetrieval(), paper.getSignatureOrder(), paper.getSchool(), paper.getId());
		} catch (SQLException e) {
			System.out.println("数据库更新错误");
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public boolean del(String id){
		String sql="delete from paper where id=?";
		try {
			queryRunner.update(sql, id);
		} catch (SQLException e) {
			System.out.println("数据库删除错误！");
			e.printStackTrace();
			return false;
		}
		return true;
	}
}
