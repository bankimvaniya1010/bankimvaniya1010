using NReco.PdfGenerator;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_view_gteapplicantdocuments : System.Web.UI.Page
{
    int universityid = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    gte_videouploadmaster objgte_videouploadmaster = new gte_videouploadmaster();
    string webURL = String.Empty;
    int applicantid = 0;
    public List<Details> documentlist = new List<Details>();
   
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityid = Utility.GetUniversityId();

        if (string.IsNullOrEmpty(Request.QueryString["applicantId"]))
            Response.Redirect(webURL + "admin/default.aspx", true);
        else
            applicantid = Convert.ToInt32(Request.QueryString["applicantId"].ToString());
        if (!IsPostBack)
        {
           
            //populatecertificate(applicantid);
            poupulateUplodedDocuments(applicantid);
        }
    }

    //private void populatecertificate(int applicantid)
    //{
    //    try
    //    {
    //        var data = (from vInfo in db.gte_progressbar
    //                    where vInfo.universityId == universityid && vInfo.applicantid == applicantid
    //                    select vInfo).FirstOrDefault();
    //        if (data != null)
    //        {
    //            if (data.is_gte_certificate_generated == true)
    //            {
    //                gtecertificatelink.NavigateUrl = webURL+ "gte_certificate1.aspx?applicantid="+applicantid;
    //                gtecertificatelink.Text = "View Certificate";
    //            }
    //            else
    //            {
    //                gtecertificatelink.Text = "NO Certificate";
    //            }
    //        }
    //    }
    //    catch (Exception ex)
    //    {
    //        objLog.WriteLog(ex.StackTrace.ToString());
    //    }
    //}


    private void poupulateUplodedDocuments(int applicantid)
    {
        try {

            if(objCom.GetIS_oldOrNew_applicant(applicantid) == true)
                documentlist = (from ad in db.gte_applicantdocument
                            join pfm in db.primaryfieldmaster on ad.documentid equals pfm.primaryfieldid
                            where ad.applicantid == applicantid && ad.universityid == universityid && pfm.primaryfieldid == ad.documentid
                            select new Details() {
                                documentid = ad.applicantdocumentid,
                                documentname= pfm.primaryfiledname,
                                documentpath = webURL + "Docs/GTEApplicantDocument/"+ad.universityid+"/"+applicantid+"/"+ad.documentpath,

                            }).ToList();
            else
                documentlist = (from ad in db.gte_applicantdocument
                                join pfm in db.primaryfieldmaster on ad.documentid equals pfm.primaryfieldid
                                where ad.applicantid == applicantid && ad.universityid == universityid && pfm.primaryfieldid == ad.documentid
                                select new Details()
                                {
                                    documentid = ad.applicantdocumentid,
                                    documentname = pfm.primaryfiledname,
                                    documentpath = webURL + "Docs/GTEApplicantDocument/" + ad.documentpath,

                                }).ToList();

        }
        catch (Exception ex){objLog.WriteLog(ex.StackTrace.ToString());}
    }
    public class Details
    {
        public int documentid { get; set; }
        public string documentname { get; set; }
        public string documentpath { get; set; }
        public string certificatepath { get; set; }

    }  
}