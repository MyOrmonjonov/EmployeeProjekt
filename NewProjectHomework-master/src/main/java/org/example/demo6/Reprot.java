package org.example.demo6;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.lang.reflect.GenericArrayType;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Reprot {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @ManyToOne
    private Course course;
    @ManyToOne
    private Student student;
    private Integer amount;
}
