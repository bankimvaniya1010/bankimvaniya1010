﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantreview : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0 , universityID;
    private GTEEntities db = new GTEEntities();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected List<applicantdetails> objApplicant = new List<applicantdetails>();
    protected List<applicantemployerdetails> objEmployer = new List<applicantemployerdetails>();
    protected List<applicantlanguagecompetency> objLanguage = new List<applicantlanguagecompetency>();
    protected List<applicanthighereducation> objHigherEdu = new List<applicanthighereducation>();
    protected List<applicanteducationdetails> objEdu = new List<applicanteducationdetails>();
    protected string FullName = "";
    protected string PostalAddress = "";
    protected string ResidentailAddress = "";
    protected Common objComm = new Common();
    protected static List<faq> allQuestions = new List<faq>();
    protected void Page_Load(object sender, EventArgs e)
    {
        var isProfileDetailsCompletedByApplicant = (bool)Session["ProfileDetailsCompletedByApplicant"];
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        else if (isProfileDetailsCompletedByApplicant)
        {
            allQuestions = objComm.FaqQuestionList();
            var objUser = (students)Session["LoginInfo"];
            userID = objUser.studentid;

            objApplicant = (from pInfo in db.applicantdetails
                            where pInfo.applicantid == userID && pInfo.universityid == universityID
                            select pInfo).ToList();
            string Institutename = "";
            if (objApplicant[0].universityid != null)
            {
                // int universityID = Convert.ToInt32(objApplicant[0].universityid);
                var institute = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
                if (institute != null)
                    Institutename = institute.university_name;
            }
            applicant.InnerText = applicant.InnerText.Replace("#NameofApplicant#", objUser.name);
            applicantverify.InnerText = applicantverify.InnerText.Replace("#NameofInstitution#", Institutename);
            applicantacknowledge.InnerText = applicantacknowledge.InnerText.Replace("#NameofInstitution#", Institutename);
            applicantaware.InnerText = applicantaware.InnerText.Replace("#NameofInstitution#", Institutename);
            applicantawareConfirm.InnerText = applicantawareConfirm.InnerText.Replace("#NameofInstitution#", Institutename);
            applicantresponsible.InnerText = applicantresponsible.InnerText.Replace("#NameofInstitution#", Institutename);

            string Title = objComm.GetTitle(Convert.ToInt32(objApplicant[0].title));
            if (Title == "Others")
            {
                if ((objApplicant[0].firstname != null) && (objApplicant[0].lastname != null))
                    FullName = objApplicant[0].othertitle.ToString() + " " + objApplicant[0].firstname.ToString() + " " + objApplicant[0].lastname.ToString();
            }
            else
            {
                if ((objApplicant[0].firstname != null) && (objApplicant[0].lastname != null))
                    FullName = Title + " " + objApplicant[0].firstname.ToString() + " " + objApplicant[0].lastname.ToString();
            }
            PostalAddress = objApplicant[0].postaladdrees1 == null ? "" : objApplicant[0].postaladdrees1.ToString() + " " + objApplicant[0].postaladdrees2 == null ? "" : objApplicant[0].postaladdrees2.ToString() + " " + objApplicant[0].postaladdrees3 == null ? "" : objApplicant[0].postaladdrees3.ToString() + " " + objApplicant[0].postalcity == null ? "" : objApplicant[0].postalcity.ToString() + " " + objApplicant[0].postalstate == null ? "" : objApplicant[0].postalstate.ToString() + " " + objApplicant[0].postalpostcode == null ? "" : objApplicant[0].postalpostcode.ToString() + " " + objComm.GetCountryDiscription(objApplicant[0].postalcountry.ToString());
            ResidentailAddress = objApplicant[0].residentialaddress1 == null ? "" : objApplicant[0].residentialaddress1.ToString() + " " + objApplicant[0].residentialaddress2 == null ? "" : objApplicant[0].residentialaddress2.ToString() + " " + objApplicant[0].residentialaddress3 == null ? "" : objApplicant[0].residentialaddress3.ToString() + " " + objApplicant[0].residentialcity == null ? "" : objApplicant[0].residentialcity.ToString() + " " + objApplicant[0].residentialstate == null ? "" : objApplicant[0].residentialstate.ToString() + " " + objApplicant[0].residentailpostcode == null ? "" : objApplicant[0].residentailpostcode.ToString() + " " + objComm.GetCountryDiscription(objApplicant[0].residentialcountry.ToString());
            objEmployer = (from pInfo in db.applicantemployerdetails
                           where pInfo.applicantid == userID && pInfo.universityid == universityID
                           select pInfo).ToList();
            objLanguage = (from pInfo in db.applicantlanguagecompetency
                           where pInfo.applicantid == userID && pInfo.universityid == universityID
                           select pInfo).ToList();
            objHigherEdu = (from pInfo in db.applicanthighereducation
                            where pInfo.applicantid == userID && pInfo.universityid == universityID
                            select pInfo).ToList();
            objEdu = (from pInfo in db.applicanteducationdetails
                      where pInfo.applicantid == userID && pInfo.universityid == universityID
                      select pInfo).ToList();
        }
        else
        	Response.Redirect("personaldetails.aspx?formid=1", true);
    }
   
}