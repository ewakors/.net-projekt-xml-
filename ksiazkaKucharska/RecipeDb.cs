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
            CategoryDb categoryDb = new CategoryDb();
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("recipe_select_all", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataReader reader;
            List<RecipeDetails> recipes = new List<RecipeDetails>();
            List<CategoryDetails> categories = categoryDb.SelectAllCategory();
            try
            {
                con.Open();
                reader = cmd.ExecuteReader();
                foreach (IDataRecord record in GetFromReader(reader))
                {
                    CategoryDetails category = categories.Where(c => c.Id == Int32.Parse(record[6].ToString())).Single();
                    RecipeDetails recipe = new RecipeDetails((int)record[0], record[1].ToString(), record[2].ToString(), (int)record[3], record[4].ToString(),record[5].ToString(), category.Name,category.Id);
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

        public RecipeDetails SelectRecipeById(int Id)
        {
           // Id = 15;
            CategoryDb categoryDb = new CategoryDb();
            List<CategoryDetails> categories = categoryDb.SelectAllCategory();
            RecipeDetails recipe = new RecipeDetails();
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SELECT r.Id, r.Name, r.Realization, r.Portion, r.TimeBuild, r.Ingredient,r.Category_Id, c.Name From Category c Inner Join Recipe r on c.Id = r.Category_Id Where r.Id= @Id", con);
            cmd.Parameters.Add("@Id", SqlDbType.Int).Value = Id;
            SqlDataReader reader;
            try
            {
                    con.Open();
                    reader = cmd.ExecuteReader();
                    foreach (IDataRecord record in GetFromReader(reader))
                    {
                    CategoryDetails category = categories.Where(c => c.Id == Int32.Parse(record[6].ToString())).Single();
                    recipe = new RecipeDetails((int)record[0], record[1].ToString(), record[2].ToString(), (int)record[3], record[4].ToString(), record[5].ToString(), category.Name, category.Id);
                }            
            }
            catch
            {
                throw new ApplicationException("Recipe by id data error.");
            }
            finally
            {
                con.Close();
            }
            return recipe;
        }

        public DataSet SelectAllRecipesByCategoryId(int Category_Id)
        {

            string query = "SELECT r.Id, r.Name, r.Realization, r.Portion, r.TimeBuild, r.Ingredient,r.Category_Id, c.Name FROM Category c inner join Recipe r on c.Id = r.Category_Id Where ([Category_Id] = @Category_Id)";

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand com = new SqlCommand(query, con);

            com.Parameters.AddWithValue("@Category_Id", Category_Id.ToString());

            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();

            da.Fill(ds);
            return ds;
        }

        public int InsertRecipe(string Name, string Realization, int Portion, string TimeBuild, string Ingredient, int Category_Id)
        {
            int Id = 0;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("recipe_insert", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Name", SqlDbType.VarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@Realization", SqlDbType.VarChar, 1000));
            cmd.Parameters.Add(new SqlParameter("@Portion", SqlDbType.Int, 3));
            cmd.Parameters.Add(new SqlParameter("@TimeBuild", SqlDbType.VarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@Ingredient", SqlDbType.VarChar, 500));
            cmd.Parameters.Add(new SqlParameter("@Category_Id", SqlDbType.VarChar, 500));
            SqlParameter output = new SqlParameter("@Id", SqlDbType.Int, 4);
            output.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(output);
            cmd.Parameters["@Name"].Value = Name;
            cmd.Parameters["@Realization"].Value = "Realization";
            cmd.Parameters["@Portion"].Value = Portion;
            cmd.Parameters["@TimeBuild"].Value = TimeBuild;
            cmd.Parameters["@Ingredient"].Value = Ingredient;
            cmd.Parameters["@Category_Id"].Value = Category_Id;

            try
            {
                con.Open();
                var sqlRows = cmd.ExecuteNonQuery();
                Id = Int32.Parse(cmd.Parameters["@Id"].Value.ToString());
            }
            catch (SqlException err)
            {
                throw new ApplicationException("Recipe insert data error.");
            }
            finally
            {
                con.Close();
            }

            return Id;
        }

        public void UpdateRecipe(int Id, string Name, string TimeBuild, string Ingredient, int Category_Id, int Portion)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("recipe_update", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Id", SqlDbType.Int, 4));
            cmd.Parameters.Add(new SqlParameter("@Name", SqlDbType.VarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@TimeBuild", SqlDbType.VarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@Ingredient", SqlDbType.VarChar, 500));
            cmd.Parameters.Add(new SqlParameter("@Portion", SqlDbType.VarChar, 500));
            cmd.Parameters.Add(new SqlParameter("@Category_Id", SqlDbType.Int, 5));
            cmd.Parameters["@Id"].Value = Id;
            cmd.Parameters["@Name"].Value = Name;
            cmd.Parameters["@TimeBuild"].Value = TimeBuild;
            cmd.Parameters["@Ingredient"].Value = Ingredient;
            cmd.Parameters["@Portion"].Value = Portion;
            cmd.Parameters["@Category_Id"].Value = Category_Id;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException err)
            {
                //throw new ApplicationException("Recipe update data error.");
            }
            finally
            {
                con.Close();
            }
        }

        public void UpdateRecipeDetails(int Id, string Name, string TimeBuild, string Ingredient, int Category_Id, int Portion, string Realization)
        {
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("recipe_update", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Id", SqlDbType.Int, 4));
            cmd.Parameters.Add(new SqlParameter("@Name", SqlDbType.VarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@TimeBuild", SqlDbType.VarChar, 50));
            cmd.Parameters.Add(new SqlParameter("@Ingredient", SqlDbType.VarChar, 500));
            cmd.Parameters.Add(new SqlParameter("@Portion", SqlDbType.VarChar, 500));
            cmd.Parameters.Add(new SqlParameter("@Category_Id", SqlDbType.Int, 5));
            cmd.Parameters["@Id"].Value = Id;
            cmd.Parameters["@Name"].Value = Name;
            cmd.Parameters["@TimeBuild"].Value = TimeBuild;
            cmd.Parameters["@Ingredient"].Value = Ingredient;
            cmd.Parameters["@Portion"].Value = Portion;
            cmd.Parameters["@Category_Id"].Value = Category_Id;
            cmd.Parameters["@Realization"].Value = "Realization";

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException err)
            {
                //throw new ApplicationException("Recipe update data error.");
            }
            finally
            {
                con.Close();
            }
        }
        public void DeleteRecipe(int Id)
        {
            //SqlConnection con = new SqlConnection(connectionString);
            //SqlCommand cmd = new SqlCommand("recipe_delete", con);
            //cmd.CommandType = CommandType.StoredProcedure;
            //cmd.Parameters.Add("@Id", SqlDbType.Int).Value = Id;
            // cmd.Parameters["@Id"].Value = Id;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("Delete from Recipe where Id = @Id", con);
            cmd.Parameters.Add("@Id", SqlDbType.Int).Value = Id;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch(SqlException err)
            {
                throw new ApplicationException("Recipe delete data error");
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