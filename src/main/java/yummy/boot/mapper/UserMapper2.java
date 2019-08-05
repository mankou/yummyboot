package yummy.boot.mapper;

import yummy.boot.entity.User;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;
import java.util.Map;


@Mapper
public interface UserMapper2 {

    List<User> queryUser(Map m);

}
