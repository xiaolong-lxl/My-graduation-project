package com.jsj.bs.pojo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;


/**
 * (TbUser)实体类
 *
 * @author makejava
 * @since 2019-12-31 17:48:31
 */
@Data
public class TbUser implements Serializable {
    private static final long serialVersionUID = -67624514705212316L;
    //用户id
    private Integer userId;
    //用户登陆账号
    private String userAccount;
    //用户登陆密码
    private String userPassword;
    //用户显示名称
    private String username;
    //用户联系方式
    private String userTel;
    //用户邮箱
    private String userEmail;
    //注销标识字段(0-正常 1-已注销)
    private Boolean isDeleted;
    //用户状态 0 审核通过的 1审核未通过的
    private Boolean userLocked;
    //注册时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    //角色id
    private Integer roleId;



}