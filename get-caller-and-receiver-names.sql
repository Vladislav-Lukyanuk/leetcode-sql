CREATE TABLE Abonent (Id INT PRIMARY KEY IDENTITY(1,1), Name VARCHAR(100));
GO

CREATE TABLE Call (
	Id INT PRIMARY KEY IDENTITY(1,1),
	CallerId INT,
	ReceiverId INT,
	CONSTRAINT FK_Caller_Id FOREIGN KEY (CallerId)
        REFERENCES Abonent (Id),
	CONSTRAINT FK_Receiver_Id FOREIGN KEY (ReceiverId)
			REFERENCES Abonent (Id)
	);
GO

INSERT INTO Abonent(Name) VALUES (N'Test1');
INSERT INTO Abonent(Name) VALUES (N'Test2');
INSERT INTO Abonent(Name) VALUES (N'Test3');
GO

INSERT INTO Call(CallerId, ReceiverId) VALUES (1, 2);
INSERT INTO Call(CallerId, ReceiverId) VALUES (1, 3);
INSERT INTO Call(CallerId, ReceiverId) VALUES (2, 1);
INSERT INTO Call(CallerId, ReceiverId) VALUES (2, 3);
INSERT INTO Call(CallerId, ReceiverId) VALUES (3, 1);
INSERT INTO Call(CallerId, ReceiverId) VALUES (3, 2);
GO

SELECT a1.Name AS CallerName, a2.Name AS ReceiverName
FROM Call AS c
       INNER JOIN Abonent AS a1 ON c.CallerId = a1.Id      
       INNER JOIN Abonent AS a2 ON c.ReceiverId = a2.Id;
GO
