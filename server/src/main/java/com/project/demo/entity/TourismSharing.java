package com.project.demo.entity;

import java.sql.Date;
import java.sql.Timestamp;
import com.project.demo.entity.base.BaseEntity;
import java.io.Serializable;
import lombok.*;
import javax.persistence.*;


/**
 * 旅游分享：(TourismSharing)表实体类
 *
 */
@Setter
@Getter
@Entity(name = "TourismSharing")
public class TourismSharing implements Serializable {

    // TourismSharing编号
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tourism_sharing_id")
    private Integer tourism_sharing_id;

    // 标题
    @Basic
    private String title;
    // 封面
    @Basic
    private String cover;
    // 类型
    @Basic
    private String type;
    // 旅游地点
    @Basic
    private String tourist_location;
    // 发布时间
    @Basic
    private Timestamp release_time;
    // 用户编号
    @Basic
    private Integer user_no;
    // 姓名
    @Basic
    private String full_name;
    // 相关视频
    @Basic
    private String related_videos;
    // 资源获取
    @Basic
    private String resource_acquisition;
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
