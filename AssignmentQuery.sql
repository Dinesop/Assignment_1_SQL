/* ============================================================================
								
								FAILSAFE IT 
					Inlämningsuppgift 1 - Databashantering SQL

   ============================================================================ */

-- A Reset --
USE master;
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'FailSafeIT_Assignment1')
BEGIN
    ALTER DATABASE FailSafeIT_Assignment1 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE FailSafeIT_Assignment1;
END
GO

CREATE DATABASE FailSafeIT_Assignment1;
GO

USE FailSafeIT_Assignment1;
GO

PRINT 'FailSafeIT-databasen is created and ready to use!';

-- Set up tables
CREATE TABLE [Clients] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [CorporateIdNr] VARCHAR(10) UNIQUE,
  [CompanyName] NVARCHAR(250),
  [Email] NVARCHAR(100),
  [PhoneNumber] VARCHAR(50),
);

CREATE TABLE [Consultants] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [SocialSecurityNr] VARCHAR(12) UNIQUE,
  [FirstName] NVARCHAR(250),
  [LastName] NVARCHAR(250),
  [HourlyRate] DECIMAL(7,2),
  [Specialty] NVARCHAR(250),
);

CREATE TABLE Projects 
( 
    Id INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
    ClientsCorporateIdNr VARCHAR(10),
    ProjectName NVARCHAR(100),

    CONSTRAINT FK_Projects_Clients FOREIGN KEY (ClientsCorporateIdNr) REFERENCES Clients ([CorporateIdNr]),
);


CREATE TABLE Assignments
(
    ProjectId INT,
    ConsulantsSocialSecurityNr VARCHAR(12),
    StartDate DATETIME2,
    EndDate DATETIME2,
    AssignmentDesc NVARCHAR (500)
    
    CONSTRAINT PK_Assignments PRIMARY KEY (ProjectId, ConsulantsSocialSecurityNr),
    CONSTRAINT FK_Assignments_Projects FOREIGN KEY (ProjectId) REFERENCES dbo.Projects (Id),
    CONSTRAINT FK_Assignments_Consultants FOREIGN KEY (ConsulantsSocialSecurityNr) REFERENCES dbo.Consultants (SocialSecurityNr)
);

PRINT 'Tables setup and ready';

-- Populate with fake Client data from Mockaroo
insert into Clients (CorporateIdNr, CompanyName, Email, PhoneNumber) values ('2076420088', 'Turner, Kirlin and Sauer', 'jlaverenz0@ocn.ne.jp', '+86-927-856-7827');
insert into Clients (CorporateIdNr, CompanyName, Email, PhoneNumber) values ('7306930680', 'Hodkiewicz LLC', 'schominski1@mail.ru', '+255-810-622-9514');
insert into Clients (CorporateIdNr, CompanyName, Email, PhoneNumber) values ('5630086332', 'Windler LLC', 'cbarson2@aboutads.info', '+36-150-461-6873');
insert into Clients (CorporateIdNr, CompanyName, Email, PhoneNumber) values ('9698007687', 'Keebler LLC', 'mmacourek3@flavors.me', '+51-104-106-8090');
insert into Clients (CorporateIdNr, CompanyName, Email, PhoneNumber) values ('3447094125', 'Miller and Sons', 'gpally4@npr.org', '+63-888-592-3288');
insert into Clients (CorporateIdNr, CompanyName, Email, PhoneNumber) values ('4930810779', 'Douglas Group', 'kmandeville5@google.pl', '+86-398-229-8465');
insert into Clients (CorporateIdNr, CompanyName, Email, PhoneNumber) values ('8173700095', 'Dare and Sons', 'boxbe6@163.com', '+244-243-602-6228');
insert into Clients (CorporateIdNr, CompanyName, Email, PhoneNumber) values ('9996240282', 'Moen, Waters and Stroman', 'gokell7@mac.com', '+33-922-158-9979');
insert into Clients (CorporateIdNr, CompanyName, Email, PhoneNumber) values ('4559052174', 'Nader, Rodriguez and O''Keefe', 'dbultitude8@chronoengine.com', '+880-780-741-6680');
insert into Clients (CorporateIdNr, CompanyName, Email, PhoneNumber) values ('4029401058', 'Mante-Stamm', 'fpithcock9@slate.com', '+970-763-811-0249');

