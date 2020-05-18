CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        SELECT 
        CASE
            WHEN (SELECT COUNT(DISTINCT Salary) FROM Employee) < @N THEN NULL
            ELSE (SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC OFFSET @N - 1 ROWS FETCH NEXT 1 ROWS ONLY)
        END as SecondHIghestSalary
    );
END
