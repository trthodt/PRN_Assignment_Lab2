namespace Tech_Store_WebApp
{
    using Microsoft.AspNetCore.Mvc;

    public class AccountController : Controller
    {
        public IActionResult Logout()
        {
            HttpContext.Session.Remove("Role");
            return RedirectToAction("/Login");
        }
    }
}
