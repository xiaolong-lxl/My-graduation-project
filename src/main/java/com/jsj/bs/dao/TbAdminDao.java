package com.jsj.bs.dao;

import com.jsj.bs.pojo.TbAdmin;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * (TbAdmin)表数据库访问层
 *
 * @author makejava
 * @since 2019-12-31 18:53:55
 */
 
@Mapper
public interface TbAdminDao {

    /**
     * 通过ID查询单条数据
     *
     * @param adminId 主键
     * @return 实例对象
     */
    TbAdmin queryById(Integer adminId);

    /**
     * 登陆
     * @param adminAccount  账户名
     * @param adminPassword 密码
     * @return 实例对象
     */
    TbAdmin queryByAccount(@Param("adminAccount") String adminAccount, @Param("adminPassword") String adminPassword);

    /**
     * 通过账户查询账户状态
     *
     * @param adminAccount 账户名
     * @return Boolean
     */
    Boolean queryStatus(@Param("adminAccount") String adminAccount);

    /**
     * 通过实体作为筛选条件查询
     *
     * @param tbAdmin 实例对象
     * @return 对象列表
     */
    List<TbAdmin> queryAll(TbAdmin tbAdmin);

    /**
     * 新增数据
     *
     * @param tbAdmin 实例对象
     * @return 影响行数
     */
    int insert(TbAdmin tbAdmin);

    /**
     * 修改数据
     *
     * @param tbAdmin 实例对象
     * @return 影响行数
     */
    int update(TbAdmin tbAdmin);

    /**
     * 通过主键删除数据
     *
     * @param adminId 主键
     * @return 影响行数
     */
    int deleteById(Integer adminId);

}