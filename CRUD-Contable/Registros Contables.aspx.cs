using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD_Contable
{
    public partial class Registros_Contables : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                completarTabla();
            }
        }
        protected void completarTabla()
        {
            try
            {
                DataView dv = (DataView)Crud.Select(DataSourceSelectArguments.Empty);
                if (dv != null && dv.Count > 0)
                {
                    TableRow headerRow = new TableRow();

                    TableCell headerCell1 = new TableCell();
                    headerCell1.Text = "Cuenta";
                    headerCell1.Font.Bold = true;
                    headerRow.Cells.Add(headerCell1);

                    TableCell headerCell2 = new TableCell();
                    headerCell2.Text = "Tipo";
                    headerCell2.Font.Bold = true;
                    headerRow.Cells.Add(headerCell2);

                    TableCell headerCell3 = new TableCell();
                    headerCell3.Text = "Monto";
                    headerCell3.Font.Bold = true;
                    headerRow.Cells.Add(headerCell3);

                    Table1.Rows.Add(headerRow);
                    foreach (DataRowView rowView in dv)
                    {
                        DataRow row = rowView.Row;
                        TableRow tableRow = new TableRow();

                        TableCell cell1 = new TableCell();
                        cell1.Text = row["descripcion"].ToString();
                        tableRow.Cells.Add(cell1);

                        TableCell cell2 = new TableCell();
                        cell2.Text = row["tipo"].ToString() == "True" ? "Haber" : "Debe";
                        tableRow.Cells.Add(cell2);

                        TableCell cell3 = new TableCell();
                        cell3.Text = row["monto"].ToString();
                        tableRow.Cells.Add(cell3);

                        Table1.Rows.Add(tableRow);
                    }
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", $"alert('el campo Monto no puede estar vacio')", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != string.Empty)
            {
                int result = Crud.Insert();
                if (result != 0)
                {
                    Label1.Text = "Se agrego" + result.ToString() + " registro";
                    completarTabla();


                }
                else
                {
                    Label1.Text = "No se agregaron registros";

                }
                TextBox1.Text = string.Empty;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertScript", $"alert('Error')", true);
            }
            
        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataView dv1 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            if (dv1 != null && dv1.Count > 0)
            {
                DataRowView row = dv1[0];
                TextBox1.Text = row["monto"].ToString();
                DropDownList1.SelectedValue = row["idCuenta"].ToString();
                DropDownList3.SelectedValue = row["tipo"].ToString().ToLower();
                
            }
            DataView dv2 = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            string tipo = "";
            if (dv2 != null && dv2.Count > 0)
            {
                DataRowView row = dv2[0];
                
                if (row["tipo"].ToString() == "True")
                {
                    tipo = "Haber";
                }
                else
                {
                    tipo = "Debe";
                }
                TextBox2.Text = row["monto"].ToString() + " | " + row["descripcion"].ToString() + " | " + tipo;
                completarTabla();
                
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int result = Crud.Delete();
            if (result != 0)
            {
                Label1.Text = "Se elimino" + result.ToString() + " registro";
                completarTabla();

            }
            else
            {
                Label1.Text = "No se eliminaron";

            }
            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            completarTabla();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int result = Crud.Update();
            if (result != 0)
            {
                Label1.Text = "Se actualizo" + result.ToString() + " registro";
                completarTabla();

            }
            else
            {
                Label1.Text = "No se actualizaron registros";

            }
            TextBox1.Text = string.Empty;
        }
    }
}