using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ksiazkaKucharska.Components
{
    public class RecipeDetails
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Realization { get; set; }
        public int Portion { get; set; }
        public string TimeBuild { get; set; }
        public string Category { get; set; }
        public int Category_Id { get; set; }
        public string Ingredient { get; set; }
       // public int Ingredient_Id { get; set; }

        public RecipeDetails() { }

        public RecipeDetails(int id, string name, string realization, int portion, string time)
        {
            Id = id;
            Name = name;
            Realization = realization;
            Portion = portion;
            TimeBuild = time;
        }

        public RecipeDetails(int id, string name, string realization, int portion, string time, string ingredient, string category, int category_id)
        {
            Id = id;
            Name = name;
            Realization = realization;
            Portion = portion;
            TimeBuild = time;
            this.Category = category;
            this.Category_Id = category_id;
            this.Ingredient = ingredient;
           // this.Ingredient_Id = ingredient_id;
        }
    }
}