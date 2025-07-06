# ZettaMercado - Sistema de Gerenciamento de Supermercado

## 📝 Descrição
Sistema de gerenciamento de produtos de supermercado com funcionalidades de controle de estoque, precificação, carrinho de compras e autenticação em duas etapas.

## 🛠️ Tecnologias Utilizadas
- Java 17
- Spring Boot 3.x
- Spring Security
- PostgreSQL
- JWT + Google Authenticator (2FA)
- React + TypeScript (Frontend)
- Docker

## 🚀 Como Executar

### Pré-requisitos
- Java 17
- Maven
- Docker e Docker Compose
- Node.js 18+ (para o frontend)
- PostgreSQL (via Docker)

### Configuração do Ambiente

1. Clone o repositório
```bash
git clone https://github.com/seu-usuario/zettamercado.git
cd zettamercado
```

2. Configure as variáveis de ambiente
```bash
cp .env.example .env
# Edite o arquivo .env com suas configurações
```

3. Inicie os containers Docker
```bash
docker-compose up -d
```

4. Execute a aplicação
```bash
./mvnw spring-boot:run
```

5. Acesse a aplicação
- Backend: http://localhost:8080/api
- Swagger: http://localhost:8080/api/swagger-ui.html
- Frontend: http://localhost:3000

## 🔐 Modo Demonstração
Para testar todas as funcionalidades sem necessidade de login, utilize o token de demonstração:
```
Authorization: Bearer demo-token-for-recruiters
```

## 📋 Funcionalidades
- Gestão de produtos
- Controle de estoque
- Precificação
- Carrinho de compras
- Autenticação em duas etapas
- Modo demonstração para recrutadores

## 🤝 Contribuindo
1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## 📝 Licença
Este projeto está sob a licença MIT.
