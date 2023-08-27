package com.hrempowering.EmpoweringHR.domain.mysql;


import jakarta.persistence.*;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;

import java.util.Date;


@Entity
@Table(name = "emploee")
@AllArgsConstructor
@NoArgsConstructor
@Data

public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String roleId;

    @Column(nullable = false)
    private String phone_number;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private String pto;

    @Column(nullable = false)
    private String employment_type;

    @Column(nullable = false)
    private Date date_of_birth;

    @Column(nullable = false)
    private Date start_date;

    @Column(nullable = false)
    private String picture;

    @Column(name = "CreatedAt", nullable = false, updatable = false)
    @CreationTimestamp
    private Date CreatedAt;

    @Column(name = "LastModifiedAt", insertable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date LastModifiedAt;
}
