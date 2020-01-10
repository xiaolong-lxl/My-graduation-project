package com.jsj.bs.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * (TbAdmin)实体类
 *
 * @author makejava
 * @since 2019-12-31 18:53:56
 */
@Data
public class TbAdmin implements Serializable {
    private static final long serialVersionUID = -80350460783207889L;
    //管理员id
    private Integer adminId;
    //管理员登陆账号
    private String adminAccount;
    //管理员登陆密码
    private String adminPassword;
    //管理员显示昵称
    private String adminName;
    //是否锁定 0未锁定 1已锁定无法登陆
    private Boolean adminLocked;
    //角色id
    private Integer roleId;


}