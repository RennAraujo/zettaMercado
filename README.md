# ZettaMercado - Sistema de Gerenciamento de Supermercado

## 📝 Descrição
Sistema de gerenciamento de produtos de supermercado com funcionalidades de controle de estoque, precificação e carrinho de compras. Sistema dockerizado para fácil deploy em servidores Linux com **configurações de segurança aprimoradas**.

## 🛠️ Tecnologias Utilizadas
- Java 17
- Spring Boot 3.x
- Spring Security (com configurações de segurança aprimoradas)
- PostgreSQL
- Redis
- React + TypeScript (Frontend)
- Docker & Docker Compose
- Nginx (para servir o frontend)

## 🔐 Configuração de Segurança

### ⚠️ IMPORTANTE: Configuração de Variáveis de Ambiente

**ANTES DE EXECUTAR A APLICAÇÃO**, você deve configurar as variáveis de ambiente:

1. **Copie o arquivo de exemplo:**
```bash
cp .env.example .env
```

2. **Edite o arquivo `.env` com suas configurações:**
```bash
# Exemplo de configurações necessárias
DB_PASSWORD=sua_senha_segura_aqui
JWT_SECRET=sua_chave_jwt_256_bits_aqui
SECURITY_DEMO_TOKEN=seu_token_demo_seguro_aqui
```

### 🛡️ Melhorias de Segurança Implementadas
- ✅ **Credenciais externalizadas** - Todas as senhas e tokens agora estão em variáveis de ambiente
- ✅ **Headers de segurança** - X-Frame-Options, X-Content-Type-Options, XSS Protection
- ✅ **Logs mascarados** - Dados sensíveis são mascarados nos logs de auditoria
- ✅ **CORS configurável** - Origens permitidas configuráveis por ambiente
- ✅ **Autorização granular** - Endpoints protegidos com diferentes níveis de acesso
- ✅ **BCrypt aprimorado** - Força de hash aumentada para 12 rounds

### 📋 Variáveis de Ambiente Obrigatórias
Consulte o arquivo `.env.example` para ver todas as variáveis necessárias:
- `DB_PASSWORD` - Senha do banco PostgreSQL
- `JWT_SECRET` - Chave secreta para tokens JWT (256 bits)
- `SECURITY_DEMO_TOKEN` - Token para acesso de demonstração
- `ENCRYPTION_SALT` - Salt para criptografia
- E outras configurações de ambiente...

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

2. **Configure as variáveis de ambiente (OBRIGATÓRIO):**
```bash
# Copie o arquivo de exemplo
cp .env.example .env

# Edite o arquivo .env com suas configurações
# IMPORTANTE: Configure pelo menos DB_PASSWORD, JWT_SECRET e SECURITY_DEMO_TOKEN
```

3. Execute com Docker Compose
```bash
docker-compose up --build
```

4. Acesse a aplicação
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

# IMPORTANTE: Configurar variáveis de ambiente para produção
cp .env.example .env
# Edite o .env com configurações de produção seguras

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

## 🔓 Configuração de Acesso
O sistema possui configurações de segurança aprimoradas com acesso controlado. Para demonstração, utilize o token configurado em `SECURITY_DEMO_TOKEN`.

## 📋 Funcionalidades
- Gestão de produtos
- Controle de estoque
- Precificação
- Carrinho de compras
- Interface web responsiva
- API REST documentada com Swagger
- Deploy containerizado com Docker
- **Segurança aprimorada** - Configurações de segurança robustas
- **Variáveis de ambiente** - Configurações externalizadas
- **Logs seguros** - Mascaramento de dados sensíveis
- **Auto-refresh de dados** - Interface atualiza automaticamente
- **Configuração CORS otimizada** - Suporte completo para frontend/backend
- **Sistema de demonstração** - Dados de exemplo pré-carregados

## 🔒 Relatório de Segurança
Para informações detalhadas sobre as melhorias de segurança implementadas, consulte o arquivo `SECURITY_REPORT.md`.

## 🐛 Correções Recentes
### v1.2.0 - Auditoria de Segurança Completa
- **✅ Credenciais externalizadas** - Todas as configurações sensíveis movidas para `.env`
- **✅ Headers de segurança** - Implementados headers de proteção (XSS, CSRF, etc.)
- **✅ Logs mascarados** - Dados pessoais e tokens são mascarados nos logs
- **✅ CORS configurável** - Origens permitidas configuráveis por ambiente
- **✅ Autorização granular** - Endpoints com diferentes níveis de proteção
- **✅ .gitignore aprimorado** - Proteção contra commit de dados sensíveis

### v1.1.0 - Correção de Bugs JavaScript
- **Corrigido erro "r.map is not a function"** em todas as páginas
- **Tratamento de API paginada**: Páginas Home e Produtos agora processam corretamente `response.data.content`
- **Carrinho com null safety**: Adicionado optional chaining (`?.`) para evitar erros quando dados não estão carregados
- **Navegação aprimorada**: Fluxo completo entre páginas funcionando perfeitamente
- **Estabilidade melhorada**: Frontend mais robusto com tratamento de erros adequado

## 🤝 Contribuindo
1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## 📝 Licença
Este projeto está sob a licença MIT.
