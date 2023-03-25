package com.shyam.gujarat_police.exceptions;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PoliceAlreadyAssignedException extends RuntimeException{
    // this class will give information about when police will be freed from
    // and where the police is assigned.
    String message;
}
