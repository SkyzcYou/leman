package com.leman.service;

import com.leman.entity.Admin;

import java.util.List;

public interface AdminService {
    Admin queryAdminByNameAndPassword(String name, String password);

    //增加一个Admin
    int addAdmin(Admin admin);

    //根据id删除一个Admin
    int deleteAdminById(int id);

    //更新Admin
    int updateAdmin(Admin admin);

    //根据id查询,返回一个Admin
    Admin queryAdminById(int id);

    //查询全部Admin,返回list集合
    List<Admin> queryAllAdmin();
}
