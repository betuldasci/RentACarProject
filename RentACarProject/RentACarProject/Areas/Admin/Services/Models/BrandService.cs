using Microsoft.EntityFrameworkCore;
using RentACarProject.Areas.Admin.Services.Interfaces;
using RentACarProject.Data;
using RentACarProject.Models;

namespace RentACarProject.Areas.Admin.Services.Models
{
    public class BrandService : IBrandService
    {
        ApplicationDbContext db;
        public BrandService(ApplicationDbContext db)
        {
            this.db = db;
        }
        public Task<bool> AddBrandAsync(Brand brand)
        {
            var result = false;
            if (brand != null)
            {
                db.Brand.AddAsync(brand);
                db.SaveChanges();
                result = true;
            }
            return Task.FromResult(result);
        }

        public Task<bool> DeleteBrandAsync(int id)
        {
            var brand = db.Brand.FirstOrDefault(c => c.Id == id && !c.IsDelete);
            var result = false;
            if (brand != null)
            {
                brand.IsDelete = true;
                db.SaveChanges();
                result = true;
            }
            return Task.FromResult(result);
        }

        public Task<List<Brand>> GetAllBrandAsync()
        {
            var list = db.Brand.Where(x => !x.IsDelete).ToListAsync();
            return list;
        }

        public Task<Brand> GetBrandByIdAsync(int id)
        {
            var category = db.Brand.FirstOrDefaultAsync(x => x.Id == id && !x.IsDelete);
            return category;
        }

        public async Task<bool> UpdateBrandAsync(Brand brand)
        {
            var updateBrand = await db.Brand.FirstOrDefaultAsync(x => x.Id == brand.Id && !x.IsDelete);
            var result = false;
            if (updateBrand != null)
            {
                updateBrand.Name = brand.Name;

                updateBrand.IsStatus = brand.IsStatus;
                if (!String.IsNullOrEmpty(brand.Image))
                {
                    updateBrand.Image = brand.Image;
                }


                db.SaveChanges();
                result = true;
            }
            return result;
        }
    }
}
