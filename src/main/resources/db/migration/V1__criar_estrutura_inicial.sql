-- Criação da extensão para UUID
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Criação da tabela de usuários
CREATE TABLE usuarios (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    secret_2fa VARCHAR(32),
    perfil VARCHAR(20) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'ATIVO',
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de categorias
CREATE TABLE categorias (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    status VARCHAR(20) NOT NULL DEFAULT 'ATIVA',
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de produtos
CREATE TABLE produtos (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    quantidade_estoque INT NOT NULL DEFAULT 0,
    categoria_id UUID NOT NULL REFERENCES categorias(id),
    codigo_barras VARCHAR(50) UNIQUE,
    imagem_url TEXT,
    data_validade DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'ATIVO',
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de carrinhos
CREATE TABLE carrinhos (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    usuario_id UUID NOT NULL REFERENCES usuarios(id),
    status VARCHAR(20) NOT NULL DEFAULT 'ABERTO',
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de itens do carrinho
CREATE TABLE itens_carrinho (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    carrinho_id UUID NOT NULL REFERENCES carrinhos(id),
    produto_id UUID NOT NULL REFERENCES produtos(id),
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    data_criacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    data_atualizacao TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- Criação de índices para melhor performance
CREATE INDEX idx_usuarios_email ON usuarios(email);
CREATE INDEX idx_produtos_categoria ON produtos(categoria_id);
CREATE INDEX idx_produtos_status ON produtos(status);
CREATE INDEX idx_carrinhos_usuario ON carrinhos(usuario_id);
CREATE INDEX idx_itens_carrinho ON itens_carrinho(carrinho_id);

-- Criação de trigger para atualização automática de data_atualizacao
CREATE OR REPLACE FUNCTION atualizar_data_atualizacao()
RETURNS TRIGGER AS $$
BEGIN
    NEW.data_atualizacao = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Aplicação do trigger em todas as tabelas
CREATE TRIGGER tr_usuarios_data_atualizacao
    BEFORE UPDATE ON usuarios
    FOR EACH ROW
    EXECUTE FUNCTION atualizar_data_atualizacao();

CREATE TRIGGER tr_categorias_data_atualizacao
    BEFORE UPDATE ON categorias
    FOR EACH ROW
    EXECUTE FUNCTION atualizar_data_atualizacao();

CREATE TRIGGER tr_produtos_data_atualizacao
    BEFORE UPDATE ON produtos
    FOR EACH ROW
    EXECUTE FUNCTION atualizar_data_atualizacao();

CREATE TRIGGER tr_carrinhos_data_atualizacao
    BEFORE UPDATE ON carrinhos
    FOR EACH ROW
    EXECUTE FUNCTION atualizar_data_atualizacao();

CREATE TRIGGER tr_itens_carrinho_data_atualizacao
    BEFORE UPDATE ON itens_carrinho
    FOR EACH ROW
    EXECUTE FUNCTION atualizar_data_atualizacao(); 