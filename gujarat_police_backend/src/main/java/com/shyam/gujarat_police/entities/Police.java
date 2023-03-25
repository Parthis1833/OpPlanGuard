package com.shyam.gujarat_police.entities;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Police extends BaseModel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Long id;

    @NotEmpty(message = "{validation.name.NotEmpty}")
    @Length(min = 2,max = 70, message = "{validation.name.Size}")
    private String fullName;
    private String buckleNumber;

//    @Pattern(regexp="(0/91)?[6-9][0-9]{9}", message = "{validation.name.Size}")
    private String number;

    @NotNull(message = "{validation.name.NotEmpty}")
    @Min(value = 0, message = "{validation.name.Size}")
    @Max(value = 90, message = "{validation.name.Size}")
    private int age;

    @NotEmpty(message = "{validation.name.NotEmpty}")
    @Length(min = 1,max = 50, message = "{validation.name.Size}")
    private String district;

    private String gender;

    @ManyToOne
//    @JsonIgnore
    @JoinColumn(name = "policeStation_id")
    @NotNull(message = "{validation.name.NotEmpty}")
    private PoliceStation policeStation;
    @ManyToOne
    @JoinColumn(name = "designation_id")
//    @JsonIgnore
    @NotNull(message = "{validation.name.NotEmpty}")
    private Designation designation;

    @ManyToOne
//    @JsonIgnore
    @JoinColumn(name = "event_id")
    @NotNull(message = "{validation.name.NotEmpty}")
    private Event event;

    @Column(columnDefinition="boolean default 'false'")
    private boolean isAssigned = false;


    @Override
    public String toString() {
        return "Police{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", buckleNumber='" + buckleNumber + '\'' +
                ", number='" + number + '\'' +
                ", age=" + age +
                ", district='" + district + '\'' +
                ", gender='" + gender + '\'' +
                ", isAssigned=" + isAssigned +
                '}';
    }
}
