package com.hrempowering.EmpoweringHR.domain.mysql;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

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
    private String firstName;
    private String lastName;

    @Column(nullable = false)
    private String roleName;

    @Column(nullable = false)
    private String phoneNumber;

    @Column(nullable = false)
    private String email;

    @Column(columnDefinition = "INT default 20")
    private Integer pto;

    @DateTimeFormat(pattern = "yyyy-mm-dd")
    @Column(nullable = false)
    private Date dateOfBirth;

    @Column(nullable = false)
    @CreationTimestamp
    private Date startDate;

    @Column(nullable = false)
    private String location;

    @Column(nullable = true)
    private String picture;

    @Column(name = "CreatedAt", nullable = false, updatable = false)
    @CreationTimestamp
    private Date CreatedAt;

    @Column(name = "LastModifiedAt", insertable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date LastModifiedAt;

}
