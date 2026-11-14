# 10/11 
Börjar med att sätta upp mitt Lucidchart och fundera på relationer mellan entites. 
Jag tar bort min relationship mellan kund och konsult eftersom jag har en bridge table i uppdrag.

My custom list of titles: Software Developer, Web Developer, Blockchain Engineer, Cloud Engineer, DevOps Engineer, Systems Administrator, Network Administrator, Cybersecurity Analyst, IT Support Specialist, Quality Assurance, IT Project Manager, Business Analyst

## Checking table normalization levels:
#### Konsulter
###### 1NF
- [x] Row order must be random, 
- [x] One column can only contain one datatype 
- [x] The table must have a [[Primary Key]]
- [x] Storing a repeating group of data items on a single row violates First Normal Form
###### 2NF
 - [x] Eliminera partiella beroenden - Each non-key attribute must depend on the entire primary key.
###### 3NF
 - [x] Every non-key attribute in a table should depend on only the key.
#### Kunder
###### 1NF
- [x] Row order must be random, 
- [x] One column can only contain one datatype 
- [x] The table must have a [[Primary Key]]
- [x] Storing a repeating group of data items on a single row violates First Normal Form
###### 2NF
 - [x] Eliminera partiella beroenden - Each non-key attribute must depend on the entire primary key.n?
###### 3NF
 - [x] Every non-key attribute in a table should depend on only the key.

#### Uppdrag
###### 1NF
- [x] Row order must be random, 
- [x] One column can only contain one datatype 
- [x] The table must have a [[Primary Key]]
- [x] Storing a repeating group of data items on a single row violates First Normal Form
###### 2NF
 - [x] Eliminera partiella beroenden - Each non-key attribute must depend on the entire primary key: Slutdatumet beror ju på startdatumet... 
###### 3NF
 - [x] Every non-key attribute in a table should depend on only the key.

# 12/11
I am switching to English in the ERD and code but I will probably switch back and forth here, as it is my preferred way of writing. I reacted to what Claes said in the lesson yesterday, that the tables should have a one-to-many relationship with each other, and that makes sense between Clients and Projects (Uppdrag) but I am struggling to see how that would work between Projects and Consultants. One project can have many consultants and one consultant can have many projects. Should I insert *another* coupling table between them? I am discussing with Linnea and Stig and know they haven't, so what am I missing? I and Stig went over it again and we agreed on that we need another junction table. 
Tables updated in LucidChart, adjusted a few times and ran in SSMS, it seems to be working fine. 

# 13/11
Friday the Thirteenth and we start of with some good luck - child is well enough to go to preschool, so today I will be able to focus more on the assignment.
Going to start with checking the normalization on my new tables, then I will look into the SQL queries, I got the reset and setup done yesterday but not sure I got my keys correctly set up.
- [x] Check normalization
- [x] Verify PK and FK work as intended
- [x] Check other query requirements.

Okay, trying to insert into the Project table I got the following error:
The INSERT statement conflicted with the FOREIGN KEY constraint "FK_Projects_ClientsCorporateIdNr". The conflict occurred in database "FailSafeIT_Assignment1", table "dbo.Clients", column 'Id'.
The statement has been terminated.
Which I suspect is related to Lucidcharts setup of the column. It added a lot of nice constraints based on my key, but I barely understand keys so having someone add it for me makes it difficult to error proof. I assume it is becuase the keys are for LucidCharts (LC) own PK and not the one I setup. So will have to modify accordingly. 
Trying to figure out these FKs manually, learning a lot in the process. Managed to figure out how to add a column after creation all on my own. 
`ALTER TABLE Projects ADD [ProjectName] NVARCHAR(100);`
Always fun with som good old fashioned trial and error. 
Lesson of the day: Well-indexed notes are really handy when you need to find out which lesson we went through what keyword. Needed to look up composite primary keys based on foreign keys and thanks to my previous notetaking I could find it quickly and check my comments in the code from the lesson and figure out how to set it up. 
Okay, so JOINS. I realized that introducing that extra table makes it a bit more tricky (which I suspect was why Claes suggested having 3 tables, not 4) but it will be a learning experience. 
The syntax for inner joins are select columns you want, from which table and join with related key. 
So if I want companyName from Clients, I need to join that with Projects with the related key of ClientsCorporateIdNr. 
I then need to join it with Assignments through the related key ProjectId. 
I also need to join Assignments with Consultants through the related key of ConsultantsSocialSecurityNr. 

# 14/11
I struggled a lot yesterday with the join, I got some weird errors - "the multipart identifier could not be bound", that I've tried to understand. 
And when I try to do them seperatly I get "Invalid object name 'Projects.ProjectName'."
I looked over my tables and realised I had accidentally kept the PKs and FKs as the consultants social security number and company identifying number when setting up and reference the tables, so I fixed that. 
It did not help however. We are back to "the multipart identifier could not be bound"
Okay, after a lot of back and forth I got it to work. It is honestly quite simple when you know how it is done. 
The issue was a combo of me remembering the wrong keynames and writing the wrong syntax. 
Okay I had some issues with C question too, mostly because I am a bit tired and don't fully know what I am doing.
Question D and E done!