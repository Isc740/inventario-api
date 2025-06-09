using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text.Json.Serialization;
using Microsoft.AspNetCore.Mvc;

namespace ADSO_Proyect.Models
{
    public class Ciudad
    {
        [Key]
        public int CiuID { get; set; }

        public string CiuNombre { get; set; }

        public bool Eliminado { get; set; } = false;

        [JsonIgnore]
        public virtual ICollection<Factura> Facturas { get; set; } = new List<Factura>();
    }
}





