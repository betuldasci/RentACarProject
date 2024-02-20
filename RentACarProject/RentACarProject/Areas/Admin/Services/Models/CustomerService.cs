using RentACarProject.Areas.Admin.Services.Interfaces;
using RentACarProject.Data;
using RentACarProject.Models;
using System.Reflection.PortableExecutable;

namespace RentACarProject.Areas.Admin.Services.Models
{
    public class CustomerService : ICustomerService
    {
        private readonly ApplicationDbContext db;
        public CustomerService(ApplicationDbContext db)
        {
            this.db = db;
        }
        public Task<bool> AddCustomerAsync(ApplicationUser user)
        {
            throw new NotImplementedException();
        }

        public Task<bool> DeleteCustomerAsync(ApplicationUser user)
        {
            throw new NotImplementedException();
        }

        public Task<List<ApplicationUser>> GetAllCustomerAsync()
        {
            var customers = db.ApplicationUser.ToList();
            var roles = db.Roles.ToList();
            var userRole = db.UserRoles.ToList();
            foreach (var custom in customers)
            {
                var roleId = userRole.FirstOrDefault(x=>x.UserId == custom.Id).RoleId;
                custom.Role = roles.FirstOrDefault(x => x.Id == roleId).Name;
            }
            return Task.FromResult(customers);
        }

        public Task<ApplicationUser> GetCustomerByIdAsync(int id)
        {
            throw new NotImplementedException();
        }

        public Task<bool> UpdateCustomerAsync(ApplicationUser user)
        {
            throw new NotImplementedException();
        }
    }
}
