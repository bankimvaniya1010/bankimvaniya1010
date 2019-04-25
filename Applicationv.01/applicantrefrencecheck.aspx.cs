using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
public partial class applicantrefrencecheck : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected List<tooltipmaster> lstToolTips = new List<tooltipmaster>();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (user)Session["LoginInfo"];
        userID = objUser.userid;
        if (!IsPostBack)
        {
            BindRefrenceList(); SetControlsUniversitywise(1);
        }
    }
    private void BindRefrenceList()
    {
        try
        {
            var RefInfo = (from pInfo in db.Applicantreferencecheck
                           where pInfo.applicantid == userID
                           select pInfo).ToList();
            grdRefernce.DataSource = RefInfo;
            grdRefernce.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void SetControlsUniversitywise(int universityID)
    {

        var fields = (from pfm in db.primaryfieldmaster
                      join ufm in db.universitywisefieldmapping on pfm.primaryfieldid equals ufm.primaryfieldid
                      where ufm.universityid == universityID && ufm.formid == 6
                      select new
                      {
                          primaryfiledname = pfm.primaryfiledname,

                      }).ToList();
        for (int k = 0; k < fields.Count; k++)
        {
            switch (fields[k].primaryfiledname)
            {
                case "NAME":
                    Name.Attributes.Add("style", "display:block;");
                    labelname.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "MOBILE/CELLULAR NUMBER":
                    Mobile.Attributes.Add("style", "display:block;");
                    labelMobile.InnerHtml = fields[k].primaryfiledname;
                    break;
                case "EMAIL":
                    Email.Attributes.Add("style", "display:block;");
                    labelEmail.InnerHtml = fields[k].primaryfiledname;
                    break;
                default:
                    break;
            }
        }
    }
    protected void btnReference_Click(object sender, EventArgs e)
    {
        Applicantreferencecheck objReference = new Applicantreferencecheck();
        try
        {
           
                objReference.name = txtName.Value;
                //  profileInfo.workphone = txtworkphone.Value;
                objReference.mobile = txtMobile.Value;
                objReference.email = txtEmail.Value;
                objReference.applicantid = userID;
                objReference.requestsenttime = DateTime.Now;
                objReference.referncekey = Guid.NewGuid().ToString();
                db.Applicantreferencecheck.Add(objReference);
                db.SaveChanges();
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == userID
                               select pInfo).FirstOrDefault();
            string Applicantname = "";
            string Title = objCom.GetTitle(Convert.ToInt32(profileInfo.title));
            if (Title == "Others")
            {
                if ((profileInfo.firstname != null) && (profileInfo.lastname != null))
                    Applicantname = profileInfo.othertitle.ToString() + " " + profileInfo.firstname.ToString() + " " + profileInfo.lastname.ToString();
            }
            else
            {
                if ((profileInfo.firstname != null) && (profileInfo.lastname != null))
                    Applicantname = Title + " " + profileInfo.firstname.ToString() + " " + profileInfo.lastname.ToString();
            }
            StringBuilder sb = new StringBuilder();
            sb.Append("Dear" + txtName.Value + "<br/><br/>");

            sb.Append(Applicantname + " has given your details for reference check at the time of applying his/her for course.<br/>");
            sb.Append("Please validate that you know him very well by confirming the check box in below page<br/>");
            sb.AppendFormat(webURL + "referencecheck.aspx?referncekey=" + objReference.referncekey + "<br/>");
            sb.Append("Thank You <br/>");
            sb.Append("The Application Center Validation Team <br/>");
            objCom.SendMail(txtEmail.Value, sb.ToString(), "Refrence Check for " + Applicantname);
            BindRefrenceList();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grdtrefernce_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(grdRefernce.DataKeys[e.RowIndex].Values[0]);
            Applicantreferencecheck objRef = db.Applicantreferencecheck.Where(b => b.id == ID).First();
            db.Applicantreferencecheck.Remove(objRef);
            db.SaveChanges();
            BindRefrenceList();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grdRefernce_DataBound(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in grdRefernce.Rows)
            {

                if (row.RowState != DataControlRowState.Edit) // check for RowState
                {
                    if (row.RowType == DataControlRowType.DataRow) //check for RowType
                    {
                        string id = row.Cells[0].Text; // Get the id to be deleted
                                                       //cast the ShowDeleteButton link to linkbutton
                        LinkButton lb = (LinkButton)row.Cells[3].Controls[0];
                        if (lb != null)
                        {
                            //attach the JavaScript function with the ID as the paramter
                            lb.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}