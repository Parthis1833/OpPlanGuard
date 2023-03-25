package com.shyam.gujarat_police.dto.request;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class DesignationDto {

    @JsonProperty("id")
    private Long id;

    @JsonProperty("name-in-english")
    private String name;

    @JsonProperty("name-in-gujarati")
    private String nameInGujarati;

    @JsonProperty("is-deletable")
    private boolean isDeletable;

}
