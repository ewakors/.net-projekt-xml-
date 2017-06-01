<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site2.Master" CodeBehind="HomePage.aspx.cs" Inherits="ksiazkaKucharska.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <article style="padding-top: 1%; color:black; font-family: 'Dosis', sans-serif; ">
        <h1 style="font-size: 3em; margin-left:120px">  Książka kucharska</h1>
       
        <p style="font-family: Arial, sans-serif;  font-size: 14pt; margin-left:120px;margin-right:120px">
            Zbiór przepisów kulinarnych, opisujących sposób przygotowywania danych potraw. Współczesne książki kucharskie są na ogół ułożone według 
            jakiegoś tematu przewodniego i zawierają przepisy np. kuchni narodowych czy regionalnych bądź spełniające wymagania danej diety
             (np. książki kucharskie dla diabetyków, wegetarian czy osób odchudzających się). Mogą też zawierać przepisy na określony typ potraw,
             np. ciasta, sałatki, przetwory z owoców czy potrawy mięsne. Obecnie są często ilustrowane fotografiami pokazującymi gotowe dania.
        </p>

        <h1 style="font-size: 3em; margin-left:120px">Przepis na dziś: </h1>
         <h2 style=" margin-left:120px">
             Spaghetti Bolognese
          </h2>
                <iframe style=" margin-left: 30%;"width="560" height="315" 
                    src="https://www.youtube.com/embed/5W6CEis7np4?rel=0&amp;showinfo=0?rel=0&autoplay=0"></iframe>

    </article>
</asp:Content>


