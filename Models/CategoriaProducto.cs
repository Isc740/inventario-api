using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSO_Proyect.Models
{
    public class CategoriaProducto
    {
        [Key]
        public int CatID { get; set; }

        public int? IvaIDFK { get; set; }
        [ForeignKey("IvaIDFK")]
        public virtual Iva Iva { get; set; }

        public string CatDescripcion { get; set; }

        public bool Eliminado { get; set; } = false;

        public virtual ICollection<Producto> Productos { get; set; } = new List<Producto>();
    }
}
