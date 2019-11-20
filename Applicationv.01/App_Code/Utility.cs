using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Utility
/// </summary>
public static class Utility
{
    public static string GetSecondaryLanguage()
    {
        string SecondaryLanguage = "";
        if (HttpContext.Current.Session["SecondaryLang"] != null)
            SecondaryLanguage = HttpContext.Current.Session["SecondaryLang"].ToString();
        return SecondaryLanguage;
    }

    public static Boolean CheckStudentLogin()
    {
        if (HttpContext.Current.Session["Role"] == null || HttpContext.Current.Session["UserID"] == null || !HttpContext.Current.Session["Role"].ToString().Equals("student"))
            return false;
        return true;
    }

    public static Boolean CheckAdminLogin()
    {
        if (HttpContext.Current.Session["Role"] == null || HttpContext.Current.Session["UserID"] == null || HttpContext.Current.Session["Role"].ToString().Equals("student"))
            return false;
        return true;
    }

    public static int GetUniversityId()
    {
        return Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
    }

    public static string GetWebUrl()
    {
        return System.Configuration.ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", HttpContext.Current.Request.Url.Host.ToLower()).ToString();
    }
}