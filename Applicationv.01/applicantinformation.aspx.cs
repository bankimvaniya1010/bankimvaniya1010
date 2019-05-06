using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Collections;

public partial class applicantinformation : System.Web.UI.Page
{
    int userID = 0, ApplicantID = 0;
    int pageID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    protected string breadcrum = "";
    ArrayList fieldList = new ArrayList();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    int universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (user)Session["LoginInfo"];
        userID = objUser.userid;
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
                                formfieldid = fm.formfieldid,
                                name = fm.name,
                                tooltips = fm.tooltips,
                                isdepedent = fm.isdepedent,
                                depedentformfieldid = fm.depedentformfieldid,
                                depedentformfieldvalue = fm.depedentformfieldvalue,
                                type = fm.type,
                                displayOrder = ffm.displayorder
                            }).ToList();

        ControlsList = ControlsList.OrderBy(x => x.displayOrder).ToList();
        for (int k = 0; k < ControlsList.Count; k++)
        {
            System.Web.UI.HtmlControls.HtmlGenericControl lstDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            lstDiv.Attributes["class"] = "list-group-item";
            lstDiv.ID = ControlsList[k].name.Replace(" ", "");
            mainDiv.Controls.Add(lstDiv);
            if (ControlsList[k].isdepedent == true)
            {
                lstDiv.Attributes["style"] = "display:none";
                lstDiv.Attributes["isdepedent"] = ControlsList[k].isdepedent.ToString();
                lstDiv.Attributes["depedentid"] = ControlsList[k].depedentformfieldid.ToString();
                lstDiv.Attributes["depedendentvalue"] = ControlsList[k].depedentformfieldvalue.ToString();
            }
            lstDiv.Attributes["controltype"] = ControlsList[k].type.ToString();
            lstDiv.Attributes["formfieldid"] = ControlsList[k].formfieldid.ToString();
            System.Web.UI.HtmlControls.HtmlGenericControl formgroupDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
            formgroupDiv.Attributes["class"] = "form-group m-0";
            formgroupDiv.Attributes["role"] = "group";
            formgroupDiv.Attributes["aria - labelledby"] = ControlsList[k].name;
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
            int fieldID = ControlsList[k].formfieldid;
            var typemaster = db.typemaster.Where(x => x.formfieldid == fieldID).ToList();
            if (ControlsList[k].type.ToLower() == "textbox")
            {
                TextBox txtcustombox = new TextBox();
                txtcustombox.ID = "txt" + ControlsList[k].name.Replace(" ", "");

                txtcustombox.Attributes["class"] = "form-control";
                txtcustombox.Attributes.Add("title", ControlsList[k].tooltips);
                mycontrol.Controls.Add(txtcustombox);

            }
            if (ControlsList[k].type.ToLower() == "dropdownlist")
            {
                DropDownList ddllst = new DropDownList();
                ddllst.ID = "ddl" + ControlsList[k].name.Replace(" ", ""); ;
                lstDiv.Attributes["parentcontrolid"] = ddllst.ID;

                ddllst.Attributes["class"] = "form-control";
                ddllst.Attributes.Add("title", ControlsList[k].tooltips);
                ddllst.Items.Add(new ListItem("Select", "0"));
                for (int t = 0; t < typemaster.Count; t++)
                {
                    ddllst.Items.Add(new ListItem(typemaster[t].value, typemaster[t].value));
                }
                mycontrol.Controls.Add(ddllst);

            }

            if (ControlsList[k].type.ToLower() == "radiobutton")
            {
                RadioButtonList radioButton = new RadioButtonList();
                radioButton.ID = "rd" + ControlsList[k].name.Replace(" ", "");

                lstDiv.Attributes["parentcontrolid"] = radioButton.ID;
                radioButton.Attributes["class"] = "form-control";
                radioButton.Attributes.Add("title", ControlsList[k].tooltips);
                for (int t = 0; t < typemaster.Count; t++)
                {
                    radioButton.Items.Add(new ListItem(typemaster[t].value, typemaster[t].value));
                }
                radioButton.RepeatDirection = RepeatDirection.Horizontal;
                mycontrol.Controls.Add(radioButton);

            }
            if (ControlsList[k].type.ToLower() == "calendar")
            {
                TextBox txtcustombox = new TextBox();
                txtcustombox.ID = "txt" + ControlsList[k].name.Replace(" ", "");
                txtcustombox.Attributes["class"] = "form-control";
                txtcustombox.Attributes["data-toggle"] = "flatpickr";
                txtcustombox.Attributes.Add("title", ControlsList[k].tooltips);
                mycontrol.Controls.Add(txtcustombox);

            }
        }
    }
}