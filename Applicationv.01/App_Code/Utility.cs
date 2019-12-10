using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Utility
/// </summary>
public static class Utility
{
    internal static GTEEntities db;

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
        int? universityId = (int?)HttpContext.Current.Session["universityId"];
        if (!universityId.HasValue)
        {
            using (db = new GTEEntities())
            {
                string inBoundUrl = HttpContext.Current.Request.Url.Host.ToLower().ToString();
                if (inBoundUrl.ToUpper().Contains("www."))
                    inBoundUrl = inBoundUrl.Replace("www.", string.Empty);
                var details = db.university_master.Where(x => x.hosturl == inBoundUrl).Select(x => new { x.universityid, x.university_name }).FirstOrDefault();
                if (details != null)
                {
                    universityId = details.universityid;
                    if (universityId.Value > 0)
                    {
                        HttpContext.Current.Session["universityName"] = details.university_name;
                        return universityId.Value;
                    }
                    else
                        return -1;
                }
                else
                    return -1;
            }
        }
        else
            return universityId.Value;
    }

    public static string GetWebUrl()
    {
        return System.Configuration.ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", HttpContext.Current.Request.Url.Host.ToLower()).ToString();
    }

    internal static string GetUniversityName()
    {
        return (string)HttpContext.Current.Session["universityName"];
    }

    public static string GetRoleName()
    {        
        int? roleID = (int?)HttpContext.Current.Session["Role"];
        string roleName = (string)HttpContext.Current.Session["RoleName"];
        if (roleName == null)
        {
            using (db = new GTEEntities())
            {
                var GetRole = db.rolemaster.Where(x => x.roleid == roleID).Select(x => new { x.rolename }).FirstOrDefault();
                if (GetRole != null)
                    HttpContext.Current.Session["RoleName"] = GetRole.rolename;

                return GetRole.rolename;
            }
        }
        else
            return roleName;
    }
}