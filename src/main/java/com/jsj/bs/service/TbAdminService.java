package com.jsj.bs.service;

import com.github.pagehelper.PageInfo;
import com.jsj.bs.pojo.TbAdmin;

/**
 * (TbAdmin)表服务接口
 *
 * @author makejava
 * @since 2019-12-31 18:53:55
 */
public interface TbAdminService {

    /**
     * 通过ID查询单条数据
     *
     * @param adminId 主键
     * @return 实例对象
     */
    TbAdmin queryById(Integer adminId);

    /**
     * 登陆
     *
     * @param adminAccount  账户名
     * @param adminPassword 密码
     * @return 实例对象
     */
    TbAdmin queryByAccount(String adminAccount, String adminPassword);

    /**
     * 通过账户查询账户状态
     *
     * @param adminAccount 账户名
     * @return Boolean
     */
    Boolean queryStatus(String adminAccount);

    /**
     * 查询多条数据
     *
     * @param page     页码
     * @param pageSize 页大小
     * @param tbAdmin  实体
     * @return PageInfo<TbAdmin> 分页数据集合
     */
    PageInfo<TbAdmin> queryAll(int page, int pageSize, TbAdmin tbAdmin);


    /**
     * 新增数据
     *
     * @param tbAdmin 实例对象
     * @return 实例对象
     */
    TbAdmin insert(TbAdmin tbAdmin);

    /**
     * 修改数据
     *
     * @param tbAdmin 实例对象
     * @return 实例对象
     */
    TbAdmin update(TbAdmin tbAdmin);

    /**
     * 通过主键删除数据
     *
     * @param adminId 主键
     * @return 是否成功
     */
    boolean deleteById(Integer adminId);

}