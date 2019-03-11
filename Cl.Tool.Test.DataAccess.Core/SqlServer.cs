
namespace Cl.Tool.Test.DataAccess.Core
{
    using System;    
    using System.Configuration;
    using System.Data.SqlClient;

    public class SqlServer
    {
        public SqlConnection Connection { get; set; }

        /// <summary>
        /// Método para conectar con la base de datos Sql Server
        /// </summary>
        /// <returns></returns>
        public bool Conecta()
        {
            var salida = false;

            try
            {
                Connection = new SqlConnection(ConfigurationManager.ConnectionStrings["DB_Tool_Test"].ConnectionString);
                Connection.Open();
                salida = true;
            }
            catch(Exception ex)
            {
                Console.Write(ex.Message);
            }

            return salida;
        }

        /// <summary>
        /// Método para desconectar la base de datos Sql Server
        /// </summary>
        /// <returns></returns>
        public bool Desconecta()
        {
            var salida = false;

            try
            {
                if (Connection.State == System.Data.ConnectionState.Open)
                {
                    Connection.Close();
                }
                salida = true;
            }
            catch(Exception ex)
            {
                Console.Write(ex.Message);
            }

            return salida;
        }
    }
}
