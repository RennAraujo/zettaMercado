-- Script de migração dos dados do MySQL para PostgreSQL
-- Execute este script no PostgreSQL após criar as tabelas

-- Primeiro, vamos limpar as tabelas se existirem dados
TRUNCATE TABLE itens_carrinho CASCADE;
TRUNCATE TABLE carrinhos CASCADE;
TRUNCATE TABLE produtos CASCADE;
TRUNCATE TABLE categorias CASCADE;
TRUNCATE TABLE usuarios CASCADE;

-- Inserir dados dos usuários (adapte os dados do backup MySQL)
-- Exemplo de inserção - substitua pelos dados reais do backup
/*
INSERT INTO usuarios (id, nome, email, senha, secret_2fa, perfil, status, data_criacao, data_atualizacao)
SELECT 
    id,
    nome,
    email,
    senha,
    secret_2fa,
    perfil,
    status,
    data_criacao,
    data_atualizacao
FROM mysql_usuarios_temp;
*/

-- Inserir dados das categorias
/*
INSERT INTO categorias (id, nome, descricao, status, data_criacao, data_atualizacao)
SELECT 
    id,
    nome,
    descricao,
    status,
    data_criacao,
    data_atualizacao
FROM mysql_categorias_temp;
*/

-- Inserir dados dos produtos
/*
INSERT INTO produtos (id, nome, descricao, preco, quantidade_estoque, categoria_id, codigo_barras, imagem_url, data_validade, status, data_criacao, data_atualizacao, version)
SELECT 
    id,
    nome,
    descricao,
    preco,
    quantidade_estoque,
    categoria_id,
    codigo_barras,
    imagem_url,
    data_validade,
    status,
    data_criacao,
    data_atualizacao,
    version
FROM mysql_produtos_temp;
*/

-- Inserir dados dos carrinhos
/*
INSERT INTO carrinhos (id, usuario_id, status, data_criacao, data_atualizacao, version)
SELECT 
    id,
    usuario_id,
    status,
    data_criacao,
    data_atualizacao,
    version
FROM mysql_carrinhos_temp;
*/

-- Inserir dados dos itens do carrinho
/*
INSERT INTO itens_carrinho (id, carrinho_id, produto_id, quantidade, preco_unitario, subtotal, data_criacao, data_atualizacao, version)
SELECT 
    id,
    carrinho_id,
    produto_id,
    quantidade,
    preco_unitario,
    subtotal,
    data_criacao,
    data_atualizacao,
    version
FROM mysql_itens_carrinho_temp;
*/

-- Atualizar sequências se necessário (PostgreSQL)
-- SELECT setval('usuarios_id_seq', (SELECT MAX(id) FROM usuarios));
-- SELECT setval('categorias_id_seq', (SELECT MAX(id) FROM categorias));
-- SELECT setval('produtos_id_seq', (SELECT MAX(id) FROM produtos));
-- SELECT setval('carrinhos_id_seq', (SELECT MAX(id) FROM carrinhos));
-- SELECT setval('itens_carrinho_id_seq', (SELECT MAX(id) FROM itens_carrinho));

-- Verificar integridade dos dados
SELECT 'usuarios' as tabela, COUNT(*) as total FROM usuarios
UNION ALL
SELECT 'categorias' as tabela, COUNT(*) as total FROM categorias
UNION ALL
SELECT 'produtos' as tabela, COUNT(*) as total FROM produtos
UNION ALL
SELECT 'carrinhos' as tabela, COUNT(*) as total FROM carrinhos
UNION ALL
SELECT 'itens_carrinho' as tabela, COUNT(*) as total FROM itens_carrinho;