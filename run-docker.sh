#!/bin/bash

# Script para fazer build e executar a aplicação Docker

echo "🔨 A fazer build da imagem Docker..."
docker build -t tainada-app .

echo "✅ Build completo!"
echo "🚀 A executar a aplicação na porta 9099..."

# Para a aplicação se estiver a correr
docker stop tainada-container 2>/dev/null
docker rm tainada-container 2>/dev/null

# Executa a nova aplicação
docker run -d \
  --name tainada-container \
  -p 9099:9099 \
  -v $(pwd)/src/main/resources/dados.csv:/app/src/main/resources/dados.csv \
  tainada-app

echo "✅ Aplicação a correr em http://localhost:9099"
echo "📊 Endpoints disponíveis:"
echo "   GET  http://localhost:9099/todos"
echo "   POST http://localhost:9099/adicionar"
echo ""
echo "📝 Para ver os logs: docker logs -f tainada-container"
echo "🛑 Para parar: docker stop tainada-container"
