

using ADSO_Proyect.Models;
using Microsoft.AspNetCore.Mvc;

namespace ADSO_Proyect.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ModelosController : GenericController<Modelo>
    {
        public ModelosController(InvContext context) : base(context)
        {
        }
    }
}
