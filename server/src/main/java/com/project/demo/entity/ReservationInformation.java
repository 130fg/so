package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 预订信息：(ReservationInformation)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "ReservationInformation")
public class ReservationInformation implements Serializable {

    // ReservationInformation编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "reservation_information_id")
    private Integer reservation_information_id;

    // 标题
    @Basic
    private String title;
    // 封面
    @Basic
    private String cover;
    // 户型
    @Basic
    private String house_type;
    // 配套设施
    @Basic
    private String supporting_facilities;
    // 预付定金
    @Basic
    private String advance_deposit;
    // 用户编号
    @Basic
    private Integer user_no;
    // 姓名
    @Basic
    private String full_name;
    // 入住时间
    @Basic
    private Timestamp check_in_time;
    // 联系电话
    @Basic
    private String contact_number;
    // 备注
    @Basic
    private String remarks;




    // 支付状态
    @Basic
    private String pay_state;

    // 支付类型: 微信、支付宝、网银
    @Basic
    private String pay_type;










    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
