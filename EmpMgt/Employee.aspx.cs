using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EmpMgt
{
    public partial class Employee : System.Web.UI.Page
    {
        //连接数据库字符串
        string sqlconn = "Data Source=(LocalDB)\\MSSQLLocalDB;" + "AttachDbFilename='|DataDirectory|\\Employee.mdf';";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ShowData();
            }
        }
        //显示员工资料至GridView 
        void ShowData()
        {
            using(SqlConnection cn=new SqlConnection())
            {
                cn.ConnectionString = sqlconn; cn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM 员工", cn); SqlDataReader dr = cmd.ExecuteReader(); GridView1.DataSource = dr;
                GridView1.DataBind();
            }
        }
        //插入功能
        protected void btnInsert_Click_Click(object sender, EventArgs e)
        {
            using (SqlConnection cn = new SqlConnection())
            {
                cn.ConnectionString = sqlconn;
                cn.Open();
                string sqlstr = string.Format("INSERT INTO 员工(编号,姓名,工资,电话)" +
                "VALUES('{0}',N'{1}','{2}','{3}')", TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text);
                SqlCommand cmd = new SqlCommand(sqlstr, cn);
                cmd.ExecuteNonQuery();
                 Label1.Text = "";
                 ShowData();
            }
        }
        //修改功能
        protected void btnUpdate_Click_Click(object sender, EventArgs e)
        {
            using (SqlConnection cn = new SqlConnection())
                {
                cn.ConnectionString = sqlconn;
                cn.Open();
                string sqlstr = "UPDATE 员工 SET 姓名=@name,工资=@salary,电话=@number WHERE 编号=@id";
                
                    // 建立SqlCommand对象cmd
                    SqlCommand cmd = new SqlCommand(sqlstr, cn);
                    cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Char));
                    cmd.Parameters.Add(new SqlParameter("@name", SqlDbType.NChar));
                    cmd.Parameters.Add(new SqlParameter("@salary", SqlDbType.SmallMoney));
                    cmd.Parameters.Add(new SqlParameter("@number", SqlDbType.Char));
                    cmd.Parameters["@id"].Value = TextBox1.Text;
                    cmd.Parameters["@name"].Value = TextBox2.Text;
                    cmd.Parameters["@salary"].Value = TextBox3.Text;
                    cmd.Parameters["@number"].Value = TextBox4.Text;
                    cmd.ExecuteNonQuery();
                    Label1.Text = "";
                    ShowData();
                
            }
        }
        //删除功能
        protected void btnDelete_Click_Click(object sender, EventArgs e)
        {
           using (SqlConnection cn = new SqlConnection())
           {
                cn.ConnectionString = sqlconn;
                cn.Open();

                string sqlstr = "DELETE FROM 员工 WHERE 编号=@id";
                // 建立SqlCommand对象cmd
                SqlCommand cmd = new SqlCommand(sqlstr, cn);
                cmd.Parameters.Add(new SqlParameter("@id", SqlDbType.Char));
                cmd.Parameters["@id"].Value = TextBox1.Text;
                cmd.ExecuteNonQuery();
                Label1.Text = "";
                ShowData();
           }
        }
    }
}