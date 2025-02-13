using DirectoryManagementRepository.IRepositories;
using Microsoft.Data.SqlClient;
using System.Data;
using Dapper;
using Microsoft.Extensions.Configuration;
using DirectoryManagementData.DTOs;

namespace DirectoryManagementRepository.Repositories
{
    // Handles database operations for business listings
    public class BusinessListingRepo : IBusinessListingRepo
    {
        private readonly string _connectionString;

        public BusinessListingRepo(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DirectoryDB");
        }

        // Retrieves paginated business listings from database
        public dynamic GetBusinessListingsRepo(int pageSize, int pageIndex, string searchKeyword)
        {
            try
            {
                var parameters = new DynamicParameters();
                parameters.Add("@PageSize", pageSize);
                parameters.Add("@PageIndex", pageIndex);
                parameters.Add("@SearchKeyword", string.IsNullOrEmpty(searchKeyword) ? null : searchKeyword);
                using (var connection = new SqlConnection(_connectionString))
                {
                    return connection.QueryFirstOrDefault<dynamic>(
                        "GetBusinessList",
                        parameters,
                        commandType: CommandType.StoredProcedure
                    );
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Database error while fetching business listings.", ex);
            }
        }

        // Removes business record from database
        public dynamic DeleteBusiness(int businessID)
        {
            try
            {
                using (var connection = new SqlConnection(_connectionString))
                {
                    var parameters = new DynamicParameters();
                    parameters.Add("@BusinessID", businessID, DbType.Int32);

                    return connection.QueryFirstOrDefault<dynamic>(
                        "DeleteBusiness",
                        parameters,
                        commandType: CommandType.StoredProcedure
                    );
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Database error while deleting the business.", ex);
            }
        }

        // Gets list of business categories
        public ServiceResponse GetCategories()
        {
            try
            {
                using (var connection = new SqlConnection(_connectionString))
                {
                    var parameters = new DynamicParameters();
                    parameters.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 255);

                    var categories = connection.Query<CategoryModel>(
                        "sp_GetCategories",
                        parameters,
                        commandType: CommandType.StoredProcedure
                    ).ToList();

                    string message = parameters.Get<string>("@Message");

                    return new ServiceResponse
                    {
                        Status = "Success",
                        Code = "200",
                        Message = message,
                        result = categories,
                        TotalCount = categories.Count
                    };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Database error while fetching categories.", ex);
            }
        }

        // Updates business information in database
        public ServiceResponse UpdateBusinessDetails(UpdateBusinessModel updateModel)
        {
            try
            {
                using (var connection = new SqlConnection(_connectionString))
                {
                    connection.Open();

                    // Validate category if provided
                    if (updateModel.CategoryID.HasValue)
                    {
                        var categoryExists = connection.QueryFirstOrDefault<bool>(
                            "SELECT CASE WHEN EXISTS (SELECT 1 FROM Categories WHERE CategoryID = @CategoryID) THEN 1 ELSE 0 END",
                            new { CategoryID = updateModel.CategoryID });

                        if (!categoryExists)
                        {
                            return new ServiceResponse
                            {
                                Status = "Error",
                                Code = "400",
                                Message = "Invalid Category ID provided.",
                                TotalCount = 0
                            };
                        }
                    }

                    // Add parameters for update
                    var parameters = new DynamicParameters();
                    parameters.Add("@BusinessID", updateModel.BusinessID);

                    if (!string.IsNullOrEmpty(updateModel.Name))
                        parameters.Add("@Name", updateModel.Name);

                    if (!string.IsNullOrEmpty(updateModel.Address))
                        parameters.Add("@Address", updateModel.Address);

                    if (!string.IsNullOrEmpty(updateModel.City))
                        parameters.Add("@City", updateModel.City);

                    if (!string.IsNullOrEmpty(updateModel.STATE))
                        parameters.Add("@State", updateModel.STATE);

                    if (!string.IsNullOrEmpty(updateModel.ZipCode))
                        parameters.Add("@ZipCode", updateModel.ZipCode);

                    if (!string.IsNullOrEmpty(updateModel.PhoneNumber))
                        parameters.Add("@PhoneNumber", updateModel.PhoneNumber);

                    if (updateModel.CategoryID.HasValue)
                        parameters.Add("@CategoryID", updateModel.CategoryID.Value);

                    if (!string.IsNullOrEmpty(updateModel.Website))
                        parameters.Add("@Website", updateModel.Website);

                    if (updateModel.Rating != 0)
                        parameters.Add("@Rating", updateModel.Rating);

                    parameters.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 255);

                    connection.Execute("sp_UpdateBusinessDetails", parameters, commandType: CommandType.StoredProcedure);

                    string message = parameters.Get<string>("@Message");
                    int rowsAffected = connection.QuerySingle<int>("SELECT @@ROWCOUNT");

                    return new ServiceResponse
                    {
                        Status = rowsAffected > 0 ? "Success" : "Error",
                        Code = rowsAffected > 0 ? "200" : "404",
                        Message = message,
                        TotalCount = rowsAffected
                    };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while updating business details.", ex);
            }
        }

        // Adds new business to database
        public ServiceResponse AddBusiness(AddBusinessRequest business)
        {
            try
            {
                using (var connection = new SqlConnection(_connectionString))
                {
                    connection.Open();

                    // Validate category
                    if (business.CategoryID != 0)
                    {
                        var categoryExists = connection.QueryFirstOrDefault<bool>(
                            "SELECT CASE WHEN EXISTS (SELECT 1 FROM Categories WHERE CategoryID = @Category) THEN 1 ELSE 0 END",
                            new { Category = business.CategoryID });

                        if (!categoryExists)
                        {
                            return new ServiceResponse
                            {
                                Status = "Error",
                                Code = "400",
                                Message = "Invalid Category provided.",
                                TotalCount = 0
                            };
                        }
                    }

                    // Set up parameters for new business
                    var parameters = new DynamicParameters();
                    parameters.Add("@Name", business.Name);
                    parameters.Add("@Address", business.Address);
                    parameters.Add("@City", business.City);
                    parameters.Add("@State", business.STATE);
                    parameters.Add("@ZipCode", business.ZipCode);
                    parameters.Add("@PhoneNumber", business.PhoneNumber);
                    parameters.Add("@CategoryID", business.CategoryID);
                    parameters.Add("@Website", business.Website);
                    parameters.Add("@Rating", business.Rating);
                    parameters.Add("@CreatedAt", business.CreatedAt);
                    parameters.Add("@UpdatedAt", business.UpdatedAt);
                    parameters.Add("@BusinessID", dbType: DbType.Int32, direction: ParameterDirection.Output);
                    parameters.Add("@Message", dbType: DbType.String, direction: ParameterDirection.Output, size: 255);

                    connection.Execute("sp_AddBusiness", parameters, commandType: CommandType.StoredProcedure);

                    int newBusinessId = parameters.Get<int>("@BusinessID");
                    string message = parameters.Get<string>("@Message");

                    return new ServiceResponse
                    {
                        Status = "Success",
                        Code = "201",
                        Message = message,
                        TotalCount = 1
                    };
                }
            }
            catch (Exception ex)
            {
                throw new Exception("An error occurred while adding business details.", ex);
            }
        }
    }
}