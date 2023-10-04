<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registros Contables.aspx.cs" Inherits="CRUD_Contable.Registros_Contables" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 36px;
        }
    </style>
</head>
<body>
    <div>
        <span>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx">Ir al Home</asp:HyperLink>
        </span>
    <form id="form1" runat="server">
        <table>
          
  <tr>
    <td class="auto-style1">
      <asp:TextBox ID="TextBox1" class="form-control-sm" runat="server" TextMode="Number" ToolTip="Monto del Registro" PlaceHolder="Monto" Height="27px"></asp:TextBox>
    </td>
    <td class="auto-style1" >
      <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" CssClass="js-example-basic-single form-control-sm" AutoPostBack="True" DataSourceID="DdListCuenta" DataTextField="descripcion" DataValueField="id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Height="30px" Width="177px">
 </asp:DropDownList>
    </td>
    <td class="auto-style1">
        <asp:DropDownList ID="DropDownList3" CssClass="js-example-basic-single form-control-sm" runat="server" Height="30px" Width="124px">
    <asp:ListItem Value="false">Debe</asp:ListItem>
    <asp:ListItem Value="true">Haber</asp:ListItem>
</asp:DropDownList>
    </td>
      <td class="auto-style1">
    <asp:Button ID="Button1" runat="server" Text="Agregar" OnClick="Button1_Click" Width="100px" class="btn btn-primary btn-sm" />
</td>
      <td class="auto-style1">
    <asp:Button ID="Button2" runat="server" Text="Modificar" OnClick="Button2_Click" Width="100px" class="btn btn-primary btn-sm" />
          </td>
      <td class="auto-style1">
          <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</td>
      
  </tr>
           
<tr>
  <td>
      <asp:DropDownList ID="DropDownList2"  runat="server" AutoPostBack="True" PlaceHolder="Selecione registro a borrar" DataSourceID="Crud" CssClass="js-example-basic-single form-control-sm" DataTextField="id" DataValueField="id"  OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" Width="167px">
</asp:DropDownList>
      </td>
    <td colspan="2">
     <asp:TextBox ID="TextBox2" CssClass="form-control-sm" runat="server" Width="300px" ReadOnly="True"></asp:TextBox>
    </td>
     <td colspan="2">
    <asp:Button ID="Button3" runat="server" Text="Borrar" OnClick="Button3_Click" Width="200px" class="btn btn-primary btn-sm"  />
 </td>

    </tr>
                
      </table>     
            
            
            
            
            
           
            
            
            <asp:Table ID="Table1" runat="server" Width="502px" CssClass="table" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" GridLines="Both">
            </asp:Table>
  
            
    </form>
        </div>
    <asp:SqlDataSource ID="Crud" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" DeleteCommand="DELETE FROM [ResgistrosContables] WHERE [id] = @id" InsertCommand="INSERT INTO ResgistrosContables(idCuenta, monto, tipo) VALUES (@idCuenta, @monto, @tipo)" SelectCommand="SELECT ResgistrosContables.monto, ResgistrosContables.tipo, Cuentas.descripcion, ResgistrosContables.id FROM ResgistrosContables INNER JOIN Cuentas ON ResgistrosContables.idCuenta = Cuentas.id" UpdateCommand="UPDATE [ResgistrosContables] SET [idCuenta] = @idCuenta, [monto] = @monto, [tipo] = @tipo WHERE [id] = @id">
        <DeleteParameters>
            <asp:ControlParameter ControlID="DropDownList2" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="TextBox1" Name="monto" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList3" Name="tipo" PropertyName="SelectedValue" Type="Boolean" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="idCuenta" PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="TextBox1" Name="monto" PropertyName="Text" Type="Int32" />
            <asp:ControlParameter ControlID="DropDownList3" Name="tipo" PropertyName="SelectedValue" Type="Boolean" />
            <asp:ControlParameter ControlID="DropDownList2" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DdListCuenta" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [Cuentas]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DdListRegistros" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [ResgistrosContables]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT * FROM [ResgistrosContables] WHERE ([id] = @id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList2" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:cadena %>" SelectCommand="SELECT ResgistrosContables.id, ResgistrosContables.monto, ResgistrosContables.tipo, Cuentas.descripcion FROM ResgistrosContables INNER JOIN Cuentas ON ResgistrosContables.idCuenta = Cuentas.id WHERE (ResgistrosContables.id = @id)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList2" Name="id" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
</body>
</html>
