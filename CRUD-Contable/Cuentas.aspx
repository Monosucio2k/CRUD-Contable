<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cuentas.aspx.cs" Inherits="CRUD_Contable.Cuentas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col">
    <span>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Ir al Home</asp:HyperLink></span>
    <form id="form1" runat="server">
        <table>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox1" class="form-control-sm" runat="server" AutoPostBack="True"></asp:TextBox>
                    </td>
                <td>
            <asp:Button ID="Button1" runat="server" Text="Agregar" Width="95px" OnClick="Button1_Click" class="btn btn-primary btn-sm"/>
                    </td>
                <td>
                    <asp:Button ID="Button2" runat="server" Text="Modificar" class="btn btn-primary btn-sm" OnClick="Button2_Click" />
                    </td>
                <td>
            <asp:Label ID="Label1" runat="server"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td>
             <asp:DropDownList ID="DropDownList1" runat="server" Width="170px" AutoPostBack="True" CssClass="js-example-basic-single" DataSourceID="Crud" DataTextField="descripcion" DataValueField="id"  OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ToolTip="Selecciona una cuenta">
 </asp:DropDownList>
                    </td>
                <td>
 <asp:Button ID="Button3" runat="server" Text="Borrar" Width="90px" class="btn btn-primary btn-sm" OnClick="Button3_Click" />
                    </td>
                </tr>
                </table>
    </form>
    </div>
    </div>
    </div>
    <asp:SqlDataSource ID="SelectDdList" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Cuentas] WHERE ([id] = @id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="Crud" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [Cuentas] WHERE [id] = @id" InsertCommand="INSERT INTO [Cuentas] ([descripcion]) VALUES (@descripcion)" SelectCommand="SELECT * FROM [Cuentas]" UpdateCommand="UPDATE [Cuentas] SET [descripcion] = @descripcion WHERE [id] = @id">
        <DeleteParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="descripcion" PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="descripcion" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="DropDownList1" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
</body>
</html>
