package service;

import java.util.ArrayList;
import java.util.List;

import dao.UserDao;
import entity.User;

public class UserService {
	private UserDao userdao = new UserDao();
	public User getUser(String username,String password){
		User user= userdao.getUser(username);
		if(user.getPassword().equals(password)){return user;}
		return null;
	}
	public Boolean checkUser(String username){
		User user = userdao.getUser(username);
		if(user!=null){return true;}
		return false;
	}
	public Boolean registerUser(User user){
		return userdao.insertUser(user);
	}
	public Boolean updateUser(User user){
		return userdao.update(user);
	}
	public Boolean changePassword(String password,String id){
		return userdao.changePassword(password, id);
	}
	public List<User> queryAll(){		
		return userdao.queryAll();
	}
	public List<User> queryName(String name){
		return userdao.queryName(name);
	}
}
