package org.example.demo6;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Groups extends BaseEntty{

    private String name;
    @ManyToOne
    private Modul modul;
}
