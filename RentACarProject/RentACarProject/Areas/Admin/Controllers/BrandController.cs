using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using RentACarProject.Areas.Admin.Services.Interfaces;
using RentACarProject.GenericModels;
using RentACarProject.Models;

namespace RentACarProject.Areas.Admin.Controllers
{
    [Area("Admin")]
    [Authorize(Roles = Other.Role_Admin)]
    public class BrandController : Controller
    {
        private readonly IBrandService brandService;
        private readonly UploadImage uploadImage;

        public BrandController(IBrandService brandService, UploadImage uploadImage)
        {
            this.brandService = brandService;
            this.uploadImage = uploadImage;
        }
        public async Task<IActionResult> Index()
        {
            var list = await brandService.GetAllBrandAsync();
            return View(list);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create(Brand brand)
        {
            if (ModelState.IsValid)
            {
                var files = HttpContext.Request.Form.Files;
                string image = uploadImage.Image(files, "brand");
                brand.Image = image == null ? "empty.jpg" : image;

                TempData["Message"] = await brandService.AddBrandAsync(brand) ?
                        "Brand Added Successful" : "";
            }

            return View();
        }


        public async Task<IActionResult> Edit(int id = 0)
        {
            var brand = await brandService.GetBrandByIdAsync(id);
            if (brand == null)
            {
                return NotFound();
            }
            return View(brand);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Brand brand)
        {
            if (ModelState.IsValid)
            {
                var files = HttpContext.Request.Form.Files;
                string image = uploadImage.Image(files, "brand");
                if (image != null)
                {
                    brand.Image = image;
                }
                var result = await brandService.UpdateBrandAsync(brand);



                TempData["Message"] = result ?
                        "Brand Edit Successful" : "";
            }
            return View(brand);
        }

        public async Task<IActionResult> Delete(int id = 0)
        {
            var result = await brandService.DeleteBrandAsync(id);

            TempData["Message"] = result ?
                    "Brand Deleted Successful" : "Not Found Brand";

            return RedirectToAction("Index");
        }

    }
}
