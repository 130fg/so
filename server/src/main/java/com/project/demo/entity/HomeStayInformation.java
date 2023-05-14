package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 民宿信息：(HomeStayInformation)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "HomeStayInformation")
public class HomeStayInformation implements Serializable {

    // HomeStayInformation编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "home_stay_information_id")
    private Integer home_stay_information_id;

    // 标题
    @Basic
    private String title;
    // 封面
    @Basic
    private String cover;
    // 类型
    @Basic
    private String type;
    // 户型
    @Basic
    private String house_type;
    // 平方
    @Basic
    private String square;
    // 价格
    @Basic
    private String price;
    // 配套设施
    @Basic
    private String supporting_facilities;
    // 预付定金
    @Basic
    private Integer advance_deposit;
    // 民宿地址
    @Basic
    private String home_address;
    // 详情介绍
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
