-- Criação da tabela de usuários
CREATE TABLE TBUsuarios (
                            usuario_id SERIAL PRIMARY KEY,
                            nome_usuario VARCHAR(255) NOT NULL,
                            email VARCHAR(255) UNIQUE NOT NULL,
                            hash_senha VARCHAR(255) NOT NULL,
                            criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de categorias de gastos
CREATE TABLE TBCategoriasGastos (
                                    categoria_id SERIAL PRIMARY KEY,
                                    nome VARCHAR(255) NOT NULL,
                                    descricao TEXT
);

-- Criação da tabela de gastos
CREATE TABLE TBGastos (
                          gasto_id SERIAL PRIMARY KEY,
                          usuario_id INT NOT NULL,
                          categoria_id INT NOT NULL,
                          valor DECIMAL(10, 2) NOT NULL,
                          data DATE NOT NULL,
                          descricao TEXT,
                          FOREIGN KEY (usuario_id) REFERENCES TBUsuarios(usuario_id),
                          FOREIGN KEY (categoria_id) REFERENCES TBCategoriasGastos(categoria_id)
);

-- Criação da tabela de renda
CREATE TABLE TBRendas (
                          renda_id SERIAL PRIMARY KEY,
                          usuario_id INT NOT NULL,
                          valor DECIMAL(10, 2) NOT NULL,
                          fonte VARCHAR(255),
                          data DATE NOT NULL,
                          FOREIGN KEY (usuario_id) REFERENCES TBUsuarios(usuario_id)
);

-- Criação da tabela de objetivos financeiros
CREATE TABLE TBMetasFinanceiras (
                                    meta_id SERIAL PRIMARY KEY,
                                    usuario_id INT NOT NULL,
                                    valor_alvo DECIMAL(10, 2) NOT NULL,
                                    valor_atual DECIMAL(10, 2) NOT NULL,
                                    prazo DATE,
                                    descricao TEXT,
                                    FOREIGN KEY (usuario_id) REFERENCES TBUsuarios(usuario_id)
);
