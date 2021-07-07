using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.IO;

public partial class applicantrefrencecheck : System.Web.UI.Page
{
    int formId = 0;
    int userID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected static List<faq> allQuestions = new List<faq>();
    string webURL = String.Empty;
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        var isDeclarationCompleted = (bool)Session["DeclarationCompleted"];
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == "") || !isDeclarationCompleted)
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        CustomControls = objCom.CustomControlist(formId, universityID);
        if (CustomControls.Count > 0)
            objCom.AddCustomControl(CustomControls, mainDiv);
        if (!IsPostBack)
        {
            allQuestions = objCom.FaqQuestionList(Request.QueryString["formid"], universityID);
            if (CustomControls.Count > 0)
                objCom.SetCustomData(formId, userID, CustomControls, mainDiv);
            BindRefrenceList();
            SetControlsUniversitywise();
            SetToolTips();
        }
    }

    private void BindRefrenceList()
    {
        try
        {
            var RefInfo = (from pInfo in db.applicantreferencecheck
                           where pInfo.applicantid == userID && pInfo.universityid == universityID
                           select pInfo).ToList();
            grdRefernce.DataSource = RefInfo;
            grdRefernce.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private String setInnerHtml(dynamic obj)
    {
        return obj.secondaryfielddnamevalue == "" ? obj.primaryfiledname : obj.primaryfiledname + "( " + obj.secondaryfielddnamevalue + ")";
    }

    private void SetControlsUniversitywise()
    {
        try
        {
            string SecondaryLanguage = Utility.GetSecondaryLanguage();

            var fields = (from pfm in db.primaryfieldmaster
                          join ufm in db.universitywisefieldmapping on pfm.primaryfieldid equals ufm.primaryfieldid
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid into tmp
                          from x in tmp.Where(c => c.secondaryfieldnamelanguage == SecondaryLanguage).DefaultIfEmpty()
                          where ufm.universityid == universityID && ufm.formid == formId
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = (x == null ? String.Empty : x.fieldnameinstructions),
                              secondaryfieldnameinstructions = (x == null ? String.Empty : x.secondaryfieldnameinstructions),
                              secondaryfieldnamelanguage = (x == null ? String.Empty : x.secondaryfieldnamelanguage),
                              secondaryfielddnamevalue = (x == null ? String.Empty : x.secondaryfielddnamevalue)
                          }).ToList();

            if (fields.Count == 0)
            {
                fields = (from pfm in db.primaryfieldmaster
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid into tmp
                          from x in tmp.Where(c => c.secondaryfieldnamelanguage == SecondaryLanguage).DefaultIfEmpty()
                          where pfm.formid == formId
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = (x == null ? String.Empty : x.fieldnameinstructions),
                              secondaryfieldnameinstructions = (x == null ? String.Empty : x.secondaryfieldnameinstructions),
                              secondaryfieldnamelanguage = (x == null ? String.Empty : x.secondaryfieldnamelanguage),
                              secondaryfielddnamevalue = (x == null ? String.Empty : x.secondaryfielddnamevalue)
                          }).ToList();
            }
            for (int k = 0; k < fields.Count; k++)
            {
                switch (fields[k].primaryfiledname)
                {
                    case "NAME":
                        Name.Attributes.Add("style", "display:block;");
                        labelname.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "MOBILE/CELLULAR NUMBER":
                        Mobile.Attributes.Add("style", "display:block;");
                        labelMobile.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "EMAIL":
                        Email.Attributes.Add("style", "display:block;");
                        labelEmail.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    default:
                        break;
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btnReference_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            var profileReference = (from pInfo in db.applicantreferencecheck
                                    where pInfo.applicantid == userID && pInfo.universityid == universityID
                                    select pInfo).FirstOrDefault();
            applicantreferencecheck objReference = new applicantreferencecheck();
            if (profileReference != null)
            {
                mode = "update";
                objReference = profileReference;
            }
            objReference.name = txtName.Value;
            objReference.mobile = txtMobile.Value;
            objReference.email = txtEmail.Value;
            objReference.applicantid = userID;
            objReference.requestsenttime = DateTime.Now;
            objReference.universityid = universityID;
            objReference.referncekey = Guid.NewGuid().ToString();
            objReference.isverified = null;
            if (mode == "new")
                db.applicantreferencecheck.Add(objReference);
            db.SaveChanges();           
            if (CustomControls.Count > 0)
                objCom.SaveCustomData(userID, formId, CustomControls, mainDiv);

            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == userID && pInfo.universityid == universityID
                               select pInfo).FirstOrDefault();
            string Applicantname = "";
            string applicantFirstName = "";
            applicantFirstName = profileInfo.firstname;
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
            var univresityDetails = db.university_master.Where(x => x.IsDeleted != 1 && x.universityid == universityID).Select(x => new { x.university_name, x.logo, x.cityid }).FirstOrDefault();
            
            string url = webURL + "referencecheck.aspx?referncekey=" + objReference.referncekey;
            string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/referencecheckNotification.html"));
            html = html.Replace("@UniversityName", univresityDetails.university_name);
            html = html.Replace("@universityLogo", webURL + "Docs/" + universityID + "/" + univresityDetails.logo);
            html = html.Replace("@locationofInstitution", objCom.GetCityName(Convert.ToInt32(univresityDetails.cityid)));
            html = html.Replace("@applicatFullName", Applicantname);
            html = html.Replace("@applicantFirstname", applicantFirstName);            
            html = html.Replace("@refereepageUrl", url);
            objCom.SendMail(txtEmail.Value, html, "Refrence Check for " + Applicantname);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grdtrefernce_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
       
    }


    protected void grdRefernce_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void grdRefernce_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("Edit"))
            {
                int applicantid = Convert.ToInt32(e.CommandArgument.ToString());
                PopulateRefernceInfo(applicantid);
            }
            if (e.CommandName.Equals("Delete"))
            {
                int ID = Convert.ToInt32(e.CommandArgument);
                applicantreferencecheck objRef = db.applicantreferencecheck.Where(b => b.id == ID).First();
                db.applicantreferencecheck.Remove(objRef);
                db.SaveChanges();
                BindRefrenceList();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void PopulateRefernceInfo(int applicantid)
    {
        var RefInfo = (from pInfo in db.applicantreferencecheck
                       where pInfo.applicantid == userID && pInfo.universityid == universityID
                       select pInfo).FirstOrDefault();
        if (RefInfo != null)
        {
            txtName.Value = RefInfo.name;
            txtMobile.Value = RefInfo.mobile;
            txtEmail.Value = RefInfo.email;
        }
    }
    private void SetToolTips()
    {


        try
        {
            var fields = (from pfm in db.primaryfieldmaster
                          join utm in db.universitywisetooltipmaster
                          on pfm.primaryfieldid equals utm.fieldid into
                          tmpUniversity
                          from z in tmpUniversity.Where(x => x.universityid == universityID && x.formid == formId).DefaultIfEmpty()
                          join tm in db.tooltipmaster on pfm.primaryfieldid equals tm.fieldid into tmp
                          from x in tmp.Where(c => c.formid == formId).DefaultIfEmpty()
                          where (x.formid == formId || z.formid == formId)
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              universitywiseToolTips = (z == null ? String.Empty : z.tooltips),
                              tooltips = (x == null ? String.Empty : x.tooltips)
                          }).ToList();


            for (int k = 0; k < fields.Count; k++)
            {
                switch (fields[k].primaryfiledname)
                {
                    case "NAME":
                        icName.Attributes.Add("style", "display:block;");
                        icName.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "MOBILE/CELLULAR NUMBER":
                        icMobile.Attributes.Add("style", "display:block;");
                        icMobile.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;
                    case "EMAIL":
                        icEmail.Attributes.Add("style", "display:block;");
                        icEmail.Attributes.Add("data-tipso", setTooltips(fields[k]));
                        break;

                    default:
                        break;

                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());

        }
    }
    private String setTooltips(dynamic obj)
    {
        return obj.universitywiseToolTips == "" ? obj.tooltips : obj.universitywiseToolTips;
    }
}