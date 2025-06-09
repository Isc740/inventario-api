


using Microsoft.AspNetCore.Http;
using ADSO_Proyect.Models;
using Microsoft.AspNetCore.Mvc;

namespace ADSO_Proyect.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class IvasController : GenericController<Iva>
    {
        public IvasController(InvContext context) : base(context)
        {
        }
    }
}
