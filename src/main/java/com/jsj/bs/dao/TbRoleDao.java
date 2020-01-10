package com.jsj.bs.dao;

import com.jsj.bs.pojo.TbRole;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 角色表(TbRole)表数据库访问层
 *
 * @author makejava
 * @since 2019-12-31 19:41:08
 */
 
@Mapper
public interface TbRoleDao {

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
    List<String> queryByUserAccount(@Param("account") String account);

    /**
     * 通过实体作为筛选条件查询
     *
     * @param account 账户
     * @return 对象列表
     */
    List<String> queryByLeaderAccount(@Param("account") String account);

    /**
     * 通过实体作为筛选条件查询
     *
     * @param account 账户
     * @return 对象列表
     */
    List<String> queryByAdminAccount(@Param("account") String account);


}