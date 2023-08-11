package com.rafabraga.relatorios.controller;

import com.rafabraga.relatorios.model.Livro;
import com.rafabraga.relatorios.repository.LivroRepository;
import jakarta.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.*;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.sql.DataSource;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

@RestController
@RequestMapping("livros")
public class LivroController {

    private final LivroRepository livroRepository;
    private final DataSource dataSource;
    private final Path pastaArquivosJasper;

    public LivroController(LivroRepository livroRepository, DataSource dataSource) {
        this.livroRepository = livroRepository;
        this.dataSource = dataSource;
        this.pastaArquivosJasper = Paths.get("src", "main", "resources", "relatorios");
    }

    @GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<Livro>> listarLivros() {
        return ResponseEntity.ok(this.livroRepository.findAll());
    }

    @GetMapping(path = "/{isbn}", produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Livro> buscarLivro(@PathVariable final String isbn) {
        return ResponseEntity.of(this.livroRepository.findByIsbn(isbn));
    }

    @GetMapping(params = "pdf", produces = MediaType.APPLICATION_PDF_VALUE)
    public void exportarLivros(final HttpServletResponse response) throws SQLException, IOException, JRException {
        final String headerKey = "Content-Disposition";
        final String headerValue = "inline; filename=livros-" + System.currentTimeMillis() + ".pdf";
        response.setHeader(headerKey, headerValue);
        response.setContentType(MediaType.APPLICATION_PDF_VALUE);

        final JasperPrint print = JasperFillManager.fillReport(Files.newInputStream(pastaArquivosJasper.resolve("livros-por-genero.jasper")), null, this.dataSource.getConnection());
        JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());
    }

    @GetMapping(path = "/{isbn}", params = "pdf", produces = MediaType.APPLICATION_PDF_VALUE)
    public void exportarLivro(@PathVariable final String isbn, final HttpServletResponse response) throws IOException, JRException, SQLException {
        final String headerKey = "Content-Disposition";
        final String headerValue = "inline; filename=livro-" + isbn + "-" + System.currentTimeMillis() + ".pdf";
        response.setHeader(headerKey, headerValue);
        response.setContentType(MediaType.APPLICATION_PDF_VALUE);

        final HashMap<String, Object> params = new HashMap<>();
        params.put("ISBN", isbn);

        final JasperPrint print = JasperFillManager.fillReport(Files.newInputStream(pastaArquivosJasper.resolve("detalhes-livro.jasper")), params, this.dataSource.getConnection());
        JasperExportManager.exportReportToPdfStream(print, response.getOutputStream());
    }
}
