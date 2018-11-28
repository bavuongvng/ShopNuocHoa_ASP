﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["user"] == null)
        {
            HyperDK.Visible = true;
            HyperDN.Visible = true;
            HyperDX.Visible = false;
        }
        else
        {
            HyperDX.Visible = true;
            HyperDK.Visible = false;
            HyperDN.Visible = false;
        }
    }

    protected void HyperDX_Click(object sender, EventArgs e)
    {
        Session.Remove("user");
        Response.Redirect("Trangchu.aspx");
    }
}
