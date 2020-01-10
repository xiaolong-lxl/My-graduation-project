package com.jsj.bs.service;

import com.jsj.bs.pojo.TbRole;

import java.util.List;

/**
 * 角色表(TbRole)表服务接口
 *
 * @author makejava
 * @since 2019-12-31 19:41:08
 */
public interface TbRoleService {

    /**
     * 通过ID查询单条数据
     *
     * @param roleId 主键
     * @return 实例对象
     */
    TbRole queryById(Integer roleId);

    /**
     * 通过实体作为筛选条件查询
     *
     * @param account 账户
     * @return 对象列表
     */
    List<String> queryByUserAccount(String account);

    /**
     * 通过实体作为筛选条件查询
     *
     * @param account 账户
     * @return 对象列表
     */
    List<String> queryByLeaderAccount(String account);

    /**
     * 通过实体作为筛选条件查询
     *
     * @param account 账户
     * @return 对象列表
     */
    List<String> queryByAdminAccount(String account);


}