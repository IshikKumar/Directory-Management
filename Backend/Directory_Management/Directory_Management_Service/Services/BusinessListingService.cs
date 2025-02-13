using DirectoryManagementService.IServices;
using System.Text.Json;
using DirectoryManagementRepository.IRepositories;
using DirectoryManagementData.DTOs;

namespace DirectoryManagementService.Services
{
    // Handles business logic for business listing operations
    public class BusinessListingService : IBusinessListingService
    {
        private readonly IBusinessListingRepo _businessListingRepo;

        public BusinessListingService(IBusinessListingRepo businessListingRepo)
        {
            _businessListingRepo = businessListingRepo ?? throw new ArgumentNullException(nameof(businessListingRepo));
        }

        // Retrieves paginated business listings with optional search
        public ServiceResponse GetBusinessListingService(int pageSize, int pageIndex, string searchKeyword)
        {
            try
            {
                var result = _businessListingRepo.GetBusinessListingsRepo(pageSize, pageIndex, searchKeyword);
                if (result == null)
                {
                    return new ServiceResponse
                    {
                        Status = "Error",
                        Code = "404",
                        Message = "No businesses found.",
                        result = new List<BusinessModel>(),
                        TotalCount = 0,
                        CurrentPage = pageIndex,
                        PageSize = pageSize,
                        TotalPages = 0
                    };
                }
                var response = new ServiceResponse
                {
                    Status = result.Status,
                    Code = result.Code,
                    Message = result.Message,
                    TotalCount = result.TotalCount,
                    CurrentPage = pageIndex,
                    PageSize = pageSize,
                    TotalPages = (int)Math.Ceiling((double)result.TotalCount / pageSize)
                };

                // Handle JSON string result if returned from DB
                if (result.Result is string jsonString)
                {
                    try
                    {
                        response.result = JsonSerializer.Deserialize<List<BusinessModel>>(jsonString);
                    }
                    catch (JsonException)
                    {
                        response.IsError = true;
                        response.Error = "Invalid JSON format in database response.";
                        response.result = null;
                    }
                }
                else
                {
                    response.result = result.Result;
                }
                return response;
            }
            catch (Exception ex)
            {
                return new ServiceResponse
                {
                    Status = "Error",
                    Code = "500",
                    Message = "An error occurred while fetching business listings.",
                    Error = ex.Message,
                    result = null,
                    TotalCount = 0,
                    CurrentPage = pageIndex,
                    PageSize = pageSize,
                    TotalPages = 0
                };
            }
        }

        // Removes a business listing by ID
        public ServiceResponse DeleteBusiness(int businessID)
        {
            try
            {
                var result = _businessListingRepo.DeleteBusiness(businessID);

                if (result == null || result.TotalCount == 0)
                {
                    return new ServiceResponse
                    {
                        Status = "Error",
                        Code = "404",
                        Message = "Business not found or already deleted.",
                        TotalCount = 0
                    };
                }

                return new ServiceResponse
                {
                    Status = "Success",
                    Code = "200",
                    Message = "Business deleted successfully.",
                    TotalCount = result.TotalCount
                };
            }
            catch (Exception ex)
            {
                return new ServiceResponse
                {
                    Status = "Error",
                    Code = "500",
                    Message = "An error occurred while deleting the business.",
                    Error = ex.Message,
                    TotalCount = 0
                };
            }
        }

        // Gets list of available business categories
        public ServiceResponse GetCategoriesForDropdown()
        {
            try
            {
                return _businessListingRepo.GetCategories();
            }
            catch (Exception ex)
            {
                return new ServiceResponse
                {
                    Status = "Error",
                    Code = "500",
                    Message = "An error occurred while fetching categories.",
                    Error = ex.Message,
                    TotalCount = 0
                };
            }
        }

