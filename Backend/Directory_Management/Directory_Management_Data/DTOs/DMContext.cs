using Microsoft.EntityFrameworkCore;

namespace DirectoryManagementData.DTOs
{
    public class DMContext : DbContext
    {
        public DMContext(DbContextOptions<DMContext> options) : base(options)
        {
        }

        public DbSet<BusinessModel> tb_BusinessList { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<BusinessModel>(entity =>
            {
                entity.ToTable("tb_BusinessList");

                entity.Property(e => e.Name)
                      .HasMaxLength(50);
            });
        }
    }
}
