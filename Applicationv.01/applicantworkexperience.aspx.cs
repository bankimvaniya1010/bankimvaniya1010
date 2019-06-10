using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantworkexperience : System.Web.UI.Page
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
            Response.Redirect(webURL + "Login.aspx", true);
        var objUser = (students)Session["LoginInfo"];
        userID = objUser.studentid;
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == ""))
        {
            Response.Redirect(webURL + "default.aspx", true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        if (!IsPostBack)
        {
            objCom.BindCountries(ddlCountry);
            SetToolTips();
            BindRelationship();
            // PopulateEmployerInfo(1);
            BindEmploymentDetails();
            SetControlsUniversitywise();
        }
    }
    private void SetToolTips()
    {
        try
        {
            lstToolTips = db.tooltipmaster.ToList();
            for (int k = 0; k < lstToolTips.Count; k++)
            {
                switch (lstToolTips[k].field)
                {

                    case "EmployerLinkedin":
                        txtlinkedin.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "VerificationEmail":
                        txtEmail.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "RelationwithVerification":
                        ddlRelationship.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Verificationame":
                        txtemploymentverification.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Managername":
                        txtreportingmanger.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "BriefDescitption":
                        txtbriefDescription.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "EmploymentEnddate":
                        txtEndate.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "EmploymentStartdate":
                        txtStartDate.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "Postition":
                        txtPosition.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "OrganizationCountry":

                        ddlCountry.Attributes.Add("title", lstToolTips[k].tooltips);
                        break;
                    case "HaveWorkexperience":
                        rblEmploymentYes.ToolTip = lstToolTips[k].tooltips;
                        rblEmploymentNo.ToolTip = lstToolTips[k].tooltips;
                        break;
                    case "Organizationnane":
                        txtEmployer.Attributes.Add("title", lstToolTips[k].tooltips);

                        break;
                    case "Organizationcity":
                        txtCity.Attributes.Add("title", lstToolTips[k].tooltips);
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
                    case "DO YOU WISH TO RECORD ANY WORK EXPERIENCE THAT MAY BE RELEVANT TO THE COURSE YOU ARE APPLYING FOR?":
                        employmentInfo.Attributes.Add("style", "display:block;");
                        labelemployment.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "WEBSITE":
                        employerwebsite.Attributes.Add("style", "display:block;");
                        labelemployerwebsite.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF ORGANIZATION":
                        employer.Attributes.Add("style", "display:block;");
                        labelemployer.InnerHtml = setInnerHtml(fields[k]);
                        break;

                    case "CITY":
                        employercity.Attributes.Add("style", "display:block;");
                        labelemployercity.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "COUNTRY":
                        employercountry.Attributes.Add("style", "display:block;");
                        labelemployercountry.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "POSITION/ROLE IN":
                        position.Attributes.Add("style", "display:block;");
                        labelposition.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "START DATE":
                        startdate.Attributes.Add("style", "display:block;");
                        labelstartdate.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "END DATE":
                        endate.Attributes.Add("style", "display:block;");
                        labelendate.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "BRIEF DESCRIPTION OF WHAT YOU DID":
                        briefDescription.Attributes.Add("style", "display:block;");
                        labelbriefDescription.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF YOUR REPORTING MANAGER":
                        reportingmanger.Attributes.Add("style", "display:block;");
                        labelreportingmanger.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "NAME OF CONTACT WHO CAN VERIFY YOUR EMPLOYMENT":
                        employmentverification.Attributes.Add("style", "display:block;");
                        labelemploymentverification.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "RELATIONSHIP WITH THE CONTACT":
                        relationship.Attributes.Add("style", "display:block;");
                        labelrelationship.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "EMAIL ID OF CONTACT WHO CAN VERIFY YOUR EMPLOYMENT":
                        email.Attributes.Add("style", "display:block;");
                        labelemail.InnerHtml = setInnerHtml(fields[k]);
                        break;
                    case "LINKEDIN PROFILE LINK OF THE CONTACT":
                        linkedin.Attributes.Add("style", "display:block;");
                        labellinkedin.InnerHtml = setInnerHtml(fields[k]);
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
    private void PopulateEmployerInfo(int employerId)
    {
        try
        {
            var employerInfo = (from pInfo in db.applicantemployerdetails
                                where pInfo.applicantid == userID && pInfo.employerid == employerId && pInfo.universityid == universityID
                                select pInfo).FirstOrDefault();
            if (employerInfo != null)
            {
                if (employerInfo.wishtoaddemployer == 1)
                    rblEmploymentYes.Checked = true;
                else
                    rblEmploymentNo.Checked = false;
                txtEmployer.Value = employerInfo.organization;
                txtemployerwebsite.Value = employerInfo.website;
                txtCity.Value = employerInfo.city;
                if (employerInfo.country != null)
                {
                    ddlCountry.ClearSelection();
                    ddlCountry.Items.FindByValue(employerInfo.country.ToString()).Selected = true;
                }
                txtPosition.Value = employerInfo.designation;
                txtStartDate.Value = Convert.ToDateTime(employerInfo.durationfrom).ToString("yyyy-MM-dd");
                txtEndate.Value = Convert.ToDateTime(employerInfo.durationto).ToString("yyyy-MM-dd");
                txtbriefDescription.Value = employerInfo.briefdescription;
                txtreportingmanger.Value = employerInfo.nameofreportingmanger;
                txtemploymentverification.Value = employerInfo.contactpersonwithdetails;
                if (employerInfo.relationshipwithcontact != null)
                {
                    ddlRelationship.ClearSelection();
                    ddlRelationship.Items.FindByValue(employerInfo.relationshipwithcontact.ToString()).Selected = true;
                }
                txtEmail.Value = employerInfo.emailid;
                txtlinkedin.Value = employerInfo.linkedinidofcontact;
                lblSaveTime.Text = " Record was last saved at " + employerInfo.lastsavedtime.ToString();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_login_Click(object sender, EventArgs e)
    {
        try
        {
            var noExperience = (from ad in db.applicantdetails
                                where ad.applicantid == userID && ad.universityid == universityID
                                select ad).FirstOrDefault();
            var mode = "new";
            string employerid = hdnemployer.Value;
            applicantemployerdetails objEmployer = new applicantemployerdetails();
            if (employerid != "")
            {
                mode = "update";
                int eID = Convert.ToInt32(employerid);
                var employerInfo = (from pInfo in db.applicantemployerdetails
                                    where pInfo.employerid == eID && pInfo.universityid == universityID
                                    select pInfo).FirstOrDefault();
                objEmployer = employerInfo;
            }

            if (rblEmploymentYes.Checked)
            {
                noExperience.haveworkexperience = true;
                objEmployer.wishtoaddemployer = 1;
                objEmployer.organization = txtEmployer.Value;
                objEmployer.designation = txtPosition.Value;               
                objEmployer.website = txtemployerwebsite.Value;
                objEmployer.city = txtCity.Value;
                objEmployer.country = Convert.ToInt32(ddlCountry.SelectedValue);
                objEmployer.briefdescription = txtbriefDescription.Value;
                objEmployer.nameofreportingmanger = txtreportingmanger.Value;
                objEmployer.contactpersonwithdetails = txtemploymentverification.Value;
                objEmployer.relationshipwithcontact = ddlRelationship.SelectedValue;
                objEmployer.emailid = txtEmail.Value;
                objEmployer.linkedinidofcontact = txtlinkedin.Value;
                objEmployer.durationfrom = Convert.ToDateTime(txtStartDate.Value);
                objEmployer.durationto = Convert.ToDateTime(txtEndate.Value);
                objEmployer.applicantid = userID;
                objEmployer.lastsavedtime = DateTime.Now;
                objEmployer.universityid = universityID;
                if (mode == "new")
                    db.applicantemployerdetails.Add(objEmployer);                
            }
            else
            {
                noExperience.haveworkexperience = false;
            }
            db.SaveChanges();
            lblMessage.Text = "Your Contact Details have been saved";
            lblMessage.Visible = true;
            BindEmploymentDetails();



        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindEmploymentDetails()
    {
        try
        {
            var empDetails = (from eInfo in db.applicantemployerdetails
                              where eInfo.applicantid == userID && eInfo.universityid == universityID
                              select eInfo).ToList();
            grdEmployment.DataSource = empDetails;
            grdEmployment.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindRelationship()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var relationship = db.realtionshipmaster.ToList();
            ddlRelationship.DataSource = relationship;
            ddlRelationship.DataTextField = "relationshipname";
            ddlRelationship.DataValueField = "relationshiptid";
            ddlRelationship.DataBind();
            ddlRelationship.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void grdEmployment_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            int id = Convert.ToInt32(grdEmployment.DataKeys[e.RowIndex].Values[0]);
            applicantemployerdetails grade = db.applicantemployerdetails.Where(b => b.employerid == id).First();
            db.applicantemployerdetails.Remove(grade);
            db.SaveChanges();
            BindEmploymentDetails(); 
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    
    protected void grdEmployment_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void grdEmployment_DataBound(object sender, EventArgs e)
    {
        try
        {
            foreach (GridViewRow row in grdEmployment.Rows)
            {

                if (row.RowState != DataControlRowState.Edit) // check for RowState
                {
                    if (row.RowType == DataControlRowType.DataRow) //check for RowType
                    {
                        string id = row.Cells[0].Text; // Get the id to be deleted
                                                       //cast the ShowDeleteButton link to linkbutton
                        LinkButton lbDelete = (LinkButton)row.Cells[6].Controls[0];
                        if (lbDelete != null)
                        {
                            //attach the JavaScript function with the ID as the paramter
                            lbDelete.Attributes.Add("onclick", "return ConfirmOnDelete('" + id + "');");

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

    protected void grdEmployment_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            if (e.CommandName.Equals("Edit"))

            {
                int employerid = Convert.ToInt32(e.CommandArgument.ToString());
                PopulateEmployerInfo(employerid);
                hdnemployer.Value = e.CommandArgument.ToString();
                employment.Attributes.Add("style", "display:block");
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}