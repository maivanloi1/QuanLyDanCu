using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QuanLyDanCu
{
    public partial class Default : System.Web.UI.Page
    {
        SqlConnection mysql = new SqlConnection(ConfigurationManager.ConnectionStrings["CDConnection"].ConnectionString);
        int ID_CD;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    mysql.Open();
                    using (SqlCommand mySQL = new SqlCommand("dbo.GetDanCu", mysql))
                    {
                        mySQL.Connection= mysql;
                        mySQL.CommandType = CommandType.StoredProcedure;

                        SqlDataReader myrd = mySQL.ExecuteReader();

                        gvCongDan.DataSource = myrd;
                        gvCongDan.DataBind();
                        myrd.Close();
                    }
                }
                catch (Exception ex)
                {

                }
                finally { mysql.Close(); }

            }
          
        }

        protected void gvCongDan_RowDeleting(object sener, GridViewDeleteEventArgs e)
        {
            int Id = Convert.ToInt32(gvCongDan.DataKeys[e.RowIndex].Values["ID"]);
            try
            {
                mysql.Open();
                using (SqlCommand mySQL = new SqlCommand("dbo.XoaDanCu", mysql))
                {
                    mySQL.Parameters.Add("@Id", SqlDbType.Int).Value = Id;
                    mySQL.CommandType = CommandType.StoredProcedure;

                    mySQL.ExecuteNonQuery();

                }
            }
            catch (Exception ex)
            {
             
            }
            finally
            {
                mysql.Close();
                LoadData();
            }
        }
       private void LoadData()
        {
            try
            {
                mysql.Open();
                using (SqlCommand mySQL = new SqlCommand("dbo.GetDanCu", mysql))
                {
                    mySQL.Connection = mysql;
                    mySQL.CommandType = CommandType.StoredProcedure;

                    SqlDataReader myrd = mySQL.ExecuteReader();

                    gvCongDan.DataSource = myrd;
                    gvCongDan.DataBind();
                    myrd.Close();
                }
            }
            catch (Exception ex)
            {

            }
            finally { mysql.Close(); }
        }

        

protected void gvCongDan_RowCommand(object sener, GridViewCommandEventArgs e)
        {
            
        }
    }
}