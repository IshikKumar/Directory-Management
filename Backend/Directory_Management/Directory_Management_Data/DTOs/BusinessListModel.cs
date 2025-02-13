namespace DirectoryManagementData.DTOs
{
    public class BusinessListRequest
    {
        public int? PageSize { get; set; }
        public int? PageIndex { get; set; }
        public string? SearchKeyword { get; set; }
        
    }
}
