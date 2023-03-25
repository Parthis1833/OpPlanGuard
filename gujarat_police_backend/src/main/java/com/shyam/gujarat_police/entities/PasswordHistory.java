package com.shyam.gujarat_police.entities;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Pattern;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "password_history")
public class PasswordHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    private String username;

    @Pattern(regexp="(0/91)?[6-9][0-9]{9}", message = "{validation.name.Size}")
    private String phoneNumber;

    private String ip;

    private String deviceType;

    private Long eventId;

    private Integer accessType;

    @Temporal(TemporalType.TIMESTAMP)
    private Date usedAt;// manual 1, upload excel 2, both 2
}
