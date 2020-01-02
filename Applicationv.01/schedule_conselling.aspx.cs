using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class schedule_conselling : System.Web.UI.Page
{
    int UserID = 0;
    Common objCom = new Common();
    protected static List<faq> allfaqQuestion = new List<faq>();
    string webURL = String.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        if (!IsPostBack)
            allfaqQuestion = objCom.FaqQuestionList();
    }
}