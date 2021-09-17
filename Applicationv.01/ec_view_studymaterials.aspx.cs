using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Collections;
using System.Collections.Specialized;

public partial class ec_view_studymaterials : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        NameValueCollection list = new NameValueCollection();
        list.Add("AJAX in Action", "D:/All_Service/edu_app/Applicationv.01/Docs/UploadFiles/biology.png");
        list.Add("AJAX Bible", "D:/All_Service/edu_app/Applicationv.01/Docs/UploadFiles/Q7.png");
        list.Add("my AJAX", "D:/All_Service/edu_app/Applicationv.01/Docs/UploadFiles/biology.png");
        list.Add("AJAX", "D:/All_Service/edu_app/Applicationv.01/Docs/UploadFiles/Q7.png");
        list.Add("Bhai", "D:/All_Service/edu_app/Applicationv.01/Docs/UploadFiles/biology.png");
        Random r = new Random();
        int index = r.Next(0, 5);
        Label1.Text = list.Keys[index].ToString();
        Image1.ImageUrl = list[index].ToString();
    }
}