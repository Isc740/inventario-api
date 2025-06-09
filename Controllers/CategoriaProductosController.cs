using ADSO_Proyect.Models;
using Microsoft.AspNetCore.Mvc;

namespace ADSO_Proyect.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoriaProductosController : GenericController<CategoriaProducto>
    {
        public CategoriaProductosController(InvContext context) : base(context)
        {
        }
    }
}
