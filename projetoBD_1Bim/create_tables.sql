DROP TABLE IF EXISTS usuarios CASCADE;
DROP TABLE IF EXISTS posts CASCADE;
DROP TABLE IF EXISTS foto CASCADE;
DROP TABLE IF EXISTS comentarios CASCADE;
DROP TABLE IF EXISTS seguidores CASCADE;
DROP TABLE IF EXISTS likes CASCADE;

CREATE TABLE usuarios(
   id INT NOT NULL,
   nome VARCHAR(50) NOT NULL,
   sobrenome VARCHAR(50) NOT NULL,
   nick VARCHAR(50) NOT NULL,
   email VARCHAR(50) NOT NULL,
   senha VARCHAR(50),
   datanascimento DATE NOT NULL,
   ultimologin TIMESTAMP  NOT NULL,
   cadastro TIMESTAMP  NOT NULL,
   primary key(id)
);

CREATE TABLE posts(
  id INT NOT NULL,
  usuario_id INT NOT NULL,
  texto VARCHAR(200) NOT NULL,
  datapostagem TIMESTAMP  NOT NULL,
  PRIMARY KEY(id),
  Foreign KEY(usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE foto(
  id INT NOT NULL,
  usuario_id INT NOT NULL,
  caminhofoto VARCHAR(200) NOT NULL,
  legenda VARCHAR(50) NOT NULL,
  datapostagem TIMESTAMP  NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE comentarios(
  id INT NOT NULL,
  usuario_id INT NOT NULL,
  post_id INT NOT NULL,
  texto VARCHAR(200) NOT NULL,
  datapostagem TIMESTAMP  NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY(post_id) REFERENCES posts(id)
);

CREATE TABLE seguidores(
  usuario_id INT NOT NULL,
  seguidor_id INT NOT NULL,
  PRIMARY KEY (usuario_id, seguidor_id),
  FOREIGN KEY (seguidor_id) REFERENCES usuarios(id),
  FOREIGN KEY(usuario_id) REFERENCES usuarios(id)
);

CREATE TABLE likes(
  id INT NOT NULL,
  usuario_id INT NOT NULL,
  post_id INT NOT NULL,
  PRIMARY KEY(id),
  FOREIGN KEY(usuario_id) REFERENCES usuarios(id),
  FOREIGN KEY(post_id) REFERENCES posts(id)
);

