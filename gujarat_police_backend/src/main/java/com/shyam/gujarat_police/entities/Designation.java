package com.shyam.gujarat_police.entities;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Designation extends BaseModel {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id", nullable = false)
    private Long id;

    @NotEmpty(message = "{validation.name.NotEmpty}")
    @Length(min = 2,max = 20, message = "{validation.name.Size}")
    private String name;

    @NotEmpty(message = "{validation.name.NotEmpty}")
    @Length(min = 2,max = 20, message = "{validation.name.Size}")
    private String nameInGujarati;

    @JsonIgnore
    @OneToMany(mappedBy = "designation", cascade = CascadeType.PERSIST)
    private List<Police> police;
}