package test;

import java.util.List;

import org.junit.Test;

import dao.UserDao;
import entity.User;
import service.UserService;

public class UserServiceTest {
	UserService userService = new UserService();
	User user=null;
	@Test
	public void TestGetUser(){
		userService.getUser("2292946166@qq.com", "12356");
		System.out.println(user);
	}
	@Test
	public void TestQueyName(){
		List<User> users =userService.queryName("张");
		System.out.println(users);
	}
	@Test
	public void Testcheck(){
		UserDao userDao = new UserDao();
		boolean ok = userDao.checkDegree("2292946166@qq.com");
		System.out.println("检查："+ok);
	}
}
