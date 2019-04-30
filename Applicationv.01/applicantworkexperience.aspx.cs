﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantworkexperience : System.Web.UI.Page
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
            SetToolTips();
            // PopulateEmployerInfo(1);
            BindEmploymentDetails();SetControlsUniversitywise(Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString()));
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
                        txtrelationship.Attributes.Add("title", lstToolTips[k].tooltips);
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
    private void SetControlsUniversitywise(int universityID)
    {
        try
        {
            string SecondaryLanguage = "";
            if (Session["SecondaryLang"] != null)
            {
                SecondaryLanguage = Session["SecondaryLang"].ToString();
            }

            var fields = (from pfm in db.primaryfieldmaster
                          join ufm in db.universitywisefieldmapping on pfm.primaryfieldid equals ufm.primaryfieldid
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid
                          where ufm.universityid == universityID && ufm.formid == 5 && (afm.secondaryfieldnamelanguage == SecondaryLanguage)
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = afm.fieldnameinstructions,
                              secondaryfieldnameinstructions = afm.secondaryfieldnameinstructions,
                              secondaryfieldnamelanguage = afm.secondaryfieldnamelanguage,
                              secondaryfielddnamevalue = afm.secondaryfielddnamevalue
                          }).ToList();
            if (fields.Count == 0 && SecondaryLanguage != "")
            {
                fields = (from ufm in db.universitywisefieldmapping
                          join pfm in db.primaryfieldmaster on ufm.primaryfieldid equals pfm.primaryfieldid
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid
                          where ufm.formid == 5 && (afm.secondaryfieldnamelanguage == SecondaryLanguage)
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = afm.fieldnameinstructions,
                              secondaryfieldnameinstructions = afm.secondaryfieldnameinstructions,
                              secondaryfieldnamelanguage = afm.secondaryfieldnamelanguage,
                              secondaryfielddnamevalue = afm.secondaryfielddnamevalue
                          }).ToList();
            }
            else if (fields.Count == 0 && SecondaryLanguage == "")
            {
                fields = (from ufm in db.universitywisefieldmapping
                          join pfm in db.primaryfieldmaster on ufm.primaryfieldid equals pfm.primaryfieldid
                          join afm in db.applicantformmaster on pfm.primaryfieldid equals afm.primaryfieldid
                          where ufm.formid == 5 && ufm.universityid == universityID
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = "",
                              secondaryfieldnameinstructions = "",
                              secondaryfieldnamelanguage = "",
                              secondaryfielddnamevalue = ""
                          }).ToList();
            }
            if (fields.Count == 0)
            {
                fields = (from pfm in db.primaryfieldmaster

                          where pfm.formid == 5
                          select new
                          {
                              primaryfiledname = pfm.primaryfiledname,
                              fieldnameinstructions = "",
                              secondaryfieldnameinstructions = "",
                              secondaryfieldnamelanguage = "",
                              secondaryfielddnamevalue = ""
                          }).ToList();
            }


            for (int k = 0; k < fields.Count; k++)
            {
                switch (fields[k].primaryfiledname)
                {
                    case "DO YOU WISH TO RECORD ANY WORK EXPERIENCE THAT MAY BE RELEVANT TO THE COURSE YOU ARE APPLYING FOR?":
                        employmentInfo.Attributes.Add("style", "display:block;");
                        labelemployment.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "WEBSITE":
                        employerwebsite.Attributes.Add("style", "display:block;");
                        labelemployerwebsite.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "NAME OF ORGANIZATION":
                        employer.Attributes.Add("style", "display:block;");
                        labelemployer.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;

                    case "CITY":
                        employercity.Attributes.Add("style", "display:block;");
                        employercity.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "COUNTRY":
                        employercountry.Attributes.Add("style", "display:block;");
                        labelemployercountry.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "POSITION/ROLE IN":
                        position.Attributes.Add("style", "display:block;");
                        labelposition.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "START DATE":
                        startdate.Attributes.Add("style", "display:block;");
                        labelstartdate.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "END DATE":
                        endate.Attributes.Add("style", "display:block;");
                        labelendate.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "BRIEF DESCRIPTION OF WHAT YOU DID":
                        briefDescription.Attributes.Add("style", "display:block;");
                        labelbriefDescription.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "NAME OF YOUR REPORTING MANAGER":
                        reportingmanger.Attributes.Add("style", "display:block;");
                        labelreportingmanger.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "NAME OF CONTACT WHO CAN VERIFY YOUR EMPLOYMENT":
                        employmentverification.Attributes.Add("style", "display:block;");
                        labelemploymentverification.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "RELATIONSHIP WITH THE CONTACT":
                        relationship.Attributes.Add("style", "display:block;");
                        labelrelationship.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "EMAIL ID OF CONTACT WHO CAN VERIFY YOUR EMPLOYMENT":
                        email.Attributes.Add("style", "display:block;");
                        labelemail.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
                        break;
                    case "LINKEDIN PROFILE LINK OF THE CONTACT":
                        linkedin.Attributes.Add("style", "display:block;");
                        labellinkedin.InnerHtml = fields[k].secondaryfielddnamevalue == "" ? fields[k].primaryfiledname : fields[k].primaryfiledname + "( " + fields[k].secondaryfielddnamevalue + ")";
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
                                where pInfo.applicantid == userID && pInfo.employerid == employerId
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
                    ddlCountry.Items.FindByValue(employerInfo.country).Selected = true;
                }
                txtPosition.Value = employerInfo.designation;
                txtStartDate.Value = Convert.ToDateTime(employerInfo.durationfrom).ToString("yyyy-MM-dd");
                txtEndate.Value = Convert.ToDateTime(employerInfo.durationto).ToString("yyyy-MM-dd");
                txtbriefDescription.Value = employerInfo.briefdescription;
                txtreportingmanger.Value = employerInfo.nameofreportingmanger;
                txtemploymentverification.Value = employerInfo.contactpersonwithdetails;
                txtrelationship.Value = employerInfo.relationshipwithcontact;
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
            string employerid = hdnemployer.Value;
            if (employerid == "")
            {
                applicantemployerdetails objEmployer = new applicantemployerdetails();
                if (rblEmploymentYes.Checked)
                    objEmployer.wishtoaddemployer = 1;
                else
                    objEmployer.wishtoaddemployer = 0;
                objEmployer.organization = txtEmployer.Value;
                objEmployer.website = txtemployerwebsite.Value;
                objEmployer.city = txtCity.Value;
                if (ddlCountry.SelectedValue != "")
                {

                    objEmployer.country = ddlCountry.SelectedValue;

                }
                objEmployer.designation = txtPosition.Value;
                objEmployer.durationfrom = Convert.ToDateTime(txtStartDate.Value);
                objEmployer.durationto = Convert.ToDateTime(txtEndate.Value);
                objEmployer.briefdescription = txtbriefDescription.Value;
                objEmployer.nameofreportingmanger = txtreportingmanger.Value;
                objEmployer.contactpersonwithdetails = txtemploymentverification.Value;
                objEmployer.relationshipwithcontact = txtrelationship.Value;
                objEmployer.emailid = txtEmail.Value;
                objEmployer.linkedinidofcontact = txtlinkedin.Value;
                objEmployer.applicantid = userID;
                objEmployer.lastsavedtime = DateTime.Now;
                db.applicantemployerdetails.Add(objEmployer);
            }
            else
            {
                int eID = Convert.ToInt32(employerid);
                var employerInfo = (from pInfo in db.applicantemployerdetails
                                    where pInfo.employerid == eID
                                    select pInfo).FirstOrDefault();

                if (employerInfo != null)
                {
                    if (rblEmploymentYes.Checked)
                        employerInfo.wishtoaddemployer = 1;
                    else
                        employerInfo.wishtoaddemployer = 0;
                    employerInfo.organization = txtEmployer.Value;
                    employerInfo.website = txtemployerwebsite.Value;
                    employerInfo.city = txtCity.Value;
                    if (ddlCountry.SelectedValue != "")
                    {
                        employerInfo.country = ddlCountry.SelectedValue;

                    }
                    employerInfo.designation = txtPosition.Value;
                    employerInfo.durationfrom = Convert.ToDateTime(txtStartDate.Value);
                    employerInfo.durationto = Convert.ToDateTime(txtEndate.Value);
                    employerInfo.briefdescription = txtbriefDescription.Value;
                    employerInfo.nameofreportingmanger = txtreportingmanger.Value;
                    employerInfo.contactpersonwithdetails = txtemploymentverification.Value;
                    employerInfo.relationshipwithcontact = txtrelationship.Value;
                    employerInfo.emailid = txtEmail.Value;
                    employerInfo.linkedinidofcontact = txtlinkedin.Value;
                    employerInfo.lastsavedtime = DateTime.Now;
                }
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
                              where eInfo.applicantid == userID
                              select eInfo).ToList();
            grdEmployment.DataSource = empDetails;
            grdEmployment.DataBind();
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
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}