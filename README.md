# 🎯 Tainada do Sousa

Uma aplicação web moderna para gerir as "tainadas" com Spring Boot e armazenamento em CSV.

## 📋 Descrição

Esta aplicação permite adicionar e visualizar itens com nome e produto, armazenando os dados de forma persistente num ficheiro CSV. Perfeita para pequenos inventários ou listas de gestão pessoal.

## 🚀 Funcionalidades

- ✅ **Adicionar Items**: Endpoint POST para adicionar novos items
- 📊 **Listar Items**: Endpoint GET para obter todos os items guardados
- 💾 **Persistência CSV**: Os dados são guardados num ficheiro CSV para não perder informação
- 🐳 **Docker Ready**: Containerização completa para deployment fácil
- 🌐 **CORS Habilitado**: Pronto para integração com frontend

## 🛠️ Tecnologias Utilizadas

- **Spring Boot 3.5.3** - Framework principal
- **Java 17** - Linguagem de programação
- **Maven** - Gestão de dependências
- **Docker** - Containerização
- **CSV** - Armazenamento de dados
- **Lombok** - Redução de boilerplate code

## 📂 Estrutura do Projeto

```
src/
├── main/
│   ├── java/com/sousa/tainada/
│   │   ├── TainadaApplication.java      # Classe principal
│   │   ├── controller/
│   │   │   └── ItemController.java      # REST endpoints
│   │   ├── model/
│   │   │   └── Item.java               # Modelo de dados
│   │   └── service/
│   │       └── CsvService.java         # Lógica de CSV
│   └── resources/
│       ├── application.properties      # Configurações
│       └── dados.csv                  # Ficheiro de dados
├── Dockerfile                         # Container setup
└── run-docker.sh                     # Script de deployment
```

## 🔌 API Endpoints

### POST /adicionar
Adiciona um novo item à lista.

**Request Body:**
```json
{
  "nome": "João Silva",
  "producto": "Laptop Dell"
}
```

**Response:**
```json
{
  "id": 1,
  "nome": "João Silva",
  "producto": "Laptop Dell"
}
```

### GET /todos
Retorna todos os items guardados.

**Response:**
```json
[
  {
    "id": 1,
    "nome": "João Silva",
    "producto": "Laptop Dell"
  },
  {
    "id": 2,
    "nome": "Maria Santos",
    "producto": "Mouse Gaming"
  }
]
```

## 🚀 Como Executar

### Opção 1: Executar Localmente

1. **Pré-requisitos:**
   - Java 17+
   - Maven 3.6+

2. **Executar:**
   ```bash
   ./mvnw spring-boot:run
   ```

3. **Aceder:**
   - API: `http://localhost:9099`
   - Endpoints: `http://localhost:9099/todos` e `http://localhost:9099/adicionar`

### Opção 2: Docker (Recomendado)

1. **Pré-requisitos:**
   - Docker instalado

2. **Build e Run Automático:**
   ```bash
   ./run-docker.sh
   ```

3. **Ou manualmente:**
   ```bash
   # Build da imagem
   docker build -t tainada-app .
   
   # Executar container
   docker run -d --name tainada-container -p 9099:9099 tainada-app
   ```

## 🧪 Testar a API

### Usando curl:

**Adicionar item:**
```bash
curl -X POST http://localhost:9099/adicionar \
  -H "Content-Type: application/json" \
  -d '{"nome":"Test User","producto":"Test Product"}'
```

**Listar items:**
```bash
curl http://localhost:9099/todos
```

### Usando uma ferramenta GUI:
- Postman
- Insomnia
- Thunder Client (VS Code)

## 📊 Gestão de Dados

Os dados são automaticamente guardados no ficheiro `src/main/resources/dados.csv` no formato:
```csv
nome,producto
João Silva,Laptop Dell
Maria Santos,Mouse Gaming
```

## 🔧 Configuração

O ficheiro `application.properties` contém:
```properties
spring.application.name=tainada
server.port=9099
```

## 🐳 Docker Commands Úteis

```bash
# Ver logs da aplicação
docker logs -f tainada-container

# Parar a aplicação
docker stop tainada-container

# Remover container
docker rm tainada-container

# Remover imagem
docker rmi tainada-app
```

## 🤝 Como Contribuir

1. Fork o projeto
2. Cria uma branch para a tua feature (`git checkout -b feature/nova-funcionalidade`)
3. Commit as tuas mudanças (`git commit -m 'Adiciona nova funcionalidade'`)
4. Push para a branch (`git push origin feature/nova-funcionalidade`)
5. Abre um Pull Request

## 📝 Licença

Este projeto está sob a licença MIT. Vê o ficheiro [LICENSE](LICENSE) para mais detalhes.

## 👨‍💻 Autor

**Nuno Sousa**
- Projeto: Tainada do Sousa
- Versão: 1.0.0

## 🎯 Roadmap

- [ ] Interface web frontend
- [ ] Autenticação de utilizadores
- [ ] Export/Import de dados
- [ ] API de pesquisa avançada
- [ ] Logs de auditoria
- [ ] Backup automático

---

⭐ **Se gostaste do projeto, dá uma estrela!** ⭐
