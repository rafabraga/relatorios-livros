package com.rafabraga.relatorios.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Data;

@Data
@Entity
public class Autor {

    @Id
    private Long id;
    private String nome;
}
