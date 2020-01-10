package com.jsj.bs.pojo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * (TbQingjia)实体类
 *
 * @author makejava
 * @since 2020-01-09 22:08:29
 */
@Data
public class TbQingjia implements Serializable {
    private static final long serialVersionUID = -72345756608561839L;
    //请假申请id
    private Integer qingjiaId;
    //请假标题
    private String qingjiaTitle;
    //请假人
    private String leaderName;
    //联系电话
    private String leaderTel;
    //请假开始时间
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startTime;
    //请假结束时间
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endTime;
    //请假理由
    private String qingjiaWhy;
    //负责人id
    private Integer leaderId;
    //请假是否通过  0通过  1未通过
    private Boolean hasAllow;
    //申请时间
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date addTime;


}