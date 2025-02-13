using DirectoryManagementData.DTOs;

namespace DirectoryManagementRepository.IRepositories
{
    public interface IBusinessListingRepo
    {

        ServiceResponse GetCategories();
        dynamic GetBusinessListingsRepo(int pageSize, int pageIndex, string searchKeyword);
        dynamic DeleteBusiness(int businessID);
        ServiceResponse UpdateBusinessDetails(UpdateBusinessModel updateModel);
        ServiceResponse AddBusiness(AddBusinessRequest business);

    }
}
