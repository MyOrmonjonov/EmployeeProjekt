package org.example.demo6.entity;

import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Report {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String firstname;
    private String lastname;
    private Integer cashSum;
    private Integer cardSum;
    private Integer bankSum;

    public Report(String firstname, String lastname, Integer cashSum, Integer cardSum, Integer bankSum) {
        this.firstname = firstname;
        this.lastname = lastname;
        this.cashSum = cashSum;
        this.cardSum = cardSum;
        this.bankSum = bankSum;
    }

}
