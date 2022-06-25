CREATE TABLE tblFLIGHT
(FlightID INT IDENTITY(1,1) primary key,
Mileage INT,
FlightNumber varchar(30) not null,
FlightDate DATE,
EstimatedArrivalTime DATE,
EstimatedDepartureTime DATE,
Year INT,
Month INT)

CREATE TABLE tblFLIGHT_TYPE
(FlightTypeID INT IDENTITY(1,1) primary key,
FlightTypeName varchar(50),
FlightTypeDesc varchar(300))

CREATE TABLE tblCARRIER
(CarrierID  INT IDENTITY(1,1) primary key,
CarrierName varchar(30),
Alliance varchar(50),
BeginDate DATE)

CREATE TABLE tblAIRPLANE
(AirplaneID  INT IDENTITY(1,1) primary key,
AirplaneName varchar(30),
AirplaneDesc varchar(300))

CREATE TABLE tblMODEL
(ModelID  INT IDENTITY(1,1) primary key,
Capacity INT,
ModelName varchar(60),
BeginDate DATE,
RegistrationNum INT)

CREATE TABLE tblMANUFACTURE
(ManufactureID  INT IDENTITY(1,1) primary key,
ManufactureName varchar(30),
ManufactureDesc varchar(300))

CREATE TABLE tblCOUNTRY
(CountryID  INT IDENTITY(1,1) primary key,
CountryName varchar(50),
CountryDesc varchar(300))

CREATE TABLE tblAIRPORT
(AirportID  INT IDENTITY(1,1) primary key,
AirportName varchar(50),
AirportDesc varchar(300))

CREATE TABLE tblFLIGHT_STATUS
(FlightStatusID  INT IDENTITY(1,1) primary key,
ActualDepartureTime DATE,
ActualArrivalTime DATE)

CREATE TABLE tblSTATUS
(StatusID  INT IDENTITY(1,1) primary key,
StatusName varchar(50),
StatusDesc varchar(300))


CREATE TABLE tblTICKET
(TicketID INT IDENTITY(1,1) primary key, 
TicketNumber varchar(30) not null, 
TicketDesccr varchar(300) null) 

CREATE TABLE tblGENDER
(GenderID INT IDENTITY(1,1) primary key, 
Gender varchar(10) not null)

CREATE TABLE tblBAGGAGE
(BaggageID INT IDENTITY(1,1) primary key, 
Baggage_Weight INT not null) 

CREATE TABLE tblSTAFF
(StaffID INT IDENTITY(1,1) primary key, 
BeginDate Date not null, 
EndDate Date null, 
Birth Date not null,
Fname varchar(20) not null,
Lname varchar(20) not null) 


CREATE TABLE tblFLIGHT_STAFF
(FlightStaffID INT IDENTITY(1,1) primary key) 

CREATE TABLE tblSTAFF_TYPE
(StaffTypeID INT IDENTITY(1,1) primary key,
StaffTypeName varchar(30) not null, 
StaffTypeDescr varchar(300)) 

CREATE TABLE tblROLE
(RoleID INT IDENTITY(1,1) primary key,
RoleName varchar(30),
RoleDesc varchar(300))

CREATE TABLE tblSEAT
(SeatID INT IDENTITY(1,1) primary key,
SeatNum varchar(5) not null)

CREATE TABLE tblSEAT_TYPE
(SeatTypeID INT IDENTITY(1,1) primary key,
SeatTypeName varchar(30) not null,
SeatTypeDescr varchar(300))

CREATE TABLE tblCLASS
(ClassID INT IDENTITY(1,1) primary key,
ClassName varchar(30) not null,
ClassDescr varchar(300))



ALTER TABLE tblFLIGHT
ADD AirplaneID INT FOREIGN KEY REFERENCES tblAIRPLANE (AirplaneID),
    ArrivalAirportID INT FOREIGN KEY REFERENCES tblAIRPORT (AirportID),
    DepartureAirportID INT FOREIGN KEY REFERENCES tblAIRPORT (AirportID),
    FlightTypeID INT FOREIGN KEY REFERENCES tblFLIGHT_TYPE (FlightTypeID),
    FlightStatusID INT FOREIGN KEY REFERENCES tblFLIGHT_STATUS (FlightStatusID)

