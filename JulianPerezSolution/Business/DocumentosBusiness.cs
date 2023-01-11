using DataAccess;
using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public class DocumentosBusiness
    {
        DocumentosDataAccess DocumentosDataAccess;
        public DocumentosBusiness()
        {
            DocumentosDataAccess = new DocumentosDataAccess();
        }

        public IList<Documento> GetDocumentos() => DocumentosDataAccess.GetEmpleados();

    }
}
