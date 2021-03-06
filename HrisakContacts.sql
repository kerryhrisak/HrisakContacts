USE [master]
GO
/****** Object:  Database [HrisakDB]    Script Date: 7/31/2016 10:07:25 PM ******/
CREATE DATABASE [HrisakDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HrisakDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQL2016\MSSQL\DATA\HrisakDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HrisakDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQL2016\MSSQL\DATA\HrisakDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [HrisakDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HrisakDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HrisakDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HrisakDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HrisakDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HrisakDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HrisakDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [HrisakDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HrisakDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HrisakDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HrisakDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HrisakDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HrisakDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HrisakDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HrisakDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HrisakDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HrisakDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HrisakDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HrisakDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HrisakDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HrisakDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HrisakDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HrisakDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HrisakDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HrisakDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HrisakDB] SET  MULTI_USER 
GO
ALTER DATABASE [HrisakDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HrisakDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HrisakDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HrisakDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HrisakDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HrisakDB', N'ON'
GO
ALTER DATABASE [HrisakDB] SET QUERY_STORE = OFF
GO
USE [HrisakDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [HrisakDB]
GO
/****** Object:  User [personDB]    Script Date: 7/31/2016 10:07:25 PM ******/
CREATE USER [personDB] FOR LOGIN [personDB] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [personDB]
GO
/****** Object:  Table [dbo].[tblPeople]    Script Date: 7/31/2016 10:07:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPeople](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](100) NULL,
	[FirstName] [nvarchar](100) NULL,
	[BirthDate] [nvarchar](100) NULL,
	[CellPhone] [nvarchar](20) NULL,
	[EmailAddress] [nvarchar](265) NULL,
 CONSTRAINT [PK_tblPeople] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblPersonToAddress]    Script Date: 7/31/2016 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPersonToAddress](
	[PersonToAddressID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[AddressID] [int] NOT NULL,
 CONSTRAINT [PK_tblPersonToAddress] PRIMARY KEY CLUSTERED 
(
	[PersonToAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblAddress]    Script Date: 7/31/2016 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAddress](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[Street] [nvarchar](250) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](2) NULL,
	[ZipCode] [nvarchar](10) NULL,
 CONSTRAINT [PK_tblAddress] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vwPersonMainList]    Script Date: 7/31/2016 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwPersonMainList]
AS
SELECT        dbo.tblPeople.PersonID, dbo.tblPeople.LastName, dbo.tblPeople.FirstName, dbo.tblAddress.Street, dbo.tblAddress.City, dbo.tblAddress.State, dbo.tblAddress.ZipCode, 
                         dbo.tblPersonToAddress.PersonToAddressID
FROM            dbo.tblPeople INNER JOIN
                         dbo.tblPersonToAddress ON dbo.tblPeople.PersonID = dbo.tblPersonToAddress.PersonID INNER JOIN
                         dbo.tblAddress ON dbo.tblPersonToAddress.AddressID = dbo.tblAddress.AddressID

GO
/****** Object:  View [dbo].[vwPersonEdit]    Script Date: 7/31/2016 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwPersonEdit]
AS
SELECT        dbo.tblPeople.LastName, dbo.tblPeople.FirstName, dbo.tblPeople.BirthDate, dbo.tblPeople.CellPhone, dbo.tblPeople.EmailAddress, dbo.tblAddress.Street, dbo.tblAddress.City, dbo.tblAddress.State, 
                         dbo.tblAddress.ZipCode, dbo.tblPersonToAddress.PersonToAddressID
FROM            dbo.tblPeople INNER JOIN
                         dbo.tblPersonToAddress ON dbo.tblPeople.PersonID = dbo.tblPersonToAddress.PersonID INNER JOIN
                         dbo.tblAddress ON dbo.tblPersonToAddress.AddressID = dbo.tblAddress.AddressID

GO
/****** Object:  View [dbo].[vwPeopleEdit]    Script Date: 7/31/2016 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwPeopleEdit]
AS
SELECT        dbo.tblPeople.FirstName, dbo.tblPeople.CellPhone, dbo.tblAddress.AddressID, dbo.tblPeople.PersonID, dbo.tblAddress.Street, dbo.tblAddress.City, dbo.tblAddress.State, dbo.tblAddress.ZipCode, 
                         dbo.tblPeople.EmailAddress, dbo.tblPeople.BirthDate
FROM            dbo.tblAddress INNER JOIN
                         dbo.tblPersonToAddress ON dbo.tblAddress.AddressID = dbo.tblPersonToAddress.AddressID CROSS JOIN
                         dbo.tblPeople

GO
/****** Object:  View [dbo].[vwPersonAddressEdit]    Script Date: 7/31/2016 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwPersonAddressEdit]
AS
SELECT        dbo.tblPeople.PersonID, dbo.tblPeople.LastName, dbo.tblPeople.FirstName, dbo.tblAddress.Street, dbo.tblAddress.City, dbo.tblAddress.State, dbo.tblAddress.ZipCode,
 dbo.tblPeople.CellPhone, dbo.tblPeople.EmailAddress,
                         dbo.tblPersonToAddress.PersonToAddressID
FROM            dbo.tblPeople INNER JOIN
                         dbo.tblPersonToAddress ON dbo.tblPeople.PersonID = dbo.tblPersonToAddress.PersonID INNER JOIN
                         dbo.tblAddress ON dbo.tblPersonToAddress.AddressID = dbo.tblAddress.AddressID


GO
/****** Object:  StoredProcedure [dbo].[prAddPersonAddress]    Script Date: 7/31/2016 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kerry Hrisak
-- Create date: 7/31/2016
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prAddPersonAddress]
	@LastName nvarchar(100),
	@FirstName nvarchar(100),
	@BirthDate nvarchar(100),
	@CellPhone nvarchar(20),
	@EmailAddress nvarchar(265),
	@Street nvarchar(250),
	@City nvarchar(100),
	@State nvarchar(2),
	@ZipCode nvarchar(10)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

	declare @countPerson int
	declare @addPerson bit
	declare @addAddress bit
	declare @countAddress int
	declare @addressID int
	declare @personID int

	select @countPerson = count(*) 
	from tblPeople 
	where LastName = @LastName and FirstName = @FirstName and BirthDate = @BirthDate and CellPhone = @CellPhone and EmailAddress = @EmailAddress

	if @countPerson = 0 
	begin
	INSERT INTO [dbo].[tblPeople]
           ([LastName]
           ,[FirstName]
           ,[BirthDate]
           ,[CellPhone]
           ,[EmailAddress])
     VALUES
           (@LastName
           ,@FirstName
           ,@BirthDate
           ,@CellPhone
           ,@EmailAddress)
	set @addPerson = 1
	select @personID = @@IDENTITY

	end
	else 
		begin
			select @personID = PersonID
			from tblPeople 
			where LastName = @LastName and FirstName = @FirstName and BirthDate = @BirthDate and CellPhone = @CellPhone and EmailAddress = @EmailAddress
			
		end

	select @countAddress = count(*) 
	from tblAddress 
	where Street = @Street and City = @City and [State] = @State and ZipCode = @ZipCode

	if @countAddress = 0 
	begin
	INSERT INTO [dbo].[tblAddress]
           ([Street]
           ,[City]
           ,[State]
           ,[ZipCode])
     VALUES
           (@Street
           ,@City
           ,@State
           ,@ZipCode)

	  set @addAddress = 1
	  select @addressID = @@IDENTITY
	end
	else 
		begin
			select @addressID = AddressID
			from tblAddress 
			where Street = @Street and City = @City and [State] = @State and ZipCode = @ZipCode

		end

	if @addAddress = 1 Or @addPerson = 1 
		begin
			INSERT INTO [dbo].[tblPersonToAddress] (PersonID, AddressID)
			VALUES (@personID, @addressID)
		end
END


GO
/****** Object:  StoredProcedure [dbo].[prDeletePerson]    Script Date: 7/31/2016 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kerry Hrisak
-- Create date: 7/31/2016
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[prDeletePerson]
	@PersonToAddressID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	declare @personID int
	declare @addressID int
	declare @countPersonID int
	declare @countAddressID int
    -- Insert statements for procedure here
	SELECT @personID = PersonID, @addressID = AddressID
	FROM tblPersonToAddress

	select @countPersonID = count(*) from tblPeople where personID = @personID
	select @countAddressID = count(*) from tblAddress where addressID = @addressID

	Delete from tblPersonToAddress where PersonID = @personID and AddressID = @addressID

	if @countPersonID = 1 
	 begin
	delete from tblAddress where AddressID = @addressID
	end

	if @countAddressID = 1
	begin
	delete from tblPeople where PersonID = @personID
	end 
END

GO
/****** Object:  StoredProcedure [dbo].[prGetCityStateFromZip]    Script Date: 7/31/2016 10:07:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Kerry Hrisak
-- Create date: 7/30/2016
-- Description:	Get City and State from the Zip Code
-- =============================================
CREATE PROCEDURE [dbo].[prGetCityStateFromZip]
	@Zip varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT top 1 City, [State] 
	FROM tblAddress
	WHERE ZipCode = @Zip
END

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblAddress"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "tblPeople"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 234
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblPersonToAddress"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 119
               Right = 646
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPeopleEdit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPeopleEdit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblPeople"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblPersonToAddress"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 119
               Right = 438
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblAddress"
            Begin Extent = 
               Top = 120
               Left = 246
               Bottom = 250
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPersonEdit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPersonEdit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblPeople"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tblPersonToAddress"
            Begin Extent = 
               Top = 61
               Left = 500
               Bottom = 174
               Right = 692
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblAddress"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPersonMainList'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPersonMainList'
GO
USE [master]
GO
ALTER DATABASE [HrisakDB] SET  READ_WRITE 
GO
