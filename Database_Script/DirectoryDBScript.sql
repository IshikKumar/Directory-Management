CREATE TABLE [dbo].[Businesses](
	[BusinessID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Address] [nvarchar](500) NULL,
	[City] [nvarchar](100) NOT NULL,
	[STATE] [nvarchar](100) NOT NULL,
	[ZipCode] [nvarchar](20) NOT NULL,
	[PhoneNumber] [nvarchar](20) NOT NULL,
	[CategoryId] [int] NULL,
	[Website] [nvarchar](255) NULL,
	[Rating] [decimal](3, 2) NULL,
	[CreatedAt] [datetime] NULL,
	[UpdatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BusinessID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10-02-2025 13:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Businesses] ON 

INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (1, N'ABC Bistro', N'123 Main St, Suite 1', N'Los Angeles', N'California', N'900101', N'6000000001', 4, N'abcb.com', CAST(4.50 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-23T20:25:17.907' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (2, N'Tech World', N'456 Elm St', N'San Francisco', N'California', N'941101', N'7000000002', 2, N'techworld.com', CAST(4.20 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (3, N'Health Plus', N'789 Oak St', N'Seattle', N'Washington', N'981101', N'8000000003', 3, N'healthplus.com', CAST(4.80 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (4, N'Elite Tutors', N'321 Maple Ave', N'Austin', N'Texas', N'733101', N'9000000004', 4, N'elitetutors.com', CAST(4.30 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (5, N'5 Hub', N'654 Pine St', N'Denver', N'Colorado', N'801201', N'6000000005', 5, N'5hb.com', CAST(4.60 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-23T20:29:18.353' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (6, N'Golden Grill', N'122 Baker Street', N'Phoenix', N'Arizona', N'850011', N'7000000006', 1, N'goldengrill.com', CAST(4.70 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (7, N'Smart Solutions', N'808 Ridge Ave', N'Houston', N'Texas', N'770101', N'8000000007', 2, N'smartsolutions.com', CAST(4.40 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (8, N'Care First Clinic', N'1100 Care Blvd', N'Portland', N'Oregon', N'197035', N'9000000008', 3, N'carefirst.com', CAST(4.90 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (9, N'LearnPro Academy', N'702 Campus Road', N'Madison', N'Wisconsin', N'537101', N'6000000009', 4, N'learnpro.com', CAST(4.10 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (10, N'Peak Performers Gym', N'950 Heights Drive', N'Salt Lake City', N'Utah', N'841101', N'7000000010', 5, N'peakperformers.com', CAST(4.30 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (11, N'Sizzle Kitchen', N'250 West Street', N'Chicago', N'Illinois', N'606101', N'8000000011', 1, N'sizzlekitchen.com', CAST(4.40 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (12, N'Gadget Galaxy', N'1400 Tech Plaza', N'Dallas', N'Texas', N'751201', N'9000000012', 2, N'gadgetgalaxy.com', CAST(4.60 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (13, N'Wellness First', N'320 Health Park', N'Miami', N'Florida', N'331011', N'6000000013', 3, N'wellnessfirst.com', CAST(4.70 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (14, N'Brain Boosters', N'840 Academy Road', N'Boston', N'Massachusetts', N'021108', N'7000000014', 4, N'brainboosters.com', CAST(4.20 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (15, N'Iron Works Gym', N'500 5 Blvd', N'San Diego', N'California', N'921101', N'8000000015', 5, N'ironworksgym.com', CAST(4.80 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (16, N'Tasteful Bites', N'770 Gourmet Street', N'New York', N'New York', N'100101', N'9000000016', 1, N'tastefulbites.com', CAST(4.30 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (17, N'Tech Savvy', N'900 Innovation Dr', N'San Jose', N'California', N'951101', N'6000000017', 2, N'techsavvy.com', CAST(4.50 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (18, N'Healthy Living', N'200 Care Drive', N'Atlanta', N'Georgia', N'303101', N'7000000018', 3, N'healthyliving.com', CAST(4.90 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (19, N'Scholars Hub', N'680 Study Lane', N'Columbus', N'Ohio', N'430815', N'8000000019', 4, N'scholarshub.com', CAST(4.40 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (20, N'Powerhouse 5', N'340 Muscle Rd', N'Charlotte', N'North Carolina', N'282101', N'9000000020', 5, N'powerhouse5.com', CAST(4.70 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (21, N'Urban Cafe', N'440 Downtown Blvd', N'Orlando', N'Florida', N'328101', N'6000000021', 1, N'urbancafe.com', CAST(4.60 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (22, N'Bright Gadgets', N'620 Shine Drive', N'Nashville', N'Tennessee', N'372101', N'7000000022', 2, N'brightgadgets.com', CAST(4.20 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (23, N'Care Beyond', N'830 Comfort Ave', N'Raleigh', N'North Carolina', N'271601', N'8000000023', 3, N'carebeyond.com', CAST(4.80 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (24, N'Top Tutors', N'460 Knowledge Pkwy', N'Tampa', N'Florida', N'336101', N'9000000024', 4, N'toptutors.com', CAST(4.50 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (25, N'Elite Fit', N'990 Flex Ave', N'Cleveland', N'Ohio', N'441011', N'6000000025', 5, N'elitefit.com', CAST(4.70 AS Decimal(3, 2)), CAST(N'2025-01-21T15:46:58.227' AS DateTime), CAST(N'2025-01-21T15:46:58.227' AS DateTime))
INSERT [dbo].[Businesses] ([BusinessID], [Name], [Address], [City], [STATE], [ZipCode], [PhoneNumber], [CategoryId], [Website], [Rating], [CreatedAt], [UpdatedAt]) VALUES (30, N'Swiggy', N'', N'Bangalore', N'Karnataka', N'123453', N'9876543202', NULL, NULL, NULL, CAST(N'2025-01-23T19:24:32.757' AS DateTime), CAST(N'2025-01-23T19:24:32.757' AS DateTime))
SET IDENTITY_INSERT [dbo].[Businesses] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (4, N'Education')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (2, N'Electronics')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (3, N'Healthcare')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (5, N'Other')
INSERT [dbo].[Categories] ([CategoryID], [Name]) VALUES (1, N'Restaurants')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_Businesses_PhoneNumber]    Script Date: 10-02-2025 13:33:52 ******/
ALTER TABLE [dbo].[Businesses] ADD  CONSTRAINT [UQ_Businesses_PhoneNumber] UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Categori__737584F65A0456AD]    Script Date: 10-02-2025 13:33:52 ******/
ALTER TABLE [dbo].[Categories] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Businesses] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Businesses] ADD  DEFAULT (getdate()) FOR [UpdatedAt]
GO
ALTER TABLE [dbo].[Businesses]  WITH CHECK ADD  CONSTRAINT [Businesses_categoryId_FK] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Businesses] CHECK CONSTRAINT [Businesses_categoryId_FK]
GO
/****** Object:  StoredProcedure [dbo].[DeleteBusiness]    Script Date: 10-02-2025 13:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteBusiness]
    @BusinessID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the BusinessID exists
    IF EXISTS (SELECT 1 FROM Businesses WHERE BusinessID = @BusinessID)
    BEGIN
        DELETE FROM Businesses WHERE BusinessID = @BusinessID;

        SELECT 
            'Success' AS Status,
            '200' AS Code,
            'Business deleted successfully' AS Message,
            (SELECT COUNT(*) FROM Businesses) AS TotalCount;
    END
    ELSE
    BEGIN
        SELECT 
            'Error' AS Status,
            '404' AS Code,
            'Business not found' AS Message,
            (SELECT COUNT(*) FROM Businesses) AS TotalCount;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[GetBusinessList]    Script Date: 10-02-2025 13:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBusinessList]
    @PageSize INT = 10,
    @PageIndex INT = 1,
    @SearchKeyword NVARCHAR(100) = NULL
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @Offset INT = (@PageIndex - 1) * @PageSize;
    
    -- Calculate total filtered count
    DECLARE @TotalCount INT;
    SELECT @TotalCount = COUNT(*)
    FROM Businesses b
    LEFT JOIN Categories c ON b.CategoryId = c.CategoryId
    WHERE @SearchKeyword IS NULL 
        OR (
            b.Name LIKE '%' + @SearchKeyword + '%' 
            OR b.City LIKE '%' + @SearchKeyword + '%'
        );
        
    -- Get paginated and filtered results
    SELECT 
        'Success' AS Status,
        '200' AS Code,
        'Businesses fetched successfully' AS Message,
        (SELECT 
            b.BusinessID, 
            b.Name, 
            b.Address, 
            b.City, 
            b.STATE, 
            b.ZipCode, 
            b.PhoneNumber,
            b.CategoryId,           -- Added CategoryId
            c.Name AS Category,
            b.Website, 
            b.Rating, 
            b.CreatedAt, 
            b.UpdatedAt
         FROM Businesses b
         LEFT JOIN Categories c ON b.CategoryId = c.CategoryId
         WHERE @SearchKeyword IS NULL 
            OR (
                b.Name LIKE '%' + @SearchKeyword + '%' 
                OR b.City LIKE '%' + @SearchKeyword + '%'
            )
         ORDER BY b.Name
         OFFSET @Offset ROWS
         FETCH NEXT @PageSize ROWS ONLY
         FOR JSON PATH) AS Result,
        @TotalCount AS TotalCount;
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_AddBusiness]    Script Date: 10-02-2025 13:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AddBusiness]
    @Name NVARCHAR(100),
    @Address NVARCHAR(200),
    @City NVARCHAR(100),
    @State NVARCHAR(50),
    @ZipCode NVARCHAR(20),
    @PhoneNumber NVARCHAR(20),
    @CategoryID INT,
    @Website NVARCHAR(200),
    @Rating DECIMAL(3,1),
    @CreatedAt DATETIME,
    @UpdatedAt DATETIME,
    @BusinessID INT OUTPUT,
    @Message NVARCHAR(255) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN 
        -- Check if business with same name and address already exists
        IF EXISTS (
            SELECT 1 
            FROM Businesses 
            WHERE Name = @Name 
            
        )
        BEGIN
            SET @Message = 'A business with this name and address already exists.';
            SET @BusinessID = 0;
            RETURN;
        END



        -- Insert the new business
        INSERT INTO Businesses (
            Name,
            Address,
            City,
            State,
            ZipCode,
            PhoneNumber,
            CategoryID,
            Website,
            Rating,
            CreatedAt,
            UpdatedAt
        )
        VALUES (
            @Name,
            @Address,
            @City,
            @State,
            @ZipCode,
            @PhoneNumber,
            @CategoryID,
            @Website,
            @Rating,
            @CreatedAt,
            @UpdatedAt
        );

        -- Get the new BusinessID
        SET @BusinessID = SCOPE_IDENTITY();
        
        -- Set success message
        SET @Message = 'Business added successfully.';
END
END;
GO
/****** Object:  StoredProcedure [dbo].[sp_GetCategories]    Script Date: 10-02-2025 13:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_GetCategories]
    @Message VARCHAR(255) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        -- Get active categories ordered by name
        SELECT 
            CategoryID,
            Name
        FROM Categories 
        ORDER BY Name;

        SET @Message = 'Categories retrieved successfully.';
    END TRY
    BEGIN CATCH
        SET @Message = ERROR_MESSAGE();
        THROW;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_UpdateBusinessDetails]    Script Date: 10-02-2025 13:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_UpdateBusinessDetails]
    @BusinessID INT,
    @Name VARCHAR(100) = NULL,
    @Address VARCHAR(200) = NULL,
    @City VARCHAR(100) = NULL,
    @State VARCHAR(50) = NULL,
    @ZipCode VARCHAR(20) = NULL,
    @PhoneNumber VARCHAR(20) = NULL,
    @CategoryID INT = NULL,
    @Website VARCHAR(200) = NULL,
    @Rating DECIMAL(3,2) = NULL,
    @Message VARCHAR(255) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Check if business exists
    IF NOT EXISTS (SELECT 1 FROM Businesses WHERE BusinessID = @BusinessID)
    BEGIN
        SET @Message = 'Business not found.';
        RETURN;
    END

    -- Check if category exists when CategoryID is provided
    IF @CategoryID IS NOT NULL AND NOT EXISTS (SELECT 1 FROM Categories WHERE CategoryID = @CategoryID)
    BEGIN
        SET @Message = 'Invalid Category ID provided.';
        RETURN;
    END

    UPDATE Businesses
    SET
        Name = ISNULL(@Name, Name),
        Address = ISNULL(@Address, Address),
        City = ISNULL(@City, City),
        State = ISNULL(@State, State),
        ZipCode = ISNULL(@ZipCode, ZipCode),
        PhoneNumber = ISNULL(@PhoneNumber, PhoneNumber),
        CategoryID = ISNULL(@CategoryID, CategoryID),
        Website = ISNULL(@Website, Website),
        Rating = ISNULL(@Rating, Rating),
        UpdatedAt = GETUTCDATE()
    WHERE BusinessID = @BusinessID;

    SET @Message = 'Business details updated successfully.';
END
