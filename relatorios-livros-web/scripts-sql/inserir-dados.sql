INSERT INTO editora (nome) VALUES ('Companhia de Bolso');
INSERT INTO editora (nome) VALUES ('Nova Fronteira');
INSERT INTO editora (nome) VALUES ('Vozes');
INSERT INTO editora (nome) VALUES ('Ática');
INSERT INTO editora (nome) VALUES ('Nacional');

INSERT INTO idioma (nome) VALUES ('Português');

INSERT INTO genero (nome) VALUES ('Literatura Estrangeira');
INSERT INTO genero (nome) VALUES ('Psicologia');
INSERT INTO genero (nome) VALUES ('Infanto Juvenis');
INSERT INTO genero (nome) VALUES ('Biografias');

INSERT INTO autor (nome) VALUES ('Milan Kundera');
INSERT INTO autor (nome) VALUES ('Viktor Emil Frankl');
INSERT INTO autor (nome) VALUES ('Carolina Maria de Jesus');
INSERT INTO autor (nome) VALUES ('Albert Einstein');
INSERT INTO autor (nome) VALUES ('Dale Carnegie');

INSERT INTO livro (isbn, nome, descricao, estado_conservacao, ano, preco, editora_id, idioma_id, genero_id) VALUES (
	'9788535912517', 'A insustentável leveza do ser', 'Livro de bolso, usado, em bom estado de conservação. Bordas com marcas de poeira. Sem grifos. Assinatura de caneta e carimbos do antigo dono.309 p', 'USADO', 2012, 25.00,
	(SELECT id FROM editora WHERE nome = 'Companhia de Bolso'),
	(SELECT id FROM idioma WHERE nome = 'Português'),
	(SELECT id FROM genero WHERE nome = 'Literatura Estrangeira')
);

INSERT INTO livro (isbn, nome, descricao, estado_conservacao, ano, preco, editora_id, idioma_id, genero_id) VALUES (
	'9788523302740', 'Em Busca de Sentido', 'livro usado em ótimo estado! isento de grifos e sublinhados.', 'USADO', 2004, 39.90,
	(SELECT id FROM editora WHERE nome = 'Vozes'),
	(SELECT id FROM idioma WHERE nome = 'Português'),
	(SELECT id FROM genero WHERE nome = 'Psicologia')
);

INSERT INTO livro (isbn, nome, descricao, estado_conservacao, ano, preco, editora_id, idioma_id, genero_id) VALUES (
	'9788508171279', 'Quarto de Despejo - Diário de uma Favelada', 'livro usado em ótimo estado! isento de grifos e sublinhados', 'USADO', 2001, 34.90,
	(SELECT id FROM editora WHERE nome = 'Vozes'),
	(SELECT id FROM idioma WHERE nome = 'Português'),
	(SELECT id FROM genero WHERE nome = 'Infanto Juvenis')
);

INSERT INTO livro (isbn, nome, descricao, estado_conservacao, ano, preco, editora_id, idioma_id, genero_id) VALUES (
	'9788520936740', 'Como vejo o mundo', 'Livro capa dura em muito bom estado de conservação. Corte limpo. Apresenta grifos em aproximandamente em 5 pgs.Òtimo de miolo. Livre de rabiscos. 153 pgs.', 'USADO', 2017, 30.00,
	(SELECT id FROM editora WHERE nome = 'Nova Fronteira'),
	(SELECT id FROM idioma WHERE nome = 'Português'),
	(SELECT id FROM genero WHERE nome = 'Biografias')
);

INSERT INTO livro (isbn, nome, descricao, estado_conservacao, ano, preco, editora_id, idioma_id, genero_id) VALUES (
	'9788504004861', 'Como Fazer Amigos e Influenciar Pessoas', '#294 páginas, edição bolso, bom estado. )1. quais são as as seis maneiras de fazer as pessoas gostarem de você? ver páginas 95/153 2. quais são as doze maneiras de conquistar as pessoas para o seu modo de pensar? ver páginas 157/239. 3. quais são as nove maneiras de modificar as pessoas sem as ofender ou provocar ressentimentos? ver paginas 243/282. o único propósito deste livro é ajudá-lo a resolver um de seus problemas: o de relacionar-se bem com as pessoas e de influenciá-las na vida cotidiana, nos negócios, no trabalho e nos contatos sociais.', 'USADO', 1995, 30.00,
	(SELECT id FROM editora WHERE nome = 'Nacional'),
	(SELECT id FROM idioma WHERE nome = 'Português'),
	(SELECT id FROM genero WHERE nome = 'Psicologia')
);

UPDATE livro SET capa = pg_read_binary_file('/docker-entrypoint-initdb.d/capas/a-insustentavel-leveza-do-ser.jpeg') WHERE isbn = '9788535912517';
UPDATE livro SET capa = pg_read_binary_file('/docker-entrypoint-initdb.d/capas/em-busca-de-sentido.jpeg') WHERE isbn = '9788523302740';
UPDATE livro SET capa = pg_read_binary_file('/docker-entrypoint-initdb.d/capas/quarto-de-despejo.jpeg') WHERE isbn = '9788508171279';
UPDATE livro SET capa = pg_read_binary_file('/docker-entrypoint-initdb.d/capas/como-vejo-o-mundo.jpeg') WHERE isbn = '9788520936740';
UPDATE livro SET capa = pg_read_binary_file('/docker-entrypoint-initdb.d/capas/como-fazer-amigos.jpeg') WHERE isbn = '9788504004861';

INSERT INTO livro_autor (livro_id, autor_id) VALUES (
	(SELECT id FROM livro WHERE nome = 'A insustentável leveza do ser'),
	(SELECT id FROM autor WHERE nome = 'Milan Kundera')
);

INSERT INTO livro_autor (livro_id, autor_id) VALUES (
	(SELECT id FROM livro WHERE nome = 'Em Busca de Sentido'),
	(SELECT id FROM autor WHERE nome = 'Viktor Emil Frankl')
);

INSERT INTO livro_autor (livro_id, autor_id) VALUES (
	(SELECT id FROM livro WHERE nome = 'Quarto de Despejo - Diário de uma Favelada'),
	(SELECT id FROM autor WHERE nome = 'Carolina Maria de Jesus')
);

INSERT INTO livro_autor (livro_id, autor_id) VALUES (
	(SELECT id FROM livro WHERE nome = 'Como vejo o mundo'),
	(SELECT id FROM autor WHERE nome = 'Albert Einstein')
);

INSERT INTO livro_autor (livro_id, autor_id) VALUES (
	(SELECT id FROM livro WHERE nome = 'Como Fazer Amigos e Influenciar Pessoas'),
	(SELECT id FROM autor WHERE nome = 'Dale Carnegie')
);
