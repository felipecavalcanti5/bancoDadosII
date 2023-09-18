CREATE DATABASE criando_banco_sql
GO

USE criando_banco_sql
GO

CREATE TABLE Clientes (
  IDCliente INT identity(1,1) primary key,
  CodigoDoCliente VARCHAR(5) NOT NULL,
  NomeDaEmpresa VARCHAR(40) NULL,
  NomeDoContato VARCHAR(30) NULL,
  CargoDoContato VARCHAR(30) NULL,
  Endereco VARCHAR(60) NULL,
  Cidade VARCHAR(15) NULL,
  Regiao VARCHAR(15) NULL,
  CEP VARCHAR(10) NULL,
  Pais VARCHAR(15) NULL,
  Telefone VARCHAR(24) NULL,
  Fax VARCHAR(24) NULL
);

CREATE TABLE Funcionarios (
  CodigoDoFuncionario INT identity(1,1) primary key,
  Sobrenome VARCHAR(20) NULL,
  Nome VARCHAR(10) NULL,
  Cargo VARCHAR(30) NULL,
  Tratamento VARCHAR(25) NULL,
  DataDeNascimento DATE NULL,
  DataDeContratacao DATE NULL,
  Endereco VARCHAR(60) NULL,
  Cidade VARCHAR(15) NULL,
  Regiao VARCHAR(15) NULL,
  CEP VARCHAR(10) NULL,
  Pais VARCHAR(15) NULL,
  TelefoneResidencial VARCHAR(24) NULL,
  Ramal VARCHAR(4) NULL,
  Foto VARCHAR(15) NULL,
  Observacoes text NULL,
  Supervisor INT NULL,
  CONSTRAINT FK_supervisor FOREIGN KEY (Supervisor) REFERENCES Funcionarios(CodigoDoFuncionario));

  CREATE TABLE Transportadoras (
  CodigoDaTransportadora INT identity(1,1) primary key,
  NomeDaEmpresa VARCHAR(40) NULL,
  Telefone VARCHAR(24) NULL
);

CREATE TABLE Pedidos (
  NumeroDoPedido INT identity(1,1) primary key,
  IDCliente INT NULL,
  CodigoDoFuncionario INT NULL,
  DataDoPedido DATE NULL,
  DataDeEntrega DATE NULL,
  DataDeEnvio DATE NULL,
  CodigoDaTransportadora INT NULL,
  Frete DECIMAL(19, 4) NULL,
  NomeDoDestinatario VARCHAR(40) NULL,
  EndereçoDoDestinatario VARCHAR(60) NULL,
  CidadeDeDestino VARCHAR(15) NULL,
  RegiaoDeDestino VARCHAR(15) NULL,
  CEPdeDestino VARCHAR(10) NULL,
  PaisDeDestino VARCHAR(15) NULL,
  CONSTRAINT FK_IDCLiente FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente),
  CONSTRAINT FK_codigofuncionario FOREIGN KEY (CodigoDoFuncionario) REFERENCES Funcionarios(CodigoDoFuncionario),
  CONSTRAINT FK_codigotransportadora FOREIGN KEY (CodigoDaTransportadora) REFERENCES Transportadoras(CodigoDaTransportadora)
);

CREATE TABLE Categorias (
  CodigoDaCategoria INT identity(1,1) primary key,
  NomeDaCategoria VARCHAR(15) NULL,
  Descricao VARCHAR(50) NULL,
  Figura VARCHAR(15) NULL
);

CREATE TABLE Fornecedores (
  CodigoDoFornecedor INT identity(1,1) primary key,
  NomeDaEmpresa VARCHAR(40) NULL,
  NomeDoContato VARCHAR(30) NULL,
  CargoDoContato VARCHAR(30) NULL,
  Endereco VARCHAR(60) NULL,
  Cidade VARCHAR(15) NULL,
  Regiao VARCHAR(15) NULL,
  CEP VARCHAR(10) NULL,
  Pais VARCHAR(15) NULL,
  Telefone VARCHAR(24) NULL,
  Fax VARCHAR(24) NULL,
  HomePage text NULL
);


CREATE TABLE Produtos (
  CodigoDoProduto INT identity(1,1) primary key,
  NomeDoProduto VARCHAR(40) NULL,
  CodigoDoFornecedor INT NULL,
  CodigoDaCategoria INT NULL,
  QuantidadePorUnidade VARCHAR(25) NULL,
  PrecoUnitario DECIMAL(19, 4) NULL,
  UnidadesEmEstoque INT NULL,
  UnidadesPedidas INT NULL,
  NivelDeReposicao INT NULL,
  Descontinuado INT NOT NULL,
  CONSTRAINT FK_codigofornecedor FOREIGN KEY (CodigoDoFornecedor) REFERENCES Fornecedores(CodigoDoFornecedor),
  CONSTRAINT FK_codigocategoria FOREIGN KEY (CodigoDaCategoria) REFERENCES Categorias(CodigoDaCategoria)
);

CREATE TABLE Detalhes_do_Pedido (
  NumeroDoPedido INT identity(1,1) primary key,
  CodigoDoProduto INT NULL,
  PrecoUnitário INT NULL,
  Quantidade INT NULL,
  Desconto INT NULL,
  CONSTRAINT FK_codigoproduto FOREIGN KEY (CodigoDoProduto) REFERENCES Produtos(CodigoDoProduto)
);

