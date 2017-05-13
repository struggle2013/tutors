package service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import entity.Notice;
import util.DataBaseUtils;

public class NoticeService {
	public void add(String noticeName,String info,String content){
		String id = UUID.randomUUID().toString();
		Date date = new Date();
		String sql="insert into notice values(?,?,?,?,?)";
		DataBaseUtils.update(sql, id,noticeName,info,date,content);
	}
	public List<Notice> getNotices(){
		List<Notice> notices=new ArrayList<Notice>();
		String sql = "select * from notice";
		List<Map<String, Object>> noticess = DataBaseUtils.queryForList(sql);
		for (Map<String, Object> map : noticess) {
			String id = (String) map.get("id");
			String sql_notice="select * from notice where id=?";
			Notice notice = DataBaseUtils.queryForBean(sql_notice, Notice.class, id);
			notices.add(notice);
		}
		
		return notices;
	}
	public Notice getNotice(String id){
		String sql="select * from notice where id=?";
		Notice notice = DataBaseUtils.queryForBean(sql, Notice.class, id);
		return notice;
	}
}