        // Updates business information with validation
        public ServiceResponse UpdateBusinessDetails(UpdateBusinessModel request)
        {
            try
            {
                var updateModel = new UpdateBusinessModel
                {
                    BusinessID = request.BusinessID
                };

                // Validate business ID
                if (updateModel.BusinessID <= 0)
                {
                    return new ServiceResponse
                    {
                        Status = "Error",
                        Code = "400",
                        Message = "Invalid Business ID provided.",
                        TotalCount = 0
                    };
                }

                // Update fields if valid
                if (IsValidStringField(request.Name))
                    updateModel.Name = request.Name;

                if (IsValidStringField(request.Address))
                    updateModel.Address = request.Address;

                if (IsValidStringField(request.City))
                    updateModel.City = request.City;

                if (IsValidStringField(request.STATE))
                    updateModel.STATE = request.STATE;

                if (IsValidStringField(request.ZipCode))
                    updateModel.ZipCode = request.ZipCode;

                if (IsValidStringField(request.PhoneNumber))
                    updateModel.PhoneNumber = request.PhoneNumber;

                if (IsValidStringField(request.Website))
                    updateModel.Website = request.Website;

                if (request.CategoryID > 0)
                    updateModel.CategoryID = request.CategoryID;

                // Validate rating range
                if (request.Rating != 0)
                {
                    if (request.Rating < 0 || request.Rating > 5)
                    {
                        return new ServiceResponse
                        {
                            Status = "Error",
                            Code = "400",
                            Message = "Rating must be between 0 and 5.",
                            TotalCount = 0
                        };
                    }
                    updateModel.Rating = request.Rating;
                }

                // Validate phone number format
                if (!string.IsNullOrEmpty(updateModel.PhoneNumber) && !IsValidPhoneNumber(updateModel.PhoneNumber))
                {
                    return new ServiceResponse
                    {
                        Status = "Error",
                        Code = "400",
                        Message = "Invalid phone number format.",
                        TotalCount = 0
                    };
                }

                return _businessListingRepo.UpdateBusinessDetails(updateModel);
            }
            catch (Exception ex)
            {
                return new ServiceResponse
                {
                    Status = "Error",
                    Code = "500",
                    Message = "An error occurred while updating business details.",
                    Error = ex.Message,
                    TotalCount = 0
                };
            }
        }

        // Checks if a string field is valid and not default
        private bool IsValidStringField(string value)
        {
            return !string.IsNullOrEmpty(value) && value != "string";
        }

        // Validates phone number format using regex
        private bool IsValidPhoneNumber(string phoneNumber)
        {
            return System.Text.RegularExpressions.Regex.IsMatch(phoneNumber, @"^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d$");
        }

        // Creates new business listing with validation
        public ServiceResponse AddBusiness(AddBusinessRequest request)
        {
            try
            {
                // Validate required fields
                if (string.IsNullOrEmpty(request.Name))
                {
                    return new ServiceResponse
                    {
                        Status = "Error",
                        Code = "400",
                        Message = "Business name is required.",
                        TotalCount = 0
                    };
                }

                // Validate phone number format
                if (!string.IsNullOrEmpty(request.PhoneNumber) && !IsValidPhoneNumber(request.PhoneNumber))
                {
                    return new ServiceResponse
                    {
                        Status = "Error",
                        Code = "400",
                        Message = "Invalid phone number format.",
                        TotalCount = 0
                    };
                }

                // Validate rating range
                if (request.Rating < 0 || request.Rating > 5)
                {
                    return new ServiceResponse
                    {
                        Status = "Error",
                        Code = "400",
                        Message = "Rating must be between 0 and 5.",
                        TotalCount = 0
                    };
                }

                request.CreatedAt = DateTime.UtcNow;
                request.UpdatedAt = DateTime.UtcNow;

                return _businessListingRepo.AddBusiness(request);
            }
            catch (Exception ex)
            {
                return new ServiceResponse
                {
                    Status = "Error",
                    Code = "500",
                    Message = "An error occurred while adding business.",
                    Error = ex.Message,
                    TotalCount = 0
                };
            }
        }
    }
}