package com.shyam.gujarat_police.entities;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.util.Date;
import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Entity
public class Event extends BaseModel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Long id;

    @NotEmpty(message = "{validation.name.NotEmpty}")
    private String eventName;

    @NotEmpty(message = "{validation.name.NotEmpty}")
    private String eventDetails;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy")
    private Date eventStartDate;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd/MM/yyyy")
    private Date eventEndDate;

    @JsonIgnore
    @OneToMany(mappedBy = "event", cascade = CascadeType.PERSIST)
    private List<AssignPolice> assignPolice;

    @JsonIgnore
    @OneToMany(mappedBy = "event", cascade = CascadeType.PERSIST)
    private List<EventPoliceCount> eventPoliceCountList;

    @JsonIgnore
    @OneToMany(mappedBy = "event", cascade = CascadeType.PERSIST)
    private List<Police> policeList;



    @Override
    public String toString() {
        return "Event{" +
                "id=" + id +
                ", eventName='" + eventName + '\'' +
                ", eventDetails='" + eventDetails + '\'' +
                ", eventStartDate=" + eventStartDate +
                ", eventEndDate=" + eventEndDate +
                '}';
    }
}
