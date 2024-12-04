package org.example.demo6;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Modul extends BaseEntty{


    private String name;
    @ManyToOne
    private Course course;
}
