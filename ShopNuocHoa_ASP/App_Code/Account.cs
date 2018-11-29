using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Account
/// </summary>
public class Account
{
    private string username;
    private string password;

    public string Username
    {
        get { return username;}
        set { username = value; }
    }
    public string Password
    {
        get { return password;}
        set { password = value; }
    }

    public Account()
    {
        //
        // TODO: Add constructor logic here
        //
    }
}