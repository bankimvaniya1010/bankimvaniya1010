using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_viewinfo : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0;
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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        // var objUser = (user)Session["LoginInfo"];
        if ((Request.QueryString["ID"] != null) && (Request.QueryString["ID"] != null))
            userID = Convert.ToInt32(Request.QueryString["ID"]);
        if (!IsPostBack)
        {
            objApplicant = (from pInfo in db.applicantdetails
                            where pInfo.applicantid == userID
                            select pInfo).ToList();
            string Institutename = "";
            if (objApplicant[0].universityid != null)
            {
                int universityID = Convert.ToInt32(objApplicant[0].universityid);
                var institute = db.university_master.Where(x => x.universityid == universityID).FirstOrDefault();
                if (institute != null)
                    Institutename = institute.university_name;
            }


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
                           where pInfo.applicantid == userID
                           select pInfo).ToList();
            objLanguage = (from pInfo in db.applicantlanguagecompetency
                           where pInfo.applicantid == userID
                           select pInfo).ToList();
            objHigherEdu = (from pInfo in db.applicanthighereducation
                            where pInfo.applicantid == userID
                            select pInfo).ToList();
            objEdu = (from pInfo in db.applicanteducationdetails
                      where pInfo.applicantid == userID
                      select pInfo).ToList();
        }
    }
}