package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 主题活动：(ThematicActivities)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "ThematicActivities")
public class ThematicActivities implements Serializable {

    // ThematicActivities编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "thematic_activities_id")
    private Integer thematic_activities_id;

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
    private Timestamp activity_time;
    // 活动详情
    @Basic
    private String event_details;

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
