using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_validatedocument : System.Web.UI.Page
{
    private int userID = 0, agentID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        var objUser = (students)Session["LoginInfo"];
        agentID = objUser.studentid;
        if ((Request.QueryString["ID"] != null) && (Request.QueryString["ID"] != null))
            userID = Convert.ToInt32(Request.QueryString["ID"]);
        if (!IsPostBack)
        { BindDocument(userID); }
    }

    private void BindDocument(int userId)
    {
        try
        {
            var query = (from adm in db.applicantdocumentmaster
                         join dva in db.documentvalidationbyagent on adm.documentid equals dva.documentid into combined
                         from x in combined.DefaultIfEmpty()
                         where adm.applicantid == userID
                         select new
                         {

                             documentid = adm.documentid,
                             applicantid = adm.applicantid,
                             documentname = adm.documentname,
                             filename = adm.filename,
                             remarks = x.remarks
                         }).ToList();
            gvValidateDocument.DataSource = query;
            gvValidateDocument.DataBind();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    protected void Download(object sender, EventArgs e)
    {
        try
        {

            string filePath = (sender as LinkButton).CommandArgument;
            if ((Session["Role"] == null) && (Session["UserID"] == null))
                Response.Redirect(webURL + "Login.aspx");
            if ((Request.QueryString["ID"] != null) && (Request.QueryString["ID"] != null))
                userID = Convert.ToInt32(Request.QueryString["ID"]);

            docPath = docPath + "\\" + userID + "\\Documents\\";
            Response.ContentType = ContentType;

            Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(docPath + filePath));
            Response.WriteFile(docPath + filePath);
            Response.End();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }



    protected void gvValidateDocument_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        try
        {

            gvValidateDocument.EditIndex = -1;
            BindDocument(userID);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    protected void gvValidateDocument_RowEditing(object sender, GridViewEditEventArgs e)
    {
        try
        {

            gvValidateDocument.EditIndex = e.NewEditIndex;
            BindDocument(userID);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }

    protected void gvValidateDocument_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {

            int ID = Convert.ToInt32(gvValidateDocument.DataKeys[e.RowIndex].Values[0]);
            documentvalidationbyagent docValidation = db.documentvalidationbyagent.Where(b => b.documentid == ID).FirstOrDefault();
            TextBox txtRemarks = (TextBox)gvValidateDocument.Rows[e.RowIndex].FindControl("txtRemarks");
            if (docValidation == null)
            {
                documentvalidationbyagent objDocValidation = new documentvalidationbyagent();
                objDocValidation.agentid = agentID;
                objDocValidation.documentid = ID;
                objDocValidation.lastupdatedate = DateTime.Now;
                objDocValidation.remarks = txtRemarks.Text.Trim();
                db.documentvalidationbyagent.Add(objDocValidation);
            }
            else
            { docValidation.remarks = txtRemarks.Text.Trim(); }



            gvValidateDocument.EditIndex = -1;
            db.SaveChanges();
            BindDocument(userID);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_Email(object sender, EventArgs e)
    {
        try
        {
            var personalInfo = db.applicantdetails.Where(x => x.applicantid == userID).FirstOrDefault();
            if (personalInfo != null)
                objCom.SendMail(personalInfo.email, txtEmailText.Value.ToString(), "Document Veification");
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}