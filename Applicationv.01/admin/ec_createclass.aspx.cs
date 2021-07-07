using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class admin_ec_createclass : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int selectedexaminerId, selectuniversity, adminId, universityID;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        roleName = Utility.GetRoleName();
        adminId = Convert.ToInt32(Session["UserID"]);
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();

        if (!IsPostBack) {
            BindDropdowns();
            populateAutoID();
        }
    }
    private void populateAutoID() {
        List<int> listID = db.ec_class_master.Select(x => x.id).ToList();
        lblcode.Text = (listID.Last() + 1).ToString();
    }

    private void BindDropdowns() {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            
            var major = db.majordiscipline_master.ToList();
            ddlmajor.DataSource = major;
            ddlmajor.DataTextField = "description";
            ddlmajor.DataValueField = "id";
            ddlmajor.DataBind();
            ddlmajor.Items.Insert(0, lst);

            var studylevel = db.studylevelmaster.ToList();
            ddllevel.DataSource = studylevel;
            ddllevel.DataTextField = "studylevel";
            ddllevel.DataValueField = "studylevelid";
            ddllevel.DataBind();
            ddllevel.Items.Insert(0, lst);

            var grade = db.grademaster.ToList();
            ddlgrade.DataSource = grade;
            ddlgrade.DataTextField = "description";
            ddlgrade.DataValueField = "id";
            ddlgrade.DataBind();
            ddlgrade.Items.Insert(0, lst);

            var subject = db.subjectmaster.ToList();
            ddlsubject.DataSource = subject;
            ddlsubject.DataTextField = "description";
            ddlsubject.DataValueField = "id";
            ddlsubject.DataBind();
            ddlsubject.Items.Insert(0, lst);

            var type = db.type_master.ToList();
            ddltype.DataSource = type;
            ddltype.DataTextField = "description";
            ddltype.DataValueField = "id";
            ddltype.DataBind();
            ddltype.Items.Insert(0, lst);

            var currency = db.currency_master.ToList();
            ddlcurrency.DataSource = currency;
            ddlcurrency.DataTextField = "currency_symbol";
            ddlcurrency.DataValueField = "id";
            ddlcurrency.DataBind();
            ddlcurrency.Items.Insert(0, lst);

            
            var Location = db.universitycampus.Where(x=>x.universityid == universityID).ToList();
            lstLocation.DataSource = Location;
            lstLocation.DataTextField = "campusname";
            lstLocation.DataValueField = "campusid";
            lstLocation.DataBind();

            for (int i = 0; i <= 9; i++)
            {
                ddlyear.Items.Insert(i, i.ToString());
                ddlhours.Items.Insert(i, i.ToString());
            }
            for (int i = 0; i <= 11; i++)
                ddlmonths.Items.Insert(i, i.ToString());
            for (int i = 0; i <= 30; i++)
                ddldays.Items.Insert(i, i.ToString());

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_submit_Click(object sender, EventArgs e)
    {
        try
        {
            ec_class_master objec_class_master = new ec_class_master();

            string classname = txtclassname.Value;
            var data = db.ec_class_master.Where(x => x.classname == classname).FirstOrDefault();
            if (data == null)
            {
                objec_class_master.classname = txtclassname.Value;
                objec_class_master.classdescription = txtclassdescription.Text;
                objec_class_master.webpageurl = txtwebpageurl.Value;
                if (ddlmajor.SelectedValue != "0")
                    objec_class_master.majorid = Convert.ToInt32(ddlmajor.SelectedValue);
                if (ddllevel.SelectedValue != "0")
                    objec_class_master.levelid = Convert.ToInt32(ddllevel.SelectedValue);
                if (ddlgrade.SelectedValue != "0")
                    objec_class_master.gradeid = Convert.ToInt32(ddlgrade.SelectedValue);
                if (ddlsubject.SelectedValue != "0")
                    objec_class_master.subjectid = Convert.ToInt32(ddlsubject.SelectedValue);
                if (ddlmode.SelectedValue != "0")
                    objec_class_master.modeid = Convert.ToInt32(ddlmode.SelectedValue);
                objec_class_master.virtuallink = txtvirtuallink.Value;
                if (rblauto.Checked)
                    objec_class_master.classsetting = 1;
                else if (rblmanual.Checked)
                    objec_class_master.classsetting = 2;

                if (ddltype.SelectedValue != "0")
                    objec_class_master.type = Convert.ToInt32(ddltype.SelectedValue);

                if (ddlyear.SelectedValue != null && ddlyear.SelectedValue != "")
                    objec_class_master.duration_year = Convert.ToInt32(ddlyear.SelectedValue);
                if (ddlmonths.SelectedValue != null && ddlmonths.SelectedValue != "")
                    objec_class_master.duration_month = Convert.ToInt32(ddlmonths.SelectedValue);
                if (ddldays.SelectedValue != "" && ddldays.SelectedValue != null)
                    objec_class_master.duration_day = Convert.ToInt32(ddldays.SelectedValue);
                if (ddlhours.SelectedValue != "" && ddlhours.SelectedValue != null)
                    objec_class_master.duration_hours = Convert.ToInt32(ddlhours.SelectedValue);

                if (ddlcurrency.SelectedValue != "0")
                    objec_class_master.fee_currency = Convert.ToInt32(ddlcurrency.SelectedValue);
                objec_class_master.fee_amount = txtfee.Value;

                objec_class_master.requirement = txtrequirements.Value;
                objec_class_master.instruction = txtinstructions.Value;

                if (intructionfile.HasFile)
                {
                    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"];
                    docPath = docPath + "/Eclass_Service/class/";
                    if (!Directory.Exists(docPath))
                        Directory.CreateDirectory(docPath);
                    string extension = Path.GetExtension(intructionfile.PostedFile.FileName);
                    string filename = Guid.NewGuid() + extension;

                    if (File.Exists(docPath + filename))
                    {
                        File.Delete(docPath + filename);
                    }

                    intructionfile.PostedFile.SaveAs(docPath + filename);
                    objec_class_master.instructionfilepath = filename;

                }

                if (ddlbooklatestatus.SelectedValue != "0")
                    objec_class_master.booklatestatus = Convert.ToInt32(ddlbooklatestatus.SelectedValue);

                objec_class_master.universityid = universityID;
                db.ec_class_master.Add(objec_class_master);
                db.SaveChanges();

                int classID = objec_class_master.id;

                for (int i = 0; i < lstLocation.Items.Count; i++)
                {
                    ec_class_location_mapping_master objLocation = new ec_class_location_mapping_master();
                    if (lstLocation.Items[i].Selected == true)
                    {
                        objLocation.classid = classID;
                        objLocation.locationid = Convert.ToInt32(lstLocation.Items[i].Value);
                        db.ec_class_location_mapping_master.Add(objLocation);
                        db.SaveChanges();
                    }
                }
                //dates
                string[] facilitiesList = hidFacilities.Value.Split(';');
                string[] facilitiesCostList = hidFacilityCost.Value.Split(';');
                string[] facilitiesPriceList = hidFacilityPrice.Value.Split(';');

                int facilitiesCount = facilitiesList.Length;
                for (int i = 0; i < facilitiesCount - 1; i++)
                {
                    ec_class_date_master objmapping = new ec_class_date_master();
                    objmapping.classid = classID;
                    objmapping.class_startdate = Convert.ToDateTime(facilitiesList[i]);
                    objmapping.class_deadLinedate = Convert.ToDateTime(facilitiesCostList[i]);
                    objmapping.class_deadLinedate_utc = Convert.ToDateTime(facilitiesPriceList[i]);

                    db.ec_class_date_master.Add(objmapping);
                    db.SaveChanges();
                }
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                     "alert('Record Inserted Successfully');window.location='" + Request.ApplicationPath + "admin/ec_manageclass.aspx';", true);

            }
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Class with entered name already exists')", true);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}