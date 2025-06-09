using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ADSO_Proyect.Models
{
    public class Marca
    {
        [Key]
        public int MarID { get; set; }

        public string MarDescripcion { get; set; }

        public bool Eliminado { get; set; } = false;

        public virtual ICollection<Producto> Productos { get; set; } = new List<Producto>();
    }
}
