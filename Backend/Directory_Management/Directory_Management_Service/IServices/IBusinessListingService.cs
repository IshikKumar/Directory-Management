using DirectoryManagementData.DTOs;


namespace DirectoryManagementService.IServices
{
    public interface IBusinessListingService
    {
        ServiceResponse GetCategoriesForDropdown();
        ServiceResponse GetBusinessListingService(int pageSize, int pageIndex, string searchKeyword);
        ServiceResponse DeleteBusiness(int businessID);
        ServiceResponse UpdateBusinessDetails(UpdateBusinessModel updateModel);
        ServiceResponse AddBusiness(AddBusinessRequest request);

    }
}
