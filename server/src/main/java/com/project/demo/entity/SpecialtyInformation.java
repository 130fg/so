package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 特产信息：(SpecialtyInformation)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "SpecialtyInformation")
public class SpecialtyInformation implements Serializable {

    // SpecialtyInformation编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "specialty_information_id")
    private Integer specialty_information_id;

    // 编号
    @Basic
    private String number;
    // 名称
    @Basic
    private String name;
    // 图片
    @Basic
    private String picture;
    // 类型
    @Basic
    private String type;
    // 价格
    @Basic
    private Integer price;
    // 详情
    @Basic
    private String details;

    // 点击数
    @Basic
    private Integer hits;

    // 点赞数
    @Basic
    private Integer praise_len;












    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
