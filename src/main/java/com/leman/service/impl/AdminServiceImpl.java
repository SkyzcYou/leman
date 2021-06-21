package com.leman.service.impl;

import com.leman.dao.AdminMapper;
import com.leman.entity.Admin;
import com.leman.service.AdminService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AdminServiceImpl implements AdminService {
    private AdminMapper adminMapper;

    public void setAdminMapper(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    @Override
    public Admin queryAdminByNameAndPassword(String name, String password) {
        return adminMapper.queryAdminByNameAndPassword(name, password);
    }

    @Override
    public int addAdmin(Admin admin) {
        return adminMapper.addAdmin(admin);
    }

    @Override
    public int deleteAdminById(int id) {
        return adminMapper.deleteAdminById(id);
    }

    @Override
    public int updateAdmin(Admin admin) {
        return adminMapper.updateAdmin(admin);
    }

    @Override
    public Admin queryAdminById(int id) {
        return adminMapper.queryAdminById(id);
    }

    @Override
    public List<Admin> queryAllAdmin() {
        return adminMapper.queryAllAdmin();
    }
}
