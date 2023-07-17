# Labeddit

Projeto Labeddit desenvolvido por Célio Cleiton, Turma C Barbosa.

Labeddit é uma plataforma de discussão e compartilhamento de conteúdo, onde os usuários podem criar postagens, comentar em postagens existentes, dar likes e dislikes, e interagir com outros usuários.

## Tecnologias Utilizadas

- Node.js
- Express.js
- Banco de Dados SQLite
- Knex.js (Query Builder)
- Autenticação JWT

## Configuração do Ambiente

1. Certifique-se de ter o Node.js instalado em sua máquina.

2. Clone este repositório em sua máquina local:

   ```
   git clone https://github.com/celiocleiton/labeddit.git
   ```

3. Acesse o diretório do projeto:

   ```
   cd labeddit
   ```

4. Instale as dependências do projeto:

   ```
   npm install
   ```

5. Crie um arquivo `.env` na raiz do projeto e configure as seguintes variáveis de ambiente:

   ```
   DB_FILE_PATH=caminho/do/arquivo/database.sqlite
   SECRET_KEY=sua-chave-secreta
   ```

6. Crie um arquivo de banco de dados SQLite vazio no caminho especificado pela variável `DB_FILE_PATH`.

7. Execute as migrações do banco de dados:

   ```
   npm run migrate
   ```

8. Inicie o servidor:

   ```
   npm start
   ```

9. O servidor estará rodando em `http://localhost:3003`.

## Endpoints da API

- `POST /users/register`: registra um novo usuário na plataforma.

- `POST /users/login`: realiza o login de um usuário e retorna um token de autenticação.

- `POST /posts`: cria uma nova postagem.

- `POST /posts/:id/comments`: cria um novo comentário em uma postagem existente.

- `PUT /posts/:id/like`: realiza uma curtida em uma postagem existente.

- `PUT /posts/:id/dislike`: realiza uma descurtida em uma postagem existente.

- `GET /posts`: retorna todas as postagens existentes na plataforma.

- `GET /posts/:id`: retorna uma postagem específica, juntamente com seus comentários.

## Exemplos de requisições

Claro! Aqui estão alguns exemplos de como fazer as requisições no Postman para os endpoints da API:

1. **Registro de usuário (`POST /users/signup`):**

   - Método: POST
   - URL: http://localhost:3003/users/signup
   - Corpo da requisição (JSON):
     ```json
     {
       "name": "Seu Nome",
       "email": "seuemail@example.com",
       "password": "suaSenha"
     }
     ```

2. **Login de usuário (`POST /users/login`):**

   - Método: POST
   - URL: http://localhost:3003/users/login
   - Corpo da requisição (JSON):
     ```json
     {
       "email": "seuemail@example.com",
       "password": "suaSenha"
     }
     ```

   A resposta da requisição irá conter um token de autenticação, que você pode utilizar nas requisições subsequentes que exigem autenticação.

3. **Criação de uma nova postagem (`POST /posts`):**

   - Método: POST
   - URL: http://localhost:3003/posts
   - Cabeçalhos (Headers):
     - Authorization: Bearer `<token>`
       (Substitua `<token>` pelo token de autenticação recebido no login)
   - Corpo da requisição (JSON):
     ```json
    {
        "content": "Conteúdo do Post",
        "token": "Coloque seu token aqui"
    }
     ```

4. **Criação de um novo comentário em uma postagem (`POST /posts/:id`):**

   - Método: POST
   - URL: http://localhost:3003/posts/:id
     (Substitua `:id` pelo ID da postagem alvo)
   - Cabeçalhos (Headers):
     - Authorization: Bearer `<token>`
       (Substitua `<token>` pelo token de autenticação recebido no login)
   - Corpo da requisição (JSON):
     ```json
     {
       "id_post": "Aqui coloca o id do post que desejar comentar",
       "content": "Conteúdo do comentário aqui.",
       "token": "Coloque seu token aqui"
     }
     ```

5. **Curtida em uma postagem (`PUT /posts/:id/like`):**

   - Método: PUT
   - URL: http://localhost:3003/posts/:id/like
     (Substitua `:id` pelo ID da postagem alvo)
   - Cabeçalhos (Headers):
     - Authorization: Bearer `<token>`
       (Substitua `<token>` pelo token de autenticação recebido no login)

        - Corpo da requisição (JSON):
     ```json
     {
       "like": 1,
       "token": "Coloque seu token aqui"
     }
     ```

6. **Descurtida em uma postagem (`PUT /posts/:id/dislike`):**

   - Método: PUT
   - URL: http://localhost:3003/posts/:id/dislike
     (Substitua `:id` pelo ID da postagem alvo)
   - Cabeçalhos (Headers):
     - Authorization: Bearer `<token>`
       (Substitua `<token>` pelo token de autenticação recebido no login)

        - Corpo da requisição (JSON):
     ```json
     {
       "like": 0,
       "token": "Coloque seu token aqui"
     }
     ```

7. **Listagem de todas as postagens (`GET /posts`):**

   - Método: GET
   - URL: http://localhost:3003/posts
   - Cabeçalhos (Headers):
     - Authorization: Bearer `<token>`

8. **Detalhes de uma postagem específica (`GET /posts/:id`):**

   - Método: GET
   - URL: http://localhost:3003/posts/:id
     (Substitua `:id` pelo ID da postagem alvo)

Lembre-se de substituir os valores entre colchetes (`[valor]`) pelas informações corretas ao realizar as requisições no Postman.


## Contribuição

Contribuições para este projeto são bem-vindas. Se você encontrar algum problema ou tiver alguma sugestão de melhoria, sinta-se à vontade para abrir uma issue ou enviar um pull request.

## Licença

Este projeto está licenciado sob a [MIT License](https://opensource.org/licenses/MIT).

---
