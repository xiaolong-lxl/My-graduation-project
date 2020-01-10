package com.jsj.bs.pojo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * (TbGaipai)实体类
 *
 * @author makejava
 * @since 2020-01-09 16:30:54
 */
@Data
public class TbGaipai implements Serializable {
    private static final long serialVersionUID = -65032807768722897L;
    //改派申请id
    private Integer gaipaiId;
    //改派标题
    private String gaipaiTitle;
    //改派理由
    private String gaipaiWhy;
    //改派时间
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date gaipaiDate;
    //改派状态
    private String gaipaiStatu;
    //报修人id
    private Integer leaderId;
    //报修单id
    private Integer odertId;
    //是否取消 0是 1 否
    private Boolean isDeleted;


}