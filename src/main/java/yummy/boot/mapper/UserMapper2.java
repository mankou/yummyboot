package yummy.boot.mapper;

import yummy.boot.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * 这里演示即使在xml的方式中也能使用注解方式
 * */
@Mapper
public interface UserMapper2 {

    @Select("select * from tb_user")
    public List<User> selectAll();

}
