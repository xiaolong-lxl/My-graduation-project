package com.jsj.bs.dao;

import com.jsj.bs.BastTest;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * @author King_long
 * @program: lxlproject
 * @Date 2020/01/09 14:02
 */

/**
 *  role 模型 单元测试
 */
public class TbRoleDaoTest extends BastTest {

    @Autowired
    private TbRoleDao tbRoleDao;
    @Test
    public void queryById() {
        System.out.println(tbRoleDao.queryById(1));
    }

    @Test
    public void queryByUserAccount() {
        System.out.println(tbRoleDao.queryByUserAccount("zhangsan"));
    }

    @Test
    public void queryByLeaderAccount() {
        System.out.println(tbRoleDao.queryByLeaderAccount("xiaowang"));
    }

    @Test
    public void queryByAdminAccount() {
        System.out.println(tbRoleDao.queryByAdminAccount("admin"));
    }
}