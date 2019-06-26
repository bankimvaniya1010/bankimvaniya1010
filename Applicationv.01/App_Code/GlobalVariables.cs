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

    public static bool isDeclarationDoneByApplicant;

    public static int universityMaxAge;
    public static int universityMinAge;

    public static int GetHighSchoolSecondaryAllowedGap
    {
        get { return 26; }
    }

    public static int GetHigherEduSecondarySchoolAllowedGap
    {
        get { return 12; }
    }

    public static int GetAgeMotivationLimit
    {
        get { return 30; }
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