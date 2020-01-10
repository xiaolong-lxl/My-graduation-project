package com.jsj.bs.dao;

import com.jsj.bs.BastTest;
import com.jsj.bs.pojo.TbOrder;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * @author King_long
 * @program: lxlproject
 * @Date 2020/01/09 14:27
 */

/**
 * order 报修单 模型 单元测试
 */
public class TbOrderDaoTest extends BastTest {

    @Autowired
    private TbOrderDao tbOrderDao;

    /**
     * 通过ID查询单条数据
     */

    @Test
    public void queryById() {
        System.out.println(tbOrderDao.queryById(1));
    }

    /**
     * 通过实体作为筛选条件查询
     */
    @Test
    public void queryAll() {
        System.out.println(tbOrderDao.queryAll(new TbOrder()));
    }

    /**
     * 新增数据
     */
    @Test
    public void insert() {
        TbOrder tbOrder = new TbOrder();
        tbOrder.setMachineModel("惠普");
        tbOrder.setLianxiUser("小刘");
        tbOrder.setProblemLever("立刻");
        tbOrder.setLianxiTel("12345678901");
        tbOrder.setProblemDesc("蓝屏");
        tbOrder.setMachineAddress("西安");
        tbOrder.setLeaderId(2);
        tbOrder.setStatu("未处理");
        System.out.println(tbOrderDao.insert(tbOrder));

    }

    /**
     * 修改数据
     */
    @Test
    public void update() {
        TbOrder tbOrder = new TbOrder();
        tbOrder.setOrderId(59);
        tbOrder.setMachineModel("惠普");
        tbOrder.setLianxiUser("小刘");
        tbOrder.setProblemLever("立刻");
        tbOrder.setLianxiTel("12345678901");
        tbOrder.setProblemDesc("蓝屏");
        tbOrder.setMachineAddress("西安");
        tbOrder.setLeaderId(2);
        tbOrder.setStatu("未处理");
        System.out.println(tbOrderDao.update(tbOrder));
    }

    /**
     * 通过主键删除数据
     */
    @Test
    public void delete() {
        System.out.println(tbOrderDao.deleteById(60));
    }
}