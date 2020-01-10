package com.jsj.bs.pojo;

import lombok.Data;

import java.io.Serializable;

/**
 * (TbLeader)实体类
 *
 * @author makejava
 * @since 2019-12-31 18:53:56
 */
@Data
public class TbLeader implements Serializable {
    private static final long serialVersionUID = 653738785262012497L;
    //负责人id
    private Integer leaderId;
    //负责人登陆账号
    private String leaderAccount;
    //负责人登陆密码
    private String leaderPassword;
    //负责人显示昵称
    private String leaderName;
    //是否锁定 0未锁定 1已锁定无法登陆
    private Boolean leaderLocked;
    //角色id
    private Integer roleId;


}