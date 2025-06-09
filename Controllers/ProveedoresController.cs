




using ADSO_Proyect.Models;
using Microsoft.AspNetCore.Mvc;

namespace ADSO_Proyect.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProveedoresController : GenericController<Proveedor>
    {
        public ProveedoresController(InvContext context) : base(context)
        {
        }
    }
}
