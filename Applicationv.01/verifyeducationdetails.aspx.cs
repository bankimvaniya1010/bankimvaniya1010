using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class verifyhighschool : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    public string lblfirstname = string.Empty;
    public string lbluniversityName = string.Empty;
    Logger objLog = new Logger();
    Common objCom = new Common();
    string webURL = String.Empty;
    string qualificationtype = string.Empty;
    string verificationKey = string.Empty;
    int applicantid = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();       
        verificationKey = Request.QueryString["key"];
        qualificationtype = Request.QueryString["type"];
        
        if (Request.QueryString["key"] != null || Request.QueryString["type"] != null)
        {
            applicanteducationdetails educationDetails = null;
            applicanthighereducation higherEducationDetails = null;
            if (qualificationtype == "highschool")
                educationDetails = db.applicanteducationdetails.Where(obj => obj.highschoolverificationkey == verificationKey && obj.ishighschooldone == 1).FirstOrDefault();
            else if (qualificationtype == "secondary")
                educationDetails = db.applicanteducationdetails.Where(obj => obj.secondaryverificationkey == verificationKey && obj.issecondarydone == 1).FirstOrDefault();
            else if (qualificationtype == "diploma")
                educationDetails = db.applicanteducationdetails.Where(obj => obj.diplomaverificationkey == verificationKey && obj.isdiplomadone == 1).FirstOrDefault();
            else if (qualificationtype == "highereducation")
                higherEducationDetails = db.applicanthighereducation.Where(obj => obj.highereducationverificationkey == verificationKey).FirstOrDefault();

            if (educationDetails != null || higherEducationDetails != null)
            {
                if (educationDetails != null)
                {
                    var applicantdetails = db.applicantdetails.Where(x => x.applicantid == educationDetails.applicantid && x.universityid == educationDetails.universityid).Select(x => new { x.firstname,x.applicantid }).FirstOrDefault();
                    if (applicantdetails.firstname != null)
                    {
                        lblfirstname = applicantdetails.firstname;
                        applicantid = Convert.ToInt32(applicantdetails.applicantid);
                    }

                    if (qualificationtype == "highschool")
                    {
                        if (educationDetails.ishighschoolverified.HasValue && educationDetails.ishighschoolverified.Value)
                            alreadyVerified();
                        else
                        {
                            questionDIv.Visible = true;
                            //acc bind lbl                                
                            lblqualificationName.InnerText = "High School";
                            lblhighschoolName.InnerText = educationDetails.highschoolname;
                            lblstartdateofQualification.InnerText = educationDetails.highschoolstartdate;
                            lblenddateofQualification.InnerText = educationDetails.highschoolendate;
                            lbllocationofhighschool.InnerText = objCom.GetCountryDiscription(Convert.ToInt32(educationDetails.highschoolcountry));
                        }
                    }
                    else if (qualificationtype == "secondary")
                    {
                        if (educationDetails.issecondaryverified.HasValue && educationDetails.issecondaryverified.Value)
                            alreadyVerified();
                        else
                        {
                            questionDIv.Visible = true;
                            //acc bind lbl
                            lblqualificationName.InnerText = "Secondary";
                            lblhighschoolName.InnerText = educationDetails.secondaryname;
                            lblstartdateofQualification.InnerText = educationDetails.secondarystartdate;
                            lblenddateofQualification.InnerText = educationDetails.secondaryendate;
                            lbllocationofhighschool.InnerText = objCom.GetCountryDiscription(Convert.ToInt32(educationDetails.secondarycountry));
                        }
                    }
                    else if (qualificationtype == "diploma")
                    {
                        if (educationDetails.isdiplomaverified.HasValue && educationDetails.isdiplomaverified.Value)
                            alreadyVerified();
                        else
                        {
                            questionDIv.Visible = true;
                            //acc bind lbl
                            lblqualificationName.InnerText = "Diploma";
                            lblhighschoolName.InnerText = educationDetails.diplomaschoolname;
                            lblstartdateofQualification.InnerText = educationDetails.diplomastartdate;
                            lblenddateofQualification.InnerText = educationDetails.diplomaendate;
                            lbllocationofhighschool.InnerText = objCom.GetCountryDiscription(Convert.ToInt32(educationDetails.diplomacountry));
                        }
                    }
                }
                else if (higherEducationDetails != null)
                {
                    if (higherEducationDetails.ishighereducationverified.HasValue && higherEducationDetails.ishighereducationverified.Value)
                        alreadyVerified();
                    else
                    {
                        questionDIv.Visible = true;
                        lblqualificationName.InnerText = higherEducationDetails.coursename;
                        lblhighschoolName.InnerText = higherEducationDetails.schoolname;
                        lblstartdateofQualification.InnerText = higherEducationDetails.startdate;
                        lblenddateofQualification.InnerText = higherEducationDetails.endate;
                        lbllocationofhighschool.InnerText = objCom.GetCountryDiscription(Convert.ToInt32(higherEducationDetails.countryofhighereducation));
                    }
                }
            }
            else
                notFound();
        }
        else
            notFound();

    }

    private void alreadyVerified()
    {
        detailsNotFound.Visible = false;
        afterVerfication.Visible = false;
        verified.Visible = true;
        questionDIv.Visible = false;
    }

    private void notFound()
    {
        detailsNotFound.Visible = true;
        afterVerfication.Visible = false;
        verified.Visible = false;
        questionDIv.Visible = false;
    }

    protected void btn_Save_Click(object sender, EventArgs e)
    {
        try
        {
            var mode = "new";
            var details = db.educationdetailcheck_referee_response.Where(x => x.type == qualificationtype).FirstOrDefault();
            educationdetailcheck_referee_response objresponse = new educationdetailcheck_referee_response();

            if (details != null)
            {
                mode = "update";
                objresponse = details;
            }
            objresponse.applicantId = applicantid;
            objresponse.universityId = Utility.GetUniversityId();
            objresponse.type = qualificationtype;
            if (rbYes.Checked)
                objresponse.verifieddetailsresponse = 1;
            else
                objresponse.verifieddetailsresponse = 0;
            objresponse.howlongknoweachresponse = txtQuestion2.Value;
            objresponse.performancedescription = txtQuestion3.Value;
            objresponse.greateststrengthresponse = txtQuestion4.Value;
            objresponse.additionalInforesponse = txtQuestion5.Value;

            if (mode == "new")
                db.educationdetailcheck_referee_response.Add(objresponse);
            db.SaveChanges();
            savefverificationFlag();
            detailsNotFound.Visible = false;
            verified.Visible = false;
            afterVerfication.Visible = true;
            questionDIv.Visible = false;
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void savefverificationFlag()
    {
        try
        {
            var mode = "new";
            //isverified flag save 
            dynamic educationDetails = null;
            dynamic higherEducationDetails = null;
            if (qualificationtype == "highschool")
                educationDetails = db.applicanteducationdetails.Where(obj => obj.highschoolverificationkey == verificationKey && obj.ishighschooldone == 1).FirstOrDefault();
            else if (qualificationtype == "secondary")
                educationDetails = db.applicanteducationdetails.Where(obj => obj.secondaryverificationkey == verificationKey && obj.issecondarydone == 1).FirstOrDefault();
            else if (qualificationtype == "diploma")
                educationDetails = db.applicanteducationdetails.Where(obj => obj.diplomaverificationkey == verificationKey && obj.isdiplomadone == 1).FirstOrDefault();
            else if (qualificationtype == "highereducation")
                higherEducationDetails = db.applicanthighereducation.Where(obj => obj.highereducationverificationkey == verificationKey).FirstOrDefault();

            applicanteducationdetails objapplicanteducationdetails = new applicanteducationdetails();
            applicanthighereducation objapplicanthighereducation = new applicanthighereducation();

            if (qualificationtype == "highereducation")
            {
                if (higherEducationDetails != null)
                {
                    mode = "update";
                    objapplicanthighereducation = higherEducationDetails;
                }
                if (qualificationtype == "highereducation")
                    objapplicanthighereducation.ishighereducationverified = true;
                if (mode == "new")
                    db.applicanthighereducation.Add(objapplicanthighereducation);
                db.SaveChanges();
            }
            else
            {
                if (educationDetails != null)
                {
                    mode = "update";
                    objapplicanteducationdetails = educationDetails;
                }

                if (qualificationtype == "highschool")
                    objapplicanteducationdetails.ishighschoolverified = true;
                else if (qualificationtype == "secondary")
                    objapplicanteducationdetails.issecondaryverified = true;
                else if (qualificationtype == "diploma")
                    objapplicanteducationdetails.isdiplomaverified = true;
                if (mode == "new")
                    db.applicanteducationdetails.Add(objapplicanteducationdetails);
                db.SaveChanges();
            }

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }
}