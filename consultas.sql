--1)Liste o nome dos clientes e os títulos dos filmes que eles alugaram
SELECT c.first_name || ' ' || c.last_name, f.title
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id;

--2)Mostre todos os filmes cadastrados e seus respectivos atores, incluindo também os filmes que ainda não possuem ator associado
SELECT f.title, a.first_name || ' ' || a.last_name AS nome_autor
FROM film f
LEFT OUTER JOIN film_actor fa ON f.film_id = fa.film_id
JOIN actor a ON fa.actor_id = a.actor_id;

--3)Liste os nomes das cidades e a quantidade de clientes em cada uma. Mostre apenas as cidades com mais de 10 clientes
SELECT ci.city, COUNT(c.customer_id) AS quantidade_clientes
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
GROUP BY ci.city
HAVING quantidade_clientes > 10;

--4)Para cada loja e categoria de filme, mostre o nome da categoria, o ID da loja e a média dos pagamentos recebidos. 
--Liste apenas os casos com média maior que R$5. Ordene os resultados pela média em ordem decrescente.
SELECT s.store_id, c.name AS categoria, AVG(p.amount) AS media_pagamento
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
JOIN store s ON i.store_id = s.store_id
GROUP BY s.store_id, c.name
HAVING AVG(p.amount) > 5
ORDER BY media_pagamento DESC;

5--Mostre os filmes com mais aluguéis que a média de aluguéis por filme.

SELECT f.title, COUNT(*) AS total
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
HAVING COUNT(*) > (
  SELECT AVG(alugueis)
  FROM (
    SELECT COUNT(*) AS alugueis
    FROM rental r2
    JOIN inventory i2 ON r2.inventory_id = i2.inventory_id
    GROUP BY i2.film_id
  ) sub
);

6--Liste os nomes dos funcionários (staff) e a soma dos valores pagos por seus clientes, mostrando apenas os que receberam mais de $1000 em pagamentos. 
--Inclua o ID da loja onde trabalham e ordene por valor total recebido em ordem decrescente.
SELECT s.staff_id, s.first_name || ' ' || s.last_name AS funcionario, s.store_id, SUM(p.amount) AS valor_recebido
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
GROUP BY s.staff_id, s.first_name, s.last_name, s.store_id
HAVING SUM(p.amount) > 1000
ORDER BY total_recebido DESC;


