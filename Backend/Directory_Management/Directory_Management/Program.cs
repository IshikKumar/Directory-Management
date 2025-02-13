using DirectoryManagementData.DTOs;
using DirectoryManagementRepository.IRepositories;
using DirectoryManagementRepository.Repositories;
using DirectoryManagementService.IServices;
using DirectoryManagementService.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.OpenApi.Models;

namespace DirectoryManagement
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);
            var configuration = builder.Configuration;

            // Database configuration
            builder.Services.AddDbContext<DMContext>(options =>
                options.UseSqlServer(builder.Configuration.GetConnectionString("DirectoryDB")));

            // Service registrations
            builder.Services.AddSingleton<IBusinessListingService, BusinessListingService>();
            builder.Services.AddSingleton<IBusinessListingRepo, BusinessListingRepo>();
            builder.Services.AddHttpClient();
            builder.Services.AddControllers();
            builder.Services.AddEndpointsApiExplorer();

            // Swagger configuration
            builder.Services.AddSwaggerGen(opt =>
            {
                opt.SwaggerDoc("v1", new OpenApiInfo { Title = "Directory Management", Version = "v1" });
            });

            // CORS policy setup
            builder.Services.AddCors(options =>
            {
                options.AddPolicy("CorsPolicy", builder =>
                {
                    builder.WithOrigins("http://localhost:4200").AllowAnyMethod().AllowAnyHeader();
                });
            });

            var app = builder.Build();

            // Middleware configuration
            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "MyAPI v1");
            });
            app.UseHttpsRedirection();
            app.UseCors("CorsPolicy");
            app.UseAuthorization();
            app.MapControllers();
            app.Run();
        }
    }
}