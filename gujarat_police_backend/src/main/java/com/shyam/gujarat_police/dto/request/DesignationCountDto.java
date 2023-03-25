package com.shyam.gujarat_police.dto.request;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DesignationCountDto {
    private String name;
    private String nameInGujarati;
    private int count = 0;
}
