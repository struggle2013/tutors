package test;

import java.util.List;

import org.junit.Test;

import dao.ApplyDao;
import dao.UserDao;
import entity.Apply;
import entity.Schedule;
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
	@Test
	public void TestgetSchedule(){
		ApplyDao applyDao = new ApplyDao();
		Schedule schedule =applyDao.getSchedule("11@qq.com");
		System.out.println("schedule:"+schedule);
	}
	@Test
	public void TestGet(){
		ApplyDao applyDao = new ApplyDao();
		List<Apply> applys = applyDao.getAcademyCheck();
		System.out.println(applys);
	}
	@Test
	public void TestGet2(){
		ApplyDao applyDao = new ApplyDao();
		List<Apply> applys = applyDao.getTechnologyCheck();
		System.out.println(applys);
	}
	@Test
	public void Test3(){
		ApplyDao applyDao = new ApplyDao();
		List<Apply> applys = applyDao.getDegreeCheck();
		System.out.println(applys);
	}
}
