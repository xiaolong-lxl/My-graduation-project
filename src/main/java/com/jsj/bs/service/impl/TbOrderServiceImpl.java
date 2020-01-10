package com.jsj.bs.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.jsj.bs.dao.TbOrderDao;
import com.jsj.bs.pojo.TbOrder;
import com.jsj.bs.service.TbOrderService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 报修单表(TbOrder)表服务实现类
 *
 * @author makejava
 * @since 2020-01-06 15:23:40
 */
@Service("tbOrderService")
public class TbOrderServiceImpl implements TbOrderService {

    private static final Logger LOGGER = LogManager.getLogger(TbOrderServiceImpl.class);

    @Autowired
    private TbOrderDao tbOrderDao;



    /**
     * 通过ID查询单条数据
     *
     * @param orderId 主键
     * @return 实例对象
     */
    @Override
    public TbOrder queryById(int orderId) {
        return tbOrderDao.queryById(orderId);
    }

    /**
     * 查询多条数据
     *
     * @param page     页码
     * @param pageSize 页大小
     * @param tbOrder  实体
     * @return PageInfo<TbOrder> 分页数据集合
     */
    @Override
    public PageInfo<TbOrder> queryAll(int page, int pageSize, TbOrder tbOrder) {
        LOGGER.info("==========================service================"+tbOrder);
        /*拦截分页信息*/
        PageHelper.startPage(page, pageSize);
        List<TbOrder> tbOrderList = tbOrderDao.queryAll(tbOrder);

        for (TbOrder order : tbOrderList) {
            LOGGER.info("+=====Order  serviceimpl========" + order.toString());
        }

        return new PageInfo<>(tbOrderList);
    }

    /**
     * 新增数据
     *
     * @param tbOrder 实例对象
     * @return 实例对象
     */
    @Transactional
    @Override
    public TbOrder insert(TbOrder tbOrder) {
        //向报修表添加数据
        int insert = tbOrderDao.insert(tbOrder);
        if (insert > 0) {

            return tbOrderDao.queryById(tbOrder.getOrderId());

        }
        return null;
    }

    /**
     * 修改数据
     *
     * @param tbOrder 实例对象
     * @return 实例对象
     */
    @Transactional
    @Override
    public Boolean update(TbOrder tbOrder) {

        int update = tbOrderDao.update(tbOrder);

        LOGGER.info("====OrderserivceImpl======" + update);

        //上面语句返回的是受影响行数，成功返回1，所以当update为1是返回true 否则取反
        if (update > 0) {
            return true;
        }
        return false;
    }

    /**
     * 通过主键删除数据
     *
     * @param orderId 主键
     * @return 是否成功
     */
    @Transactional
    @Override
    public boolean deleteById(Integer orderId) {
        return tbOrderDao.deleteById(orderId) > 0;
    }
}