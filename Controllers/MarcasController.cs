
using ADSO_Proyect.Models;
using Microsoft.AspNetCore.Mvc;

namespace ADSO_Proyect.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MarcasController : GenericController<Marca>
    {
        public MarcasController(InvContext context) : base(context)
        {
        }
    }
}
