package dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import entity.Book;
import util.JdbcUtils;

public class BookDao {
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

	public Book getBook(String id) {
		String sql = "select * from book where id = ?";
		Book book = null;
		try {
			book = queryRunner.query(sql, new BeanHandler<Book>(Book.class), id);
		} catch (SQLException e) {
			System.out.println("数据根据id查询错误");
			e.printStackTrace();
		}
		System.out.println("数据查到的论文为:" + book);
		if (book == null) {
			return null;
		}
		return book;
	}

	public List<Book> getBooks(String name) {
		List<Book> books = new ArrayList<Book>();
		// 实现 名字 的模糊查询
		if (name == null) {
			name = "%%";
		} else {
			name = "%" + name + "%";
		}
		String sql = "select * from book where name like ?";
		try {
			books = queryRunner.query(sql, new BeanListHandler<Book>(Book.class), name);
		} catch (SQLException e) {
			System.out.println("数据库名字模糊查询错误");
			e.printStackTrace();
		}
		return books;
	}
	public List<Book> getBooksByUser(String userId) {
		List<Book> books = new ArrayList<Book>();
		String sql = "select * from book where userId=?";
		try {
			books = queryRunner.query(sql, new BeanListHandler<Book>(Book.class), userId);
		} catch (SQLException e) {
			System.out.println("数据库名字模糊查询错误");
			e.printStackTrace();
		}
		return books;
	}
	public boolean addBook(Book book) {
		String sql = "insert into Book(id,name,press,pressTime,editWordNumber,signatureOrder,"
				+ "school,userId) values(?,?,?,?,?,?,?,?)";
		try {
			queryRunner.update(sql, book.getId(), book.getName(), book.getPress(), book.getPressTime(),
					book.getEditWordNumber(), book.getSignatureOrder(), book.getSchool(), book.getUserId());
		} catch (SQLException e) {
			System.out.println("数据库添加错误");
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public boolean updateBook(Book book) {
		String sql = "update book set name=?,press=?,pressTime=?,editWordNumber=?,signatureOrder=?,"
				+ "school=? where id=?";
		try {
			queryRunner.update(sql, book.getName(), book.getPress(), book.getPressTime(),
					book.getEditWordNumber(), book.getSignatureOrder(), book.getSchool(), book.getUserId());
		} catch (SQLException e) {
			System.out.println("数据库更新错误");
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public boolean del(String id){
		String sql="delete from book where id=?";
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
