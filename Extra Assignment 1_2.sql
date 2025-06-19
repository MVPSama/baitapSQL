CREATE TABLE TRAINEE (
    TraineeID INT,
    Full_Name VARCHAR(100),
    Birth_Date DATE NOT NULL,
    Gender ENUM('male', 'female', 'unknown'),
    ET_IQ INT CHECK (ET_IQ >= 0 AND ET_IQ <= 20),
    ET_Gmath INT CHECK (ET_Gmath >= 0 AND ET_Gmath <= 20),
    ET_English INT CHECK (ET_English >= 0 AND ET_English <= 50),
    Training_Class VARCHAR(50),
    Evaluation_Notes VARCHAR(100)
);