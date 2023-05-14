package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 订单结算：(OrderSettlement)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "OrderSettlement")
public class OrderSettlement implements Serializable {

    // OrderSettlement编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_settlement_id")
    private Integer order_settlement_id;

    // 编号
    @Basic
    private String number;
    // 名称
    @Basic
    private String name;
    // 图片
    @Basic
    private String picture;
    // 价格
    @Basic
    private Integer price;
    // 用户编号
    @Basic
    private Integer user_no;
    // 姓名
    @Basic
    private String full_name;
    // 购买时间
    @Basic
    private Timestamp purchase_time;
    // 购买数量
    @Basic
    private String purchase_quantity;
    // 合计金额
    @Basic
    private String total_amount;
    // 标注说明
    @Basic
    private String annotation_notes;




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
