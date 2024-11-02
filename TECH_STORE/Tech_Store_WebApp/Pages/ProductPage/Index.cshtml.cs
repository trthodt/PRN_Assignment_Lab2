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
    public class IndexModel : PageModel
    {
        private readonly IProductService _context;

        public IndexModel(IProductService context)
        {
            _context = context;
        }

        public IList<Product> Product { get;set; } = default!;

        public async Task OnGetAsync()
        {
            if (_context.GetProducts() != null)
            {
                Product = _context.GetProducts();
            }
        }
    }
}
