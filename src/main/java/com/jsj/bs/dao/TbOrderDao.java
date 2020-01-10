package com.jsj.bs.dao;

import com.jsj.bs.pojo.TbOrder;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 报修单表(TbOrder)表数据库访问层
 *
 * @author makejava
 * @since 2020-01-06 15:23:40
 */
 
@Mapper
public interface TbOrderDao {

    /**
     * 通过ID查询单条数据
     *
     * @param orderId 主键
     * @return 实例对象
     */
    TbOrder queryById(@Param("orderId") int orderId);

    /**
     * 通过实体作为筛选条件查询
     *
     * @param tbOrder 实例对象
     * @return 对象列表
     */
    List<TbOrder> queryAll(TbOrder tbOrder);

    /**
     * 新增数据
     *
     * @param tbOrder 实例对象
     * @return 影响行数
     */
    int insert(TbOrder tbOrder);

    /**
     * 修改数据
     *
     * @param tbOrder 实例对象
     * @return 影响行数
     */
    int update(TbOrder tbOrder);

    /**
     * 通过主键删除数据
     *
     * @param orderId 主键
     * @return 影响行数
     */
    int deleteById(Integer orderId);

}