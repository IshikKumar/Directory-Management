Directory Management System

A full-stack application built with .NET Core Web API, Angular 18, and SQL Server.

FEATURES
- Directory management system with full CRUD operations
- Stored procedure-based database operations for better maintainability
- Modern responsive UI with Angular
- RESTful API architecture

TECHNOLOGY STACK
- Backend: .NET Core 8.0 Web API
- Frontend: Angular 18
- Database: SQL Server
- Runtime Environment: Node.js 20.x LTS
- Additional Libraries: SweetAlert2 for notifications

PREREQUISITES

Node.js
- Node.js 20.x LTS or higher
- npm (comes with Node.js)

Database
- SQL Server Management Studio
- SQL Server instance

Backend
- Visual Studio 2022 with ASP.NET and Web Development
- .NET Desktop Development
- .NET 8.0 SDK

Frontend
- Node.js (20.x LTS version)
- Angular CLI 18

INSTALLATION GUIDE

Node.js Setup
1. Download Node.js 20.x LTS from official website (https://nodejs.org/)
2. Run the installer and follow the installation wizard
3. Verify installation by opening a terminal/command prompt and running:
   node --version
   npm --version

Database Setup
1. Open SQL Server Management Studio
2. Connect to your local database instance
3. Execute these commands in sequence:

   Create database Directory

   USE Directory

4. Run the complete database script file

   DirectoryDBScript.sql

   This will create all required tables and stored procedures

Backend Setup
1. Navigate to the BACKEND folder
2. Open the .sln file in Visual Studio 2022
3. Update the connection string in appsettings.json:

   "DirectoryDB": "server=(localdb)\\MSSQLLocalDB;database=Directory;Trusted_Connection=True;TrustServerCertificate=True"

    Note: Modify the server name according to your local instance

Frontend Setup
1. Install Angular CLI globally:
   npm install -g @angular/cli@18

2. Verify installation:
   ng version

3. Navigate to the frontend folder and install dependencies:
   cd frontend
   npm install

4. Install SweetAlert2:
   npm install sweetalert2

RUNNING THE APPLICATION

Start the Backend
1. Open the solution in Visual Studio 2022
2. Press F5 or click the Run button
3. The API will start

Start the Frontend
1. Open a terminal in the frontend directory
2. Run the development server:
   ng serve --open
3. The application will automatically open in your default browser

ADDITIONAL NOTES
- The application uses stored procedures for database operations instead of LINQ queries for better maintainability
- Ensure all prerequisites are installed before running the application
- Make sure to update the database connection string according to your local SQL Server instance

TROUBLESHOOTING
If you encounter any issues:
1. Verify all prerequisites are installed
2. Check if the database connection string matches your local setup
3. Ensure all required ports are available
4. Verify Node.js and Angular CLI versions
5. If npm install fails, try clearing npm cache:
   npm cache clean --force