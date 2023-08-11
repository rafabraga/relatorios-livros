package com.rafabraga.relatorios.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

@Data
@Entity
public class Genero {

    @Id
    private Long id;
    private String nome;
}
