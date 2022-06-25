CREATE PROCEDURE insertFlightStatus
@StatusName varchar(30),
@ActualDepartureTime DATE,
@ActualArrivalTime DATE
AS

DECLARE @StatusID int
SET @StatusID = (SELECT s.StatusID FROM tblSTATUS s WHERE s.StatusName = @StatusName)

BEGIN TRAN T1
INSERT INTO tblFLIGHT_STATUS (ActualDepartureTime, ActualArrivalTime, StatusID)
VALUES (@ActualDepartureTime, @ActualArrivalTime, @StatusID)
COMMIT TRAN T1

GO

CREATE PROCEDURE insertTicket
@FlightNumber varchar(30),
@FlightDate DATE,
@C_FName varchar(30),
@C_LName varchar(30),
@DOB DATE,
@TicketNumber varchar(30),
@SeatNum varchar(30),
@SeatTypeName varchar(30),
@ClassName varchar(30)
AS

DECLARE @CLASS_ID INT, @ST_ID INT, @S_ID INT, @F_ID INT, @C_ID INT
SET @CLASS_ID = (SELECT c.ClassID FROM tblCLASS c WHERE c.ClassName = @ClassName)
SET @ST_ID = (SELECT ST.SeatTypeID FROM tblSEAT_TYPE ST WHERE ST.SeatTypeName = @SeatTypeName)
SET @S_ID = (SELECT s.SeatID 
            FROM tblSEAT s 
            WHERE s.SeatNum = @SeatNum 
            AND s.SeatTypeID = @ST_ID
            AND s.ClassID = @CLASS_ID)
SET @F_ID = (SELECT F.FlightID 
            FROM tblFLIGHT F 
            WHERE F.FlightNumber = @FlightNumber
            AND F.FlightDate = @FlightDate)
SET @C_ID = (SELECT C.CustomerID
            FROM tblCUSTOMER C
            WHERE C.Fname = @C_FName
            AND C.Lname = @C_LName
            
            AND C.Birth = @DOB)

BEGIN TRAN T1
INSERT INTO tblTicket (FlightID, CustomerID, TicketNumber, SeatID)
VALUES (@F_ID, @C_ID, @TicketNumber, @S_ID)
COMMIT TRAN T1
GO


CREATE PROCEDURE insertStaff
@CitizenshipName varchar(30),
@StaffTypeName varchar(30),
@BeginDate DATE,
@Birth DATE,
@SFname varchar(30),
@SLname varchar(30),
@GenderName varchar(10),
@CarrierName varchar(30)
AS

DECLARE @G_ID INT, @C_ID INT, @ST_ID INT, @CA_ID INT
SET @G_ID = (SELECT G.GenderID FROM tblGENDER G WHERE G.GenderName = @GenderName)
SET @ST_ID = (SELECT ST.StaffTypeID FROM tblStaffType ST WHERE ST.StaffTypeName = @StaffTypeName)
SET @C_ID = (SELECT C.CitizenshipID FROM tblCitizenship C WHERE C.CitizenshipName = @CitizenshipName)
SET @CA_ID = (SELECT CA.CarrierID FROM tblCarrier CA WHERE CA.CarrierName = @CarrierName)

BEGIN TRAN T1
INSERT INTO tblStaff (CitizenshipID, StaffTypeID, BeginDate, Birth, Fname, Lname, GenderID, CarrierID)
VALUES (@C_ID, @ST_ID, @BeginDate, @Birth, @Fname, @Lname, @G_ID, @CA_ID)
COMMIT TRAN T1
