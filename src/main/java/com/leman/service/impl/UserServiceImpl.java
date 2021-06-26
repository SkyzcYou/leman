package com.leman.service.impl;

import com.leman.dao.UserMapper;
import com.leman.entity.User;
import com.leman.service.UserService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: skyzc
 * Date: 2019/12/10
 * Time: 19:09
 * To change this template use File | Settings | File Templates.
 * Description:
 */
@Service
public class UserServiceImpl implements UserService {
    private UserMapper userMapper;
    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }
    @Override
    public List<User> queryAllUser() {
        return userMapper.queryAllUser();
    }

    @Override
    public User queryUserByEmailAndPassword(String email, String password) {
        User user = userMapper.queryUserByEmailAndPassword(email,password);
        return user;
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public User queryUserById(int id) {
        return userMapper.queryUserById(id);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public int updatePassword(User user) {
        return userMapper.updatePassword(user);
    }

    @Override
    public int deleteUserById(int id) {
        return userMapper.deleteUserById(id);
    }

    @Override
    public int updateUser_allinfo(User user) {
        return userMapper.updateUser_allinfo(user);
    }
}