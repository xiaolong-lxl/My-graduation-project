package com.jsj.bs.dao;

import com.jsj.bs.BastTest;
import com.jsj.bs.pojo.TbUser;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * @author King_long
 * @program: lxlproject
 * @Date 2020/01/09 14:10
 */

/**
 * user 模型 单元测试
 */
public class TbUserDaoTest extends BastTest {

    @Autowired
    private TbUserDao tbUserDao;
    @Test
    public void queryById() {
        System.out.println(tbUserDao.queryById("zhangsan"));
    }

    @Test
    public void queryByAccount() {
        System.out.println(tbUserDao.queryByAccount("zhangsan","111111111" ));
    }

    @Test
    public void queryStatus() {
        System.out.println(tbUserDao.queryStatus("zhangsan"));
        System.out.println(tbUserDao.queryStatus("lisi"));
    }

    @Test
    public void queryAll() {
        TbUser tbUser = new TbUser();
        for (TbUser user : tbUserDao.queryAll(tbUser)) {
            System.out.println(user);
        }
    }

    @Test
    public void insert() {

    }

    @Test
    public void update() {
    }
}