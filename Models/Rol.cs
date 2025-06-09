using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ADSO_Proyect.Models
{
    public class Rol
    {
        [Key]
        public int RolID { get; set; }

        public string RolNombre { get; set; }

        public string RolDescripcion { get; set; }

        public virtual ICollection<Cliente> Clientes { get; set; } = new List<Cliente>();
    }
}
