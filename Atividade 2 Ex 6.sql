create table tb_categorias(
id_categoria bigint auto_increment not null,
campus varchar(100),
primary key (id_categoria)
);

insert into tb_categorias(campus) values ("São Paulo"), ("Diadema"), ("SBC"), ("Santos"), ("Campinas");

select * from tb_categorias;

create table tb_cursos(
id_curso bigint auto_increment not null,
nomecurso varchar(150) not null,
valor decimal (6,2) not null,
professor varchar(150) not null,
id_categoria bigint,
primary key (id_curso),
foreign key (id_categoria) references tb_categorias(id_categoria)
);

select * from tb_cursos;


ALTER TABLE tb_cursos
rename column materia to professor;

insert into tb_cursos (nomecurso, valor, professor, id_categoria)
values ("Engenharia", 1500.00, "Arthur", 1),
("Artes Cênicas", 1000.00, "Bianca", 2),
("Matemática", 800.00, "Isabella", 3),
("Educação Física", 1000.00, "Daniel", 4),
("Psicologia", 900.00, "Gabriel", 5),
("Programação", 1500.00, "Kevin", 1),
("Agricultura", 400.00, "Luana", 2),
("Nutrição", 200.00, "Joana", 3);
-- Faça um SELECT utilizando o operador LIKE, buscando todes os cursos que possuam a letra J no atributo nome.
select * from tb_cursos where valor > 500;
select * from tb_cursos where valor between 600 and 1000;
select * from tb_cursos where nomecurso like "%j%";

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_cursos com os dados da tabela tb_categorias.
select id_curso, nomecurso, valor, professor, tb_categorias.id_categoria
from tb_cursos inner join tb_categorias
on tb_cursos.id_categoria = tb_categorias.id_categoria;


-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_cursos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica
select id_curso, nomecurso, valor, professor, tb_categorias.id_categoria
from tb_cursos inner join tb_categorias
on tb_cursos.id_categoria = tb_categorias.id_categoria
where tb_categorias.campus = "São Paulo";


-- abreviado
select N.nomecurso as CursosDiadema, N.valor, N.professor, C.id_categoria
from tb_cursos as N
inner join tb_categorias as C
on N.id_categoria = C.id_categoria
where C.campus = "Diadema";