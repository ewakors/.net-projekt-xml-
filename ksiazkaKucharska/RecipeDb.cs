using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace ksiazkaKucharska.Components
{
    public class RecipeDb
    {
        private string connectionString;

        public RecipeDb()
        {
            connectionString = WebConfigurationManager.ConnectionStrings["MBase"].ConnectionString;
        }

        public RecipeDb(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public List<RecipeDetails> SelectAllRecipes()
        {

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("recipe_select_all", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader;
            List<RecipeDetails> recipes = new List<RecipeDetails>();
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                foreach (IDataRecord record in GetFromReader(reader))
                {
                    RecipeDetails recipe = new RecipeDetails((int)record[0], record[1].ToString(), record[2].ToString(), (int)record[3], record[4].ToString());
                    recipes.Add(recipe);
                }

            }
            catch (SqlException err)
            {
                throw new ApplicationException("Recipe data error.");
            }
            finally
            {
                con.Close();
            }
            return recipes;
        }

        public DataSet SelectAllRecipesByCategoryId(int Category_Id)
        {

            string query = "SELECT * FROM Category c inner join Recipe r on c.Id = r.Category_Id Where ([Category_Id] = @Category_Id)";

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand com = new SqlCommand(query, con);

            com.Parameters.AddWithValue("@Category_Id", Category_Id.ToString());

            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();

            da.Fill(ds);
            return ds;
        }

        IEnumerable<IDataRecord> GetFromReader(IDataReader reader)
        {
            while (reader.Read()) yield return reader;
        }
    }
}