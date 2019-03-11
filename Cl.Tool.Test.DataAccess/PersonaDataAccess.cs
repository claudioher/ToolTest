using Cl.Tool.Test.Business.Entity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cl.Tool.Test.DataAccess
{
    public class PersonaDataAccess
    {
        /// <summary>
        /// Método para listar las personas
        /// </summary>
        /// <returns></returns>
        public List<PersonaEntity> Personas_Lst()
        {
            var sql = new Core.SqlServer();
            var lista = new List<PersonaEntity>();
            var tabla = new DataTable();

            try
            {
                if (sql.Conecta())
                {
                    var adapter = new SqlDataAdapter("SP_PERSONA_LST", sql.Connection);
                    adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                    adapter.Fill(tabla);
                    foreach(DataRow row in tabla.Rows)
                    {
                        var item = new PersonaEntity();
                        item.Id = Convert.ToInt32(row["ID"]);
                        item.Nombres = row["Nombres"].ToString();
                        item.Email = row["Email"].ToString();
                        item.Cedula = Convert.ToInt32(row["Cedula"]);
                        item.IdCargo = Convert.ToInt32(row["ID_Cargo"]);
                        item.NombreCargo = row["NombreCargo"].ToString();
                        lista.Add(item);
                    }
                }
            }
            catch(Exception ex)
            {
                Console.Write(ex.Message);
                lista = null;
            }

            return lista;
        }

        /// <summary>
        /// Método para buscar la cedula
        /// </summary>
        /// <param name="cedula"></param>
        /// <returns></returns>
        public int Persona_Fnd_Cedula(int cedula)
        {
            var sql = new Core.SqlServer();
            var salida = 0;
            var tabla = new DataTable();

            try
            {
                if (sql.Conecta())
                {
                    var adapter = new SqlDataAdapter("SP_PERSONA_FND_CEDULA", sql.Connection);
                    adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                    adapter.SelectCommand.Parameters.Add("@CEDULA", SqlDbType.Int).Value = cedula;
                    adapter.Fill(tabla);
                    salida = tabla.Rows.Count;                    
                }
            }
            catch(Exception ex)
            {
                Console.Write(ex.Message);
                salida = 0;
            }

            return salida;
        }
        
        /// <summary>
        /// Método para eliminar una persona
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int Persona_Era(int id)
        {
            var sql = new Core.SqlServer();
            var salida = 0;
            var tabla = new DataTable();

            try
            {
                if (sql.Conecta())
                {
                    var adapter = new SqlDataAdapter("SP_PERSONA_ERA", sql.Connection);
                    adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
                    adapter.SelectCommand.Parameters.Add("@ID", SqlDbType.Int).Value = id;
                    adapter.Fill(tabla);
                    salida = tabla.Rows.Count;
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
                salida = 0;
            }

            return salida;
        }

        /// <summary>
        /// Método para agregar una persona
        /// </summary>
        /// <param name="cedula"></param>
        /// <param name="nombres"></param>
        /// <param name="email"></param>
        /// <param name="idCargo"></param>
        public void Persona_Add(int cedula, string nombres, string email, int idCargo)
        {
            var sql = new Core.SqlServer();

            try
            {
                if (sql.Conecta())
                {
                    var command = new SqlCommand("SP_PERSONA_ADD", sql.Connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@CEDULA", SqlDbType.Int).Value = cedula;
                    command.Parameters.Add("@NOMBRES", SqlDbType.NVarChar).Value = nombres;
                    command.Parameters.Add("@EMAIL", SqlDbType.NVarChar).Value = email;
                    command.Parameters.Add("@IDCARGO", SqlDbType.Int).Value = idCargo;
                    command.ExecuteNonQuery();
                }                
            }
            catch(Exception ex)
            {
                Console.Write(ex.Message);
            }
        }

        /// <summary>
        /// Método para actualizar una persona
        /// </summary>
        /// <param name="id"></param>
        /// <param name="cedula"></param>
        /// <param name="nombres"></param>
        /// <param name="email"></param>
        /// <param name="idCargo"></param>
        public void Persona_Upd(int id, int cedula, string nombres, string email, int idCargo)
        {
            var sql = new Core.SqlServer();

            try
            {
                if (sql.Conecta())
                {
                    var command = new SqlCommand("SP_PERSONA_UPD", sql.Connection);
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add("@ID", SqlDbType.Int).Value = id;
                    command.Parameters.Add("@CEDULA", SqlDbType.Int).Value = cedula;
                    command.Parameters.Add("@NOMBRES", SqlDbType.NVarChar).Value = nombres;
                    command.Parameters.Add("@EMAIL", SqlDbType.NVarChar).Value = email;
                    command.Parameters.Add("@IDCARGO", SqlDbType.Int).Value = idCargo;
                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
            }
        }
    }
}
