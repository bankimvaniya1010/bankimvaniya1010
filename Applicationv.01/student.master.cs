﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin : System.Web.UI.MasterPage
{
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    public int? questioncompleted = 0 , isclarificationquestionset = 0;
    string webURL = String.Empty;
    int universityID;
    int UserID = 0;    
    public string logourl = string.Empty;
    public string fontColor = string.Empty;
    public string headercolor = string.Empty;
    public string verticalnavigationcolor = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        universityID = Utility.GetUniversityId();
        if (!Utility.CheckStudentLogin())
            Response.Redirect(webURL + "Login.aspx", true);
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        string name = db.students.Where(x => x.studentid == UserID).Select(x => x.name).FirstOrDefault();
        var gteQuestionPart2Count = db.gte_question_master_part2.Count();
        var applicant_response = db.gte_question_part2_applicant_response.Where(x => x.applicant_id == UserID && x.university_id == universityID).ToList();

        if (applicant_response.Count == gteQuestionPart2Count) // Condition for checking gte Questions Part 2 completed
            questioncompleted = 1;

        var clarification_questionsList = db.gte_clarification_questionmaster.ToList();

        foreach (var item in applicant_response)
            clarification_questionsList.RemoveAll(x => x.gte_master1_id == item.question_id && x.display_condition.Value != item.applicant_response.Value);

        if (clarification_questionsList.Count == 0)
            isclarificationquestionset = 0;
        else
            isclarificationquestionset = 1;

        if (!IsPostBack) {
            Bindseclanguagelist();
            populateSelectedLanguage();
        }
        lblusername.Text = name;
        var universityDetails = db.university_master.Where(x => x.universityid == universityID).Select(x => new { x.university_name, x.universityid, x.fontcolor, x.headerstripcolor, x.verticalnavigationcolor, x.logo }).FirstOrDefault();
        logourl = webURL + "/Docs/" + universityDetails.universityid + "/" + universityDetails.logo;
        lbluniversityName.Text = universityDetails.university_name;
        verticalnavigationcolor = universityDetails.verticalnavigationcolor;
        fontColor = universityDetails.fontcolor;
        headercolor = universityDetails.headerstripcolor;
    }

    private void populateSelectedLanguage()
    {
        string SecondaryLanguage = Utility.GetSecondaryLanguage();
        if (SecondaryLanguage != "")
            ddlseclanguage.Items.FindByValue(SecondaryLanguage.ToString()).Selected = true;
    }


    private void Bindseclanguagelist()
    {
        ListItem lst = new ListItem("Please select", "0");
        var slm = db.secondarylanguagemaster.ToList();
        ddlseclanguage.DataSource = slm;
        ddlseclanguage.DataTextField = "secondarylanguagename";
        ddlseclanguage.DataValueField = "languagecode";
        ddlseclanguage.DataBind();
        ddlseclanguage.Items.Insert(0, lst);
    }


}
