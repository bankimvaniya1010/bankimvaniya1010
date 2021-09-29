using Amazon;
using Amazon.S3;
using Amazon.S3.Model;
using Amazon.S3.Transfer;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_class_create : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int adminId, universityID, RecordID;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    ec_class_master objec_class_master = new ec_class_master();
    public string timezone_value,date1, date2, editpage="0";
    public DateTime currentdatetime = DateTime.UtcNow;
    private object objapplicantdetails;

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

        if (Request.QueryString["id"] != null && Request.QueryString["id"].ToString() != "")
        {
            RecordID = -1;
            if (int.TryParse(Request.QueryString["id"], out RecordID))
            {
                objec_class_master = db.ec_class_master.Where(obj => obj.id == RecordID).FirstOrDefault();
                if (objec_class_master == null)
                    RecordID = -1;
                else
                    editpage = "1";
            }
        }
        
        if (!IsPostBack)
        {
            BindDropdowns();
            populateAutoID();
            if (objec_class_master != null)
                populate(RecordID);
                
        }
        
    }
    private void populate(int id)
    {
        try
        {
            
            if (objec_class_master != null && RecordID != 0)
            {
                lblcode.Text = objec_class_master.id.ToString();
                txtclassname.Value = objec_class_master.classname;
                txtclassdescription.Text = objec_class_master.classdescription;
                txtwebpageurl.Value = objec_class_master.webpageurl;

                if (objec_class_master.majorid != null)
                {
                    ddlmajor.ClearSelection();
                    ddlmajor.Items.FindByValue(objec_class_master.majorid.ToString()).Selected = true;
                }
                if (objec_class_master.levelid != null)
                {
                    ddllevel.ClearSelection();
                    ddllevel.Items.FindByValue(objec_class_master.levelid.ToString()).Selected = true;
                    ddlboradfield.Items.Clear();
                    BindBroadField(Convert.ToInt32(objec_class_master.levelid), ddlboradfield);
                }

                if (objec_class_master.broadFieldID != null)
                {
                    ddlboradfield.ClearSelection();
                    ddlboradfield.Items.FindByValue(objec_class_master.broadFieldID.ToString()).Selected = true;
                    hidbroadfieldId.Value = objec_class_master.broadFieldID.ToString();
                }
                if (objec_class_master.narrowFieldID != null)
                {
                    BindNarrowField(Convert.ToInt32(objec_class_master.broadFieldID), ddlnarrowfield);
                    ddlnarrowfield.ClearSelection();
                    ddlnarrowfield.Items.FindByValue(objec_class_master.narrowFieldID.ToString()).Selected = true;
                    hidnarrowfieldId.Value = objec_class_master.narrowFieldID.ToString();
                }
                if (objec_class_master.detailedFieldID != null)
                {
                    BindDetailedField(Convert.ToInt32(objec_class_master.narrowFieldID), ddldetailedfield);
                    ddldetailedfield.ClearSelection();
                    ddldetailedfield.Items.FindByValue(objec_class_master.detailedFieldID.ToString()).Selected = true;
                    hiddetailedfield.Value = objec_class_master.detailedFieldID.ToString();
                }


                if (objec_class_master.gradeid != null)
                {
                    ddlgrade.ClearSelection();
                    ddlgrade.Items.FindByValue(objec_class_master.gradeid.ToString()).Selected = true;
                }
                if (objec_class_master.groupid != null)
                {
                    ddlgroup.ClearSelection();
                    ddlgroup.Items.FindByValue(objec_class_master.groupid.ToString()).Selected = true;
                }
                if (objec_class_master.subjectid != null)
                {
                    ddlsubject.ClearSelection();
                    ddlsubject.Items.FindByValue(objec_class_master.subjectid.ToString()).Selected = true;
                }
                if (objec_class_master.type != null)
                {
                    ddltype.ClearSelection();
                    ddltype.Items.FindByValue(objec_class_master.type.ToString()).Selected = true;
                }
                if (objec_class_master.modeid != null)
                {
                    ddlmode.ClearSelection();
                    ddlmode.Items.FindByValue(objec_class_master.modeid.ToString()).Selected = true;
                }

                txtvirtuallink.Value = objec_class_master.virtuallink;
                if (objec_class_master.classsetting == 1)
                    rblauto.Checked = true;
                else
                    rblmanual.Checked = true;

                if (objec_class_master.location != null)
                {
                    lstLocation.ClearSelection();
                    lstLocation.Items.FindByValue(objec_class_master.location.ToString()).Selected = true;
                }
                if (objec_class_master.duration_year != null)
                {
                    ddlyear.ClearSelection();
                    ddlyear.Items.FindByValue(objec_class_master.duration_year.ToString()).Selected = true;
                }
                if (objec_class_master.duration_month != null)
                {
                    ddlmonths.ClearSelection();
                    ddlmonths.Items.FindByValue(objec_class_master.duration_month.ToString()).Selected = true;
                }
                if (objec_class_master.duration_day != null)
                {
                    ddldays.ClearSelection();
                    ddldays.Items.FindByValue(objec_class_master.duration_day.ToString()).Selected = true;
                }
                if (objec_class_master.duration_hours != null)
                {
                    ddlhours.ClearSelection();
                    ddlhours.Items.FindByValue(objec_class_master.duration_hours.ToString()).Selected = true;
                }
                if (objec_class_master.fee_currency != null)
                {
                    ddlcurrency.ClearSelection();
                    ddlcurrency.Items.FindByValue(objec_class_master.fee_currency.ToString()).Selected = true;
                }

                txtfee.Value = objec_class_master.fee_amount;
                txtenrollment_fee.Value = objec_class_master.enrollment_fee_amount;
                if (objec_class_master.timezone != null)
                    hidTimeZone.Value = objec_class_master.timezone;
                if (!string.IsNullOrEmpty(objec_class_master.timezone))
                {
                    string[] str = objec_class_master.timezone.Split(' ');
                    timezone_value = str[0];
                }
                else
                    timezone_value = "Australia/Perth";
                
            
                if (objec_class_master.recurrenceid != null && objec_class_master.recurrenceid != 0)
                {
                    ddlrecurrence.ClearSelection();
                    ddlrecurrence.Items.FindByValue(objec_class_master.recurrenceid.ToString()).Selected = true;

                    if (objec_class_master.recurrenceid == 1)
                    {
                        txtrepeatsevery_day.Value = objec_class_master.repeatsevery_day;
                        if (objec_class_master.enddate_daily != null)
                            txtenddate_daily.Value = Convert.ToDateTime(objec_class_master.enddate_daily).ToString("dd-MM-yyyy");
                    }
                    else if (objec_class_master.recurrenceid == 2)
                    {
                        txtrepeateevery_week.Value = objec_class_master.repeateevery_week;
                        if (objec_class_master.daysof_week != null && objec_class_master.daysof_week != "")
                        {
                            string[] xyz = objec_class_master.daysof_week.Split(',');
                            for (int i = 0; i < xyz.Count()-1; i++)
                            {
                                if (xyz[i] != "" && xyz[i] != null)
                                    lstDayofWeek.Items.FindByValue(xyz[i].ToString()).Selected = true;
                            }
                        }
                        if (objec_class_master.enddate_weekly != null)
                            txtenddate_weekly.Value = Convert.ToDateTime(objec_class_master.enddate_weekly).ToString("dd-MM-yyyy");
                    }
                    else if (objec_class_master.recurrenceid == 3)
                    {
                        txtrepeateevery_months.Value = objec_class_master.repeateevery_months;
                        if (objec_class_master.rbl_daysofmonth == 1)
                        {
                            rblday.Checked = true;
                            txtday_months.Value = objec_class_master.day_months;
                        }
                        else if (objec_class_master.rbl_daysofmonth == 2)
                        {
                            rblday2.Checked = true;
                            if (objec_class_master.ddlday != null)
                            {
                                ddlday.ClearSelection();
                                ddlday.Items.FindByValue(objec_class_master.ddlday.ToString()).Selected = true;
                            }
                            if (objec_class_master.ddlday1 != null)
                            {
                                ddlday2.ClearSelection();
                                ddlday2.Items.FindByValue(objec_class_master.ddlday1.ToString()).Selected = true;
                            }
                        }
                        if (objec_class_master.enddate_monthly != null)
                            txtenddate_monthly.Value = Convert.ToDateTime(objec_class_master.enddate_monthly).ToString("dd-MM-yyyy");
                    }
                }

                txtclassstarttime.Value = objec_class_master.class_starttime;
                Hid_txtclassstarttime.Value = objec_class_master.class_starttime_utc;
                txtclassendtime.Value = objec_class_master.class_endtime;
                Hid_txtclassendtime.Value = objec_class_master.class_endtime_utc;
                //if (objec_class_master.Is_singelInstructor == 1)
                //    chkyes.Checked = true;
                //else if (objec_class_master.Is_singelInstructor == 2)
                //    chkNo.Checked = true;

                txtAvailability.Value = objec_class_master.availability.ToString();
                txtrequirements.Text = objec_class_master.requirement;
                txtinstructions.Text = objec_class_master.instruction;

                if (objec_class_master.instructionfilepath != null)
                {
                    Hidintructionfile.Value = objec_class_master.instructionfilepath;
                    intructionfileLink.NavigateUrl = webURL + "Docs/Eclass_Service/class/" + objec_class_master.instructionfilepath;
                    intructionfileLink.Text = "View File";
                }
                if (objec_class_master.booklatestatus != null)
                {
                    ddlbooklatestatus.ClearSelection();
                    ddlbooklatestatus.Items.FindByValue(objec_class_master.booklatestatus.ToString()).Selected = true;
                }
               
                if (objec_class_master.bookingdeadline != null)
                    selectedexamdate_time1.Value = objec_class_master.bookingdeadline.ToString();
                if (objec_class_master.bookingdeadline_utc != null)
                    hidexamutcdatetime1.Value = objec_class_master.bookingdeadline_utc.ToString();

                if (objec_class_master.startdate != null)
                {
                    txtstartdate.Value = Convert.ToDateTime(objec_class_master.startdate).ToString("dd-MM-yyyy");
                    //var abc = Convert.ToDateTime(objec_class_master.startdate).ToString("yyyy-MM-ddTHH:mm:ss"); /*value ="2014-11-16T15:25:33";*/

                    //string[] str = abc.Split('.');
                    //if(str.Length == 3)
                    //    date1 = str[0] + ":" + str[1] + ":" + str[2];
                    //lbl1.InnerText = Convert.ToDateTime(objec_class_master.startdate).ToString("dd-MM-yyyy");
                }
                if (objec_class_master.bookingdeadline != null)
                {
                    var bookingdeadline_data = Convert.ToDateTime(objec_class_master.bookingdeadline).ToString("yyyy-MM-ddTHH:mm:ss"); /*value ="2014-11-16T15:25:33";*/

                    string[] bookingdeadline_str = bookingdeadline_data.Split('.');
                    if (bookingdeadline_str.Length == 3)
                        date2 = bookingdeadline_str[0] + ":" + bookingdeadline_str[1] + ":" + bookingdeadline_str[2];
                    lbl2.InnerText = Convert.ToDateTime(objec_class_master.bookingdeadline).ToString("dd-MM-yyyy HH:mm:ss");
                }
               
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
  
    private void populateAutoID()
    {
        List<int> listID = db.ec_class_master.Select(x => x.id).ToList();
        if(listID.Count == 0)
            lblcode.Text = (0 + 1).ToString();
        else
            lblcode.Text = (listID.Last() + 1).ToString();
    }

    private void BindDropdowns()
    {
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

            var group = db.ec_grademaster.ToList();
            ddlgrade.DataSource = group;
            ddlgrade.DataTextField = "description";
            ddlgrade.DataValueField = "id";
            ddlgrade.DataBind();
            ddlgrade.Items.Insert(0, lst);

            var Class = (from ap in db.class_master
                         join cwm in db.institutionwiseclassmaster on ap.id equals cwm.classId
                         where cwm.institutionID == universityID
                         select new
                         {
                             description = ap.description,
                             id = ap.id
                         }).ToList();
            ddlgroup.DataSource = Class;
            ddlgroup.DataTextField = "description";
            ddlgroup.DataValueField = "id";
            ddlgroup.DataBind();
            ddlgroup.Items.Insert(0, lst);

            var subject = db.subjectmaster.ToList();
            ddlsubject.DataSource = subject;
            ddlsubject.DataTextField = "description";
            ddlsubject.DataValueField = "id";
            ddlsubject.DataBind();
            ddlsubject.Items.Insert(0, lst);


            var currency = db.currency_master.ToList();
            ddlcurrency.DataSource = currency;
            ddlcurrency.DataTextField = "currency_symbol";
            ddlcurrency.DataValueField = "id";
            ddlcurrency.DataBind();
            ddlcurrency.Items.Insert(0, lst);

            var type = db.ec_type_master.ToList();
            ddltype.DataSource = type;
            ddltype.DataTextField = "type_description";
            ddltype.DataValueField = "type_id";
            ddltype.DataBind();
            ddltype.Items.Insert(0, lst);

            var mode = db.ec_mode_master.ToList();
            ddlmode.DataSource = mode;
            ddlmode.DataTextField = "mode_description";
            ddlmode.DataValueField = "mode_id";
            ddlmode.DataBind();
            ddlmode.Items.Insert(0, lst);

            var Location = db.universitycampus.Where(x => x.universityid == universityID).ToList();
            lstLocation.DataSource = Location;
            lstLocation.DataTextField = "campusname";
            lstLocation.DataValueField = "campusid";
            lstLocation.DataBind();
            lstLocation.Items.Insert(0, lst);

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

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetNarrowFields(int broadfieldID)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = (from nf in db1.course_narrowFields_master
                    join mapp in db1.broad_narrow_mapping on broadfieldID equals mapp.broadField_Id
                    where nf.id == mapp.narrowField_Id
                    select new
                    {
                        fieldname = nf.fieldname,
                        id = nf.id,
                    }).Distinct().OrderBy(x => x.fieldname).ToList();
        return JsonConvert.SerializeObject(temp);
    }

    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetDetailedFields(int narrowfieldID)
    {
        GTEEntities db1 = new GTEEntities();
        var temp = (from df in db1.course_detailsField_master
                    join mapp in db1.narrow_detailed_mapping on narrowfieldID equals mapp.narrowField_Id
                    where df.id == mapp.deatailedField_Id
                    select new
                    {
                        fieldname = df.fieldname,
                        id = df.id,
                    }).Distinct().OrderBy(x => x.fieldname).ToList();
        return JsonConvert.SerializeObject(temp);
    }
    [WebMethod]
    [ScriptMethod(UseHttpGet = true)]
    public static string GetBroadFields(int studeylevelID)
    {
        GTEEntities db1 = new GTEEntities();

        List<int> lst = new List<int>();
        lst.Add(17); lst.Add(18); lst.Add(19); lst.Add(20);
        lst.Add(21); lst.Add(22); lst.Add(23); lst.Add(24);
        lst.Add(25); lst.Add(26); lst.Add(27); lst.Add(28);

        dynamic temp;
        if (lst.Contains(studeylevelID))
        {
            temp = (from bf in db1.course_broadFields_master
                    where bf.id == 12
                    select new
                    {
                        fieldname = bf.fieldname,
                        id = bf.id,
                    }).Distinct().OrderBy(x => x.fieldname).ToList();
        }
        else
        {
            temp = (from bf in db1.course_broadFields_master
                    select new
                    {
                        fieldname = bf.fieldname,
                        id = bf.id,
                    }).Distinct().OrderBy(x => x.fieldname).ToList();
        }
        return JsonConvert.SerializeObject(temp);
    }

    private void BindBroadField(int studylevelID, DropDownList ddl)
    {
        try
        {
            List<int> lst = new List<int>();
            lst.Add(17); lst.Add(18); lst.Add(19); lst.Add(20);
            lst.Add(21); lst.Add(22); lst.Add(23); lst.Add(24);
            lst.Add(25); lst.Add(26); lst.Add(27); lst.Add(28);

            dynamic temp;
            if (lst.Contains(studylevelID))
            {
                temp = (from bf in db.course_broadFields_master
                        where bf.id == 12
                        select new
                        {
                            fieldname = bf.fieldname,
                            id = bf.id,
                        }).Distinct().OrderBy(x => x.fieldname).ToList();
            }
            else
            {
                temp = (from bf in db.course_broadFields_master
                        select new
                        {
                            fieldname = bf.fieldname,
                            id = bf.id,
                        }).Distinct().OrderBy(x => x.fieldname).ToList();
            }

            ListItem lst1 = new ListItem("Please select", "0");

            ddl.DataSource = temp;
            ddl.DataTextField = "fieldname";
            ddl.DataValueField = "id";
            ddl.DataBind();
            ddl.Items.Insert(0, lst1);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindNarrowField(int broadfieldID, DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var narrow = (from nf in db.course_narrowFields_master
                          join mapp in db.broad_narrow_mapping on broadfieldID equals mapp.broadField_Id
                          where nf.id == mapp.narrowField_Id
                          select new
                          {
                              fieldname = nf.fieldname,
                              id = nf.id,
                          }).Distinct().OrderBy(x => x.fieldname).ToList();
            ddl.DataSource = narrow;
            ddl.DataTextField = "fieldname";
            ddl.DataValueField = "id";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindDetailedField(int narrowfieldID, DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var temp = (from df in db.course_detailsField_master
                        join mapp in db.narrow_detailed_mapping on narrowfieldID equals mapp.narrowField_Id
                        where df.id == mapp.deatailedField_Id
                        select new
                        {
                            fieldname = df.fieldname,
                            id = df.id,
                        }).Distinct().OrderBy(x => x.fieldname).ToList();
            ddl.DataSource = temp;
            ddl.DataTextField = "fieldname";
            ddl.DataValueField = "id";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);
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
            var mode = "new";
            ec_class_master objec_class_master = new ec_class_master();

            string classname = txtclassname.Value;
            var data = db.ec_class_master.Where(x => x.id == RecordID).FirstOrDefault();
            if (data != null)
            {
                mode = "update";
                objec_class_master = data;
            }
            objec_class_master.classname = txtclassname.Value;
            objec_class_master.classdescription = txtclassdescription.Text;
            objec_class_master.webpageurl = txtwebpageurl.Value;
            //if (ddlmajor.SelectedValue != "0")
            //    objec_class_master.majorid = Convert.ToInt32(ddlmajor.SelectedValue);

            if (ddllevel.SelectedValue != "0")
                objec_class_master.levelid = Convert.ToInt32(ddllevel.SelectedValue);
            if (ddlboradfield.SelectedValue != "")
                objec_class_master.broadFieldID = Convert.ToInt32(hidbroadfieldId.Value);
            if (ddlnarrowfield.SelectedValue != "")
                objec_class_master.narrowFieldID = Convert.ToInt32(hidnarrowfieldId.Value);
            if (ddldetailedfield.SelectedValue != "")
                objec_class_master.detailedFieldID = Convert.ToInt32(hiddetailedfield.Value);
            if (ddlgrade.SelectedValue != "0")
                objec_class_master.gradeid = Convert.ToInt32(ddlgrade.SelectedValue);
            if (ddlgroup.SelectedValue != "0")
                objec_class_master.groupid = Convert.ToInt32(ddlgroup.SelectedValue);
            if (ddlsubject.SelectedValue != "0")
                objec_class_master.subjectid = Convert.ToInt32(ddlsubject.SelectedValue);
            if (ddltype.SelectedValue != "0")
                objec_class_master.type = Convert.ToInt32(ddltype.SelectedValue);
            if (ddlmode.SelectedValue != "0")
                objec_class_master.modeid = Convert.ToInt32(ddlmode.SelectedValue);
            objec_class_master.virtuallink = txtvirtuallink.Value;
            if (rblauto.Checked)
                objec_class_master.classsetting = 1;
            else if (rblmanual.Checked)
                objec_class_master.classsetting = 2;

            if (lstLocation.SelectedValue != null)
                objec_class_master.location = Convert.ToInt32(lstLocation.SelectedValue);
            //if (ddlyear.SelectedValue != null && ddlyear.SelectedValue != "")
            //    objec_class_master.duration_year = Convert.ToInt32(ddlyear.SelectedValue);
            //if (ddlmonths.SelectedValue != null && ddlmonths.SelectedValue != "")
            //    objec_class_master.duration_month = Convert.ToInt32(ddlmonths.SelectedValue);
            //if (ddldays.SelectedValue != "" && ddldays.SelectedValue != null)
            //    objec_class_master.duration_day = Convert.ToInt32(ddldays.SelectedValue);
            //if (ddlhours.SelectedValue != "" && ddlhours.SelectedValue != null)
            //    objec_class_master.duration_hours = Convert.ToInt32(ddlhours.SelectedValue);

            if (ddlcurrency.SelectedValue != "0")
                objec_class_master.fee_currency = Convert.ToInt32(ddlcurrency.SelectedValue);
            objec_class_master.fee_amount = txtfee.Value;
            objec_class_master.enrollment_fee_amount = txtenrollment_fee.Value;

            objec_class_master.timezone = hidTimeZone.Value;
            //objec_class_master.startdate = Convert.ToDateTime(selectedexamdate_time.Value);
            //objec_class_master.startdate_utc = Convert.ToDateTime(hidexamutcdatetime.Value);

            if (txtstartdate.Value != "")
            {
                var vdateArr = txtstartdate.Value.Split(Convert.ToChar("-"));
                objec_class_master.startdate = Convert.ToDateTime(txtstartdate.Value);
            }
            if (txtstartdate.Value != "")
            {
                objec_class_master.startdate_utc = Convert.ToDateTime(txtstartdate.Value);
            }

            //if (txtstartdate.Value != "")
            //    objec_class_master.startdate = Convert.ToDateTime(txtstartdate.Value);
            //if (txtstartdate.Value != "")
            //    objec_class_master.startdate_utc = Convert.ToDateTime(txtstartdate.Value);
            if (selectedexamdate_time1.Value != "")
                objec_class_master.bookingdeadline = Convert.ToDateTime(selectedexamdate_time1.Value);
            if (hidexamutcdatetime1.Value != "")
                objec_class_master.bookingdeadline_utc = Convert.ToDateTime(hidexamutcdatetime1.Value);

            if (ddlrecurrence.SelectedValue != "0")
                objec_class_master.recurrenceid = Convert.ToInt32(ddlrecurrence.SelectedValue);

            if (ddlrecurrence.SelectedValue == "1")
            {
                objec_class_master.repeatsevery_day = txtrepeatsevery_day.Value;
                if (txtenddate_daily.Value != "")
                {
                    objec_class_master.enddate_daily = Convert.ToDateTime(txtenddate_daily.Value);
                }
                
            }
            else if (ddlrecurrence.SelectedValue == "2")
            {
                objec_class_master.repeateevery_week = txtrepeateevery_week.Value;
                for (int i = 0; i < lstDayofWeek.Items.Count; i++)
                {
                    if (lstDayofWeek.Items[i].Selected == true)
                        objec_class_master.daysof_week += Convert.ToInt32(lstDayofWeek.Items[i].Value) + ",";
                }
                if (txtenddate_weekly.Value != "")
                {
                    objec_class_master.enddate_weekly = Convert.ToDateTime(txtenddate_weekly.Value);
                }

            }
            else if (ddlrecurrence.SelectedValue == "3")
            {
                objec_class_master.repeateevery_months = txtrepeateevery_months.Value;
                if (rblday.Checked == true)
                {
                    objec_class_master.rbl_daysofmonth = 1;
                    objec_class_master.day_months = txtday_months.Value;
                }
                else if (rblday2.Checked == true)
                {
                    objec_class_master.rbl_daysofmonth = 2;
                    if (ddlday.SelectedValue != "0")
                        objec_class_master.ddlday = Convert.ToInt32(ddlday.SelectedValue);
                    if (ddlday2.SelectedValue != "0")
                        objec_class_master.ddlday1 = Convert.ToInt32(ddlday2.SelectedValue);
                }
                if (txtenddate_monthly.Value != "")
                {
                    objec_class_master.enddate_monthly = Convert.ToDateTime(txtenddate_monthly.Value);
                }
            }
            objec_class_master.class_starttime = txtclassstarttime.Value;
            if (Hid_txtclassstarttime.Value != "Invalid date")
            {
                string[] s1 = Hid_txtclassstarttime.Value.Split('T');
                objec_class_master.class_starttime_utc = s1[1];
            }

            objec_class_master.class_endtime = txtclassendtime.Value;

            if (Hid_txtclassendtime.Value != "Invalid date")
            {
                string[] s2 = Hid_txtclassendtime.Value.Split('T');
                objec_class_master.class_endtime_utc = s2[1];
            }
            objec_class_master.availability = Convert.ToInt32(txtAvailability.Value);

            //if (chkyes.Checked == true)
            //    objec_class_master.Is_singelInstructor = 1;
            //else if (chkNo.Checked == true)
            //    objec_class_master.Is_singelInstructor = 2;

            objec_class_master.requirement = txtrequirements.Text;
            objec_class_master.instruction = txtinstructions.Text;

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
            DateTime end_date;
            if (ddlrecurrence.SelectedValue == "1")
                end_date = Convert.ToDateTime(txtenddate_daily.Value);
            else
                end_date = Convert.ToDateTime(txtenddate_weekly.Value);
            
            string durationlbl = DateDiff(Convert.ToDateTime(txtstartdate.Value), end_date);
            string[] str = durationlbl.Split(',');   //years + " ," + months + ","+ days + ",";
            objec_class_master.duration_year = Convert.ToInt32(str[0]);
            objec_class_master.duration_month = Convert.ToInt32(str[1]);
            objec_class_master.duration_day = Convert.ToInt32(str[2]);

            objec_class_master.universityid = universityID;
            if (mode == "new")
                db.ec_class_master.Add(objec_class_master);
            db.SaveChanges();

            int classid = Convert.ToInt32(lblcode.Text);
            
            DateTime date_start = Convert.ToDateTime(txtstartdate.Value);
            

            if (editpage == "0")
            {
                if (ddlrecurrence.SelectedValue == "1")
                {
                    DateTime date_end_daily = Convert.ToDateTime(txtenddate_daily.Value);

                    calculate_scheduledates_daily(classid, date_start, date_end_daily, Convert.ToInt32(ddlrecurrence.SelectedValue), Convert.ToInt32(txtrepeatsevery_day.Value), TimeSpan.Parse(txtclassstarttime.Value), TimeSpan.Parse(txtclassendtime.Value), TimeSpan.Parse(objec_class_master.class_starttime_utc), TimeSpan.Parse(objec_class_master.class_endtime_utc), hidTimeZone.Value);
                }
                else if (ddlrecurrence.SelectedValue == "2")
                {
                    DateTime date_end_weekly = Convert.ToDateTime(txtenddate_weekly.Value); ;
                    List<string> dayslist = new List<string>();

                    for (int i = 0; i < lstDayofWeek.Items.Count; i++)
                    {
                        if (lstDayofWeek.Items[i].Selected == true)
                        {
                            var day = lstDayofWeek.Items[i].Text;
                            dayslist.Add(day);
                        }
                    }
                    calculate_scheduledates_weekly(classid, date_start, date_end_weekly, Convert.ToInt32(ddlrecurrence.SelectedValue), Convert.ToInt32(txtrepeateevery_week.Value), dayslist, TimeSpan.Parse(txtclassstarttime.Value), TimeSpan.Parse(txtclassendtime.Value), TimeSpan.Parse(objec_class_master.class_starttime_utc), TimeSpan.Parse(objec_class_master.class_endtime_utc), hidTimeZone.Value);
                }
            }
            if (mode == "new")
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                 "alert('Record Inserted Successfully.Now assign instructor');window.location='" + Request.ApplicationPath + "admin/ec_class_create_assign_instructor.aspx?id="+classid+"';", true);
            else
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                 "alert('Record updated Successfully');window.location='" + Request.ApplicationPath + "admin/ec_manageclass.aspx';", true);

        }
        catch (Exception ex)
        {
            objLog.WriteLog("main:"+ex.ToString());
        }
    }
    // Always uses Monday-to-Sunday weeks
    public static DateTime GetStartOfWeek(DateTime input)
    {
        // Using +6 here leaves Monday as 0, Tuesday as 1 etc.
        int dayOfWeek = (((int)input.DayOfWeek) + 6) % 7;
        return input.Date.AddDays(-dayOfWeek);
    }
    //public static int GetWeeks(DateTime start, DateTime end)
    //{
    //    start = GetStartOfWeek(start);
    //    end = GetStartOfWeek(end);
    //    int days = (int)(end - start).TotalDays;
    //    return (days / 7) + 1; // Adding 1 to be inclusive
    //}
    
    private void calculate_scheduledates_daily(int classid, DateTime startdate, DateTime enddate, int recurrence, int repeatsevery, TimeSpan class_starttime, TimeSpan class_endtime, TimeSpan class_starttime_utc, TimeSpan class_endtime_utc, string timezone)
    {
        try
        {  
            var list = db.ec_class_date_schedule_master.Where(x => x.universityid == universityID && x.classID == classid).ToList();
            db.ec_class_date_schedule_master.RemoveRange(list);
            db.SaveChanges();
            
            for (var date = startdate; date <= enddate; date = date.AddDays(repeatsevery + 1))
            {
                ec_class_date_schedule_master objmapping = new ec_class_date_schedule_master();

                DateTime date_test = date;
                TimeSpan time_d1= class_starttime;
                DateTime result_d1 = date_test + time_d1;
                TimeSpan time_d2 = class_starttime_utc;
                DateTime result_d2 = date_test + time_d2;
                //end
                TimeSpan time_d3 = class_endtime;
                DateTime result_d3 = date_test + time_d3;
                TimeSpan time_d4 = class_endtime_utc;
                DateTime result_d4 = date_test + time_d4;
                
                objmapping.classID = classid;
                objmapping.universityid = universityID;
                objmapping.class_datetime_start = result_d1;
                objmapping.class_datetime_end = result_d3;
                objmapping.class_datetime_start_utc = result_d2;
                objmapping.class_datetime_end_utc = result_d4;
                db.ec_class_date_schedule_master.Add(objmapping);
                db.SaveChanges();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog("Daily:" + ex.ToString());
        }
    }
    private void calculate_scheduledates_weekly(int classid, DateTime startdate, DateTime enddate, int recurrence, int repeatsevery, List<string> lst_days, TimeSpan class_starttime, TimeSpan class_endtime, TimeSpan class_starttime_utc, TimeSpan class_endtime_utc,string timezone)
    {
        try
        {
            var list_ = db.ec_class_date_schedule_master.Where(x => x.universityid == universityID && x.classID == classid).ToList();
            db.ec_class_date_schedule_master.RemoveRange(list_);
            db.SaveChanges();

            List<string> list = new List<string>();
            List<DateTime> final_datelist = new List<DateTime>();
            List<DateTime> final_datelist_2 = new List<DateTime>();

            DateTime start = GetStartOfWeek(startdate);

            foreach (var item in lst_days)
            {
                for (var date = start; date <= enddate; date = date.AddDays(1))
                {
                    if (date.DayOfWeek.ToString() == item)
                    {
                        string str = date + "," + date.DayOfWeek;
                        list.Add(str);
                    }
                }
            }
            if (lst_days.Count > 0)
            {
                foreach (var item in lst_days)
                {
                    List<string> ab = list.Where(x => x.Contains(item)).ToList();
                    List<DateTime> temp_datelist = new List<DateTime>();

                    foreach (var ls in ab)
                    {

                        string[] split = ls.Split(',');

                        if (split[1] == item)
                        {
                            string[] data = ls.Split(',');
                            DateTime xy = Convert.ToDateTime(data[0]);
                            temp_datelist.Add(xy);
                        }
                    }
                    DateTime start_d1 = temp_datelist.First();
                    DateTime end_d1 = temp_datelist.Last();

                    for (var i = 0; i <= ab.Count; i = i + repeatsevery + 1)
                    {
                        if (i <= ab.Count - 1)
                        {
                            if (ab[i] != "" && ab[i] != null)
                            {
                                DateTime d = Convert.ToDateTime(ab[i]);
                                if (startdate <= d && d <= enddate)
                                    final_datelist.Add(d);
                            }
                        }
                    }
                }

                var order_datelist = final_datelist.OrderByDescending(x => x).ToList();
                foreach (var date in order_datelist)
                {
                    ec_class_date_schedule_master objmapping = new ec_class_date_schedule_master();
                    var xy = Convert.ToDateTime(date).ToString("dd-MM-yyyy") + " " + class_starttime;
                    //DateTime d1 = Convert.ToDateTime(xy);

                    //var xy_utc = Convert.ToDateTime(date).ToString("dd-MM-yyyy") + " " + class_starttime_utc;
                    //DateTime d1_utc = Convert.ToDateTime(xy_utc);

                    ////end
                    //var ab = Convert.ToDateTime(date).ToString("dd-MM-yyyy") + " " + class_endtime;
                    //DateTime d2 = Convert.ToDateTime(ab);

                    //var ab_utc = Convert.ToDateTime(date).ToString("dd-MM-yyyy") + " " + class_endtime_utc;
                    //DateTime d2_utc = Convert.ToDateTime(ab_utc);

                    DateTime date_test = date;
                    TimeSpan time_d1 = class_starttime;
                    DateTime result_d1 = date_test + time_d1;
                    TimeSpan time_d2 = class_starttime_utc;
                    DateTime result_d2 = date_test + time_d2;
                    //end
                    TimeSpan time_d3 = class_endtime;
                    DateTime result_d3 = date_test + time_d3;
                    TimeSpan time_d4 = class_endtime_utc;
                    DateTime result_d4 = date_test + time_d4;

                    objmapping.classID = classid;
                    objmapping.universityid = universityID;
                    objmapping.class_datetime_start = result_d1;
                    objmapping.class_datetime_end = result_d3;
                    objmapping.class_datetime_start_utc = result_d2;
                    objmapping.class_datetime_end_utc = result_d4;
                    db.ec_class_date_schedule_master.Add(objmapping);
                    db.SaveChanges();
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog("Weekly:" + ex.ToString());
        }
    }

    public static int GetMonthDifference(DateTime startDate, DateTime endDate)
    {
        int monthsApart = 12 * (startDate.Year - endDate.Year) + startDate.Month - endDate.Month;
        return Math.Abs(monthsApart);
    }
    public string DateDiff(DateTime dt1, DateTime dt2)
    {
        DateTime zeroTime = new DateTime(1, 1, 1);

        int leapDaysInBetween = CountLeapDays(dt1, dt2);

        TimeSpan span = dt2 - dt1;

        int years = (zeroTime + span).Year - 1;
        int months = (zeroTime + span).Month - 1;
        int days = (zeroTime + span).Day - (leapDaysInBetween % 2 == 1 ? 1 : 0);
        int weeks = days / 7;
        int remainingdays = days % 7;

        string str = years + " ," + months + ","+ days + ",";
        Console.WriteLine(String.Format("\nThe difference between date {0} and date {1} is: \n\t {2} year(s), {3} month(s), and {4} day(s).", dt1, dt2, years, months, days));
        Console.WriteLine(String.Format("\nThe difference between date {0} and date {1} is: \n\t {2} year(s), {3} month(s), {4} week(s) and {5} day(s).", dt1, dt2, years, months, weeks, remainingdays));
        return str;
    }
    private static int CountLeapDays(DateTime dt1, DateTime dt2)
    {
        int leapDaysInBetween = 0;
        int year1 = dt1.Year, year2 = dt2.Year;
        DateTime dateValue;

        for (int i = year1; i <= year2; i++)
        {
            if (DateTime.TryParse("02/29/" + i.ToString(), out dateValue))
            {
                if (dateValue >= dt1 && dateValue <= dt2)
                    leapDaysInBetween++;
            }
        }

        return leapDaysInBetween;
    }

}