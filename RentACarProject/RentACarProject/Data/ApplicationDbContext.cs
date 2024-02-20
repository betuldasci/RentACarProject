using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using RentACarProject.Models;

namespace RentACarProject.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Brand> Brand { get; set; }
        public DbSet<Car> Car { get; set; }
        public DbSet<Rental> Rental { get; set; }
        public DbSet<Payment> Payment { get; set; }
        public DbSet<ApplicationUser> ApplicationUser { get; set; }

    }
}
