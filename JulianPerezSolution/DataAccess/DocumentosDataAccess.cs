using Entities;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess
{
    public class DocumentosDataAccess
    {
        Acceso acceso;
        public DocumentosDataAccess()
        {
            acceso = Acceso.GetInstance;
        }

        public Documento GetDocumentoById(int id)
        {
            Documento documento = new Documento();
            DataTable tabla = acceso.Leer("GetDocumentoByID", new SqlParameter[]
            {
                new SqlParameter("@IdDocumento", id)
            });
            foreach (DataRow fila in tabla.Rows)
            {
                documento= MapperHelpers.MapearDocumento(fila);
            }
            return documento;
        }

        public IList<Documento> GetEmpleados()
        {
            IList<Documento> documentos = new List<Documento>();
            DataTable tabla = acceso.Leer("GetDocumentos", null);
            foreach (DataRow fila in tabla.Rows)
                documentos.Add(MapperHelpers.MapearDocumento(fila));

            return documentos;
        }

        
    }
}
