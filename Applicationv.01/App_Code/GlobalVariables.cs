using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public sealed class GlobalVariables
{
    public GlobalVariables()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static string GetChinaCountryName
    {
        get { return "China".ToUpper(); }
    }

    public static string GetRussiaCountryName
    {
        get { return "Russian Federation".ToUpper(); }
    }
}