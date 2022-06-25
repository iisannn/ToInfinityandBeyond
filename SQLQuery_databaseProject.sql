-- list customers: SINGLE FLIGHT MILEAGE > 3000 with travel doctype :passport, permState :WA 
SELECT R.RouteName, SUM(B.ScheduletripID) AS TotalBoardings, SUM(F.FareAmount) AS ToalFare-- S.StudentFname, S.StudentLname, SUM(CR.Credits) AS TotalCredits
FROM ROUTE R
    JOIN SCHEDULE S ON R.RouteID = S.RouteID
    JOIN SCHEDULE_TRIP ST ON S.ScheduleID = ST.ScheduleID
    JOIN BOARDING B ON ST.ScheduleTripID = B.ScheduletripID
    JOIN FARE F ON B.FareID = F.FareID
    JOIN PAYMENT P ON B.PaymentID = P.PaymentID
WHERE ST.[ActualTime] > November 3, 2016
AND ST.[ActualTime] < March 16, 2019
AND R.RouteName IN (SELECT R.RouteName
                    FROM ROUTE R
                        JOIN SCHEDULE S ON R.RouteID = S.RouteID
    JOIN SCHEDULE_TRIP ST ON S.ScheduleID = ST.ScheduleID
    JOIN BOARDING B ON ST.ScheduleTripID = B.ScheduletripID
    JOIN FARE F ON B.FareID = F.FareID
    JOIN PAYMENT P ON B.PaymentID = P.PaymentID
    WHERE FareBeginDate = 'June 15, 2020'
                    AND P.PaymentName = 'K-12 Student Card' or  P.PaymentName = 'Senior Citizen SocialCard')
GROUP BY R.RouteName 
HAVING TotalBoardings > 26500

SELECT C.CustomerID, C.FnName, C.LName
    FROM Customer C
        JOIN Ticket T ON C.CustomerID = T.CustomerID
        JOIN Flight F ON T.FlightID = F.FlightID 
        JOIN TravelDocument TD ON C.CustomerID = TD.CustomerID
        JOIN TravelDocumentType TDT ON TD.TravelDocumentTypeID = TDT.TravelDocumentTypeID 
        WHERE C.PermState = "WA"
        AND F.Mileage > 3000
        AND TDT.TravelDocumentTypeName = "passport"
    GROUP BY C.CustomerID

-- list all flights: departure airport = sea, within past 3 years, carrier: Alaska, with staff citizenship "Mexico"
SELECT F.FlightID
    FROM Flight F
        JOIN Airplane A ON F.AirplaneID = A.AirplaneID 
        JOIN Carrier C ON A.CarrierID = C.CarrierID
        JOIN FlightStaff FS ON F.FlightID = FS.FlightID
        JOIN Staff S on FS.StaffID = S.StaffID 
        JOIN Airport AP ON F.AirportID = AP.AirportID
        JOIN Flight_Status FStatus ON F.FlightID = FStatus.FlightID
        JOIN Status ST on Fstatus.StatusID = ST.StatusID
        JOIN Citizenship CZ ON S.CitizenshipID = CZ.CitizenshipID
        WHERE AP.AirportName = 'SEA'
        AND ST.StatusName = 'Departure'
        AND C.CarrierName = 'Alaska'
        AND CZ.CitizenshipName = 'Mexico'
        AND F.FlightDate > DateAdd(Year, -3,GetDate())
        GROUP BY F.FlightID
-- list customers: special need : vegan, club: gold, business class >= 5,age >= 40

SELECT C.CustomerID, C.FnName, C.LName
    FROM Customer C
        JOIN Ticket T ON C.CustomerID = T.CustomerID
        JOIN Seat S on T.SeatID = S.SeatID
        JOIN Class CLA ON S.ClassID = CLA.ClassID
        JOIN Custo_Special CS ON C.CustomerID = CS.CustomerID
        JOIN SpecialNeed SN ON CS.SpecialNeedID = SN.SpecialNeedID
        JOIN Customer_Club CC ON C.CustomerID = CC.CustomerID
        JOIN Club CL ON CC.ClubID = CL.ClubID
        JOIN ClubType CLT ON CL.ClubTypeID = CLT.ClubTypeID
        WHERE C.Birth >=  DateAdd(Year, -40,GetDate())
        AND CLT.ClubTypeName = 'Gold'
        AND SN.SpecialNeedName = "vegan"
    GROUP BY C.CustomerID
    HAVING ( SELECT COUNT(*) FROM Ticket WHERE CLA.Class = "Business Class") >= 5
-- list carrier count the times they host international flight in 2018, carrier country "United States",// model: A380> = 5, // (use subquery)Distinct staff citizenship >=8
SELECT C.CarrierID, C.CarrierName,  (SELECT COUNT(F.FlightID) FROM Flight WHERE FT.FlightTypeName = 'international') AS International_2018
    FROM Carrier C
        JOIN Country CO ON C.CountryID = CO.CountryID
        JOIN Staff S ON C.CarrierID = S.CarrierID
        JOIN Citizenship Citi ON S.CitizenshipID = Citi.CitizenshipID
        JOIN Airplane A ON C.AirplaneID = A.AirplaneID 
        JOIN Model M ON A.ModelID = M.ModelID
        WHERE CO.CountryName = 'United State'
        AND  ( SELECT COUNT(*) FROM Model M WHERE M.ModelTypeName = "A380") >= 5
        AND  (SELECT DISTINCT Citi.CitizenshipName FROM Citizenship) >= 8
    GROUP BY C.CarrierID