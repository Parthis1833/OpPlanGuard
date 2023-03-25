package com.shyam.gujarat_police.dto.request;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties(ignoreUnknown = true)
public class FindByDesignationDto {

    @JsonProperty("name")
    private String name = "";
    @JsonProperty("nameInGujarati")
    private String nameInGujarati = "";

    @Override
    public String toString() {
        return "FindByDesignationDto{" +
                "name='" + name + '\'' +
                ", nameInGujarati='" + nameInGujarati + '\'' +
                '}';
    }
}
