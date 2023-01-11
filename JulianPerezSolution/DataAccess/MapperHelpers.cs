using Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class MapperHelpers
    {
        public static Empleado MapearEmpleado(DataRow fila)
        {
            return new Empleado()
            {
                Id = fila.Field<int>("Id"),
                Apellido = fila.Field<string>("Apellido"),
                Nombre = fila.Field<string>("Nombre"),
                Codigo = fila.Field<string>("Codigo"),
                FechaAlta = fila.Field<DateTime?>("FechaAlta"),
                IdTipoDto = fila.Field<int?>("IdTipoDto"),
                NumDocumento = fila.Field<int?>("NumDocumento"),
            };
        }

        public static Documento MapearDocumento(DataRow fila)
        {
            return new Documento()
            {
                Id = fila.Field<int>("Id"),
                Descripcion = fila.Field<string>("Descripcion")
            };
        }
    }
}
