/* Write your PL/SQL query statement below */
SELECT DISTINCT l1.num AS ConsecutiveNums
FROM Logs l1
JOIN Logs l2 ON l1.id = l2.id - 1
JOIN Logs l3 ON l1.id = l3.id - 2
WHERE l1.num = l2.num AND l1.num = l3.num;

/*
Explicação Passo a Passo:
Autojunção (Self Join):

Estamos juntando a tabela Logs com ela mesma três vezes (como l1, l2 e l3)

Isso nos permite comparar cada linha com as linhas seguintes

Lógica das Junções:

l1.id = l2.id - 1 → pega a linha atual (l1) e a próxima linha (l2)

l1.id = l3.id - 2 → pega a linha atual (l1) e a linha duas posições à frente (l3)

Condição WHERE:

l1.num = l2.num AND l1.num = l3.num → verifica se o número é o mesmo nas três linhas consecutivas

SELECT DISTINCT:

Garante que cada número apareça apenas uma vez no resultado, mesmo que tenha múltiplas sequências