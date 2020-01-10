package com.jsj.bs.dao;

import com.jsj.bs.BastTest;
import com.jsj.bs.pojo.TbQingjia;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

/**
 * @author King_long
 * @program: lxlproject
 * @Date 2020/01/09 22:16
 */

public class TbQingjiaDaoTest extends BastTest {

    @Autowired
    private TbQingjiaDao tbQingjiaDao;

    @Test
    public void queryById() {
        System.out.println(tbQingjiaDao.queryById(1));
    }

    @Test
    public void queryAll() {
        for (TbQingjia tbQingjia : tbQingjiaDao.queryAll(new TbQingjia())) {
            System.out.println(tbQingjia);
        }
    }

    @Test
    public void insert() {
        TbQingjia tbQingjia = new TbQingjia();
        tbQingjia.setQingjiaTitle("生病了");
        tbQingjia.setEndTime(new Date());
        tbQingjia.setLeaderId(4);
        tbQingjia.setAddTime(new Date());
        tbQingjia.setLeaderTel("12345678909");
        tbQingjia.setStartTime(new Date());
        tbQingjia.setLeaderName("温温");
        tbQingjia.setQingjiaWhy("生病了，去医院看看");
        System.out.println(tbQingjiaDao.insert(tbQingjia));
        System.out.println(tbQingjiaDao.queryById(tbQingjia.getQingjiaId()));

    }

    @Test
    public void update() {
        TbQingjia tbQingjia = new TbQingjia();
        tbQingjia.setQingjiaId(5);
        tbQingjia.setQingjiaTitle("去姥姥家");
        tbQingjia.setEndTime(new Date());
        tbQingjia.setAddTime(new Date());
        tbQingjia.setLeaderId(4);
        tbQingjia.setLeaderTel("12345678909");
        tbQingjia.setStartTime(new Date());
        tbQingjia.setLeaderName("温温");
        tbQingjia.setQingjiaWhy("生病了，去医院看看");
        System.out.println(tbQingjiaDao.update(tbQingjia));
        System.out.println(tbQingjiaDao.queryById(tbQingjia.getQingjiaId()));

    }

    @Test
    public void deleteById() {
        System.out.println(tbQingjiaDao.queryById(5));
        System.out.println(tbQingjiaDao.deleteById(5));
    }
}