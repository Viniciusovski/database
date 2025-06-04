SELECT 
    d.name AS Department,
    e.name AS Employee,
    e.salary AS Salary
FROM 
    Employee e
JOIN 
    Department d ON e.departmentId = d.id
WHERE 
    (e.departmentId, e.salary) IN (
        SELECT 
            departmentId, 
            MAX(salary)
        FROM 
            Employee
        GROUP BY 
            departmentId
    )
ORDER BY 
    Department, Employee;

/*
Explicação
Junção das tabelas: Primeiro, unimos as tabelas Employee e Department usando o departmentId como chave de junção.

Subconsulta para salários máximos: A parte crucial é a subconsulta que encontra o maior salário para cada departamento:

sql
SELECT departmentId, MAX(salary)
FROM Employee
GROUP BY departmentId
Esta subconsulta retorna uma lista com cada departamento e seu respectivo maior salário.

Filtro com WHERE: Usamos a cláusula WHERE para filtrar apenas os funcionários cuja combinação de departmentId e salary esteja na lista retornada pela subconsulta (ou seja, os funcionários com salário máximo em seu departamento).

Ordenação: Finalmente, ordenamos os resultados pelo nome do departamento e pelo nome do funcionário para uma apresentação organizada.