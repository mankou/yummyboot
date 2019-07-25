package yummy.web.service;

import com.github.pagehelper.PageInfo;
import yummy.web.entity.User;

import java.util.List;

public interface UserService {
	void insertSample();

	PageInfo<User> selectByNameByPage(String name,Integer pageNum,Integer pageSize);


	List<User> selectAll();
}
