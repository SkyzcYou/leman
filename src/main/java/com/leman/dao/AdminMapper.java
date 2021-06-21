package com.leman.dao;

import com.leman.entity.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
    Admin queryAdminByNameAndPassword(@Param("name") String name, @Param("password") String password);
    int updatePassword(Admin admin);

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
