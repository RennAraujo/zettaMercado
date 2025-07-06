-- Inserir usuário administrador padrão (senha: admin123)
INSERT INTO usuarios (nome, email, senha, perfil, status)
VALUES ('Administrador', 'admin@zettamercado.com', '$2a$10$Y50UaMFOxteibQEYLrwuHeehHYfcoafCopUazP12.rqB41bsolF.O', 'ADMIN', 'ATIVO');

-- Inserir usuário demonstração para recrutadores (senha: demo123)
INSERT INTO usuarios (nome, email, senha, perfil, status)
VALUES ('Demonstração', 'demo@zettamercado.com', '$2a$10$8KxX8m1.keSLi7U.X8t7QOyXzeaaMoKuYxeVR8qE1yGIZgLwqvp6y', 'DEMO', 'ATIVO');

-- Inserir categorias iniciais
INSERT INTO categorias (nome, descricao, status) VALUES
('Mercearia', 'Produtos básicos de mercearia', 'ATIVA'),
('Hortifruti', 'Frutas, legumes e verduras', 'ATIVA'),
('Bebidas', 'Bebidas em geral', 'ATIVA'),
('Carnes', 'Carnes, aves e peixes', 'ATIVA'),
('Laticínios', 'Leite e derivados', 'ATIVA');

-- Inserir produtos de exemplo
INSERT INTO produtos (nome, descricao, preco, quantidade_estoque, categoria_id, codigo_barras, status)
SELECT 
    'Arroz Integral', 
    'Arroz integral tipo 1, pacote 1kg',
    9.99,
    100,
    id,
    '7891234567890',
    'ATIVO'
FROM categorias WHERE nome = 'Mercearia'
UNION ALL
SELECT 
    'Banana Prata',
    'Banana prata orgânica, kg',
    5.99,
    50,
    id,
    '7891234567891',
    'ATIVO'
FROM categorias WHERE nome = 'Hortifruti'
UNION ALL
SELECT 
    'Água Mineral',
    'Água mineral sem gás, garrafa 1.5L',
    3.99,
    200,
    id,
    '7891234567892',
    'ATIVO'
FROM categorias WHERE nome = 'Bebidas'
UNION ALL
SELECT 
    'Filé Mignon',
    'Filé mignon bovino, kg',
    89.99,
    30,
    id,
    '7891234567893',
    'ATIVO'
FROM categorias WHERE nome = 'Carnes'
UNION ALL
SELECT 
    'Leite Integral',
    'Leite integral, caixa 1L',
    4.99,
    150,
    id,
    '7891234567894',
    'ATIVO'
FROM categorias WHERE nome = 'Laticínios'; 