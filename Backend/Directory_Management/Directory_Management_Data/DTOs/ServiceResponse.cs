namespace DirectoryManagementData.DTOs
{
    public class ServiceResponse
    {
        public string Status { get; set; }
        public string Code { get; set; }
        public string Message { get; set; }
        public string Error { get; set; }
        public bool IsError { get; set; }
        public dynamic result { get; set; }
        public int TotalCount { get; set; }
        public int CurrentPage { get; set; }
        public int PageSize { get; set; }
        public int TotalPages { get; set; }
        
    }
}
