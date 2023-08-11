package com.rafabraga.relatorios.model;

import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;
import java.util.Set;

@Data
@Entity
public class Livro {

    @Id
    private Long id;
    private String isbn;
    private String nome;
    private String descricao;
    @Enumerated(EnumType.STRING)
    private EstadoConservacao estadoConservacao;
    private Integer ano;
//    private byte[] capa;
    private BigDecimal preco;
    @ManyToOne
    @JoinColumn(name = "editora_id")
    private Editora editora;
    @ManyToOne
    @JoinColumn(name = "idioma_id")
    private Idioma idioma;
    @ManyToOne
    @JoinColumn(name = "genero_id")
    private Genero genero;
    @ManyToMany
    @JoinTable(
            name = "livro_autor",
            joinColumns = @JoinColumn(name = "livro_id"),
            inverseJoinColumns = @JoinColumn(name = "autor_id"))
    private Set<Autor> autores;

}
