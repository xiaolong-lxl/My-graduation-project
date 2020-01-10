package com.jsj.bs.dao;

import com.jsj.bs.pojo.TbGaipai;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;



/**
 * (TbGaipai)表数据库访问层
 *
 * @author makejava
 * @since 2020-01-09 16:30:54
 */
 
@Mapper
public interface TbGaipaiDao {

    /**
     * 通过ID查询单条数据
     *
     * @param gaipaiId 主键
     * @return 实例对象
     */
    TbGaipai queryById(Integer gaipaiId);

    /**
     * 通过实体作为筛选条件查询
     *
     * @param tbGaipai 实例对象
     * @return 对象列表
     */
    List<TbGaipai> queryAll(TbGaipai tbGaipai);

    /**
     * 新增数据
     *
     * @param tbGaipai 实例对象
     * @return 影响行数
     */
    int insert(TbGaipai tbGaipai);

    /**
     * 修改数据
     *
     * @param tbGaipai 实例对象
     * @return 影响行数
     */
    int update(TbGaipai tbGaipai);

    /**
     * 通过主键删除数据
     *
     * @param gaipaiId 主键
     * @return 影响行数
     */
    int deleteById(Integer gaipaiId);

}