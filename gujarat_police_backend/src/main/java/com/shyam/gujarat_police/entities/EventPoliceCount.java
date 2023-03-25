package com.shyam.gujarat_police.entities;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class EventPoliceCount {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne
//    @JsonIgnore
    @JoinColumn(name = "event_id")
    private Event event;

//    @NotEmpty(message = "{validation.name.NotEmpty}")
    private Long designationId;

    private Integer designationCount;
}
