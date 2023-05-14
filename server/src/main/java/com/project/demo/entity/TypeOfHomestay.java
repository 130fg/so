package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 民宿类型：(TypeOfHomestay)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "TypeOfHomestay")
public class TypeOfHomestay implements Serializable {

    // TypeOfHomestay编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "type_of_homestay_id")
    private Integer type_of_homestay_id;

    // 类型名称
    @Basic
    private String type_name;














    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
