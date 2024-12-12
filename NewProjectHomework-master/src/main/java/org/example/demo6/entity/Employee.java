package org.example.demo6.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Employee {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    public  Users users;
    private Integer salary;
    private Integer paid;
    private Integer lefts;

    public Employee(Users users, Integer salary) {
        this.users = users;
        this.salary = salary;
    }
}
