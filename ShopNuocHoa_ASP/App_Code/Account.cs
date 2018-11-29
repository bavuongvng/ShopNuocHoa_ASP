using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

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

    public string HoTen { get; set; }
    public string SoDT { get; set; }
    public string DiaChi { get; set; }

    public Account()
    {
    }
}