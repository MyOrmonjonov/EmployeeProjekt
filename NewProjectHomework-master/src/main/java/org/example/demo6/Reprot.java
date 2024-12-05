package org.example.demo6;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Reprot {

    private String courseName;
    private Long courseStudentAmount;
    private Long Totalsum;
}
