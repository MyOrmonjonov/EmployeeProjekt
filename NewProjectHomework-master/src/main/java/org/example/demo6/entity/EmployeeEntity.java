package org.example.demo6.entity;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Generated;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class EmployeeEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String tyupe;
    private Integer amount;
    @ManyToOne
    private Employee employee;

    private LocalDateTime localDateTime=LocalDateTime.now();


    public EmployeeEntity(String tyupe, Integer amount, Employee employee) {
        this.tyupe = tyupe;
        this.amount = amount;
        this.employee = employee;
    }
}
