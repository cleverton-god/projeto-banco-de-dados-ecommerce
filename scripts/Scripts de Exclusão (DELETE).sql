-- Remover um cupom
DELETE FROM Cupom
WHERE codigo = 'NOVOCLIENTE';

-- Remover um item do pedido
DELETE FROM ItemPedido
WHERE id_item = 2;

-- Remover um cliente 
DELETE FROM Cliente
WHERE id_cliente = 2;
