# Script PowerShell para migração do MySQL para PostgreSQL
# Execute este script no diretório raiz do projeto

Write-Host "=== Iniciando migração do MySQL para PostgreSQL ===" -ForegroundColor Green

# 1. Parar containers atuais
Write-Host "Parando containers atuais..." -ForegroundColor Yellow
docker-compose down

# 2. Remover volume do MySQL (opcional - descomente se quiser limpar)
# Write-Host "Removendo volume do MySQL..." -ForegroundColor Yellow
# docker volume rm zettamercado_mysql_data

# 3. Iniciar apenas PostgreSQL
Write-Host "Iniciando PostgreSQL..." -ForegroundColor Yellow
docker-compose up -d postgres

# 4. Aguardar PostgreSQL ficar pronto
Write-Host "Aguardando PostgreSQL ficar pronto..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

# 5. Verificar se PostgreSQL está rodando
$postgresStatus = docker exec zettamercado-postgres pg_isready -U zettamercado -d zettamercado
if ($LASTEXITCODE -eq 0) {
    Write-Host "PostgreSQL está pronto!" -ForegroundColor Green
} else {
    Write-Host "Erro: PostgreSQL não está respondendo" -ForegroundColor Red
    exit 1
}

# 6. Iniciar todos os serviços
Write-Host "Iniciando todos os serviços..." -ForegroundColor Yellow
docker-compose up -d

# 7. Aguardar backend ficar pronto
Write-Host "Aguardando backend processar migrações Flyway..." -ForegroundColor Yellow
Start-Sleep -Seconds 15

# 8. Verificar logs do backend
Write-Host "Verificando logs do backend..." -ForegroundColor Yellow
docker logs zettamercado-backend --tail 20

# 9. Testar conectividade
Write-Host "Testando conectividade com a aplicação..." -ForegroundColor Yellow
try {
    $response = Invoke-WebRequest -Uri "http://localhost:8080/actuator/health" -TimeoutSec 10
    if ($response.StatusCode -eq 200) {
        Write-Host "✅ Aplicação está funcionando!" -ForegroundColor Green
        Write-Host "Frontend: http://localhost:3000" -ForegroundColor Cyan
        Write-Host "Backend: http://localhost:8080" -ForegroundColor Cyan
        Write-Host "Swagger: http://localhost:8080/swagger-ui.html" -ForegroundColor Cyan
    }
} catch {
    Write-Host "⚠️  Aplicação ainda não está respondendo. Verifique os logs." -ForegroundColor Yellow
}

Write-Host "=== Migração concluída! ===" -ForegroundColor Green
Write-Host "Nota: Se houver dados no MySQL, você precisará executar o script migrate_mysql_to_postgres.sql manualmente." -ForegroundColor Yellow