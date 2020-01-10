package com.jsj.bs.dao;

import com.jsj.bs.pojo.TbQingjia;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * (TbQingjia)表数据库访问层
 *
 * @author makejava
 * @since 2020-01-09 22:08:29
 */
 
@Mapper
public interface TbQingjiaDao {

    /**
     * 通过ID查询单条数据
     *
     * @param qingjiaId 主键
     * @return 实例对象
     */
    TbQingjia queryById(Integer qingjiaId);

    /**
     * 通过实体作为筛选条件查询
     *
     * @param tbQingjia 实例对象
     * @return 对象列表
     */
    List<TbQingjia> queryAll(TbQingjia tbQingjia);

    /**
     * 新增数据
     *
     * @param tbQingjia 实例对象
     * @return 影响行数
     */
    int insert(TbQingjia tbQingjia);

    /**
     * 修改数据
     *
     * @param tbQingjia 实例对象
     * @return 影响行数
     */
    int update(TbQingjia tbQingjia);

    /**
     * 通过主键删除数据
     *
     * @param qingjiaId 主键
     * @return 影响行数
     */
    int deleteById(Integer qingjiaId);

}