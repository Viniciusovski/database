/* Write your PL/SQL query statement below */
SELECT c.name AS Customers
FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.id IS NULL;

/*
Explicação
Começamos com a tabela Clientes e realizamos um LEFT JOIN com a tabela Pedidos em customerId. Isso garante que todos os clientes sejam mantidos, mesmo aqueles sem pedidos.

Para clientes que nunca fizeram pedidos, as colunas da tabela Pedidos serão NULL no conjunto de resultados.

Filtramos esses registros com WHERE o.id IS NULL.

Por fim, selecionamos apenas os nomes dos clientes e renomeamos a coluna para "Clientes", conforme necessário.