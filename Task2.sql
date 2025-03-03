
-- Create the Students table
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,   
    Name VARCHAR(50),                           
    Gender VARCHAR(1),                          
    Age INT,
    Grade VARCHAR(10),
    Email VARCHAR(100) UNIQUE
);


-- Insert sample data into the Students table
INSERT INTO Students (Name, Gender, Age, Grade, Email) VALUES 
('Arjun Kumar', 'M', 20, 'A', 'arjun.kumar@example.com'),
('Priya Sharma', 'F', 19, 'B', 'priya.sharma@example.com'),
('Ravi Patel', 'M', 22, 'C', 'ravi.patel@example.com'),
('Ananya Desai', 'F', 21, 'A', 'ananya.desai@example.com'),
('Manish Verma', 'M', 23, 'B', 'manish.verma@example.com'),
('Neha Gupta', 'F', 20, 'C', 'neha.gupta@example.com'),
('Vikram Rao', 'M', 22, 'A', 'vikram.rao@example.com'),
('Kavya Nair', 'F', 18, 'B', 'kavya.nair@example.com'),
('Ishaan Mehta', 'M', 21, 'A', 'ishaan.mehta@example.com'),
('Sanya Patel', 'F', 19, 'C', 'sanya.patel@example.com');

-- Display all students and their details
SELECT * FROM Students;

-- Create the Courses table
CREATE TABLE Courses (
CourseID INT AUTO_INCREMENT PRIMARY KEY,
CourseName VARCHAR(100),
CourseDescription TEXT
);

-- Insert sample data into Courses table
INSERT INTO Courses (CourseName, CourseDescription) VALUES
('Mathematics', 'Advanced concepts in algebra and calculus'),
('Science', 'Physics, Chemistry, and Biology basics'),
('English Literature', 'Study of classical and modern literature'),
('Computer Science', 'Introduction to programming and databases'),
('History', 'A study of past events and civilizations');
-- Display all Courses and their details
SELECT * FROM Courses;

-- Create the Enrolments table
CREATE TABLE Enrolments (
EnrolmentID INT AUTO_INCREMENT PRIMARY KEY,
StudentID INT,
CourseID INT,
EnrolmentDate DATE,
FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Insert sample data into Enrolments table
INSERT INTO Enrolments (StudentID, CourseID, EnrolmentDate) VALUES
(1, 1, '2025-01-10'),
(1, 2, '2025-02-15'),
(2, 3, '2025-03-05'),
(3, 1, '2025-01-20'),
(4, 4, '2025-02-25'),
(5, 2, '2025-03-10'),
(5, 3, '2025-03-12'),
(6, 1, '2025-01-18');

-- Display all Enrolments and their details
SELECT * FROM Enrolments;

-- 1. List all students and the courses they are enrolled in
SELECT S.Name AS StudentName, C.CourseName FROM Students S
INNER JOIN Enrolments E ON S.StudentID = E.StudentID
INNER JOIN Courses C ON E.CourseID = C.CourseID;

-- 2. Find the number of students enrolled in each course
SELECT C.CourseID, C.CourseName, COUNT(E.StudentID) AS StudentCount FROM Courses C
LEFT JOIN Enrolments E ON C.CourseID = E.CourseID
GROUP BY C.CourseID, C.CourseName;

-- 3. List students who have enrolled in more than one course
SELECT S.StudentID, S.Name, COUNT(E.CourseID) AS CourseCount FROM Students S
INNER JOIN Enrolments E ON S.StudentID = E.StudentID
GROUP BY S.StudentID, S.Name
HAVING CourseCount > 1;

-- 4. Find courses with no enrolled students
SELECT C.CourseID, C.CourseName FROM Courses C
LEFT JOIN Enrolments E ON C.CourseID = E.CourseID
WHERE E.EnrolmentID IS NULL;









