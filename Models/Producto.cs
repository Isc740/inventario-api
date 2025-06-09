using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ADSO_Proyect.Models
{
    public class Producto
    {
        [Key]
        public int ProID { get; set; }

        public byte[] ProImagen { get; set; }

        public string ProDescripcion { get; set; }

        public int? CatIDFK { get; set; }
        [ForeignKey("CatIDFK")]
        public virtual CategoriaProducto Categoria { get; set; }

        public int? MarIDFK { get; set; }
        [ForeignKey("MarIDFK")]
        public virtual Marca Marca { get; set; }

        public int? ModIDFK { get; set; }
        [ForeignKey("ModIDFK")]
        public virtual Modelo Modelo { get; set; }

        public bool Eliminado { get; set; } = false;

        public virtual ICollection<FacturaDetalle> FacturaDetalles { get; set; } = new List<FacturaDetalle>();
        public virtual ICollection<ProLotPrv> ProLotPrvs { get; set; } = new List<ProLotPrv>();
    }
}
