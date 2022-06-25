CREATE PROCEDURE newflightStatus
@ActualDepartureTime datetime,
@ActualArrivalTime datetime,
@StatusName VARCHAR(50),
@FlightNumber INT,
@StatusName varchar(50)
AS

DECLARE @F_ID INT, @Status_ID INT
SET @F_ID = (SELECT FlightID FROM Flight WHERE FlightNumber = @FlightNumber)
-- error-handling goes here --> check to see if @L_ID came back empty (NULL)

SET @STATUS_ID = (SELECT StatusID FROM Status WHERE StatusName = @StatusName)
-- error-handling goes here --> check to see if @BT_ID came back empty (NULL)

BEGIN TRANSACTION T1
INSERT INTO Flight_Status (ActualDepartureTime, ActualArrivalTime, StatusID, FlightID)
VALUES ( @ActualDepartureTime, @ActualArrivalTime, @STATUS_ID, @F_ID)
-- error-handling goes here --> check to see if there errors elsewhere in database --> @@ERROR
COMMIT TRANSACTION T1

--


CREATE PROCEDURE newTicket
@TicketNumber INT,
@TicketDesc varchar(125),
@FlightNumber INT,
@CusFName varchar(10),
@CusLName varchar(10),
@SeatNum INT

AS

DECLARE @F_ID INT, @CustomerID INT, @SeatID INT
SET @F_ID = (SELECT FlightID FROM Flight WHERE FlightNumber = @FlightNumber)
SET @CustomerID = (SELECT CustomerID FROM Customer WHERE FName = @CusFName AND LName = @CusLName)
SET @SeatID = (SELECT SeatNum FROM Seat WHERE SeatNum = @SeatNum)

BEGIN TRANSACTION T2
INSERT INTO Ticket (FlightID, CustomerID, TicketNumber,TicketDesc, SeatID )
VALUES ( @F_ID, @CustomerID, @TicketNumber, @TicketDesc, @SeatID )
-- error-handling goes here --> check to see if there errors elsewhere in database --> @@ERROR
COMMIT TRANSACTION T2


CREATE PROCEDURE newBaggage
@Weight INT,
@TicketNum INT
AS
DECLARE @Ticket_ID INT
SET @Ticket_ID = (SELECT TicketID FROM Ticket WHERE TicketNumber = @TicketNum)

BEGIN TRANSACTION T3
INSERT INTO Baggage (Weight, TicketID)
VALUES(@Weight,@Ticket_ID)
COMMIT TRANSACTION T3


CREATE PROCEDURE newStaff
@BeginDate DATE,
@EndDate DATE, 
@Birth DATE, 
@FName varchar(20),
@LName varchar(20),
@CitizenshipName varchar(50),
@StaffTypeName varchar(50),
@Gender varchar(15),
@CarrierName varchar(70)

AS

DECLARE @CitizenshipID INT, @StafftypeID INT, @GenderID INT, @CarrierID INT
SET @CitizenshipID = (SELECT CitizenshipID FROM Citizenship WHERE CitizenshipName = @CitizenshipName )
SET @StafftypeID = (SELECT StafftypeID FROM StaffType WHERE StaffTypeName = @StaffTypeName)
SET @GenderID = (SELECT GenderID FROM Gender WHERE Gender = @Gender)
SET @CarrierID = (SELECT CarrierID FROM Carrier WHERE CarrierName = @CarrierName)

BEGIN TRANSACTION T4
INSERT INTO Staff (CitizenshipID, StaffTypeName,BeginDate,EndDate, Birth, FName, LName, GenderID, CarrierID )
VALUES(@CitizenshipID, @StaffTypeName, @BeginDate ,@EndDate, @Birth, @FName, @LName, @GenderID, @CarrierID )
COMMIT TRANSACTION T4