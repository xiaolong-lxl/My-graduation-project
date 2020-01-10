package com.jsj.bs.dao;

import com.jsj.bs.BastTest;
import com.jsj.bs.pojo.TbLeader;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author King_long
 * @program: lxlproject
 * @Date 2020/01/09 12:12
 */

/**
 * leader实体的单元测试类
 */
public class TbLeaderDaoTest extends BastTest {

    @Autowired
    private TbLeaderDao tbLeaderDao;

    @Test
    public void queryById() {
        System.out.println("leaderId========"+tbLeaderDao.queryByLId("xiaoli"));
    }

    @Test
    public void queryByAccount() {
        System.out.println(tbLeaderDao.queryByAccount("xiaoli", "123456"));
    }

    @Test
    public void queryStatus() {
        System.out.println(tbLeaderDao.queryStatus("xiaoli"));
    }

    @Test
    public void queryByLId() {
        System.out.println(tbLeaderDao.queryByLId("xiaoli"));
    }

    @Test
    public void queryByLeaderAccount() {
        System.out.println(tbLeaderDao.queryByLeaderAccount("xiaoli"));
    }


    @Test
    public void queryAll() {
        TbLeader tbLeader1 = new TbLeader();
       //tbLeader1.setLeaderAccount("xiaoli");
        for (TbLeader tbLeader : tbLeaderDao.queryAll(tbLeader1)) {
            System.out.println(tbLeader);
        }
    }
    @Test
    public void update(){
        TbLeader tbLeader = new TbLeader();
        tbLeader.setLeaderAccount("xiaowang");
        tbLeader.setLeaderName("王小二");
        int update = tbLeaderDao.update(tbLeader);
        System.out.println(update);
    }

}