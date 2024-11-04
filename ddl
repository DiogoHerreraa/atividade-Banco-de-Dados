CREATE TABLE Paciente 
( 
  ID_PACIENTE INT PRIMARY KEY,  
  Nome VARCHAR(255),  
  Data_Nascimento DATE,  
  Sexo VARCHAR(10),  
  Endereco VARCHAR(255),  
  Telefone VARCHAR(20),  
  Email VARCHAR(255),  
  idRecepção_Evento INT,  
  idRecepcao_restaurante INT
); 

CREATE TABLE Consulta 
( 
  ID_CONSULTA INT PRIMARY KEY,  
  Data DATE,  
  Hora TIME
); 

CREATE TABLE Recepção_MEDICA 
( 
  ID_RECEPCAO INT PRIMARY KEY,  
  Telefone VARCHAR(20),  
  Nome VARCHAR(255)
); 

CREATE TABLE Recepção_Evento 
( 
  ID_RESERVA INT PRIMARY KEY,  
  Valor DECIMAL(10, 2),  
  Data DATE
); 

CREATE TABLE Evento 
( 
  ID_EVENTO INT PRIMARY KEY,  
  Nome_Evento VARCHAR(255),  
  Data_Evento DATE,  
  Tipo_Evento VARCHAR(255),  
  idRecepção_Evento INT,
  FOREIGN KEY (idRecepção_Evento) REFERENCES Recepção_Evento(ID_RESERVA)
); 

CREATE TABLE SALA 
( 
  ID_SALA INT PRIMARY KEY,  
  Nome_Sala VARCHAR(255),  
  Capacidade INT
); 

CREATE TABLE Recepcao_restaurante 
( 
  ID_RESERVA INT PRIMARY KEY,  
  Quantidade_Pessoas INT,  
  Data_Hora TIMESTAMP,  
  is_Medico BOOLEAN,  
  idMedico INT
); 

CREATE TABLE MESA 
( 
  ID_MESA INT PRIMARY KEY,  
  Capacidade INT,  
  idRecepcao_restaurante INT,  
  idPedido INT,
  FOREIGN KEY (idRecepcao_restaurante) REFERENCES Recepcao_restaurante(ID_RESERVA),
  FOREIGN KEY (idPedido) REFERENCES PEDIDO(ID_PEDIDO)
); 

CREATE TABLE PEDIDO 
( 
  ID_PEDIDO INT PRIMARY KEY,  
  Data_Hora TIMESTAMP,  
  Tipo VARCHAR(255),  
  idPagamento INT,
  FOREIGN KEY (idPagamento) REFERENCES PAGAMENTO(ID_PAGAMENTO)
); 

CREATE TABLE ITEM_PEDIDO 
( 
  ID_ITEM_PEDIDO INT PRIMARY KEY,  
  Quantidade INT,  
  Preco DECIMAL(10, 2),  
  idPedido INT,
  FOREIGN KEY (idPedido) REFERENCES PEDIDO(ID_PEDIDO)
); 

CREATE TABLE PAGAMENTO 
( 
  ID_PAGAMENTO INT PRIMARY KEY,  
  Valor_Total DECIMAL(10, 2),  
  Metodo VARCHAR(50),  
  idRecepcao_restaurante INT,
  FOREIGN KEY (idRecepcao_restaurante) REFERENCES Recepcao_restaurante(ID_RESERVA)
); 

CREATE TABLE Medico_Faixa_etária_Cirurgião_Cardiologista_Psicologo 
( 
  ID_MEDICO INT PRIMARY KEY,  
  Telefone VARCHAR(20),  
  Especialidade VARCHAR(255),  
  Sexo VARCHAR(10),  
  Nome VARCHAR(255),  
  Email VARCHAR(255),  
  Faixa_etária INT,  
  Certificação VARCHAR(255),  
  Tipo_Cirurgia_Especializada VARCHAR(255),  
  Numero_Cirurgias_Realizadas INT,  
  Area_Atuacao VARCHAR(255),  
  Anos_Experiencia INT
); 

CREATE TABLE Rel_Consulta_Recepção 
( 
  ID_CONSULTA INT,  
  ID_RECEPCAO INT,  
  PRIMARY KEY (ID_CONSULTA, ID_RECEPCAO),
  FOREIGN KEY (ID_CONSULTA) REFERENCES Consulta(ID_CONSULTA),
  FOREIGN KEY (ID_RECEPCAO) REFERENCES Recepção_MEDICA(ID_RECEPCAO)
); 

CREATE TABLE Rel_Consulta_Paciente 
( 
  ID_CONSULTA INT,  
  ID_PACIENTE INT,  
  PRIMARY KEY (ID_CONSULTA, ID_PACIENTE),
  FOREIGN KEY (ID_CONSULTA) REFERENCES Consulta(ID_CONSULTA),
  FOREIGN KEY (ID_PACIENTE) REFERENCES Paciente(ID_PACIENTE)
); 

CREATE TABLE Rel_Consulta_Medico 
( 
  ID_CONSULTA INT,  
  ID_MEDICO INT,  
  PRIMARY KEY (ID_CONSULTA, ID_MEDICO),
  FOREIGN KEY (ID_CONSULTA) REFERENCES Consulta(ID_CONSULTA),
  FOREIGN KEY (ID_MEDICO) REFERENCES Medico_Faixa_etária_Cirurgião_Cardiologista_Psicologo(ID_MEDICO)
); 

CREATE TABLE Rel_Evento_Sala 
( 
  ID_EVENTO INT,  
  ID_SALA INT,  
  PRIMARY KEY (ID_EVENTO, ID_SALA),
  FOREIGN KEY (ID_EVENTO) REFERENCES Evento(ID_EVENTO),
  FOREIGN KEY (ID_SALA) REFERENCES SALA(ID_SALA)
);