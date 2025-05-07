--1)mostra quem fez mais comentarios
SELECT u.id AS usuarios_id, u.nome, COUNT(c.id) AS quantidade_comentarios 
FROM usuarios u 
JOIN comentarios c ON c.usuario_id = u.id 
GROUP BY u.id , u.nome ORDER BY quantidade_comentarios DESC;

--2)mostra quem deu like nos posts de x usuario
SELECT u.nome, u.sobrenome, p.usuario_id 
FROM usuarios u
JOIN likes l ON l.usuario_id = u.id
JOIN posts p ON l.post_id = p.id
WHERE p.usuario_id = '8';

--3)mostra os comentarios mais curtidos
SELECT p.id, p.texto, COUNT(l.id) AS curtidas
FROM posts p
JOIN likes l ON l.post_id = p.id
GROUP BY p.id, p.texto
ORDER BY curtidas DESC;

--4)lista os posts do mais recente para o menos recente
SELECT p.id, p.texto, p.datapostagem
FROM posts p
ORDER BY p.datapostagem DESC;

--5)mostra todos os posts que terminem com interrogação, ou seja, sao perguntas
SELECT * FROM posts 
WHERE texto like '%?'



-- 6)Mostre o nome, o nick e o e-mail de todos os usuários que estiveram online nesse mês de maio de 2025. Mostre também a data. Ordene por ordem da mais
--antiga para a mais recente.
SELECT nome, sobrenome, nick, email, ultimologin
FROM usuarios
WHERE ultimologin >= '2025-05-01 00:00'
ORDER BY ultimologin ASC;

-- 7)Mostre o texto e o autor de todos os posts curtidos pelo usuário Miranha. 
SELECT P.texto, U.nome, U.sobrenome
FROM posts P
JOIN likes L ON P.id = L.post_id
JOIN usuarios U ON P.usuario_id = U.id
WHERE L.usuario_id = 4;

-- 8)Liste os seguidores de Anthony Stark do mais novo para o mais velho. Mostre nome e nick.
SELECT U.nome, U.sobrenome, U.nick
FROM usuarios U
JOIN seguidores S ON U.id = S.seguidor_id
WHERE S.usuario_id = 1
ORDER BY U.datanascimento DESC;

-- 9)Mostre todos os comentários feitos em fevereiro de 2025, com seus respectivos autores. Mostre também o nick autor do post que recebeu o comentário.
SELECT C.texto, U.nome, U.sobrenome, A.nick AS autor_post
FROM comentarios C
JOIN usuarios U ON C.usuario_id = U.id
JOIN posts P ON C.post_id = P.id
JOIN usuarios A ON P.usuario_id = A.id
WHERE C.datapostagem BETWEEN '2025-02-01 00:00' AND '2025-03-01 00:00';



-- 10) Listar nome, nick e e-mail de usuários que fizeram postagens.
SELECT u.nome, u.nick, u.email
FROM usuarios u
JOIN posts p ON u.id = p.usuario_id
GROUP BY u.nome, u.nick, u.email;

-- 11) Mostrar usuários e quantidade de seguidores, do maior para o menor.
SELECT u.id, u.nome, u.sobrenome, COUNT(s.seguidor_id) AS total_seguidores
FROM usuarios u
LEFT JOIN seguidores s ON u.id = s.usuario_id
GROUP BY u.id
ORDER BY total_seguidores DESC;

-- 12) Exibir postagens com total de comentários, em ordem decrescente.
SELECT p.id AS post_id, COUNT(c.id) AS total_comentarios
FROM posts p
LEFT JOIN comentarios c ON p.id = c.post_id
GROUP BY p.id
ORDER BY total_comentarios DESC;

-- 13) Listar postagens com total de curtidas, do maior para o menor.
SELECT post_id, COUNT(*) AS total_likes
FROM likes
GROUP BY post_id
ORDER BY total_likes DESC;

-- 14)Conte o número de likes no post do id 1
SELECT 
COUNT(*)
FROM 
likes 
WHERE 
 post_id = 1;

-- 15)Mostre os post e usuarios que a data de postagem é menor que 2025-01-01 e a data de nascimento seja maior que 1979-06-12
 SELECT 
 P.texto AS post_texto, 
  P.datapostagem, 
  U.nome, 
  U.sobrenome, 
  U.datanascimento
FROM posts P
JOIN usuarios U ON P.usuario_id = U.id
WHERE 
datapostagem < '2025-01-01' AND datanascimento> '1979-06-12';

--16) Mostre os usuário que seguem o usuário com id = 1
SELECT U.id, U.nome, U.sobrenome
FROM 
seguidores S
JOIN usuarios U ON S.seguidor_id = U.id
WHERE 
S.usuario_id = 1;

--17) Mostre todas as curtidas que o usuário de id = 9 deu
SELECT *
FROM 
likes;
WHERE 
usuario_id = 9;




