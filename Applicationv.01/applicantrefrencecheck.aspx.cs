﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
public partial class applicantrefrencecheck : System.Web.UI.Page
{
    int formId = 0;
    int userID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected List<tooltipmaster> lstToolTips = new List<tooltipmaster>();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx",true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        if (!IsPostBack)
        {
            BindRefrenceList();
            SetControlsUniversitywise();
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

        applicantreferencecheck objReference = new applicantreferencecheck();
        try
        {
           
                objReference.name = txtName.Value;
                //  profileInfo.workphone = txtworkphone.Value;
                objReference.mobile = txtMobile.Value;
                objReference.email = txtEmail.Value;
                objReference.applicantid = userID;
                objReference.requestsenttime = DateTime.Now;
                objReference.universityid = universityID;
                objReference.referncekey = Guid.NewGuid().ToString();
                db.applicantreferencecheck.Add(objReference);
                db.SaveChanges();
            var profileInfo = (from pInfo in db.applicantdetails
                               where pInfo.applicantid == userID && pInfo.universityid == universityID
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
            applicantreferencecheck objRef = db.applicantreferencecheck.Where(b => b.id == ID).First();
            db.applicantreferencecheck.Remove(objRef);
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