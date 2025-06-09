using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ADSO_Proyect.Models
{
    public class Proveedor
    {
        [Key]
        public int PrvID { get; set; }

        public string PrvRazonSocial { get; set; }

        public bool Eliminado { get; set; } = false;

        public virtual ICollection<ProLotPrv> ProLotPrvs { get; set; } = new List<ProLotPrv>();
    }
}
