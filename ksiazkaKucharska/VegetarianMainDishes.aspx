<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site2.Master" CodeBehind="VegetarianMainDishes.aspx.cs" Inherits="ksiazkaKucharska.VegetarianMainDishes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3 style="font-weight: normal; padding-top: 3%; margin:0; margin-left: 5%; font-family: 'Dosis', sans-serif; color:black; font-size: 2em;">Dania główne wegetariańskie:</h3>
    <br/><br/>
    <asp:GridView style="float: left; color:black; margin-right: 10%; margin-left: 5%; " ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="ID" BorderColor="Black" BorderStyle="None" BorderWidth="0px" GridLines="Vertical" HorizontalAlign="Center" ShowFooter="True" Width="400px">
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
            </asp:GridView>
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
            <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/VegetarianMainDishes.xml"></asp:XmlDataSource>

            <asp:XmlDataSource ID="XmlDataSource2" runat="server" DataFile="~/VegetarianMainDishes.xml"></asp:XmlDataSource>

            <br />
        </div>
</asp:Content>
