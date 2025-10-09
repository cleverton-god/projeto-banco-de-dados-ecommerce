-- Remover um cupom
DELETE FROM Cupom
WHERE codigo = 'NOVOCLIENTE';

-- Exclui o produto com ID 1 do pedido com ID 3
DELETE FROM ItemPedido
WHERE id_pedido = 3 AND id_produto = 1; 

-- Remover um cliente 
DELETE FROM Cliente
WHERE id_cliente = 2;