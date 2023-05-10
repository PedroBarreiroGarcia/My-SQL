create database db_Livraria;
use db_Livraria;

create table tb_Livro (
	pk_IdLivro int,
    Autor varchar (50),
    Titulo varchar (50),
    Preco float,
    Genero varchar (50),
    Classificacao varchar (20),
    Tipo varchar (20),
    Capa varchar (20),
    Editora varchar (20),
    Idioma varchar (20), 
    fk_IdFornecedor int,
    Estoque int,
    QuantidadeVendida int, 
    fk_IdCliente int
);
    
select * from tb_Livro; 
    
create table tb_Cliente(
	pk_IdCliente int,
    Nome varchar (100),
    Email varchar (100),
    TelCliente varchar(15),
    Endereco varchar(100),
    Cpf varchar (20),
    Cep varchar (10),
    DataNascimento varchar (10),
    Cidade varchar (50),
    Estado varchar (20),
    Pais varchar (56),
	fk_IdLivro int
);
        
select * from tb_Cliente; 
        
create table tb_Fornecedor(
	pk_IdFornecedor int,
    NomeFornecedor varchar (100),
    CNPJFornecedor varchar (20),
    fk_IdProduto int,
    EnderecoFornecedor varchar(100),
    TelFornecedor varchar(15),
    EmailFornecedor varchar (100),
    CidadeFornecedor varchar (50),
    EstadoFornecedor varchar (20),
    PaisFornecedor varchar (56),
    CepFornecedor varchar (10)
);

select * from tb_Fornecedor;

create table tb_Vendedor(
	pk_IdVendedor int,
    NomeVendedor varchar (100),
    Unidade varchar (50),
    CpfVendedor varchar (20),
    DataNascimentoVendedor varchar (10),
    TelVendedor varchar(15),
    EmailVendedor varchar (100),
    EnderecoVendedor varchar(100),
    Salario float, 
    DataAdmissao varchar(10),
    Cargo varchar(50),
    CargaHoraria char (3)
    );
    
    select * from tb_Vendedor;
    
    create table tb_Produto(
		pk_IdProduto int,
        DescricaoProduto varchar (150),
        fk_IdFornecedor int,
        PrecoProduto float,
        TipoProduto varchar (50),
        ImpostoProduto float
	);
        
    select * from tb_Produto;
    
    use db_Livraria;
    
    