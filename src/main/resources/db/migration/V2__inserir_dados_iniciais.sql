-- Inserir usuário administrador padrão (senha: admin123)
INSERT INTO usuarios (id, nome, email, senha, perfil, status)
VALUES ('admin-user-id-001', 'Administrador', 'admin@zettamercado.com', '$2a$10$Y50UaMFOxteibQEYLrwuHeehHYfcoafCopUazP12.rqB41bsolF.O', 'ADMIN', 'ATIVO');

-- Inserir usuário demonstração para recrutadores (senha: demo123)
INSERT INTO usuarios (id, nome, email, senha, perfil, status)
VALUES ('demo-user-id-002', 'Demonstração', 'demo@zettamercado.com', '$2a$10$8KxX8m1.keSLi7U.X8t7QOyXzeaaMoKuYxeVR8qE1yGIZgLwqvp6y', 'DEMO', 'ATIVO');

-- Inserir categorias iniciais
INSERT INTO categorias (id, nome, descricao, status) VALUES
('categoria-mercearia-001', 'Mercearia', 'Produtos básicos de mercearia', 'ATIVA'),
('categoria-hortifruti-002', 'Hortifruti', 'Frutas, legumes e verduras', 'ATIVA'),
('categoria-bebidas-003', 'Bebidas', 'Bebidas em geral', 'ATIVA'),
('categoria-carnes-004', 'Carnes', 'Carnes, aves e peixes', 'ATIVA'),
('categoria-laticinios-005', 'Laticínios', 'Leite e derivados', 'ATIVA');

-- Inserir produtos de exemplo
INSERT INTO produtos (id, nome, descricao, preco, quantidade_estoque, categoria_id, codigo_barras, status)
VALUES 
('produto-arroz-001', 'Arroz Integral', 'Arroz integral tipo 1, pacote 1kg', 9.99, 100, 'categoria-mercearia-001', '7891234567890', 'ATIVO'),
('produto-banana-002', 'Banana Prata', 'Banana prata fresca, kg', 4.99, 50, 'categoria-hortifruti-002', '7891234567891', 'ATIVO'),
('produto-refrigerante-003', 'Refrigerante Cola', 'Refrigerante sabor cola, 2L', 6.99, 30, 'categoria-bebidas-003', '7891234567892', 'ATIVO'),
('produto-file-004', 'Filé mignon bovino', 'Filé mignon bovino premium, kg', 89.99, 20, 'categoria-carnes-004', '7891234567893', 'ATIVO'),
('produto-leite-005', 'Leite Integral', 'Leite integral UHT, 1L', 4.49, 80, 'categoria-laticinios-005', '7891234567894', 'ATIVO');