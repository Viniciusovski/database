/* Write your PL/SQL query statement below */
WITH RankedSalaries AS (
    SELECT salary,
    DENSE_RANK() OVER (ORDER BY salary DESC) AS rank
    FROM Employee
)
SELECT 
    (SELECT salary FROM RankedSalaries WHERE rank = 2 AND ROWNUM = 1) AS "SecondHighestSalary"
FROM DUAL;

/*
Busca na CTE RankedSalaries o salário onde rank = 2 (segundo maior salário)

ROWNUM = 1 garante que apenas um registro será retornado (o primeiro que encontrar com rank 2)

Se não existir nenhum registro com rank 2 (por exemplo, quando há apenas um único salário ou todos iguais), a subconsulta retorna NULL

FROM DUAL
DUAL é uma tabela especial de uma única linha usada no Oracle para consultas que não precisam de dados de tabelas reais

Neste caso, estamos apenas usando para estruturar a consulta

Alias em Camel Case:
*/