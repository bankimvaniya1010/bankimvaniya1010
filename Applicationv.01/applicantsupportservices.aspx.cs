using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class applicantsupportservices : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    int UserID = 0;
    Logger objLog = new Logger();
    Common objCommon = new Common();
    protected static List<faq> allfaqQuestion = new List<faq>();
    string webURL = String.Empty;//System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int UniversityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());

        if (!IsPostBack)
        {
            allfaqQuestion = objCommon.FaqQuestionList();
            universityInstruction.InnerText = db.university_master.Where(x => x.universityid == UniversityID).Select(x => x.supprot_service_instructions).FirstOrDefault();
            BindDateList();
        }

    }

    private void BindDateList()
    {
        try
        {
            var allServiceList = (from sm in db.supportservicemaster
                                  join usm in db.universitywise_supportservicemapping on sm.supportservicemasterId equals usm.supportserviceID
                                  where usm.universityid == UniversityID
                                  select new
                                  {
                                      serviceID = sm.supportservicemasterId,
                                      servicetype = sm.servicetype,
                                      providername = sm.serviceprovider_name,
                                      description = sm.description,
                                      provideremail = sm.serviceprovider_email,
                                      image = webURL + "/Docs/" + sm.imagepath
                                  }).ToList();
                
            if (allServiceList.Count == 0)
            {
                emptyServicesDiv.Visible = true;
                emptyServicesDiv.Style.Remove("display");
                services.Visible = false;
                lblEmptyList.Text = "No Support Services";
            }
            else
            {
                servicesList.DataSource = allServiceList;
                servicesList.DataBind();
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    protected void servicesList_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "SendEmail")
        {
            try
            {
                string[] data = new string[3];
                data = e.CommandArgument.ToString().Split(',');
                Session["ServiceID"] = data[0];
                Session["provideremail"] = data[1];
                Session["providername"] = data[2];
                Session["servicetype"] = data[3];

                int serviceID = Convert.ToInt32(Session["ServiceID"]);
                var emailId = Session["provideremail"];
                string providername = Convert.ToString(Session["providername"]);
                string servicetype = Convert.ToString(Session["servicetype"]);

                var applicantname = db.students.Where(x=>x.studentid == UserID).Select(x => x.name).FirstOrDefault();
                //save to db
                supportservices_enquiries objresponse = new supportservices_enquiries();
                objresponse.applicantid = UserID;
                objresponse.universityid = UniversityID;
                objresponse.supportserviceId = serviceID;
                db.supportservices_enquiries.Add(objresponse);
                db.SaveChanges();
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Your Request for the Enquiry of support service is sent .')", true);
                //send email
                string html = File.ReadAllText(Server.MapPath("/assets/Emailtemplate/supportService.html"));
                html = html.Replace("@providername", providername);
                html = html.Replace("@applicantname", applicantname.ToString());
                html = html.Replace("@servicetype", servicetype);
                objCommon.SendMail(Convert.ToString(emailId), html, "Support Service Enquiry");
            }
            catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
            
        }
    }
}