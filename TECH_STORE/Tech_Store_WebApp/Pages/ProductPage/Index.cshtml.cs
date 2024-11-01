using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Tech_BussinessObjects;

namespace Tech_Store_WebApp.Pages.ProductPage
{
    public class IndexModel : PageModel
    {
        private readonly Tech_BussinessObjects.PRN221_ASSIGNMENTContext _context;

        public IndexModel(Tech_BussinessObjects.PRN221_ASSIGNMENTContext context)
        {
            _context = context;
        }

        public IList<Product> Product { get;set; } = default!;

        public async Task OnGetAsync()
        {
            if (_context.Products != null)
            {
                Product = await _context.Products
                .Include(p => p.Category).ToListAsync();
            }
        }
    }
}
