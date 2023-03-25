package com.shyam.gujarat_police.entities;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "passwords")
public class Passwords {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    private String hashedPassword;

    @Temporal(TemporalType.TIMESTAMP)
    private Date validityUpto;

    @Temporal(TemporalType.TIMESTAMP)
    private Date createdAt;

    private Long eventId;

    private boolean isExpired;
}