INSERT INTO Clientes(CodigoDoCliente, NomeDaEmpresa, NomeDoContato, CargoDoContato, Endereco, Cidade, Regiao, CEP, Pais, Telefone, Fax)
VALUES ('ALFKI', 'Alfreds Futterkiste', 'Maria Anders', 'Representante de Vendas', 'Obere Str. 57', 'Berlin', NULL, '12209', 'Alemanha', '030-0074321', '030-0076545'),
('ANATR', 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Proprietário', 'Avda. de la Constitución 2222', 'México D.F.', NULL, '05021', 'México', '(5) 555-4729', '(5) 555-3745'),('ANTON', 'Antonio Moreno Taquería', 'Antonio Moreno', 'Proprietário', 'Mataderos  2312', 'México D.F.', NULL, '05023', 'México', '(5) 555-3932', NULL),('AROUT', 'Around the Horn', 'Thomas Hardy', 'Representante de Vendas', '120 Hanover Sq.', 'London', NULL, 'WA1 1DP', 'Reino Unido', '(171) 555-7788', '(171) 555-6750'),('BERGS', 'Berglunds snabbköp', 'Christina Berglund', 'Administrador de Pedidos', 'Berguvsvägen  8', 'Luleå', NULL, 'S-958 22', 'Suécia', '0921-12 34 65', '0921-12 34 67'),('BLAUS', 'Blauer See Delikatessen', 'Hanna Moos', 'Representante de Vendas', 'Forsterstr. 57', 'Mannheim', NULL, '68306', 'Alemanha', '0621-08460', '0621-08924'),('BLONP', 'Blondel père et fils', 'Frédérique Citeaux', 'Gerente de Marketing', '24, place Kléber', 'Strasbourg', NULL, '67000', 'França', '88.60.15.31', '88.60.15.32'),('BOLID', 'Bólido Comidas preparadas', 'Martín Sommer', 'Proprietário', 'C/ Araquil, 67', 'Madrid', NULL, '28023', 'Espanha', '(91) 555 22 82', '(91) 555 91 99'),('BONAP', 'Bon app ', 'Laurence Lebihan', 'Proprietário', '12, rue des Bouchers', 'Marseille', NULL, '13008', 'França', '91.24.45.40', '91.24.45.41'),('BOTTM', 'Bottom-Dollar Markets', 'Elizabeth Lincoln', 'Gerente Financeiro', '23 Tsawassen Blvd.', 'Tsawassen', 'BC', 'T2F 8M4', 'Canadá', '(604) 555-4729', '(604) 555-3745'),('BSBEV', 'B s Beverages', 'Victoria Ashworth', 'Representante de Vendas', 'Fauntleroy Circus', 'London', NULL, 'EC2 5NT', 'Reino Unido', '(171) 555-1212', NULL),('CACTU', 'Cactus Comidas para llevar', 'Patricio Simpson', 'Agente de Vendas', 'Cerrito 333', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5555', '(1) 135-4892'),('CENTC', 'Centro comercial Moctezuma', 'Francisco Chang', 'Gerente de Marketing', 'Sierras de Granada 9993', 'México D.F.', NULL, '05022', 'México', '(5) 555-3392', '(5) 555-7293'),('CHOPS', 'Chop-suey Chinese', 'Yang Wang', 'Proprietário', 'Hauptstr. 29', 'Bern', NULL, '3012', 'Suíça', '0452-076545', NULL),('COMMI', 'Comércio Mineiro', 'Pedro Afonso', 'Assessor de Vendas', 'Av. dos Lusíadas, 23', 'São Paulo', 'SP', '05432-043', 'Brasil', '(11) 555-7647', NULL),('CONSH', 'Consolidated Holdings', 'Elizabeth Brown', 'Representante de Vendas', 'Berkeley Gardens\r\n12  Brewery ', 'London', NULL, 'WX1 6LT', 'Reino Unido', '(171) 555-2282', '(171) 555-9199'),('DRACD', 'Drachenblut Delikatessen', 'Sven Ottlieb', 'Administrador de Pedidos', 'Walserweg 21', 'Aachen', NULL, '52066', 'Alemanha', '0241-039123', '0241-059428'),('DUMON', 'Du monde entier', 'Janine Labrune', 'Proprietário', '67, rue des Cinquante Otages', 'Nantes', NULL, '44000', 'França', '40.67.88.88', '40.67.89.89'),('EASTC', 'Eastern Connection', 'Ann Devon', 'Agente de Vendas', '35 King George', 'London', NULL, 'WX3 6FW', 'Reino Unido', '(171) 555-0297', '(171) 555-3373'),('ERNSH', 'Ernst Handel', 'Roland Mendel', 'Gerente de Vendas', 'Kirchgasse 6', 'Graz', NULL, '8010', 'Áustria', '7675-3425', '7675-3426'),  ('FAMIA', 'Familia Arquibaldo', 'Aria Cruz', 'Assistente de Marketing', 'Rua Orós, 92', 'São Paulo', 'SP', '05442-030', 'Brasil', '(11) 555-9857', NULL),
  ('FISSA', 'FISSA Fabrica Inter. Salchichas S.A.', 'Diego Roel', 'Gerente Financeiro', 'C/ Moralzarzal, 86', 'Madrid', NULL, '28034', 'Espanha', '(91) 555 94 44', '(91) 555 55 93'),
  ('FOLIG', 'Folies gourmandes', 'Martine Rancé', 'Assistente do Agente de Vendas', '184, chaussée de Tournai', 'Lille', NULL, '59000', 'França', '20.16.10.16', '20.16.10.17'),
  ('FOLKO', 'Folk och fä HB', 'Maria Larsson', 'Proprietário', 'Åkergatan 24', 'Bräcke', NULL, 'S-844 67', 'Suécia', '0695-34 67 21', NULL),
  ('FRANK', 'Frankenversand', 'Peter Franken', 'Gerente de Marketing', 'Berliner Platz 43', 'München', NULL, '80805', 'Alemanha', '089-0877310', '089-0877451'),
  ('FRANR', 'France restauration', 'Carine Schmitt', 'Gerente de Marketing', '54, rue Royale', 'Nantes', NULL, '44000', 'França', '40.32.21.21', '40.32.21.20'),
  ('FRANS', 'Franchi S.p.A.', 'Paolo Accorti', 'Representante de Vendas', 'Via Monte Bianco 34', 'Torino', NULL, '10100', 'Itália', '011-4988260', '011-4988261'),
  ('FURIB', 'Furia Bacalhau e Frutos do Mar', 'Lino Rodriguez ', 'Gerente de Vendas', 'Jardim das rosas n. 32', 'Lisboa', NULL, '1675', 'Portugal', '(1) 354-2534', '(1) 354-2535'),
  ('GALED', 'Galería del gastrónomo', 'Eduardo Saavedra', 'Gerente de Marketing', 'Rambla de Cataluña, 23', 'Barcelona', NULL, '08022', 'Espanha', '(93) 203 4560', '(93) 203 4561'),
  ('GODOS', 'Godos Cocina Típica', 'José Pedro Freyre', 'Gerente de Vendas', 'C/ Romero, 33', 'Sevilla', NULL, '41101', 'Espanha', '(95) 555 82 82', NULL),
  ('GOURL', 'Gourmet Lanchonetes', 'André Fonseca', 'Assessor de Vendas', 'Av. Brasil, 442', 'Campinas', 'SP', '04876-786', 'Brasil', '(11) 555-9482', NULL),
  ('GREAL', 'Great Lakes Food Market', 'Howard Snyder', 'Gerente de Marketing', '2732 Baker Blvd.', 'Eugene', 'OR', '97403', 'EUA', '(503) 555-7555', NULL),
  ('GROSR', 'GROSELLA-Restaurante', 'Manuel Pereira', 'Proprietário', '5ª Ave. Los Palos Grandes', 'Caracas', 'DF', '1081', 'Venezuela', '(2) 283-2951', '(2) 283-3397'),
  ('HANAR', 'Hanari Carnes', 'Mario Pontes', 'Gerente Financeiro', 'Rua do Paço, 67', 'Rio de Janeiro', 'RJ', '05454-876', 'Brasil', '(21) 555-0091', '(21) 555-8765'),
  ('HILAA', 'HILARIÓN-Abastos', 'Carlos Hernández', 'Representante de Vendas', 'Carrera 22 con Ave. Carlos Soublette #8-35', 'San Cristóbal', 'Táchira', '5022', 'Venezuela', '(5) 555-1340', '(5) 555-1948'),  ('HUNGC', 'Hungry Coyote Import Store', 'Yoshi Latimer', 'Representante de Vendas', 'City Center Plaza\r\n516 Main St.', 'Elgin', 'OR', '97827', 'EUA', '(503) 555-6874', '(503) 555-2376'),  ('HUNGO', 'Hungry Owl All-Night Grocers', 'Patricia McKenna', 'Assessor de Vendas', '8 Johnstown Road', 'Cork', 'Co. Cork', NULL, 'Irlanda', '2967 542', '2967 3333'),('ISLAT', 'Island Trading', 'Helen Bennett', 'Gerente de Marketing', 'Garden House\r\nCrowther Way', 'Cowes', 'Isle of Wigth', 'PO31 7PJ', 'Reino Unido', '(198) 555-8888', NULL),('KOENE', 'Königlich Essen', 'Philip Cramer', 'Assessor de Vendas', 'Maubelstr. 90', 'Brandenburg', NULL, '14776', 'Alemanha', '0555-09876', NULL),('LACOR', 'La corne d abondance', 'Daniel Tonini', 'Representante de Vendas', '67, avenue de l Europe', 'Versailles', NULL, '78000', 'França', '30.59.84.10', '30.59.85.11'),('LAMAI', 'La maison d Asie', 'Annette Roulet', 'Gerente de Vendas', '1 rue Alsace-Lorraine', 'Toulouse', NULL, '31000', 'França', '61.77.61.10', '61.77.61.11'),('LAUGB', 'Laughing Bacchus Wine Cellars', 'Yoshi Tannamuri', 'Assistente de Marketing', '1900 Oak St.', 'Vancouver', 'BC', 'V3F 2K1', 'Canadá', '(604) 555-3392', '(604) 555-7293'),('LAZYK', 'Lazy K Kountry Store', 'John Steel', 'Gerente de Marketing', '12 Orchestra Terrace', 'Walla Walla', 'WA', '99362', 'EUA', '(509) 555-7969', '(509) 555-6221'),('LEHMS', 'Lehmanns Marktstand', 'Renate Messner', 'Representante de Vendas', 'Magazinweg 7', 'Frankfurt a.M. ', NULL, '60528', 'Alemanha', '069-0245984', '069-0245874'),('LETSS', 'Let s Stop N Shop', 'Jaime Yorres', 'Proprietário', '87 Polk St.\r\nSuite 5', 'San Francisco', 'CA', '94117', 'EUA', '(415) 555-5938', NULL),('LILAS', 'LILA-Supermercado', 'Carlos González', 'Gerente Financeiro', 'Carrera 52 con Ave. Bolívar #65-98 Llano Largo', 'Barquisimeto', 'Lara', '3508', 'Venezuela', '(9) 331-6954', '(9) 331-7256'),('LINOD', 'LINO-Delicateses', 'Felipe Izquierdo', 'Proprietário', 'Ave. 5 de Mayo Porlamar', 'I. de Margarita', 'Nueva Esparta', '4980', 'Venezuela', '(8) 34-56-12', '(8) 34-93-93'),('LONEP', 'Lonesome Pine Restaurant', 'Fran Wilson', 'Gerente de Vendas', '89 Chiaroscuro Rd.', 'Portland', 'OR', '97219', 'EUA', '(503) 555-9573', '(503) 555-9646'),('MAGAA', 'Magazzini Alimentari Riuniti', 'Giovanni Rovelli', 'Gerente de Marketing', 'Via Ludovico il Moro 22', 'Bergamo', NULL, '24100', 'Itália', '035-640230', '035-640231'),('MAISD', 'Maison Dewey', 'Catherine Dewey', 'Agente de Vendas', 'Rue Joseph-Bens 532', 'Bruxelles', NULL, 'B-1180', 'Bélgica', '(02) 201 24 67', '(02) 201 24 68'),('MEREP', 'Mère Paillarde', 'Jean Fresnière', 'Assistente de Marketing', '43 rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canadá', '(514) 555-8054', '(514) 555-8055'),('MORGK', 'Morgenstern Gesundkost', 'Alexander Feuer', 'Assistente de Marketing', 'Heerstr. 22', 'Leipzig', NULL, '04179', 'Alemanha', '0342-023176', NULL),('NORTS', 'North/South', 'Simon Crowther', 'Assessor de Vendas', 'South House\r\n300 Queensbridge', 'London', NULL, 'SW7 1RZ', 'Reino Unido', '(171) 555-7733', '(171) 555-2530'),('OCEAN', 'Océano Atlántico Ltda.', 'Yvonne Moncada', 'Agente de Vendas', 'Ing. Gustavo Moncada 8585\r\nPiso 20-A', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 135-5333', '(1) 135-5535'),('OLDWO', 'Old World Delicatessen', 'Rene Phillips', 'Representante de Vendas', '2743 Bering St.', 'Anchorage', 'AK', '99508', 'EUA', '(907) 555-7584', '(907) 555-2880'),('OTTIK', 'Ottilies Käseladen', 'Henriette Pfalzheim', 'Proprietário', 'Mehrheimerstr. 369', 'Köln', NULL, '50739', 'Alemanha', '0221-0644327', '0221-0765721'),('PARIS', 'Paris spécialités', 'Marie Bertrand', 'Proprietário', '265, boulevard Charonne', 'Paris', NULL, '75012', 'França', '(1) 42.34.22.66', '(1) 42.34.22.77'),('PERIC', 'Pericles Comidas clásicas', 'Guillermo Fernández', 'Representante de Vendas', 'Calle Dr. Jorge Cash 321', 'México D.F.', NULL, '05033', 'México', '(5) 552-3745', '(5) 545-3745'),('PICCO', 'Piccolo und mehr', 'Georg Pipps', 'Gerente de Vendas', 'Geislweg 14', 'Salzburg', NULL, '5020', 'Áustria', '6562-9722', '6562-9723'),('PRINI', 'Princesa Isabel Vinhos', 'Isabel de Castro', 'Representante de Vendas', 'Estrada da saúde n. 58', 'Lisboa', NULL, '1756', 'Portugal', '(1) 356-5634', NULL),('QUEDE', 'Que Delícia', 'Bernardo Batista', 'Gerente Financeiro', 'Rua da Panificadora, 12', 'Rio de Janeiro', 'RJ', '02389-673', 'Brasil', '(21) 555-4252', '(21) 555-4545'),('QUEEN', 'Queen Cozinha', 'Lúcia Carvalho', 'Assistente de Marketing', 'Alameda dos Canàrios, 891', 'São Paulo', 'SP', '05487-020', 'Brasil', '(11) 555-1189', NULL),('QUICK', 'QUICK-Stop', 'Horst Kloss', 'Gerente Financeiro', 'Taucherstraße 10', 'Cunewalde', NULL, '01307', 'Alemanha', '0372-035188', NULL),('RANCH', 'Rancho grande', 'Sergio Gutiérrez', 'Representante de Vendas', 'Av. del Libertador 900', 'Buenos Aires', NULL, '1010', 'Argentina', '(1) 123-5555', '(1) 123-5556'),('RATTC', 'Rattlesnake Canyon Grocery', 'Paula Wilson', 'Assistente do Repr. de Vendas', '2817 Milton Dr.', 'Albuquerque', 'NM', '87110', 'EUA', '(505) 555-5939', '(505) 555-3620'),('REGGC', 'Reggiani Caseifici', 'Maurizio Moroni', 'Assessor de Vendas', 'Strada Provinciale 124', 'Reggio Emilia', NULL, '42100', 'Itália', '0522-556721', '0522-556722'),('RICAR', 'Ricardo Adocicados', 'Janete Limeira', 'Assistente do Agente de Vendas', 'Av. Copacabana, 267', 'Rio de Janeiro', 'RJ', '02389-890', 'Brasil', '(21) 555-3412', NULL),('RICSU', 'Richter Supermarkt', 'Michael Holz', 'Gerente de Vendas', 'Grenzacherweg 237', 'Genève', NULL, '1203', 'Suíça', '0897-034214', NULL),('ROMEY', 'Romero y tomillo', 'Alejandra Camino', 'Gerente Financeiro', 'Gran Vía, 1', 'Madrid', NULL, '28001', 'Espanha', '(91) 745 6200', '(91) 745 6210'),('SANTG', 'Santé Gourmet', 'Jonas Bergulfsen', 'Proprietário', 'Erling Skakkes gate 78', 'Stavern', NULL, '4110', 'Noruega', '07-98 92 35', '07-98 92 47'),('SAVEA', 'Save-a-lot Markets', 'Jose Pavarotti', 'Representante de Vendas', '187 Suffolk Ln.', 'Boise', 'ID', '83720', 'EUA', '(208) 555-8097', NULL),('SEVES', 'Seven Seas Imports', 'Hari Kumar', 'Gerente de Vendas', '90 Wadhurst Rd.', 'London', NULL, 'OX15 4NB', 'Reino Unido', '(171) 555-1717', '(171) 555-5646'),('SIMOB', 'Simons bistro', 'Jytte Petersen', 'Proprietário', 'Vinbæltet 34', 'København', NULL, '1734', 'Dinamarca', '31 12 34 56', '31 13 35 57'),('SPECD', 'Spécialités du monde', 'Dominique Perrier', 'Gerente de Marketing', '25, rue Lauriston', 'Paris', NULL, '75016', 'França', '(1) 47.55.60.10', '(1) 47.55.60.20'),('SPLIR', 'Split Rail Beer & Ale', 'Art Braunschweiger', 'Gerente de Vendas', 'P.O. Box 555', 'Lander', 'WY', '82520', 'EUA', '(307) 555-4680', '(307) 555-6525'),('SUPRD', 'Suprêmes délices', 'Pascale Cartrain', 'Gerente Financeiro', 'Boulevard Tirou, 255', 'Charleroi', NULL, 'B-6000', 'Bélgica', '(071) 23 67 22 20', '(071) 23 67 22 21'),('THEBI', 'The Big Cheese', 'Liz Nixon', 'Gerente de Marketing', '89 Jefferson Way\r\nSuite 2', 'Portland', 'OR', '97201', 'EUA', '(503) 555-3612', NULL),('THECR', 'The Cracker Box', 'Liu Wong', 'Assistente de Marketing', '55 Grizzly Peak Rd.', 'Butte', 'MT', '59801', 'EUA', '(406) 555-5834', '(406) 555-8083'),('TOMSP', 'Toms Spezialitäten', 'Karin Josephs', 'Gerente de Marketing', 'Luisenstr. 48', 'Münster', NULL, '44087', 'Alemanha', '0251-031259', '0251-035695'),('TORTU', 'Tortuga Restaurante', 'Miguel Angel Paolino', 'Proprietário', 'Avda. Azteca 123', 'México D.F.', NULL, '05033', 'México', '(5) 555-2933', NULL),('TRADH', 'Tradição Hipermercados', 'Anabela Domingues', 'Representante de Vendas', 'Av. Inês de Castro, 414', 'São Paulo', 'SP', '05634-030', 'Brasil', '(11) 555-2167', '(11) 555-2168'),('TRAIH', 'Trail s Head Gourmet Provisioners', 'Helvetius Nagy', 'Assessor de Vendas', '722 DaVinci Blvd.', 'Kirkland', 'WA', '98034', 'EUA', '(206) 555-8257', '(206) 555-2174'),('VAFFE', 'Vaffeljernet', 'Palle Ibsen', 'Gerente de Vendas', 'Smagsløget 45', 'Århus', NULL, '8200', 'Dinamarca', '86 21 32 43', '86 22 33 44'),('VICTE', 'Victuailles en stock', 'Mary Saveley', 'Agente de Vendas', '2, rue du Commerce', 'Lyon', NULL, '69004', 'França', '78.32.54.86', '78.32.54.87'),('VINET', 'Vins et alcools Chevalier', 'Paul Henriot', 'Gerente Financeiro', '59 rue de l Abbaye', 'Reims', NULL, '51100', 'França', '26.47.15.10', '26.47.15.11'),('WANDK', 'Die Wandernde Kuh', 'Rita Müller', 'Representante de Vendas', 'Adenauerallee 900', 'Stuttgart', NULL, '70563', 'Alemanha', '0711-020361', '0711-035428'),('WARTH', 'Wartian Herkku', 'Pirkko Koskitalo', 'Gerente Financeiro', 'Torikatu 38', 'Oulu', NULL, '90110', 'Finlândia', '981-443655', '981-443655'),('WELLI', 'Wellington Importadora', 'Paula Parente', 'Gerente de Vendas', 'Rua do Mercado, 12', 'Resende', 'SP', '08737-363', 'Brasil', '(14) 555-8122', NULL),('WHITC', 'White Clover Markets', 'Karl Jablonski', 'Proprietário', '305 - 14th Ave. S.\r\nSuite 3B', 'Seattle', 'WA', '98128', 'EUA', '(206) 555-4112', '(206) 555-4115'),('WILMK', 'Wilman Kala', 'Matti Karttunen', 'Proprietário/Assist. Marketing', 'Keskuskatu 45', 'Helsinki', NULL, '21240', 'Finlândia', '90-224 8858', '90-224 8858'),('WOLZA', 'Wolski  Zajazd', 'Zbyszek Piestrzeniewicz', 'Proprietário', 'ul. Filtrowa 68', 'Warszawa', NULL, '01-012', 'Polônia', '(26) 642-7012', '(26) 642-7012');

-- ----------------------------------------------------------------------
-- MySQL Migration Toolkit
-- SQL Create Script
-- ----------------------------------------------------------------------
-- Inserindo Registros na Tabela
-- Categorias

INSERT INTO Categorias(NomeDaCategoria, Descricao, Figura)
VALUES ('Bebidas', 'Refrigerantes, cafés, chás e cervejas', ''),
  ('Condimentos', 'Patês, temperos, picles e molhos doces e salgados', ''),
  ('Confeitos', 'Sobremesas, doces, pães doces', ''),
  ('Laticínios', 'Queijos', ''),
  ('Grãos/Cereais', 'Pães, biscoitos, massas e cereais', ''),
  ('Carnes/Aves', 'Carnes preparadas', ''),
  ('Hortigranjeiros', 'Frutas secas e pastas vegetais', ''),
  ('Frutos do Mar', 'Peixes e algas marinhas', '');

  SELECT * FROM Categorias
  GO


-- ----------------------------------------------------------------------
-- MySQL Migration Toolkit
-- SQL Create Script
-- ----------------------------------------------------------------------
-- Inserindo Registros na Tabela
-- Transportadoras

INSERT INTO Transportadoras(NomeDaEmpresa, Telefone)
VALUES ('Speedy Express', '(503) 555-9831'),
  ('United Package', '(503) 555-3199'),
  ('Federal Shipping', '(503) 555-9931');


-- ----------------------------------------------------------------------
-- MySQL Migration Toolkit
-- SQL Create Script
-- ----------------------------------------------------------------------
-- Inserindo Registros na Tabela
-- Produtos

INSERT INTO Produtos(CodigoDoProduto, NomeDoProduto, CodigoDoFornecedor, CodigoDaCategoria, QuantidadePorUnidade, PrecoUnitario, UnidadesEmEstoque, UnidadesPedidas, NivelDeReposicao, Descontinuado)
VALUES (1, 'Chai', 1, 1, '10 caixas x 20 pacotes', 18.0000, 39, 0, 10, 0),
  (2, 'Chang', 1, 1, '24 garrafas de 12oz', 19.0000, 17, 40, 25, 0),
  (3, 'Aniseed Syrup', 1, 2, '12 garrafas de 550ml', 10.0000, 13, 70, 25, 0),
  (4, 'Chef Anton\s Cajun Seasoning', 2, 2, '48 vidros de 6oz', 22.0000, 53, 0, 0, 0),
  (5, 'Chef Anton\s Gumbo Mix', 2, 2, '36 caixas', 21.3500, 0, 0, 0, -1),
  (6, 'Grandma\s Boysenberry Spread', 3, 2, '12 vidros de 8oz', 25.0000, 120, 0, 25, 0),
  (7, 'Uncle Bob\s Organic Dried Pears', 3, 7, '12 pacotes de 1lb', 30.0000, 15, 0, 10, 0),
  (8, 'Northwoods Cranberry Sauce', 3, 2, '12 vidros de 12oz', 40.0000, 6, 0, 0, 0),
  (9, 'Mishi Kobe Niku', 4, 6, '18 pacotes de 500g', 97.0000, 29, 0, 0, -1),
  (10, 'Ikura', 4, 8, '12 vidros de 200ml', 31.0000, 31, 0, 0, 0),
  (11, 'Queso Cabrales', 5, 4, 'pacote de 1kg', 21.0000, 22, 30, 30, 0),
  (12, 'Queso Manchego La Pastora', 5, 4, '10 pacotes de 500g', 38.0000, 86, 0, 0, 0),
  (13, 'Konbu', 6, 8, 'caixa de 2kg', 6.0000, 24, 0, 5, 0),
  (14, 'Tofu', 6, 7, '40 pacotes de 100g', 23.2500, 35, 0, 0, 0),
  (15, 'Genen Shouyu', 6, 2, '24 garrafas de 250ml', 15.5000, 39, 0, 5, 0),
  (16, 'Pavlova', 7, 3, '32 caixas de 500g', 17.4500, 29, 0, 10, 0),
  (17, 'Alice Mutton', 7, 6, '20 latas de 1kg', 39.0000, 0, 0, 2, -1),
  (18, 'Carnarvon Tigers', 7, 8, 'pacote de 16kg', 62.5000, 42, 0, 0, 0),
  (19, 'Teatime Chocolate Biscuits', 8, 3, '10 caixas x 12 unidades', 9.2000, 25, 0, 5, 0),
  (20, 'Sir Rodney\s Marmalade', 8, 3, '30 caixas para presente', 81.0000, 40, 0, 0, 0),
  (21, 'Sir Rodney\s Scones', 8, 3, '24 pacotes x 4 unidades', 10.0000, 3, 40, 5, 0),
  (22, 'Gustaf\s Knäckebröd', 9, 5, '24 pacotes de 500g', 21.0000, 104, 0, 25, 0),
  (23, 'Tunnbröd', 9, 5, '12 pacotes de 250g', 9.0000, 61, 0, 25, 0),
  (24, 'Guaraná Fantástica', 10, 1, '12 latas de 355ml', 4.5000, 20, 0, 0, -1),
  (25, 'NuNuCa Nuß-Nougat-Creme', 11, 3, '20 vidros de 450g', 14.0000, 76, 0, 30, 0),
  (26, 'Gumbär Gummibärchen', 11, 3, '100 sacos de 250g', 31.2300, 15, 0, 0, 0),
  (27, 'Schoggi Schokolade', 11, 3, '100 unidades de 100g', 43.9000, 49, 0, 30, 0),
  (28, 'Rössle Sauerkraut', 12, 7, '25 latas de 825g', 45.6000, 26, 0, 0, -1),
  (29, 'Thüringer Rostbratwurst', 12, 6, '50 pacotes x 30 salsichas', 123.7900, 0, 0, 0, -1),
  (30, 'Nord-Ost Matjeshering', 13, 8, '10 vidros de 200g', 25.8900, 10, 0, 15, 0),
  (31, 'Gorgonzola Telino', 14, 4, '12 pacotes de 100g', 12.5000, 0, 70, 20, 0),
  (32, 'Mascarpone Fabioli', 14, 4, '24 pacotes de 200g', 32.0000, 9, 40, 25, 0),
  (33, 'Geitost', 15, 4, '500g', 2.5000, 112, 0, 20, 0),
  (34, 'Sasquatch Ale', 16, 1, '24 garrafas de 12oz', 14.0000, 111, 0, 15, 0),
  (35, 'Steeleye Stout', 16, 1, '24 garrafas de 12oz', 18.0000, 20, 0, 15, 0),
  (36, 'Inlagd Sill', 17, 8, '24 vidros de 250g', 19.0000, 112, 0, 20, 0),
  (37, 'Gravad lax', 17, 8, '12 pacotes de 500g', 26.0000, 11, 50, 25, 0),
  (38, 'Côte de Blaye', 18, 1, '12 garrafas de 75cl', 263.5000, 17, 0, 15, 0),
  (39, 'Chartreuse verte', 18, 1, '750cc por garrafa', 18.0000, 69, 0, 5, 0),
  (40, 'Boston Crab Meat', 19, 8, '24 latas de 4oz', 18.4000, 123, 0, 30, 0),
  (41, 'Jack\s New England Clam Chowder', 19, 8, '12 latas de 12oz', 9.6500, 85, 0, 10, 0),
  (42, 'Singaporean Hokkien Fried Mee', 20, 5, '32 pacotes de 1kg', 14.0000, 26, 0, 0, -1),
  (43, 'Ipoh Coffee', 20, 1, '16 latas de 500g', 46.0000, 17, 10, 25, 0),
  (44, 'Gula Malacca', 20, 2, '20 sacos de 2kg', 19.4500, 27, 0, 15, 0),
  (45, 'Røgede sild', 21, 8, 'pacote de 1kg', 9.5000, 5, 70, 15, 0),
  (46, 'Spegesild', 21, 8, '4 vidros de 450g', 12.0000, 95, 0, 0, 0),
  (47, 'Zaanse koeken', 22, 3, '10 caixas de 4oz', 9.5000, 36, 0, 0, 0),
  (48, 'Chocolade', 22, 3, '10 pacotes', 12.7500, 15, 70, 25, 0),
  (49, 'Maxilaku', 23, 3, '24 pacotes de 50g', 20.0000, 10, 60, 15, 0),
  (50, 'Valkoinen suklaa', 23, 3, '12 barras de 100g', 16.2500, 65, 0, 30, 0),
  (51, 'Manjimup Dried Apples', 24, 7, '50 pacotes de 300g', 53.0000, 20, 0, 10, 0),
  (52, 'Filo Mix', 24, 5, '16 caixas de 2kg', 7.0000, 38, 0, 25, 0),
  (53, 'Perth Pasties', 24, 6, '48 unidades', 32.8000, 0, 0, 0, -1),
  (54, 'Tourtière', 25, 6, '16 unidades', 7.4500, 21, 0, 10, 0),
  (55, 'Pâté chinois', 25, 6, '24 caixas x 2 unidades', 24.0000, 115, 0, 20, 0),
  (56, 'Gnocchi di nonna Alice', 26, 5, '24 pacotes de 250g', 38.0000, 21, 10, 30, 0),
  (57, 'Ravioli Angelo', 26, 5, '24 pacotes de 250g', 19.5000, 36, 0, 20, 0),
  (58, 'Escargots de Bourgogne', 27, 8, '24 unidades', 13.2500, 62, 0, 20, 0),
  (59, 'Raclette Courdavault', 28, 4, 'pacote de 5kg', 55.0000, 79, 0, 0, 0),
  (60, 'Camembert Pierrot', 28, 4, '15 unidades de 300g', 34.0000, 19, 0, 0, 0),
  (61, 'Sirop rable', 29, 2, '24 garrafas de 500ml', 28.5000, 113, 0, 25, 0),
  (62, 'Tarte au sucre', 29, 3, '48 unidades', 49.3000, 17, 0, 0, 0),
  (63, 'Vegie-spread', 7, 2, '15 vidros de 625g', 43.9000, 24, 0, 5, 0),
  (64, 'Wimmers gute Semmelknödel', 12, 5, '20 sacos x 4 unidades', 33.2500, 22, 80, 30, 0),
  (65, 'Louisiana Fiery Hot Pepper Sauce', 2, 2, '32 garrafas de 8oz', 21.0500, 76, 0, 0, 0),
  (66, 'Louisiana Hot Spiced Okra', 2, 2, '24 vidros de 8oz', 17.0000, 4, 100, 20, 0),
  (67, 'Laughing Lumberjack Lager', 16, 1, '24 garrafas de 12oz', 14.0000, 52, 0, 10, 0),
  (68, 'Scottish Longbreads', 8, 3, '10 caixas x 8 unidades', 12.5000, 6, 10, 15, 0),
  (69, 'Gudbrandsdalsost', 15, 4, 'pacote de 10kg', 36.0000, 26, 0, 15, 0),
  (70, 'Outback Lager', 7, 1, '24 garrafas de 355ml', 15.0000, 15, 10, 30, 0),
  (71, 'Fløtemysost', 15, 4, '10 pacotes de 500g', 21.5000, 26, 0, 0, 0),
  (72, 'Mozzarella di Giovanni', 14, 4, '24 pacotes de 200g', 34.8000, 14, 0, 0, 0),
  (73, 'Röd Kaviar', 17, 8, '24 vidros de 150g', 15.0000, 101, 0, 5, 0),
  (74, 'Longlife Tofu', 4, 7, 'pacote de 5kg', 10.0000, 4, 20, 5, 0),
  (75, 'Rhönbräu Klosterbier', 12, 1, '24 garrafas de 500ml', 7.7500, 125, 0, 25, 0),
  (76, 'Lakkalikööri', 23, 1, '500ml', 18.0000, 57, 0, 20, 0),
  (77, 'Original Frankfurter grüne Soße', 12, 2, '12 caixas', 13.0000, 32, 0, 15, 0);




-- ----------------------------------------------------------------------
-- MySQL Migration Toolkit
-- SQL Create Script
-- ----------------------------------------------------------------------
-- Inserindo Registros na Tabela
-- Funcionários

  INSERT INTO Funcionarios(CodigoDoFuncionario, Sobrenome, Nome, Cargo, Tratamento, DataDeNascimento, DataDeContratacao, Endereco, Cidade, Regiao, CEP, Pais, TelefoneResidencial, Ramal, Foto, Observacoes, Supervisor)
VALUES (1, 'Davolio', 'Nancy', 'Representante de Vendas', 'Sra.', '1968-12-08 00:00:00', '1992-05-01 00:00:00', '507 - 20th Ave. E.\r\nApt. 2A', 'Seattle', 'WA', '98122', 'EUA', '(206) 555-9857', '5467', '', 'Sua educação inclui um bacharelado em Psicologia pela Universidade de Colorado. Nancy é membro do Conselho Internacional de Alimentação.', 2),
  (2, 'Fuller', 'Andrew', 'Vice-Presidente de Vendas', 'Dr.', '1952-02-19 00:00:00', '1992-08-14 00:00:00', '908 W. Capital Way', 'Tacoma', 'WA', '98401', 'EUA', '(206) 555-9482', '3457', '', 'Andrew formou-se em Propaganda e Marketing pela Universidade de Dallas. É fluente em francês e italiano e lê alemão. Ele entrou na companhia como representante de vendas, foi promovido a gerente de vendas . Andrew é membro do Conselho de Gerentes de Vendas, da Câmara de Comércio de Seattle e da Associação de Importadores do Círculo Pacífico.', NULL),
  (3, 'Leverling', 'Janet', 'Representante de Vendas', 'Sra.', '1963-08-30 00:00:00', '1992-04-01 00:00:00', '722 Moss Bay Blvd.', 'Kirkland', 'WA', '98033', 'EUA', '(206) 555-3412', '3355', '', 'Janet formou-se em Química pela Faculdade de Boston. Tem também certificado de conclusão do curso de Gerenciamento de Vendas de Alimentos. Janet foi contratada como assessora de vendas e foi promovida a representante de vendas.', 2),
  (4, 'Peacock', 'Margaret', 'Representante de Vendas', 'Sra.', '1958-09-19 00:00:00', '1993-05-03 00:00:00', '4110 Old Redmond Rd.', 'Redmond', 'WA', '98052', 'EUA', '(206) 555-8122', '5176', '', 'Margaret tem bacharelado em Literatura Inglesa pela Faculdade de Concordia e mestrado pelo Instituto Americano de Artes Culinárias. Ela foi designada temporariamente para o escritório de Londres antes de retornar a seu posto permanente em Seattle.', 2),
  (5, 'Buchanan', 'Steven', 'Gerente de Vendas', 'Sr.', '1955-03-04 00:00:00', '1993-10-17 00:00:00', '14 Garrett Hill', 'London', NULL, 'SW1 8JR', 'Reino Unido', '(71) 555-4848', '3453', '', 'Steven Buchanan formou-se pela Universidade St. Andrews, Escócia. Depois de trabalhar na empresa como representante de vendas, passou 6 meses em um programa de orientação no escritório de Seattle e voltou ao seu posto permanente em Londres, onde foi promovido a gerente de vendas. O Sr. Buchanan concluiu cursos de Telemarketing e de Gerente de Vendas Internacionais. Ele é fluente em francês.', 2),
  (6, 'Suyama', 'Michael', 'Representante de Vendas', 'Sr.', '1963-07-02 00:00:00', '1993-10-17 00:00:00', 'Coventry House\r\nMiner Rd.', 'London', NULL, 'EC2 7JR', 'Reino Unido', '(71) 555-7773', '428', '', 'Michael formou-se em Economia pela Universidade de Sussex, MA, e em Marketing pela Universidade da Califórnia, em Los Angeles. Também fez cursos de Comércio Multicultural e Administração para Profisssionais de Vendas. Ele é fluente em japonês e sabe ler e escrever em francês, português e espanhol.', 5),
  (7, 'King', 'Robert', 'Representante de Vendas', 'Sr.', '1960-05-29 00:00:00', '1994-01-02 00:00:00', 'Edgeham Hollow\r\nWinchester Way', 'London', NULL, 'RG1 9SP', 'Reino Unido', '(71) 555-5598', '465', '', 'Robert King serviu nas Forças de Paz e viajou muito antes de obter seu diploma de inglês na Universidade de Michigan e ingressar na empresa. Depois de concluir um curso chamado \"Vendas na Europa\", ele foi transferido para o escritório de Londres.', 5),
  (8, 'Callahan', 'Laura', 'Coordenador de Vendas Internas', 'Sra.', '1958-01-09 00:00:00', '1994-03-05 00:00:00', '4726 - 11th Ave. N.E.', 'Seattle', 'WA', '98105', 'EUA', '(206) 555-1189', '2344', '', 'Laura tem bacharelado em Psicologia pela Universidade de Washington. Ela também concluiu um curso de francês empresarial. Ela lê e escreve em francês.', 2),
  (9, 'Dodsworth', 'Anne', 'Representante de Vendas', 'Sra.', '1969-07-02 00:00:00', '1994-11-15 00:00:00', '7 Houndstooth Rd.', 'London', NULL, 'WG2 7LT', 'Reino Unido', '(71) 555-4444', '452', '', 'Anne é formada em inglês pela Faculdade St. Lawrence. Ela é fluente em francês e alemão.', 5);













-- ----------------------------------------------------------------------
-- MySQL Migration Toolkit
-- SQL Create Script
-- ----------------------------------------------------------------------
-- Inserindo Registros na Tabela
-- Fornecedor


INSERT INTO Fornecedores(CodigoDoFornecedor, NomeDaEmpresa, NomeDoContato, CargoDoContato, Endereco, Cidade, Regiao, CEP, Pais, Telefone, Fax, HomePage)
VALUES (1, 'Exotic Liquids', 'Charlotte Cooper', 'Gerente de Encomendas', '49 Gilbert St.', 'London', NULL, 'EC1 4SD', 'Reino Unido', '(171) 555-2222', NULL, NULL),
  (2, 'New Orleans Cajun Delights', 'Shelley Burke', 'Administrador de Pedidos', 'P.O. Box 78934', 'New Orleans', 'LA', '70117', 'EUA', '(100) 555-4822', NULL, '#CAJUN.HTM#'),
  (3, 'Grandma Kelly\s Homestead', 'Regina Murphy', 'Representante de Vendas', '707 Oxford Rd.', 'Ann Arbor', 'MI', '48104', 'EUA', '(313) 555-5735', '(313) 555-3349', NULL),
  (4, 'Tokyo Traders', 'Yoshi Nagase', 'Gerente de Marketing', '9-8 Sekimai\r\nMusashino-shi', 'Tokyo', NULL, '100', 'Japão', '(03) 3555-5011', NULL, NULL),
  (5, 'Cooperativa de Quesos \Las Cabras\', 'Antonio del Valle Saavedra ', 'Administrador de Exportação', 'Calle del Rosal 4', 'Oviedo', 'Asturias', '33007', 'Espanha', '(98) 598 76 54', NULL, NULL),
  (6, 'Mayumi\s', 'Mayumi Ohno', 'Representante de Marketing', '92 Setsuko\r\nChuo-ku', 'Osaka', NULL, '545', 'Japão', '(06) 431-7877', NULL, 'Mayumi\s (na World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/mayumi.htm#'),
  (7, 'Pavlova, Ltd.', 'Ian Devling', 'Gerente de Marketing', '74 Rose St.\r\nMoonie Ponds', 'Melbourne', 'Victoria', '3058', 'Austrália', '(03) 444-2343', '(03) 444-6588', NULL),
  (8, 'Specialty Biscuits, Ltd.', 'Peter Wilson', 'Representante de Vendas', '29 King\s Way', 'Manchester', NULL, 'M14 GSD', 'Reino Unido', '(161) 555-4448', NULL, NULL),
  (9, 'PB Knäckebröd AB', 'Lars Peterson', 'Agente de Vendas', 'Kaloadagatan 13', 'Göteborg', NULL, 'S-345 67', 'Suécia', '031-987 65 43', '031-987 65 91', NULL),
  (10, 'Refrescos Americanas LTDA', 'Carlos Diaz', 'Gerente de Marketing', 'Av. das Americanas 12.890', 'São Paulo', NULL, '5442', 'Brasil', '(11) 555 4640', NULL, NULL),
  (11, 'Heli Süßwaren GmbH & Co. KG', 'Petra Winkler', 'Gerente de Vendas', 'Tiergartenstraße 5', 'Berlin', NULL, '10785', 'Alemanha', '(010) 9984510', NULL, NULL),
  (12, 'Plutzer Lebensmittelgroßmärkte AG', 'Martin Bein', 'Ger. Marketing Internacional', 'Bogenallee 51', 'Frankfurt', NULL, '60439', 'Alemanha', '(069) 992755', NULL, 'Plutzer (na World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/plutzer.htm#'),
  (13, 'Nord-Ost-Fisch Handelsgesellschaft mbH', 'Sven Petersen', 'Coord. Mercados Estrangeiros', 'Frahmredder 112a', 'Cuxhaven', NULL, '27478', 'Alemanha', '(04721) 8713', '(04721) 8714', NULL),
  (14, 'Formaggi Fortini s.r.l.', 'Elio Rossi', 'Representante de Vendas', 'Viale Dante, 75', 'Ravenna', NULL, '48100', 'Itália', '(0544) 60323', '(0544) 60603', '#FORMAGGI.HTM#'),
  (15, 'Norske Meierier', 'Beate Vileid', 'Gerente de Marketing', 'Hatlevegen 5', 'Sandvika', NULL, '1320', 'Noruega', '(0)2-953010', NULL, NULL),
  (16, 'Bigfoot Breweries', 'Cheryl Saylor', 'Rep. Financeiro Local', '3400 - 8th Avenue\r\nSuite 210', 'Bend', 'OR', '97101', 'EUA', '(503) 555-9931', NULL, NULL),
  (17, 'Svensk Sjöföda AB', 'Michael Björn', 'Representante de Vendas', 'Brovallavägen 231', 'Stockholm', NULL, 'S-123 45', 'Suécia', '08-123 45 67', NULL, NULL),
  (18, 'Aux joyeux ecclésiastiques', 'Guylène Nodier', 'Gerente de Vendas', '203, Rue des Francs-Bourgeois', 'Paris', NULL, '75004', 'França', '(1) 03.83.00.68', '(1) 03.83.00.62', NULL),
  (19, 'New England Seafood Cannery', 'Robb Merchant', 'Agente Financeiro de Atacado', 'Order Processing Dept.\r\n2100 Paul Revere Blvd.', 'Boston', 'MA', '02134', 'EUA', '(617) 555-3267', '(617) 555-3389', NULL),
  (20, 'Leka Trading', 'Chandra Leka', 'Proprietário', '471 Serangoon Loop, Suite #402', 'Singapore', NULL, '0512', 'Cingapura', '555-8787', NULL, NULL),
  (21, 'Lyngbysild', 'Niels Petersen', 'Gerente de Vendas', 'Lyngbysild\r\nFiskebakken 10', 'Lyngby', NULL, '2800', 'Dinamarca', '43844108', '43844115', NULL),
  (22, 'Zaanse Snoepfabriek', 'Dirk Luchte', 'Gerente Financeiro', 'Verkoop\r\nRijnweg 22', 'Zaandam', NULL, '9999 ZZ', 'Países Baixos', '(12345) 1212', '(12345) 1210', NULL),
  (23, 'Karkki Oy', 'Anne Heikkonen', 'Gerente do Produto', 'Valtakatu 12', 'Lappeenranta', NULL, '53120', 'Finlândia', '(953) 10956', NULL, NULL),
  (24, 'G\day, Mate', 'Wendy Mackenzie', 'Representante de Vendas', '170 Prince Edward Parade\r\nHunter\s Hill', 'Sydney', 'NSW', '2042', 'Austrália', '(02) 555-5914', '(02) 555-4873', 'G\day Mate (na World Wide Web)#http://www.microsoft.com/accessdev/sampleapps/gdaymate.htm#'),
  (25, 'Ma Maison', 'Jean-Guy Lauzon', 'Gerente de Marketing', '2960 Rue St. Laurent', 'Montréal', 'Québec', 'H1J 1C3', 'Canadá', '(514) 555-9022', NULL, NULL),
  (26, 'Pasta Buttini s.r.l.', 'Giovanni Giudici', 'Administrador de Pedidos', 'Via dei Gelsomini, 153', 'Salerno', NULL, '84100', 'Itália', '(089) 6547665', '(089) 6547667', NULL),
  (27, 'Escargots Nouveaux', 'Marie Delamare', 'Gerente de Vendas', '22, rue H. Voiron', 'Montceau', NULL, '71300', 'França', '85.57.00.07', NULL, NULL),
  (28, 'Gai pâturage', 'Eliane Noz', 'Representante de Vendas', 'Bat. B\r\n3, rue des Alpes', 'Annecy', NULL, '74000', 'França', '38.76.98.06', '38.76.98.58', NULL),
  (29, 'Forêts d\érables', 'Chantal Goulet', 'Gerente Financeiro', '148 rue Chasseur', 'Ste-Hyacinthe', 'Québec', 'J2S 7S8', 'Canadá', '(514) 555-2955', '(514) 555-2921', NULL);



SELECT * FROM Clientes
GO