﻿namespace DirectoryManagementData.DTOs
{
    public class UpdateBusinessModel
    {
        public int BusinessID { get; set; }
        public string? Name { get; set; }
        public string? Address { get; set; }
        public string? City { get; set; }
        public string? STATE { get; set; }
        public string? ZipCode { get; set; }
        public string? PhoneNumber { get; set; }
        public int? CategoryID { get; set; }
        public string? Website { get; set; }
        public decimal? Rating { get; set; }
    }
}
