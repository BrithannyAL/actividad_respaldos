create database registro_personas
go

use registro_personas
go

create table personas(
	id tinyint primary key identity(1,1),
	nombre varchar(20),
	apellido varchar(20),
	cedula char(9),
	edad tinyint
)
go

insert into personas(nombre, apellido, cedula, edad)
values	('Brithanny', 'Arguello', '208380982', 20),
		('Stephanie', 'Matute', '204360356', 19),
		('Fabricio', 'Rodriguez', '206850356', 23)
go

select * from personas
go


--Respaldo total:
BACKUP DATABASE [registro_personas] TO 
DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\registro_personas.bak'
WITH NOFORMAT,
NOINIT,
NAME = N'registro_personas-Full Database Backup', 
SKIP, 
NOREWIND, 
NOUNLOAD,  
STATS = 10
GO

--restauración del primer respaldo:
USE [master]
BACKUP LOG [registro_personas] TO  
DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\registro_personas_LogBackup_2023-06-05_16-52-49.bak' WITH NOFORMAT, 
NOINIT,  NAME = N'registro_personas_LogBackup_2023-06-05_16-52-49', 
NOSKIP, 
NOREWIND, 
NOUNLOAD,  
NORECOVERY ,  
STATS = 5
RESTORE DATABASE [registro_personas] FROM  
DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\registro_personas.bak' WITH  FILE = 2,  
NOUNLOAD,  
STATS = 5
GO

--Segundo respealdo [diferencial]
BACKUP DATABASE [registro_personas] TO  
DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\registro_personas.bak' WITH  DIFFERENTIAL , 
NOFORMAT, 
NOINIT,  
NAME = N'registro_personas-Full Database Backup', 
SKIP, 
NOREWIND, 
NOUNLOAD,  
STATS = 10
GO

--restauración del segundo respaldo [diferencial]
USE [master]
BACKUP LOG [registro_personas] TO  
DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\registro_personas_LogBackup_2023-06-05_16-57-39.bak' WITH NOFORMAT, 
NOINIT,  NAME = N'registro_personas_LogBackup_2023-06-05_16-57-39', 
NOSKIP, NOREWIND, NOUNLOAD,  NORECOVERY ,  STATS = 5

RESTORE DATABASE [registro_personas] FROM  
DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\registro_personas.bak' WITH  FILE = 2,  
NORECOVERY,  NOUNLOAD,  STATS = 5

RESTORE DATABASE [registro_personas] FROM  
DISK = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\registro_personas.bak' WITH  FILE = 3,  
NOUNLOAD,  STATS = 5

GO

use registro_personas
go



