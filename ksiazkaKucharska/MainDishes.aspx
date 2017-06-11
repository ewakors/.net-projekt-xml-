<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site2.Master" CodeBehind="MainDishes.aspx.cs" Inherits="ksiazkaKucharska.MainDishes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="font-weight: normal; padding-top: 3%; margin:0; margin-left: 5%; font-family: 'Dosis', sans-serif; color:black; font-size: 2em;">Dania główne mięsne:</h3>
    <br/><br/>


<%--    <asp:GridView style="float: left; color:black; margin-right: 10%; margin-left: 5%; " ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="ID" BorderColor="Black" BorderStyle="None" BorderWidth="0px" GridLines="Vertical" HorizontalAlign="Center" ShowFooter="True" Width="400px">
                <AlternatingRowStyle BorderStyle="Solid" BorderWidth="0px" />
                <Columns>

                    <asp:BoundField DataField="Tytul" HeaderStyle-ForeColor ="Black" HeaderStyle-Font-Names="Arial" HeaderStyle-Font-Size="Medium" HeaderText="Nazwa oferty" SortExpression="Category" />

                    <asp:TemplateField HeaderText="Ilość porcji" HeaderStyle-ForeColor ="Black" HeaderStyle-Font-Names="Arial" HeaderStyle-Font-Size="Medium">
                        <ItemTemplate>
                            <%# XPath("Ilosc_porcji") %><br />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Czas przygotowania" HeaderStyle-ForeColor ="black" HeaderStyle-Font-Names="Arial" HeaderStyle-Font-Size="Medium">
                        <ItemTemplate>
                            <%# XPath("Czas_przygotowania") %><br />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:ButtonField CommandName="Select" Text="Więcej" ItemStyle-ForeColor="black" ItemStyle-Font-Names="Arial" ItemStyle-Font-Size="Small"/>
                </Columns>
                <EditRowStyle BorderStyle="None" />
                <FooterStyle BorderColor="black" BorderStyle="Solid" BorderWidth="1px" Height="0" Font-Size="0"/>
                <HeaderStyle BorderColor="black" BorderStyle="Solid" BorderWidth="1px" />
                <PagerSettings Visible="False" />
                <RowStyle BorderStyle="None" HorizontalAlign="Center" Wrap="True" />
            </asp:GridView>--%>
       <asp:DropDownList ID="DropDownListCategory" runat="server" DataSourceID="ObjectDataSourceCategory" DataTextField="Name" DataValueField="Id">
    </asp:DropDownList>
       <asp:GridView ID="GridView1" runat="server" 
           AutoGenerateColumns="False" 
           BackColor="#CCCCCC" 
           BorderColor="#999999" 
           BorderStyle="Solid"
           BorderWidth="3px" 
           CellPadding="4" 
           CellSpacing="2" 
           DataKeyNames="Id"
           DataSourceID="ObjectDataSourceRecipe" 
           ForeColor="Black"
           OnRowDeleting="GridView1_RowDeleting"
            OnRowUpdating="GridView1_RowUpdating" ShowFooter="True">
           <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ForeColor="Black"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" ForeColor="Black"></asp:LinkButton>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Button ID="ButtonUserAdd2" runat="server" Text="Dodaj" ForeColor="Black" OnClick="ButtonUserAdd2_Click"/>
                    </FooterTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" ForeColor="Black"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" ForeColor="Black"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
               <asp:TemplateField HeaderText="Id" SortExpression="Id">
                   <EditItemTemplate>
                       <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Id") %>'></asp:TextBox>
                   </EditItemTemplate>
                   <ItemTemplate>
                       <asp:Label ID="Label1" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="Name" SortExpression="Name">
                   <EditItemTemplate>
                       <asp:TextBox ID="TextBoxEditName" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                   </EditItemTemplate>
                   <FooterTemplate>
                       <asp:TextBox ID="TextBoxName" runat="server"></asp:TextBox>
                   </FooterTemplate>
                   <ItemTemplate>
                       <asp:Label ID="Label2" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>
              <%-- <asp:TemplateField HeaderText="Realization" SortExpression="Realization">
                   <EditItemTemplate>
                       <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Realization") %>'></asp:TextBox>
                   </EditItemTemplate>
                   <ItemTemplate>
                       <asp:Label ID="Label3" runat="server" Text='<%# Bind("Realization") %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>--%>
               <asp:TemplateField HeaderText="Portion" SortExpression="Portion">
                   <EditItemTemplate>
                       <asp:TextBox ID="TextBoxEditPortion" runat="server" Text='<%# Bind("Portion") %>'></asp:TextBox>
                   </EditItemTemplate>
                   <FooterTemplate>
                       <asp:TextBox ID="TextBoxPortion" runat="server"></asp:TextBox>
                   </FooterTemplate>
                   <ItemTemplate>
                       <asp:Label ID="Label4" runat="server" Text='<%# Bind("Portion") %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="Time" SortExpression="Time">
                   <EditItemTemplate>
                       <asp:TextBox ID="TextBoxEditTime" runat="server" Text='<%# Bind("TimeBuild") %>'></asp:TextBox>
                   </EditItemTemplate>
                   <FooterTemplate>
                       <asp:TextBox ID="TextBoxTime" runat="server"></asp:TextBox>
                   </FooterTemplate>
                   <ItemTemplate>
                       <asp:Label ID="Label5" runat="server" Text='<%# Bind("TimeBuild") %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>
               <asp:TemplateField HeaderText="Category" SortExpression="Category">
                   <EditItemTemplate>
                        <asp:DropDownList ID="DropDownListEditCategory" runat="server" DataSourceID="ObjectDataSourceCategory" DataTextField="Name" DataValueField="Id">
                       </asp:DropDownList>                   

                   </EditItemTemplate>
                   <FooterTemplate>
                       <asp:DropDownList ID="DropDownListCategoryAdd" runat="server" DataSourceID="ObjectDataSourceCategory" DataTextField="Name" DataValueField="Id">
                       </asp:DropDownList>
                       <asp:ObjectDataSource ID="ObjectDataSourceCategory" runat="server"
                 SelectMethod="SelectAllCategory" 
                 TypeName="ksiazkaKucharska.Components.CategoryDb"></asp:ObjectDataSource>
                   </FooterTemplate>
                   <ItemTemplate>
                       <asp:Label ID="Label6" runat="server" Text='<%# Bind("Category") %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>
              <%-- <asp:TemplateField HeaderText="Category_Id" SortExpression="Category_Id">
                   <EditItemTemplate>
                       <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("Category_Id") %>'></asp:TextBox>
                   </EditItemTemplate>
                   <ItemTemplate>
                       <asp:Label ID="Label7" runat="server" Text='<%# Bind("Category_Id") %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>--%>
               <asp:TemplateField HeaderText="Ingredient" SortExpression="Ingredient">
                   <EditItemTemplate>
                       <asp:TextBox ID="TextBoxEditIngredient" runat="server" Text='<%# Bind("Ingredient") %>'></asp:TextBox>
                   </EditItemTemplate>
                   <FooterTemplate>
                       <asp:TextBox ID="TextBoxIndredient" runat="server"></asp:TextBox>
                   </FooterTemplate>
                   <ItemTemplate>
                       <asp:Label ID="Label8" runat="server" Text='<%# Bind("Ingredient") %>'></asp:Label>
                   </ItemTemplate>
               </asp:TemplateField>
           </Columns>
           <FooterStyle BackColor="#CCCCCC" />
           <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
           <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
           <RowStyle BackColor="White" />
           <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
           <SortedAscendingCellStyle BackColor="#F1F1F1" />
           <SortedAscendingHeaderStyle BackColor="#808080" />
           <SortedDescendingCellStyle BackColor="#CAC9C9" />
           <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
       <br />
       <asp:MultiView ID="MultiView1" runat="server" >
                <asp:View ID="View1" runat="server">
                    <h3 style="font-weight: normal; margin:0; font-family: 'Dosis', sans-serif; color:black;font-size: 2em;">Przepis</h3>
                    <br/><br/>
                    <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataSourceID="XmlDataSource2" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" BackColor="White" Width="850px" >
                       
                         <fields>

                            <asp:TemplateField HeaderStyle-Font-Size="Medium" HeaderStyle-ForeColor ="black" HeaderStyle-Font-Names="Arial" HeaderText="Danie:" ItemStyle-ForeColor="Black" ItemStyle-Font-Names="Arial" ItemStyle-Font-Size="Medium">
                                <ItemTemplate>
                                    <%# XPath("@Tytul") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-Font-Size="Medium" HeaderStyle-ForeColor ="black" HeaderStyle-Font-Names="Arial" HeaderText="Ilość porcji:" ItemStyle-ForeColor="Black" ItemStyle-Font-Names="Arial" ItemStyle-Font-Size="Medium">
                                <ItemTemplate>
                                    <%# XPath("Ilosc_porcji") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderStyle-Font-Size="Medium" HeaderStyle-ForeColor ="black" HeaderStyle-Font-Names="Arial" HeaderText="Czas przygotowania:" ItemStyle-ForeColor="Black" ItemStyle-Font-Names="Arial" ItemStyle-Font-Size="Medium">
                                <ItemTemplate>
                                    <%# XPath("Czas_przygotowania") %>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="Category" HeaderStyle-Font-Size="Medium" HeaderStyle-ForeColor ="black" HeaderStyle-Font-Names="Arial" HeaderText="Kategoria:" ItemStyle-ForeColor="Black" ItemStyle-Font-Names="Arial" ItemStyle-Font-Size="Medium" SortExpression="Category" />
                            
                            <asp:TemplateField HeaderStyle-Font-Size="Medium" HeaderStyle-ForeColor ="black" HeaderStyle-Font-Names="Arial" HeaderText="Wykonanie:" ItemStyle-ForeColor="Black" ItemStyle-Font-Names="Arial" ItemStyle-Font-Size="Medium">
                                <ItemTemplate>
                                    <%# XPath("Wykonanie") %>
                                </ItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderStyle-Font-Size="Medium" HeaderStyle-ForeColor ="black" HeaderStyle-Font-Names="Arial" HeaderText="Składniki:">
                                <ItemTemplate>
                                    <asp:DataList ID="DataList1" runat="server" DataSource='<%# XPathSelect("Skladniki/Nazwa") %>' HeaderStyle-ForeColor="red" ItemStyle-ForeColor="black" ItemStyle-Font-Names="Arial" ItemStyle-Font-Size="Medium">
                                        <ItemTemplate>
                                            <%# XPath(".") %>
                                            <br/>
                                        </ItemTemplate>
                                    </asp:DataList>
                                </ItemTemplate>
                            </asp:TemplateField>

                        </fields>
                    </asp:DetailsView>
                </asp:View>
            </asp:MultiView>
            <br />
        <div style="overflow:auto;margin-left:50px">
            <br />
            <br />
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/MainDishes.xml"></asp:XmlDataSource>


            <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/MainDishes.xml"></asp:XmlDataSource>

            <asp:ObjectDataSource ID="ObjectDataSourceCategory" runat="server"
                 SelectMethod="SelectAllCategory" 
                 TypeName="ksiazkaKucharska.Components.CategoryDb">

            </asp:ObjectDataSource>



            <asp:ObjectDataSource ID="ObjectDataSourceRecipe" runat="server"
                 DeleteMethod="DeleteRecipe"
                 InsertMethod="InsertRecipe"
                 SelectMethod="SelectAllRecipes"
                 TypeName="ksiazkaKucharska.Components.RecipeDb"
                 UpdateMethod="UpdateRecipe">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Realization" Type="String" />
                    <asp:Parameter Name="Portion" Type="Int32" />
                    <asp:Parameter Name="TimeBuild" Type="String" />
                    <asp:Parameter Name="Ingredient" Type="String" />
                    <asp:Parameter Name="Category_Id" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="TimeBuild" Type="String" />
                    <asp:Parameter Name="Ingredient" Type="String" />
                    <asp:Parameter Name="Portion" Type="Int32" />
                    <asp:Parameter Name="Category_Id" Type="Int32" />
                </UpdateParameters>
            </asp:ObjectDataSource>



            <br />
        </div>
</asp:Content>
