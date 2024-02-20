using RentACarProject.Models;

namespace RentACarProject.Areas.Admin.Services.Interfaces
{
    public interface ICustomerService
    {
        public Task<bool> AddCustomerAsync(ApplicationUser user);
        public Task<List<ApplicationUser>> GetAllCustomerAsync();
        public Task<ApplicationUser> GetCustomerByIdAsync(int id);
        public Task<bool> UpdateCustomerAsync(ApplicationUser user);
        public Task<bool> DeleteCustomerAsync(ApplicationUser user);

    }
}
