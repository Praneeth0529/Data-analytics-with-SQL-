-- create
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    math_score INT,
    science_score INT,
    english_score INT,
    total_score INT GENERATED ALWAYS AS (math_score + science_score + english_score) STORED
);

-- Insert sample data
INSERT INTO Students (student_id, name, math_score, science_score, english_score) VALUES
(101, 'Arjun Kumar', 85, 90, 78),
(102, 'Priya Sharma', 72, 80, 88),
(103, 'Ravi Patel', 65, 70, 72),
(104, 'Ananya Desai', 95, 92, 94),
(105, 'Manish Verma', 88, 85, 91),
(106, 'Neha Gupta', 76, 80, 79),
(107, 'Vikram Rao', 90, 89, 84),
(108, 'Kavya Nair', 77, 83, 80),
(109, 'Ishaan Mehta', 92, 93, 89),
(110, 'Sanya Patel', 65, 70, 73);

-- Display all students and their details
SELECT * FROM Students;

-- Task 1: Identify Top Students by Total Scores
SELECT name,(math_score + science_score + english_score) AS total_score 
FROM Students
ORDER BY total_score DESC
LIMIT 5;

-- Task 2: Calculate Average Scores Based on Specific Conditions
-- Example 1: Average score of students who scored above 70 in Math
SELECT AVG(math_score) AS average_math_score
FROM Students
WHERE math_score > 70;

-- Example 2: Average total score of students grouped by score range (200-250)
SELECT AVG(total_score) AS avg_total_score
FROM (
    SELECT name, (math_score + science_score + english_score) AS total_score
    FROM Students
) AS score_table
WHERE total_score BETWEEN 200 AND 250;

-- Task 3: Find the Second-Highest Math Score
SELECT MAX(math_score) AS second_highest_math_score
FROM Students
WHERE math_score < (SELECT MAX(math_score) FROM Students);
