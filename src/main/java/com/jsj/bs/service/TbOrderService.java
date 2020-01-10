package com.jsj.bs.service;

import com.github.pagehelper.PageInfo;
import com.jsj.bs.pojo.TbOrder;

/**
 * 报修单表(TbOrder)表服务接口
 *
 * @author makejava
 * @since 2020-01-06 15:23:40
 */
public interface TbOrderService {

    /**
     * 通过ID查询单条数据
     *
     * @param orderId 主键
     * @return 实例对象
     */
    TbOrder queryById(int orderId);

    /**
     * 查询多条数据
     * @param page 页码
     * @param pageSize 页大小
     * @param tbOrder 实体
     * @return PageInfo<TbOrder> 分页数据集合
     */
    PageInfo<TbOrder> queryAll(int page, int pageSize, TbOrder tbOrder);
  

    /**
     * 新增数据
     *
     * @param tbOrder 实例对象
     * @return 实例对象
     */
    TbOrder insert(TbOrder tbOrder);

    /**
     * 修改数据
     *
     * @param tbOrder 实例对象
     * @return 实例对象
     */
    Boolean update(TbOrder tbOrder);

    /**
     * 通过主键删除数据
     *
     * @param orderId 主键
     * @return 是否成功
     */
    boolean deleteById(Integer orderId);

}