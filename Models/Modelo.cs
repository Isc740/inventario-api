using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ADSO_Proyect.Models
{
    public class Modelo
    {
        [Key]
        public int ModID { get; set; }

        public string ModDescripcion { get; set; }

        public bool Eliminado { get; set; } = false;

        public virtual ICollection<Producto> Productos { get; set; } = new List<Producto>();
    }
}
