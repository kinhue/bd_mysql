create database db_construindo_vidas;

create table tb_categoria(
id_categoria bigint auto_increment not null,
cidade varchar(100),
empresa varchar(100),
primary key (id_categoria)
);

select * from tb_categoria;

create table tb_produtos(
id_produto bigint auto_increment not null,
nome varchar(255),
preco decimal (6,2),
tamanho varchar(255),
peso varchar(255),
id_categoria bigint,
primary key (id_produto),
foreign key (id_categoria) references tb_categoria(id_categoria)
);

select * from tb_produtos;

insert into tb_categoria (cidade, empresa)
values ("SBC", "Acrilicos"),
("SP", "Tintas"),
("Campinas", "Toldos"),
("Santos", "Telhados"),
("Diadema", "Rodapés");


insert into tb_produtos (nome, preco, tamanho, peso, id_categoria)
values ("Tinta verde acrilica", 100.00, "12cm x 10cm", "10KG", 1),
("Tinta Preta Fosca para Parede", 80.00, "10cm x 12cm", "8KG", 2),
("Toldo Amarelo", 95.00, "150cm", "30KG", 3),
("Telhado Aluminio", 130.00, "300cm", "20KG", 4),
("Rodapé Branco", 50.00, "250cm", "15KG", 5),
("Tinta Azul acrilica", 60.00, "12cm x 10cm", "10KG", 1),
("Tinta Marrom Fosca para Parede", 35.00, "10cm x 12cm", "8KG", 2),
("Toldo Verde", 80.00, "150cm", "30KG", 3);

-- Faça um SELECT que retorne todes os produtos cujo valor seja maior do que R$ 100,00.
select * from tb_produtos where valor > 100;
-- Faça um SELECT que retorne todes os produtos cujo valor esteja no intervalo R$ 70,00 e R$ 150,00.
select * from tb_produtos where valor between 70 and 150;
-- Faça um SELECT utilizando o operador LIKE, buscando todes os produtos que possuam a letra C no atributo nome.
select * from tb_produtos where nome like "%C%";
-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias.
select id_produto, nome, preco, tamanho, peso, tb_categoria.id_categoria
from tb_produtos inner join tb_categoria
on tb_produtos.id_categoria = tb_categoria.id_categoria;

-- Faça um SELECT utilizando a cláusula INNER JOIN, unindo os dados da tabela tb_produtos com os dados da tabela tb_categorias, onde traga apenas os produtos que pertençam a uma categoria específica 

select P.id_produto, P.nome , P.preco , P.tamanho, P.peso, C.id_categoria
from tb_produtos as P
inner join tb_categoria as C
on P.id_categoria = C.id_categoria
where C.cidade = "SP";







