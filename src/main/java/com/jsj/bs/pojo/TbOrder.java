package com.jsj.bs.pojo;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 报修单表(TbOrder)实体类
 *
 * @author makejava
 * @since 2020-01-08 08:57:07
 */
@Data
public class TbOrder implements Serializable {
    private static final long serialVersionUID = -55042284712689373L;
    //报修单id
    private Integer orderId;
    //机器型号
    private String machineModel;
    //问题的优先级
    private String problemLever;
    //联系人
    private String lianxiUser;
    //联系电话
    private String lianxiTel;
    //问题详情
    private String problemDesc;
    //机器所在地
    private String machineAddress;
    //申请时间
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date addTime;
    //故障图片1
    private String orderImg1;
    //故障图片2
    private String orderImg2;
    //状态  -1未指派 0待处理 1处理中 2驳回报修  3未评价  4已评价 -2改派申请
    private String statu;
    //状态描述
    private String statuDesc;
    //维修人id
    private Integer leaderId;
    //0 未删除 1 删除
    private Boolean isDeleted;
    //负责人对象
    private TbLeader tbLeader;


}