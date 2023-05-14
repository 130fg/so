package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 报名记录：(RegistrationRecord)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "RegistrationRecord")
public class RegistrationRecord implements Serializable {

    // RegistrationRecord编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "registration_record_id")
    private Integer registration_record_id;

    // 活动名称
    @Basic
    private String activity_name;
    // 图片
    @Basic
    private String picture;
    // 活动类型
    @Basic
    private String activity_type;
    // 活动地点
    @Basic
    private String event_location;
    // 活动时间
    @Basic
    private String activity_time;
    // 用户编号
    @Basic
    private Integer user_no;
    // 姓名
    @Basic
    private String full_name;
    // 报名时间
    @Basic
    private Timestamp registration_time;
    // 报名人数
    @Basic
    private Integer number_of_applicants;
    // 联系电话
    @Basic
    private String contact_number;
    // 附加说明
    @Basic
    private String additional_notes;














    // 更新时间
    @Basic
    private Timestamp update_time;

    // 创建时间
    @Basic
    private Timestamp create_time;

}
