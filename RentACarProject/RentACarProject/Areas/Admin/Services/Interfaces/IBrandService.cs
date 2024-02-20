using RentACarProject.Models;

namespace RentACarProject.Areas.Admin.Services.Interfaces
{
    public interface IBrandService
    {
        public Task<bool> AddBrandAsync(Brand brand);
        public Task<List<Brand>> GetAllBrandAsync();
        public Task<Brand> GetBrandByIdAsync(int id);
        public Task<bool> UpdateBrandAsync(Brand brand);

        public Task<bool> DeleteBrandAsync(int id);
    }
}
