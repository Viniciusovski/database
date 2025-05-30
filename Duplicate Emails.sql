SELECT email AS Email
FROM Person
GROUP BY email
HAVING COUNT(email) > 1;

/*
Explicação
GROUP BY email - Agrupa todas as linhas com o mesmo endereço de email

HAVING COUNT(email) > 1 - Filtra os grupos para incluir apenas aqueles com mais de uma ocorrência

SELECT email AS Email - Retorna apenas a coluna de email com o alias especificado

Para o exemplo fornecido:

O email 'a@b.com' aparece duas vezes (com IDs 1 e 3), portanto, atende à condição HAVING

O email 'c@d.com' aparece apenas uma vez, portanto, é excluído dos resultados

A consulta retornará todos os endereços de email que aparecem mais de uma vez na tabela.
*/