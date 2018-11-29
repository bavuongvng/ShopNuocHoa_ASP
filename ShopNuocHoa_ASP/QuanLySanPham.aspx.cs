using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class QuanLySanPham :  System.Web.UI.Page
{
   

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userAdmin"] == null)
        {
            Response.Redirect("DangNhapAdmin.aspx");
        }
        ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        FileUpload file = (FileUpload)FormView1.FindControl("FileUpload2") as FileUpload;
        if (file.HasFile)
        {
            file.SaveAs(Server.MapPath("~/Img/imgProducts/" + file.FileName));
            Label lb = (Label)FormView1.FindControl("Label4") as Label;
            lb.Text = file.FileName;
            Image img = FormView1.FindControl("Image4") as Image;
            img.ImageUrl = "~/img/imgProducts/" + file.FileName;
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        FileUpload file = (FileUpload)FormView1.FindControl("FileUpload3") as FileUpload;
        if (file.HasFile)
        {
            file.SaveAs(Server.MapPath("~/Img/imgProducts/" + file.FileName));
            Label lb = (Label)FormView1.FindControl("Label3") as Label;
            lb.Text = file.FileName;
            Image img = FormView1.FindControl("Image5") as Image;
            img.ImageUrl = "~/img/imgProducts/" + file.FileName;
        }
    }



    
}