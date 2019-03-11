
namespace Cl.Tool.Test.DataAccess
{
    using Cl.Tool.Test.Business.Entity;
    using Cl.Tool.Test.DataAccess.Core;
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.SqlClient;  

    public class CargoDataAccess
    {
        /// <summary>
        /// Método para obtener la lista de cargos
        /// </summary>
        /// <returns></returns>
        public List<CargoEntity> Cargo_Lst()
        {
            var sql = new SqlServer();
            var lista = new List<CargoEntity>();
            var tabla = new DataTable();

            try
            {
                if (sql.Conecta())
                {
                    var adapter = new SqlDataAdapter("SP_CARGO_LST", sql.Connection);
                    adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                    adapter.Fill(tabla);
                    foreach (DataRow row in tabla.Rows)
                    {
                        var item = new CargoEntity();
                        item.Id = Convert.ToInt32(row["Id_Cargo"]);
                        item.Nombre = row["Nombre"].ToString();
                        lista.Add(item);
                    }
                }                
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
                lista = null;
            }

            return lista;
        }
    }
}
