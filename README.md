# ZettaMercado - Sistema de Gerenciamento de Supermercado

## 📝 Descrição
Sistema de gerenciamento de produtos de supermercado com funcionalidades de controle de estoque, precificação e carrinho de compras. Sistema dockerizado para fácil deploy em servidores Linux.

## 🛠️ Tecnologias Utilizadas
- Java 17
- Spring Boot 3.x
- Spring Security (sem autenticação)
- PostgreSQL
- Redis
- React + TypeScript (Frontend)
- Docker & Docker Compose
- Nginx (para servir o frontend)

## 🚀 Deploy com Docker

### Pré-requisitos
- Docker 20.10+
- Docker Compose 2.0+
- Servidor Ubuntu Linux (para produção)

### 🐳 Execução Local (Desenvolvimento)

1. Clone o repositório
```bash
git clone https://github.com/seu-usuario/zettamercado.git
cd zettamercado
```

2. Execute com Docker Compose
```bash
docker-compose up --build
```

3. Acesse a aplicação
- Frontend: http://localhost (porta 80)
- Backend API: http://localhost:8080/api
- Swagger: http://localhost:8080/api/swagger-ui.html

### 🖥️ Deploy em Servidor Ubuntu Linux

#### 1. Preparação do Servidor
```bash
# Atualizar sistema
sudo apt update && sudo apt upgrade -y

# Instalar Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Instalar Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Reiniciar sessão para aplicar permissões
newgrp docker
```

#### 2. Deploy da Aplicação
```bash
# Clonar repositório
git clone https://github.com/seu-usuario/zettamercado.git
cd zettamercado

# Executar em modo produção (detached)
docker-compose up -d --build

# Verificar status dos containers
docker-compose ps

# Ver logs (opcional)
docker-compose logs -f
```

#### 3. Configuração de Firewall (Ubuntu)
```bash
# Permitir tráfego HTTP e HTTPS
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw allow 8080/tcp
sudo ufw enable
```

#### 4. Comandos Úteis para Manutenção
```bash
# Parar aplicação
docker-compose down

# Atualizar aplicação
git pull
docker-compose down
docker-compose up -d --build

# Ver logs em tempo real
docker-compose logs -f [service_name]

# Backup do banco de dados
docker-compose exec postgres pg_dump -U zettamercado zettamercado > backup.sql

# Restaurar backup
docker-compose exec -T postgres psql -U zettamercado zettamercado < backup.sql
```

## 🔓 Acesso Livre
O sistema foi configurado sem autenticação para facilitar o acesso e demonstração. Todas as funcionalidades estão disponíveis diretamente.

## 📋 Funcionalidades
- Gestão de produtos
- Controle de estoque
- Precificação
- Carrinho de compras
- Interface web responsiva
- API REST documentada com Swagger
- Deploy containerizado com Docker
- **Acesso direto para recrutadores** - Botão especial na página de login
- **Auto-refresh de dados** - Interface atualiza automaticamente
- **Configuração CORS otimizada** - Suporte completo para frontend/backend
- **Sistema de demonstração** - Dados de exemplo pré-carregados

## 🤝 Contribuindo
1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## 📝 Licença
Este projeto está sob a licença MIT.
