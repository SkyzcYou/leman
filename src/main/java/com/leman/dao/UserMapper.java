package com.leman.dao;


import com.leman.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface UserMapper {
    //增加一个User
    int addUser(User user);

    //根据id删除一个User
    int deleteUserById(int id);

    //更新User
    int updateUser(User user);
    int updateUser_allinfo(User user);

    //根据id查询,返回一个User
    User queryUserById(@Param("id") int id);

    //查询全部User,返回list集合
    List<User> queryAllUser();

    //根据用户 email,密码 返回一个User
    User queryUserByEmailAndPassword(@Param("email") String email,@Param("password") String password);

    // 根据 id 修改密码
    int updatePassword(User user);
}