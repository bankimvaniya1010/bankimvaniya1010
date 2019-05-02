using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;

public partial class applicantinformation : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0;
    int pageID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected string breadcrum = "";
    int universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["pageid"] != null && Request.QueryString["pageid"].ToString() != "")
            pageID = Convert.ToInt32(Request.QueryString["pageid"].ToString());
        SetControls(pageID);
    }

    private void SetControls(int pageID)
    {
        var ControlsList = (from fm in db.formfieldmaster
                        join ffm in db.formfieldmapping on fm.formfieldid equals ffm.formfieldid
                        where ffm.universityid == universityID && ffm.formid == pageID
                        select new
                        {
                            name = fm.name,
                            tooltips = fm.tooltips,
                            type = fm.type
                           }).ToList();


        for (int k = 0; k < ControlsList.Count; k++)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl lstDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            lstDiv.Attributes["class"] = "list-group-item";
            mainDiv.Controls.Add(lstDiv);
            System.Web.UI.HtmlControls.HtmlGenericControl formgroupDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            formgroupDiv.Attributes["class"] = "form-group m-0";
            formgroupDiv.Attributes["role"] = "group";
            formgroupDiv.Attributes["aria - labelledby "] = ControlsList[k].name;
            lstDiv.Controls.Add(formgroupDiv);
            System.Web.UI.HtmlControls.HtmlGenericControl divFormRow = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            divFormRow.Attributes["class"] = "form-row";
            formgroupDiv.Controls.Add(divFormRow);


            System.Web.UI.HtmlControls.HtmlGenericControl label1 = new System.Web.UI.HtmlControls.HtmlGenericControl("Label");
            label1.ID = "label" + ControlsList[k].name;
            label1.Attributes["class"] = "col-md-3 col-form-label form-label";
            label1.Attributes["for"] = ControlsList[k].name;
            label1.InnerHtml = ControlsList[k].name;
            divFormRow.Controls.Add(label1);
            System.Web.UI.HtmlControls.HtmlGenericControl mycontrol = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            mycontrol.Attributes["class"] = "col-md-6";
            divFormRow.Controls.Add(mycontrol);

            if (ControlsList[k].type.ToLower() == "textbox")
            {
                TextBox txtcustombox = new TextBox();
                txtcustombox.ID = "txt" + ControlsList[k].name;
                txtcustombox.Attributes["class"] = "form-control";
                txtcustombox.Attributes.Add("title", ControlsList[k].tooltips);
                mycontrol.Controls.Add(txtcustombox);

            }
            if (ControlsList[k].type.ToLower() == "dropdownlist")
            {
                DropDownList ddllst = new DropDownList();
                ddllst.ID = "ddl" + ControlsList[k].name; ;
                ddllst.Attributes["class"] = "form-control";
                ddllst.Attributes.Add("title", ControlsList[k].tooltips);
                ddllst.Items.Add(new ListItem("Select", "0"));
                mycontrol.Controls.Add(ddllst);

            }

            if (ControlsList[k].type.ToLower() == "radiobutton")
            {
                RadioButton radioButton = new RadioButton();
                radioButton.ID = "rd" + ControlsList[k].name; ;
                radioButton.Attributes["class"] = "form-control";
                radioButton.Attributes.Add("title", ControlsList[k].tooltips);
                radioButton.GroupName= ControlsList[k].name;
                mycontrol.Controls.Add(radioButton);

            }
        }
    }
}