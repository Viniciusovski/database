SELECT 
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM 
    Employee e
JOIN 
    Department d ON e.departmentId = d.id
WHERE 
    (
        SELECT COUNT(DISTINCT salary)
        FROM Employee e2
        WHERE e2.departmentId = e.departmentId AND e2.salary >= e.salary
    ) <= 3
ORDER BY 
    d.name, e.salary DESC;

    /*
    Explicação Passo a Passo
Junção das tabelas: Primeiro, unimos as tabelas Employee e Department para obter os nomes dos departamentos.

Subconsulta condicional: Usamos uma subconsulta na cláusula WHERE para verificar se o salário do funcionário está entre os três maiores do departamento:

Para cada funcionário, contamos quantos salários distintos no mesmo departamento são maiores ou iguais ao dele.

Se esse count for ≤ 3, significa que o salário está entre os três maiores.

Ordenação: Finalmente, ordenamos por nome do departamento e por salário em ordem decrescente para uma apresentação clara.

Exemplo com os Dados Fornecidos
Para o departamento de TI (ID 1):

Salários únicos: 90000, 85000, 70000, 69000

Os três maiores: 90000 (Max), 85000 (Joe e Randy), 70000 (Will)

Para o departamento de Vendas (ID 2):

Salários únicos: 80000, 60000

Apenas dois funcionários, então ambos são incluídos

Observações
A solução usa DISTINCT na contagem de salários para considerar apenas valores únicos.

Funcionários com salários empatados (como Joe e Randy) são ambos incluídos se estiverem no mesmo nível dos três maiores.

Departamentos com menos de três funcionários terão todos os seus funcionários listados.

Esta abordagem é eficiente e resolve corretamente o problema conforme os requisitos.


    /*