using RentACarProject.Models;

namespace RentACarProject.Areas.Admin.Services.Interfaces
{
    public interface ICarService
    {
        public Task<bool> AddCarAsync(Car car);
        public Task<List<Car>> GetAllCarsAsync();
        public Task<Car> GetCarByIdAsync(int id);
        public Task<bool> UpdateCarAsync(Car car);  
        public Task<bool> DeleteCarAsync(int id);

    }
}
