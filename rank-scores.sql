SELECT s.Score, COUNT(t.Score) AS Rank
FROM (SELECT DISTINCT Score FROM Scores) AS t, Scores AS s
WHERE s.Score <= t.Score
GROUP BY s.Id, s.Score
ORDER BY s.Score DESC;

/* Algorithm is:

1. Get unique values.
2. Join with the same table to get number of numbers that bigger than current.
3. Join by score to remove duplicates
4. Sort by Descending

*/
