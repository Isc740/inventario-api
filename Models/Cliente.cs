using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSO_Proyect.Models
{
    public class Cliente
    {
        [Key]
        public int CliID { get; set; }

        public string CliNombre { get; set; }

        public string CliApellido { get; set; }

        public string CliEmail { get; set; }

        public string CliContraseña { get; set; }

        public int? RolIDFK { get; set; }
        [ForeignKey("RolIDFK")]
        public virtual Rol Rol { get; set; }

        public bool Eliminado { get; set; } = false;

        public virtual ICollection<Factura> Facturas { get; set; } = new List<Factura>();
    }
}
