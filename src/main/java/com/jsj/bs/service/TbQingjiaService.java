package com.jsj.bs.service;

import com.github.pagehelper.PageInfo;
import com.jsj.bs.pojo.TbQingjia;

/**
 * (TbQingjia)表服务接口
 *
 * @author makejava
 * @since 2020-01-09 22:08:29
 */
public interface TbQingjiaService {

    /**
     * 通过ID查询单条数据
     *
     * @param qingjiaId 主键
     * @return 实例对象
     */
    TbQingjia queryById(Integer qingjiaId);

    /**
     * 查询多条数据
     * @param page 页码
     * @param pageSize 页大小
     * @param tbQingjia 实体
     * @return PageInfo<TbQingjia> 分页数据集合
     */
    PageInfo<TbQingjia> queryAll(int page, int pageSize, TbQingjia tbQingjia);
  

    /**
     * 新增数据
     *
     * @param tbQingjia 实例对象
     * @return 实例对象
     */
    TbQingjia insert(TbQingjia tbQingjia);

    /**
     * 修改数据
     *
     * @param tbQingjia 实例对象
     * @return 实例对象
     */
    TbQingjia update(TbQingjia tbQingjia);

    /**
     * 通过主键删除数据
     *
     * @param qingjiaId 主键
     * @return 是否成功
     */
    boolean deleteById(Integer qingjiaId);

}