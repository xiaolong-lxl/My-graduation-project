package com.jsj.bs.service;

import com.github.pagehelper.PageInfo;
import com.jsj.bs.pojo.TbGaipai;

/**
 * (TbGaipai)表服务接口
 *
 * @author makejava
 * @since 2020-01-09 16:30:54
 */
public interface TbGaipaiService {

    /**
     * 通过ID查询单条数据
     *
     * @param gaipaiId 主键
     * @return 实例对象
     */
    TbGaipai queryById(Integer gaipaiId);

    /**
     * 查询多条数据
     * @param page 页码
     * @param pageSize 页大小
     * @param tbGaipai 实体
     * @return PageInfo<TbGaipai> 分页数据集合
     */
    PageInfo<TbGaipai> queryAll(int page, int pageSize, TbGaipai tbGaipai);
  

    /**
     * 新增数据
     *
     * @param tbGaipai 实例对象
     * @return 实例对象
     */
    TbGaipai insert(TbGaipai tbGaipai);

    /**
     * 修改数据
     *
     * @param tbGaipai 实例对象
     * @return 实例对象
     */
    TbGaipai update(TbGaipai tbGaipai);

    /**
     * 通过主键删除数据
     *
     * @param gaipaiId 主键
     * @return 是否成功
     */
    boolean deleteById(Integer gaipaiId);

}