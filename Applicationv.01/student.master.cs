using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.MasterPage
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
   protected ArrayList formList = new ArrayList();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            formList = createFormList();
        }

    }

    private ArrayList createFormList()
    {
        ArrayList form = new ArrayList();
        var forms = (from fm in db.formmaster
                     join ufm in db.universitywiseformmapping on fm.formid equals ufm.formid
                     where ufm.universityid == universityID
                     select new
                     {
                         formid = fm.formid,
                         formname = fm.formname
                     }).ToList();
        if (forms.Count == 0)
            forms = (from fm in db.formmaster
                     join ufm in db.universitywiseformmapping on fm.formid equals ufm.formid
                     select new
                     {
                         formid = fm.formid,
                         formname = fm.formname
                     }).ToList();
        foreach (var val in forms)
        {
            form.Add(val.formid + "|" + val.formname);
        }
        return form;
    }
}
