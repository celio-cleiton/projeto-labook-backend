CREATE TABLE users (
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  password TEXT NOT NULL,
  role TEXT NOT NULL,
  created_at TEXT DEFAULT (DATETIME('now')) NOT NULL
);

CREATE TABLE posts (
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  creator_id TEXT NOT NULL,
  content TEXT NOT NULL,
  comments INTEGER  NOT NULL,
  likes INTEGER  NOT NULL,
  dislikes INTEGER NOT NULL,
  created_at TEXT DEFAULT (DATETIME('now')) NOT NULL,
  updated_at TEXT DEFAULT (DATETIME('now')) NOT NULL,
  FOREIGN KEY (creator_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE likes_dislikes (
  user_id TEXT NOT NULL,
  post_id TEXT NOT NULL,
  like INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE comments_posts (
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  creator_id TEXT NOT NULL,
  content TEXT,
  likes INTEGER DEFAULT(0) NOT NULL,
  dislikes INTEGER DEFAULT(0) NOT NULL,
  created_at TEXT DEFAULT(DATETIME()) NOT NULL,
  updated_at TEXT DEFAULT(DATETIME()) NOT NULL,
  post_id TEXT NOT NULL,
  FOREIGN KEY (creator_id) REFERENCES users (id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE likes_dislikes_comments (
  user_id TEXT NOT NULL,
  comment_id TEXT NOT NULL,
  like INTEGER,
  FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (comment_id) REFERENCES comments_posts(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO users (id, name, email, password, role)
VALUES
  ("a01", "Cleiton", "celiocleiton@gmail.com", "cleiton123", "ADMIN"),
  ("a02", "Roberto", "roberto@gmail.com", "roberto123", "NORMAL"),
  ("a03", "Carlos", "carlos@gmail.com", "carlos123", "NORMAL"),
  ("a04", "Roberto Carlos", "robertocarlos@gmail.com", "robertocarlos123", "NORMAL"),
  ("a05", "Marcus", "marcus@gmail.com", "marcus123", "NORMAL"),
  ("a06", "Célio Cleiton", "celio@gmail.com", "celio123", "NORMAL");

INSERT INTO posts (id, creator_id, content, likes, dislikes)
VALUES
  ("p01", "a01", "Imagem na festa", 1, 0),
  ("p03", "a02", "Imagem na casa", 0, 1),
  ("p02", "a03", "Imagem no trabalho", 1, 0),
  ("p05", "a04", "Imagem com a esposa", 1, 0),
  ("p04", "a05", "Imagem no japão", 1, 0);

INSERT INTO comments_posts (id, creator_id, content, post_id)
VALUES
  ("c001", "a02", "Que festa linda", "p01"),
  ("c002", "a01", "Sua esposa é muito linda", "p05"),
  ("c003", "a05", "AEW só quem trabalha!", "p02");

INSERT INTO likes_dislikes (user_id, post_id, like)
VALUES
  ("a01", "p03", 100),
  ("a02", "p02", 145),
  ("a03", "p01", 236),
  ("a04", "p04", 600),
  ("a01", "p04", 255);

-- Verificar os dados nas tabelas:

SELECT * FROM users;

SELECT * FROM posts;

SELECT * FROM comments_posts;

SELECT * FROM likes_dislikes;

--aqui estamos dropando as tabelas.

DROP TABLE users;

DROP TABLE posts;

DROP TABLE comments_posts;

DROP TABLE likes_dislikes_comments;

DROP TABLE likes_dislikes;

-- aqui vai deleta o conteúdo das tabelas.

DELETE FROM users;

DELETE FROM posts;

DELETE FROM comments_posts;

DELETE FROM likes_dislikes