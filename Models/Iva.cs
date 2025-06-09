using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ADSO_Proyect.Models
{
    public class Iva
    {
        [Key]
        public int IvaID { get; set; }

        public decimal IvaPorcentajeDecimal { get; set; }

        public bool Eliminado { get; set; } = false;

        public virtual ICollection<CategoriaProducto> CategoriaProductos { get; set; } = new List<CategoriaProducto>();
    }
}
