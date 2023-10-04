using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRUD_Contable
{
    public partial class Cuentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int result = Crud.Insert();
            if (result != 0)
            {
                Label1.Text = "Se agrego" + result.ToString() + " registro";
                

            }
            else 
            {
                Label1.Text = "No se agregaron registros";
                
            }
                TextBox1.Text = string.Empty;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int result = Crud.Update();
            if (result != 0)
            {
                Label1.Text = "Se actualizo" + result.ToString() + " registro";


            }
            else
            {
                Label1.Text = "No se actualizarion registros";

            }
            TextBox1.Text = string.Empty;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

            DataView dv = (DataView)SelectDdList.Select(DataSourceSelectArguments.Empty);
            if (dv != null && dv.Count > 0)
            {
                DataRowView row = dv[0];
                TextBox1.Text = row["descripcion"].ToString();
                }
            }

        protected void Button3_Click(object sender, EventArgs e)
        {
            int result = Crud.Delete();
            if (result != 0)
            {
                Label1.Text = "Se borro" + result.ToString() + " registro";


            }
            else
            {
                Label1.Text = "No se borraron registros";

            }
            TextBox1.Text = string.Empty;
        }
    }
}