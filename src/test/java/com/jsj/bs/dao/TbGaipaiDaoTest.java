package com.jsj.bs.dao;

import com.jsj.bs.BastTest;
import com.jsj.bs.pojo.TbGaipai;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

/**
 * @author King_long
 * @program: lxlproject
 * @Date 2020/01/09 16:52
 */

public class TbGaipaiDaoTest extends BastTest {

    @Autowired
    private TbGaipaiDao tbGaipaiDao;

    @Test
    public void queryById() {
        System.out.println(tbGaipaiDao.queryById(1));
    }

    @Test
    public void queryAll() {
        for (TbGaipai tbGaipai : tbGaipaiDao.queryAll(new TbGaipai())) {
            System.out.println(tbGaipai);
        }
    }

    @Test
    public void insert() {
        TbGaipai tbGaipai = new TbGaipai();
        tbGaipai.setGaipaiTitle("任务太多");
        tbGaipai.setGaipaiWhy("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX");
        tbGaipai.setGaipaiDate(new Date());
        tbGaipai.setGaipaiStatu("已查看");
        tbGaipai.setLeaderId(2);
        tbGaipai.setOdertId(3);
        System.out.println(tbGaipaiDao.insert(tbGaipai));
        System.out.println(tbGaipaiDao.queryById(tbGaipai.getGaipaiId()));
    }

    @Test
    public void update() {
        TbGaipai tbGaipai = new TbGaipai();
        tbGaipai.setGaipaiId(2);
        tbGaipai.setGaipaiTitle("任务太多");
        tbGaipai.setGaipaiWhy("XXXXXXXXXXXXXaaaaaaaaXXXXXXXXXXXXXXXXXXXX");
        tbGaipai.setGaipaiDate(new Date());
        tbGaipai.setGaipaiStatu("已查看");
        tbGaipai.setOdertId(3);
        tbGaipai.setIsDeleted(true);
        System.out.println(tbGaipaiDao.update(tbGaipai));
        System.out.println(tbGaipaiDao.queryById(tbGaipai.getGaipaiId()));
    }

    @Test
    public void deleteById() {
        System.out.println(tbGaipaiDao.queryById(13));
        System.out.println(tbGaipaiDao.deleteById(13));

    }
}