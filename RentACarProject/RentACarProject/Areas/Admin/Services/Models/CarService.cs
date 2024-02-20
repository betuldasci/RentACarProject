using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using RentACarProject.Areas.Admin.Services.Interfaces;
using RentACarProject.Data;
using RentACarProject.Models;

namespace RentACarProject.Areas.Admin.Services.Models
{
    public class CarService : ICarService
    {
        ApplicationDbContext db;
        private readonly ILogger<CarService> _logger;
        public CarService(ApplicationDbContext db, ILogger<CarService> logger)
        {
            this.db = db;
            _logger = logger;

        }
        public Task<bool> AddCarAsync(Car car)
        {
            var result = false;
            if (car != null)
            {
                db.Car.AddAsync(car);
                db.SaveChanges();
                result = true;
            }
            return Task.FromResult(result);
        }

        public Task<bool> DeleteCarAsync(int id)
        {
            var car = db.Car.FirstOrDefault(c => c.Id == id && !c.IsDelete);
            var result = false;
            if (car != null)
            {
                car.IsDelete = true;
                db.SaveChanges();
                result = true;
            }
            return Task.FromResult(result);
        }

        public Task<List<Car>> GetAllCarsAsync()
        {
            var list = db.Car.Where(x => !x.IsDelete).Include(car=>car.Brand).ToListAsync();
            return list;
        }

        public Task<Car> GetCarByIdAsync(int id)
        {

            var car = db.Car.Include(x => x.Brand).FirstOrDefaultAsync(x => x.Id == id && !x.IsDelete);
            return car;
        }

        public async Task<bool> UpdateCarAsync(Car car)
        {
           var updateCar = await db.Car.FirstOrDefaultAsync(x=>x.Id== car.Id && !x.IsDelete);
            var result = false;
            if (updateCar != null)
            {
                updateCar.BrandId = car.BrandId;
                updateCar.Year = car.Year;
                updateCar.Description = car.Description;
                updateCar.DoorNumber = car.DoorNumber;
                updateCar.Price = car.Price;
                updateCar.IsStatus = car.IsStatus;
                updateCar.Model = car.Model;
                updateCar.Rentals = car.Rentals;
                if (!string.IsNullOrEmpty(car.Image))
                {
                    updateCar.Image = car.Image;
                }
                db.SaveChanges();
                result = true;
            }
            return result;
        }
    }
}
