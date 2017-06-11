using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace ksiazkaKucharska.Components
{
    public class CategoryDb
    {
        private string connectionString;

        public CategoryDb()
        {
            connectionString = WebConfigurationManager.ConnectionStrings["MBase"].ConnectionString;
        }

        public CategoryDb(string connetcionString)
        {
            this.connectionString = connectionString;
        }

        public List<CategoryDetails> SelectAllCategory()
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("category_select_all", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader;
            List<CategoryDetails> categories = new List<CategoryDetails>();
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                foreach(IDataRecord record in GetFromReader(reader))
                {
                    CategoryDetails category = new CategoryDetails((int)record[0], record[1].ToString());
                    categories.Add(category);
                }
            }
            catch (SqlException err)
            {
                throw new ApplicationException("Catagory data error");
            }
            finally
            {
                con.Close();
            }
            return categories;
        }

        public void DeleteCategory(int Id)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Delete from Category where Id = @Id", con);
            cmd.Parameters.Add("@Id", SqlDbType.Int).Value = Id;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException err)
            {
                throw new ApplicationException("Category delete data error");
            }
            finally
            {
                con.Close();
            }
        }

        IEnumerable<IDataRecord> GetFromReader(IDataReader reader)
        {
            while (reader.Read()) yield return reader;
        }
    }
}