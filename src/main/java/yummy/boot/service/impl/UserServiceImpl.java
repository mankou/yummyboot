package yummy.boot.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.RequiredArgsConstructor;
import yummy.boot.entity.User;
import yummy.boot.entity.UserExample;
import yummy.boot.mapper.UserMapper;
import yummy.boot.mapper.UserMapper2;
import yummy.boot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
	private final UserMapper mapper;
	private final UserMapper2 userMapper2;
	
	@Override
	public void insertSample() {
		User user = new User();
		user.setName("测试");
		user.setCreateDate(new Date());
		int result = mapper.insert(user);
	}

	@Override
	public PageInfo<User> selectByNameByPage(String name,Integer pageNum,Integer pageSize) {
		UserExample example=new UserExample();
		UserExample.Criteria criteria=example.createCriteria();
		criteria.andNameEqualTo(name);

		List<User> list;
		if(pageNum!=null){
			PageHelper.startPage(pageNum,pageSize);
			list=mapper.selectByExample(example);
		}else{
			list=mapper.selectByExample(example);
		}

		PageInfo<User> pageInfo=new PageInfo(list);
		return pageInfo;
	}

	@Override
	public List<User> queryUser() {
		Map m= new HashMap();
		return userMapper2.queryUser(m);
	}

	@Override
	public List queryUserByUserName(String userName) {
		Map m= new HashMap();
		m.put("userName",userName);
		return userMapper2.queryUser(m);
	}
}
