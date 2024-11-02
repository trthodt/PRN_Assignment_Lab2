using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Tech_BussinessObjects;
using Tech_Services.Interface;

namespace Tech_Store_WebApp.Pages.ProductPage
{
    public class DetailsModel : PageModel
    {
        private readonly IProductService _context;

        public DetailsModel(IProductService context)
        {
            _context = context;
        }

      public Product Product { get; set; } = default!; 

        public async Task<IActionResult> OnGetAsync(int id)
        {
            if (id == null || _context.GetProducts() == null)
            {
                return NotFound();
            }

            var product = _context.GetProduct(id);
            if (product == null)
            {
                return NotFound();
            }
            else 
            {
                Product = product;
            }
            return Page();
        }
    }
}
