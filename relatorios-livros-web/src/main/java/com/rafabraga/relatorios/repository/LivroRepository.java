package com.rafabraga.relatorios.repository;

import com.rafabraga.relatorios.model.Livro;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface LivroRepository extends JpaRepository<Livro, Long> {

    @Override
    @Query("select l from Livro l left join fetch l.editora left join fetch l.idioma left join fetch l.genero left join fetch l.autores")
    List<Livro> findAll();

    @Query("select l from Livro l left join fetch l.editora left join fetch l.idioma left join fetch l.genero left join fetch l.autores where l.isbn = :isbn")
    Optional<Livro> findByIsbn(String isbn);
}
