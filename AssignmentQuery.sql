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
CREATE TABLE [Consultants] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [SocialSecurityNumber] VARCHAR(12),
  [FirstName] NVARCHAR(250),
  [LastName] NVARCHAR(250),
  [HourlyRate] DECIMAL(7,2),
  [Specialty] NVARCHAR(250)
);

CREATE TABLE [Clients] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [OrganisationNumber] VARCHAR(10),
  [CompanyName] NVARCHAR(250),
  [Email] NVARCHAR(100),
  [PhoneNumber] VARCHAR(50)
);

CREATE TABLE [Projects] (
  [Id] INT IDENTITY(1,1) PRIMARY KEY,
  [ClientsId] INT,
  [ProjectName] NVARCHAR(100),
  CONSTRAINT [FK_Projects_ClientsId]
    FOREIGN KEY ([ClientsId])
      REFERENCES [Clients]([Id])
);

CREATE TABLE [Assignments] (
  [ProjectId] INT,
  [ConsultantsId] INT,
  [Startdate] DATETIME2,
  [Enddate] DATETIME2,
  [AssignmentDescription] NVARCHAR(500),
  PRIMARY KEY ([ProjectId], [ConsultantsId]),
  CONSTRAINT [FK_Assignments_ConsultantsId]
    FOREIGN KEY ([ConsultantsId])
      REFERENCES [Consultants]([Id]),
  CONSTRAINT [FK_Assignments_ProjectId]
    FOREIGN KEY ([ProjectId])
      REFERENCES [Projects]([Id])
);

PRINT 'Tables setup and ready';