-- Populate with fake Consultant data from Mockaroo
insert into Consultants (SocialSecurityNumber, FirstName, LastName, HourlyRate, Specialty) values ('8832124211', 'Märta', 'Scoterbosh', 1969, 'Web Developer');
insert into Consultants (SocialSecurityNumber, FirstName, LastName, HourlyRate, Specialty) values ('3267851165', 'Médiamass', 'Muschette', 1459, 'Network Administrator');
insert into Consultants (SocialSecurityNumber, FirstName, LastName, HourlyRate, Specialty) values ('7925694157', 'Tán', 'Meader', 4638, 'Blockchain Engineer');
insert into Consultants (SocialSecurityNumber, FirstName, LastName, HourlyRate, Specialty) values ('6883423710', 'Lorène', 'Dishman', 4609, 'IT Project Manager');
insert into Consultants (SocialSecurityNumber, FirstName, LastName, HourlyRate, Specialty) values ('7041646211', 'Mélissandre', 'Agott', 1765, 'IT Support Specialist');
insert into Consultants (SocialSecurityNumber, FirstName, LastName, HourlyRate, Specialty) values ('4525746483', 'Åsa', 'Crollman', 4464, 'IT Project Manager');
insert into Consultants (SocialSecurityNumber, FirstName, LastName, HourlyRate, Specialty) values ('9404643793', 'Cunégonde', 'Scatchar', 1703, 'IT Support Specialist');
insert into Consultants (SocialSecurityNumber, FirstName, LastName, HourlyRate, Specialty) values ('5686647879', 'Marie-josée', 'Cawte', 3105, 'IT Support Specialist');
insert into Consultants (SocialSecurityNumber, FirstName, LastName, HourlyRate, Specialty) values ('6670551673', 'Maïlys', 'Pailin', 2384, 'IT Project Manager');
insert into Consultants (SocialSecurityNumber, FirstName, LastName, HourlyRate, Specialty) values ('4581035597', 'Médiamass', 'Haill', 3262, 'IT Project Manager');

-- Polulate with fake Project data
INSERT INTO Projects (ClientsCorporateIdNr, ProjectName) VALUES ('2076420088', 'IT Support Setup: Turner, Kirlin and Sauer')
INSERT INTO Projects (ClientsCorporateIdNr, ProjectName) VALUES ('7306930680', 'Blockchain control: Hodkiewicz LLC')
INSERT INTO Projects (ClientsCorporateIdNr, ProjectName) VALUES ('7306930680', 'Network configuration: Hodkiewicz LLC')
INSERT INTO Projects (ClientsCorporateIdNr, ProjectName) VALUES ('5630086332', 'Web Development: Windler LLC')
INSERT INTO Projects (ClientsCorporateIdNr, ProjectName) VALUES ('9698007687', 'IT Environment Configuration: Keebler LLC')
INSERT INTO Projects (ClientsCorporateIdNr, ProjectName) VALUES ('3447094125', 'IT Security Project: Miller and Sons')
INSERT INTO Projects (ClientsCorporateIdNr, ProjectName) VALUES ('8173700095', 'IT Security Project: Dare and Sons')
INSERT INTO Projects (ClientsCorporateIdNr, ProjectName) VALUES ('4559052174', 'IT support Maintenance: Nader, Rodriguez and O''Keefe')
INSERT INTO Projects (ClientsCorporateIdNr, ProjectName) VALUES ('4029401058', 'IT Support Configuration: Mante-Stamm')
INSERT INTO Projects (ClientsCorporateIdNr, ProjectName) VALUES ('9996240282', 'IT Security Analysis: Moen, Waters and Stroman')


---- Populate with fake Assignment data
--insert into Assignments (ProjectId, SocialSecurityNumber, StartDate, EndDate, AssignmentDescription) values (1, '6493826101', '2025-12-29', '2026-08-22', 'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.');
--insert into Assignments (ProjectId, SocialSecurityNumber, StartDate, EndDate, AssignmentDescription) values (2, '2962158765', '2026-04-16', '2026-07-06', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.');
--insert into Assignments (ProjectId, SocialSecurityNumber, StartDate, EndDate, AssignmentDescription) values (3, '5156238106', '2026-06-22', '2026-09-18', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.');
--insert into Assignments (ProjectId, SocialSecurityNumber, StartDate, EndDate, AssignmentDescription) values (4, '0635125501', '2026-03-27', '2026-10-14', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus.');
--insert into Assignments (ProjectId, SocialSecurityNumber, StartDate, EndDate, AssignmentDescription) values (5, '6144553207', '2025-11-24', '2026-10-04', 'Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.');
--insert into Assignments (ProjectId, SocialSecurityNumber, StartDate, EndDate, AssignmentDescription) values (6, '2487190442', '2026-02-17', '2026-09-09', 'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.');
--insert into Assignments (ProjectId, SocialSecurityNumber, StartDate, EndDate, AssignmentDescription) values (7, '3543914359', '2026-02-22', '2026-08-03', 'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.');
--insert into Assignments (ProjectId, SocialSecurityNumber, StartDate, EndDate, AssignmentDescription) values (8, '0930327160', '2026-05-25', '2026-11-08', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.');
--insert into Assignments (ProjectId, SocialSecurityNumber, StartDate, EndDate, AssignmentDescription) values (9, '5464850449', '2026-02-10', '2026-10-16', 'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.');
--insert into Assignments (ProjectId, SocialSecurityNumber, StartDate, EndDate, AssignmentDescription) values (10, '7797063869', '2026-02-07', '2026-10-09', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.');




-- Verify that constraints work
--INSERT INTO Projects (ClientsCorporateIdNr, ProjectName) VALUES ('0110110000', 'IT Support');
--INSERT INTO Assignments(ProjectId, Startdate, Enddate, AssignmentDescription) VALUES ('0110110000', '2026-01-01', '2026-03-30', 'IT Support');


