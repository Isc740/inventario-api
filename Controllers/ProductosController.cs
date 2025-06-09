using ADSO_Proyect.Models;
using Microsoft.AspNetCore.Mvc;

namespace ADSO_Proyect.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductosController : GenericController<Producto>
    {
        public ProductosController(InvContext context) : base(context)
        {
        }
    }
}