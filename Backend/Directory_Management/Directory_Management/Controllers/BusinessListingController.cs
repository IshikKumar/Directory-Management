using Microsoft.AspNetCore.Mvc;
using DirectoryManagementService.IServices;
using DirectoryManagementData.DTOs;

namespace DirectoryManagement.Controllers
{
    public class BusinessListingController : Controller
    {
        private readonly IBusinessListingService _businessService;
        private readonly IConfiguration _configuration;

        public BusinessListingController(IBusinessListingService businessService, IConfiguration configuration)
        {
            _businessService = businessService;
            _configuration = configuration;
        }

        // Gets paginated list of businesses with optional search
        [HttpGet("GetBusinessList")]
        public IActionResult GetBusinessList(
        [FromQuery] int pageSize = 10,
        [FromQuery] int pageIndex = 1,
        [FromQuery] string? searchKeyword = null)
        {
            try
            {
                if (pageSize < 1) pageSize = 10;
                if (pageIndex < 1) pageIndex = 1;
                var result = _businessService.GetBusinessListingService(pageSize, pageIndex, searchKeyword);
                if (result.TotalPages > 0 && pageIndex > result.TotalPages)
                {
                    return GetBusinessList(pageSize, result.TotalPages, searchKeyword);
                }
                return Json(result);
            }
            catch (Exception ex)
            {
                return Json(new
                {
                    error = ex.Message,
                    status = "Error",
                    code = "500"
                });
            }
        }

        // Creates a new business listing
        [HttpPost("AddBusiness")]
        public ActionResult AddBusiness([FromBody] AddBusinessRequest request)
        {
            try
            {
                var response = _businessService.AddBusiness(request);
                return response.Code switch
                {
                    "201" => StatusCode(201, response),
                    "400" => BadRequest(response),
                    _ => StatusCode(500, response)
                };
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ServiceResponse
                {
                    Status = "Error",
                    Code = "500",
                    Message = "An unexpected error occurred.",
                    Error = ex.Message,
                    TotalCount = 0
                });
            }
        }

        // Removes a business listing by ID
        [HttpPost("DeleteBusiness")]
        public IActionResult DeleteBusiness([FromBody] DeleteBusinessRequest request)
        {
            try
            {
                var result = _businessService.DeleteBusiness(request.businessID);
                return Json(result);
            }
            catch (Exception ex)
            {
                return Json(new { error = ex.Message });
            }
        }

        // Updates existing business details
        [HttpPost("UpdateBusinessDetails")]
        public ActionResult UpdateBusinessDetails([FromBody] UpdateBusinessModel request)
        {
            try
            {
                var response = _businessService.UpdateBusinessDetails(request);
                return response.Code switch
                {
                    "200" => Ok(response),
                    "404" => NotFound(response),
                    "400" => BadRequest(response),
                    _ => StatusCode(500, response)
                };
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ServiceResponse
                {
                    Status = "Error",
                    Code = "500",
                    Message = "An unexpected error occurred.",
                    Error = ex.Message,
                    TotalCount = 0
                });
            }
        }

        // Retrieves list of business categories
        [HttpGet("GetCategories")]
        public ActionResult GetCategories()
        {
            try
            {
                var response = _businessService.GetCategoriesForDropdown();
                return response.Code switch
                {
                    "200" => Ok(response),
                    "404" => NotFound(response),
                    _ => StatusCode(500, response)
                };
            }
            catch (Exception ex)
            {
                return StatusCode(500, new ServiceResponse
                {
                    Status = "Error",
                    Code = "500",
                    Message = "An unexpected error occurred.",
                    Error = ex.Message,
                    TotalCount = 0
                });
            }
        }
    }
}