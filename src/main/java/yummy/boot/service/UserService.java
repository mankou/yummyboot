package yummy.boot.service;

import com.github.pagehelper.PageInfo;
import yummy.boot.entity.User;

import java.util.List;

public interface UserService {
	void insertSample();

	PageInfo<User> selectByNameByPage(String name,Integer pageNum,Integer pageSize);


	List<User> selectAll();
}
