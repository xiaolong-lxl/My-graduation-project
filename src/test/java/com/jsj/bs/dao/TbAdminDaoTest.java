package com.jsj.bs.dao;


import com.jsj.bs.BastTest;
import com.jsj.bs.pojo.TbAdmin;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author King_long
 * @program: lxlproject
 * @Date 2020/01/09 13:53
 */

/**
 * admin 模型 单元测试
 */
public class TbAdminDaoTest extends BastTest {

    @Autowired
    private TbAdminDao tbAdminDao;

    @Test
    public void queryById() {
        System.out.println(tbAdminDao.queryById(1));
    }

    @Test
    public void queryByAccount() {
        System.out.println(tbAdminDao.queryByAccount("admin","admin" ));
    }

    @Test
    public void queryStatus() {
        System.out.println(tbAdminDao.queryStatus("admin"));
    }

    @Test
    public void queryAll() {
        TbAdmin tbAdmin = new TbAdmin();
        for (TbAdmin admin : tbAdminDao.queryAll(tbAdmin)) {
            System.out.println(admin);
        }
    }
}