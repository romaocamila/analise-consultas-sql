USE restaurante; 

CREATE VIEW resumo_pedido AS 
SELECT pe.id_pedido, pe.quantidade, pe.data_pedido, 
c.nome AS nome_cliente, c.email, 
f.nome AS nome_funcionario, 
p.nome AS nome_produto, p.preco
FROM pedidos AS pe
INNER JOIN clientes AS c ON c.id_cliente = pe.id_cliente
INNER JOIN funcionarios AS f ON f.id = pe.id_funcionario
INNER JOIN produtos AS p ON p.id_produto = pe.id_produto;

SELECT id_pedido, nome_cliente, quantidade*preco AS total_pedido
FROM resumo_pedido;

CREATE OR REPLACE VIEW resumo_pedido AS 
SELECT pe.id_pedido, pe.quantidade, pe.data_pedido, 
c.nome AS nome_cliente, c.email, 
f.nome AS nome_funcionario, 
p.nome AS nome_produto, p.preco,
pe.quantidade*p.preco AS total_pedido
FROM pedidos AS pe
INNER JOIN clientes AS c ON c.id_cliente = pe.id_cliente
INNER JOIN funcionarios AS f ON f.id = pe.id_funcionario
INNER JOIN produtos AS p ON p.id_produto = pe.id_produto;

SELECT id_pedido, nome_cliente, total_pedido FROM resumo_pedido;

EXPLAIN 
SELECT id_pedido, nome_cliente, total_pedido FROM resumo_pedido;

DELIMITER //
CREATE FUNCTION BuscaIngredientesProduto (id INT)
RETURNS varchar(255)
READS SQL DATA
BEGIN
DECLARE ingredientes_produto VARCHAR(255);

SELECT ingredientes INTO ingredientes_produto
FROM info_produtos
WHERE id_produto = id;

RETURN ingredientes_produto;
END //
DELIMITER ;

SELECT BuscaIngredientesProduto(10);

DELIMITER //
CREATE FUNCTION mediaPedido (ID_PEDIDO INT)
RETURNS VARCHAR (255) 
READS SQL DATA 

Begin
DECLARE total_dos_pedidos DECIMAL(10,2);
DECLARE media_dos_pedidos DECIMAL (10,2);

SELECT SUM(quantidade*preco) INTO total_dos_pedidos
FROM resumo_pedido
WHERE id_pedido = ID_PEDIDO;

SELECT 
AVG(quantidade*preco) INTO media_dos_pedidos
FROM resumo_pedido;

IF total_dos_pedidos > media_dos_pedidos THEN RETURN 'acima da média';
ELSEIF total_dos_pedidos < media_dos_pedidos THEN RETURN 'abaixo da média';
ELSE RETURN "igual à média";
END IF;

END //
DELIMITER ;

SELECT mediaPedido (5); 

SELECT mediaPedido (6);



