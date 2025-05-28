/* Write your PL/SQL query statement below */
SELECT e1.name AS Employee
FROM Employee e1
JOIN Employee e2 ON e1.managerId = e2.id
WHERE e1.salary > e2.salary;

/*
Explicação:
Realizamos uma autojunção na tabela Employee:

e1 representa os funcionários

e2 representa seus gerentes (correspondidos por e1.managerId = e2.id)

A cláusula WHERE filtra os funcionários cujo salário é maior que o salário do gerente (e1.salary > e2.salary)

Selecionamos apenas o nome do funcionário em e1 e o apelidamos de "Employee", conforme exigido pelo formato de saída.

Para o exemplo fornecido, esta consulta retornará apenas "Joe" porque:

Salário de Joe (70000) > Salário de Sam (60000)

Salário de Henry (80000) < Salário de Max (90000)

Sam e Max não têm gerentes (managerId é nulo), portanto, eles não serão incluídos nos resultados.
/*