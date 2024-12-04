package org.example.demo6;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity

public class Student extends BaseEntty{


    private String name;
   @ManyToOne
    private Groups groups;
    private Integer amount;





}
