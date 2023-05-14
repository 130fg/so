package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 访问数据：(AccessData)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "AccessData")
public class AccessData implements Serializable {

    // AccessData编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "access_data_id")
    private Integer access_data_id;

    // 标题
    @Basic
    private String title;
    // 访问时段
    @Basic
    private Timestamp access_period;
    // 用户位置
    @Basic
    private String user_location;
    // 访问人数
    @Basic
    private Integer number_of_visitors;
    // 备注说明
    @Basic
    private String notes;














    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
