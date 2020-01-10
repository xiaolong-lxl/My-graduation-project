package com.jsj.bs.pojo;

import java.io.Serializable;
import lombok.Data;

/**
 * 角色表(TbRole)实体类
 *
 * @author makejava
 * @since 2019-12-31 19:41:08
 */
@Data
public class TbRole implements Serializable {
    private static final long serialVersionUID = 838353883722889393L;
    //角色id
    private Integer roleId;
    //角色类别
    private String roleName;


}