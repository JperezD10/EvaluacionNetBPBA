using Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class EmpleadoDataAccess
    {
        Acceso acceso;
        DocumentosDataAccess documentosDataAccess;
        public EmpleadoDataAccess()
        {
            acceso = Acceso.GetInstance;
            documentosDataAccess = new DocumentosDataAccess();
        }

        public IList<Empleado> GetEmpleados()
        {
            IList<Empleado> empleados = new List<Empleado>();
            DataTable tabla = acceso.Leer("GetEmpleados", null);
            foreach (DataRow fila in tabla.Rows)
            {
                Empleado empleado = MapperHelpers.MapearEmpleado(fila);
                empleado.TipoDoc = documentosDataAccess.GetDocumentoById(empleado.IdTipoDto.Value).Descripcion;
                empleados.Add(empleado);
            }

            return empleados;
        }

        public IList<Empleado> GetEmpleadosByApellido(string Apellido)
        {
            IList<Empleado> empleados = new List<Empleado>();
            DataTable tabla = acceso.Leer("GetEmpleadosByApellido", new SqlParameter[]
            {
                new SqlParameter("@Apellido", Apellido)
            });
            foreach (DataRow fila in tabla.Rows)
            {
                Empleado empleado = MapperHelpers.MapearEmpleado(fila);
                empleado.TipoDoc = documentosDataAccess.GetDocumentoById(empleado.IdTipoDto.Value).Descripcion;
                empleados.Add(empleado);
            }

            return empleados;
        }

        public Empleado CrearEmpleado(Empleado empleado)
        {
            acceso.Escribir("RegistrarEmpleado", new SqlParameter[]
            {
                new SqlParameter("@Codigo",empleado.Codigo),
                new SqlParameter("@Apellido",empleado.Apellido),
                new SqlParameter("@Nombre",empleado.Nombre),
                new SqlParameter("@FechaAlta",empleado.FechaAlta),
                new SqlParameter("@IdTipoDto",empleado.IdTipoDto),
                new SqlParameter("@NumDocumento",empleado.NumDocumento),
            });
            return empleado;
        }

        public bool EditarEmpleado(Empleado empleado)
        {
            var result = acceso.Escribir("EditarEmpleado", new SqlParameter[]
            {
                new SqlParameter("@Id",empleado.Id),
                new SqlParameter("@Codigo",empleado.Codigo),
                new SqlParameter("@Apellido",empleado.Apellido),
                new SqlParameter("@Nombre",empleado.Nombre),
                new SqlParameter("@FechaAlta",empleado.FechaAlta),
                new SqlParameter("@IdTipoDto",empleado.IdTipoDto),
                new SqlParameter("@NumDocumento",empleado.NumDocumento),
            });
            return result > 0;
        }

        public void EliminarEmpleado(int id)
        {
            acceso.Escribir("EliminarEmpleado", new SqlParameter[]
            {
                new SqlParameter("@Id",id),
            });
        }
    }
}
