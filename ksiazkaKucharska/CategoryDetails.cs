using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ksiazkaKucharska.Components
{
    public class CategoryDetails
    {
        public int Id { get; set; }
        public string Name { get; set; }

        public CategoryDetails(int id, string name)
        {
            Id = id;
            this.Name = name;
        }

        public CategoryDetails() { }
    }
}