ALTER TABLE tblFLIGHT_STATUS
ADD StatusID INT FOREIGN KEY REFERENCES tblSTATUS (StatusID)

ALTER TABLE tblCARRIER
ADD CoutryID INT FOREIGN KEY REFERENCES tblCOUNTRY (CountryID)

ALTER TABLE tblMODEL
ADD ManufactureID INT FOREIGN KEY REFERENCES tblMANUFACTURE (ManufactureID)

ALTER TABLE tblAIRPLANE
ADD ModelID INT FOREIGN KEY REFERENCES tblMODEL (ModelID),
    CarrierID INT FOREIGN KEY REFERENCES tblCARRIER (CarrierID)



ALTER TABLE tblTICKET 
ADD FlightID INT FOREIGN KEY REFERENCES tblFLIGHT (FlightID),
    SeatID INT FOREIGN KEY REFERENCES tblSEAT (SeatID),
    CustomerID INT FOREIGN KEY REFERENCES tblCUSTOMER (CustomerID)

ALTER TABLE tblBAGGAGE
ADD TicketID INT FOREIGN KEY REFERENCES tblTICKET (TicketID)

ALTER TABLE tblFLIGHT_STAFF
ADD FlightID INT FOREIGN KEY REFERENCES tblFLIGHT (FlightID),
    RoleID INT FOREIGN KEY REFERENCES tblROLE (RoleID),
    StaffID INT FOREIGN KEY REFERENCES tblSTAFF (StaffID)


ALTER TABLE tblSTAFF
ADD CitizenshipID INT FOREIGN KEY REFERENCES tblCITIZENSHIP (CitizenshipID),
    GenderID INT FOREIGN KEY REFERENCES tblGENDER (GenderID),
    StaffTypeID INT FOREIGN KEY REFERENCES tblSTAFF_TYPE (StaffTypeID)


ALTER TABLE tblSEAT
ADD SeatTypeID INT FOREIGN KEY REFERENCES tblSEAT_TYPE (SeatTypeID),
    ClassID INT FOREIGN KEY REFERENCES tblCLASS (ClassID)


CREATE TABLE tblCITY
(CityID INT IDENTITY(1,1) primary key,
CityName varchar(30) not null,
CityDesc varchar(300))

ALTER TABLE tblCITY
ADD CountryID INT FOREIGN KEY REFERENCES tblCOUNTRY (CountryID)

ALTER TABLE tblAIRPORT
ADD CityID INT FOREIGN KEY REFERENCES tblCITY (CityID)

