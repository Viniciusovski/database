/* Write your PL/SQL query statement below */
SELECT 
    score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS "rank"
FROM 
    Scores
ORDER BY 
    score DESC;

    /*
    Explicação Passo a Passo:
SELECT score: Seleciona a coluna de pontuações que queremos mostrar

DENSE_RANK() OVER (ORDER BY score DESC): Calcula o rank:

OVER (ORDER BY score DESC) define que a ordenação será decrescente

DENSE_RANK() faz o cálculo propriamente dito

AS "rank": Renomeia a coluna resultante para "rank" (com aspas para Oracle)

FROM Scores: Especifica a tabela de origem

ORDER BY score DESC: Garante que o resultado final esteja ordenado
    */