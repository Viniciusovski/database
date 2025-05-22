CREATE FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    SELECT salary INTO result
    FROM (
        SELECT DISTINCT salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) as rank
        FROM Employee
    )
    WHERE rank = N;
    
    RETURN result;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END;

/*
Explanation:
The function takes an input parameter N which represents the nth highest salary to find.

Inside the function, we use a subquery with DENSE_RANK() to assign ranks to distinct salaries in descending order.

We then select the salary where the rank equals N.

If no data is found (which happens when there are fewer than N distinct salaries), the EXCEPTION block catches the NO_DATA_FOUND exception and returns NULL.

The function returns the result.

Key points:

We use DENSE_RANK() instead of RANK() to handle cases where there might be duplicate salaries (though the problem specifies distinct salaries).

The EXCEPTION handling ensures we return NULL when there aren't enough distinct salaries.

The solution handles both cases shown in the examples correctly.
*/