INSERT INTO tblCOUNTRY(CountryName) VALUES
('Afghanistan'),
('Aland Islands'),
('Albania'),
('Algeria'),
('American Samoa'),
('Andorra'),
('Angola'),
('Anguilla'),
('Antarctica'),
('Antigua and Barbuda'),
('Argentina'),
('Armenia'),
('Aruba'),
('Australia'),
('Austria'),
('Azerbaijan'),
('Bahamas'),
('Bahrain'),
('Bangladesh'),
('Barbados'),
('Belarus'),
('Belgium'),
('Belize'),
('Benin'),
('Bermuda'),
('Bhutan'),
('Bolivia'),
('Bonaire, Sint Eustatius and Saba'),
('Bosnia and Herzegovina'),
('Botswana'),
('Bouvet Island'),
('Brazil'),
('British Indian Ocean Territory'),
('Brunei Darussalam'),
('Bulgaria'),
('Burkina Faso'),
('Burundi'),
('Cambodia'),
('Cameroon'),
('Canada'),
('Cape Verde'),
('Cayman Islands'),
('Central African Republic'),
('Chad'),
('Chile'),
('China'),
('Christmas Island'),
('Cocos (Keeling) Islands'),
('Colombia'),
('Comoros'),
('Congo'),
('Congo, Democratic Republic of the Congo'),
('Cook Islands'),
('Costa Rica'),
('Croatia'),
('Cuba'),
('Curacao'),
('Cyprus'),
('Czech Republic'),
('Denmark'),
('Djibouti'),
('Dominica'),
('Dominican Republic'),
('Ecuador'),
('Egypt'),
('El Salvador'),
('Equatorial Guinea'),
('Eritrea'),
('Estonia'),
('Ethiopia'),
('Falkland Islands (Malvinas)'),
('Faroe Islands'),
('Fiji'),
('Finland'),
('France'),
('French Guiana'),
('French Polynesia'),
('French Southern Territories'),
('Gabon'),
('Gambia'),
('Georgia'),
('Germany'),
('Ghana'),
('Gibraltar'),
('Greece'),
('Greenland'),
('Grenada'),
('Guadeloupe'),
('Guam'),
('Guatemala'),
('Guernsey'),
('Guinea'),
('Guinea-Bissau'),
('Guyana'),
('Haiti'),
('Heard Island and Mcdonald Islands'),
('Holy See (Vatican City State)'),
('Honduras'),
('Hungary'),
('Iceland'),
('India'),
('Indonesia'),
('Iran, Islamic Republic of'),
('Iraq'),
('Ireland'),
('Isle of Man'),
('Israel'),
('Italy'),
('Jamaica'),
('Japan'),
('Jersey'),
('Jordan'),
('Kazakhstan'),
('Kenya'),
('Kiribati'),
('South Korea'),
('North Korea'),
('Kosovo'),
('Kuwait'),
('Kyrgyzstan'),
('Malaysia'),
('Maldives'),
('Mali'),
('Malta'),
('Marshall Islands'),
('Martinique'),
('Mauritania'),
('Mauritius'),
('Mayotte'),
('Mexico'),
('Micronesia, Federated States of'),
('Moldova, Republic of'),
('Monaco'),
('Mongolia'),
('Montenegro'),
('Montserrat'),
('Morocco'),
('Mozambique'),
('Myanmar'),
('Namibia'),
('Nauru'),
('Nepal'),
('Netherlands'),
('Netherlands Antilles'),
('New Caledonia'),
('New Zealand'),
('Nicaragua'),
('Niger'),
('Nigeria'),
('Niue'),
('Norfolk Island'),
('Northern Mariana Islands'),
('Norway'),
('Oman'),
('Pakistan'),
('Palau'),
('Palestinian Territory, Occupied'),
('Panama'),
('Papua New Guinea'),
('Paraguay'),
('Peru'),
('Philippines'),
('Pitcairn'),
('Poland'),
('Portugal'),
('Puerto Rico'),
('Qatar'),
('Reunion'),
('Romania'),
('Russian Federation'),
('Rwanda'),
('Saint Barthelemy'),
('Saint Helena'),
('Saint Kitts and Nevis'),
('Saint Lucia'),
('Saint Martin'),
('Saudi Arabia'),
('Senegal'),
('Serbia'),
('Serbia and Montenegro'),
('Seychelles'),
('Sierra Leone'),
('Singapore'),
('Sint Maarten'),
('Slovakia'),
('Slovenia'),
('Solomon Islands'),
('Somalia'),
('South Africa'),
('South Georgia and the South Sandwich Islands'),
('South Sudan'),
('Spain'),
('Sri Lanka'),
('Sudan'),
('Suriname'),
('Svalbard and Jan Mayen'),
('Swaziland'),
('Sweden'),
('Switzerland'),
('Syrian Arab Republic'),
('Thailand'),
('Timor-Leste'),
('Togo'),
('Tokelau'),
('Tonga'),
('Trinidad and Tobago'),
('Tunisia'),
('Turkey'),
('Tuvalu'),
('Uganda'),
('Ukraine'),
('United Arab Emirates'),
('United Kingdom'),
('United States'),
('United States Minor Outlying Islands'),
('Uruguay'),
('Uzbekistan'),
('Vanuatu'),
('Venezuela'),
('Viet Nam'),
('Virgin Islands, British'),
('Virgin Islands, U.s.'),
('Wallis and Futuna'),
('Western Sahara'),
('Yemen'),
('Zambia'),
('Zimbabwe');