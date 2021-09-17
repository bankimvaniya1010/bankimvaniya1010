using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_manageclass : System.Web.UI.Page
{
    Logger objLog = new Logger();
    Common objCom = new Common();
    private GTEEntities db = new GTEEntities();
    string webURL = String.Empty;
    string roleName = string.Empty;
    int selectedexaminerId, selectuniversity, adminId, universityID;
    public List<details> applicant = new List<details>();
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
        if (!IsPostBack)
        {
            BindDropdown();
            BindGrid();
        }

    }
    public class details {
        public int classid { get; set; }
        public string univeristyname { get; set; }
        public string classname { get; set; }
        public int gradeID { get; set; }
        public string grade { get; set; }
        public int subjectID { get; set; }
        public string subject{ get; set; }
        public int? modeID { get; set; }
        public string mode{ get; set; }
        public int? typeID { get; set; }
        public string type{ get; set; }
        public string duration{ get; set; }
        public string fee { get; set; }
        public string bookablestatus { get; set; }
        public string IsClassInUse { get; set; }
        public DateTime? startdate { get; set; }
        public string Recurrence { get; set; }
        public int? Avialability { get; set; }
        public string Location { get; set; }
        public string link_assignstudent { get; set; }
        public string link_assignInstructor { get; set; }
    }

    private void BindDropdown() {
        try
        {
            applicant = (from cm in db.ec_class_master
                         join um in db.university_master on cm.universityid equals um.universityid
                         join gm in db.ec_grademaster on cm.gradeid equals gm.id into gradeData
                         from x in gradeData.DefaultIfEmpty()
                         join sm in db.subjectmaster on cm.subjectid equals sm.id
                         join tm in db.ec_type_master on cm.type equals tm.type_id
                         join mm in db.ec_mode_master on cm.modeid equals mm.mode_id
                         join currm in db.currency_master on cm.fee_currency equals currm.id
                         where cm.universityid == universityID
                         select new details
                         {
                             classid = cm.id,
                             univeristyname = um.university_name,
                             classname = cm.classname,
                             gradeID = x.id,
                             grade = x.description,
                             subjectID = sm.id,
                             subject = sm.description,
                             modeID = cm.modeid,
                             mode = mm.mode_description,
                             typeID= cm.type,
                             type = tm.type_description,
                             duration = cm.duration_year + " Years " + cm.duration_month + " Months " + cm.duration_day + " Days " + cm.duration_hours + " Hours ",
                             fee = currm.currency_symbol + " " + cm.fee_amount,
                             bookablestatus = cm.booklatestatus == 1 ? "Yes" : "No",
                             IsClassInUse ="NO",
                             startdate = cm.startdate,
                             Recurrence = cm.recurrenceid == 1 ? "Daily" : cm.recurrenceid == 2 ? "Weekly" : "Monthly",
                             Avialability = cm.availability,
                             link_assignstudent = webURL + "admin/ec_class_create_assign_students.aspx?id=" + cm.id,
                             link_assignInstructor = webURL + "admin/ec_class_create_assign_instructor.aspx?id=" + cm.id,
                         }).ToList();
            foreach (var item in applicant)
            {
                var classAssign = db.ec_class_applicationmaster.Where(c => c.universityid == universityID && c.classid == item.classid).ToList();
                if (classAssign.Count > 0)
                    item.IsClassInUse = "In Use";
            }

            ListItem lst = new ListItem("Search By", "0");
            
            if (applicant != null)
            {
                ddlsubject.DataSource = applicant.OrderBy(x => x.subjectID).ToList();
                ddlsubject.DataTextField = "subject";
                ddlsubject.DataValueField = "subjectID";
                ddlsubject.DataBind();
                
                ddlmode.DataSource = applicant.OrderBy(x => x.modeID).ToList();
                ddlmode.DataTextField = "mode";
                ddlmode.DataValueField = "modeID";
                ddlmode.DataBind();

                ddltype.DataSource = applicant.OrderBy(x => x.typeID).ToList();
                ddltype.DataTextField = "type";
                ddltype.DataValueField = "typeID";
                ddltype.DataBind();

                ddlclassname.DataSource = applicant.OrderBy(x => x.classname).ToList();
                ddlclassname.DataTextField = "classname";
                ddlclassname.DataValueField = "classname";
                ddlclassname.DataBind();

                ddlgrade.DataSource = applicant.OrderBy(x => x.gradeID).ToList();
                ddlgrade.DataTextField = "grade";
                ddlgrade.DataValueField = "gradeID";
                ddlgrade.DataBind();

            }
            ddlgrade.Items.Insert(0, lst);
            ddlclassname.Items.Insert(0, lst);
            ddlsubject.Items.Insert(0, lst);
            ddlmode.Items.Insert(0, lst);
            ddltype.Items.Insert(0, lst);
            RemoveDuplicateItems(ddlgrade);
            RemoveDuplicateItems(ddlsubject);
            RemoveDuplicateItems(ddlmode);
            RemoveDuplicateItems(ddltype);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    private void BindGrid(string classid = "0", int gradeID = 0, int subjectID = 0, int modeID = 0, int typeID = 0)
    {
        try
        {
            applicant = (from cm in db.ec_class_master
                        join um in db.university_master on cm.universityid equals um.universityid
                        join gm in db.ec_grademaster on cm.gradeid equals gm.id into gradeData
                        from x in gradeData.DefaultIfEmpty()
                        join sm in db.subjectmaster on cm.subjectid equals sm.id
                        join tm in db.ec_type_master on cm.type equals tm.type_id
                        join mm in db.ec_mode_master on cm.modeid equals mm.mode_id
                        join currm in db.currency_master on cm.fee_currency equals currm.id
                        where cm.universityid == universityID
                         select new details
                         {
                             classid = cm.id,
                             univeristyname = um.university_name,
                             classname = cm.classname,
                             gradeID = x.id,
                             grade = x.description,
                             subjectID = sm.id,
                             subject = sm.description,
                             modeID = cm.modeid,
                             mode = mm.mode_description,
                             typeID = cm.type,
                             type = tm.type_description,
                             duration = cm.duration_year + " Years " + cm.duration_month + " Months " + cm.duration_day + " Days " + cm.duration_hours + " Hours ",
                             fee = currm.currency_symbol + " " + cm.fee_amount,
                             bookablestatus = cm.booklatestatus == 1 ? "Yes" : "No",
                             IsClassInUse = "NO",
                             startdate = cm.startdate,
                             Recurrence = cm.recurrenceid == 1 ? "Daily" : cm.recurrenceid == 2 ? "Weekly" : "Monthly",
                             Avialability = cm.availability,
                             link_assignstudent = webURL+ "admin/ec_class_create_assign_students.aspx?id="+cm.id,
                             link_assignInstructor = webURL + "admin/ec_class_create_assign_instructor.aspx?id=" + cm.id,
                         }).ToList();
            foreach (var item in applicant)
            {
                var classAssign = db.ec_class_applicationmaster.Where(c => c.universityid == universityID && c.classid == item.classid).ToList();
                if (classAssign.Count > 0)
                    item.IsClassInUse = "In Use";
            }
            if (applicant != null)
            {
                if (classid != "0" || gradeID != 0 || subjectID != 0 || modeID != 0 || typeID != 0)
                {
                    if (classid != "0")
                    {
                        applicant = applicant.Where(x => x.classname.Contains(classid)).ToList();
                        ddlclassname.Items.FindByValue(classid.ToString()).Selected = true;
                        //ddlcountry.ClearSelection();
                        //ddlfirstname.ClearSelection();
                    }
                    if (gradeID != 0)
                    {
                        applicant = applicant.Where(x => x.gradeID== gradeID).ToList();
                        ddlgrade.Items.FindByValue(gradeID.ToString()).Selected = true;
                        //ddlcountry.ClearSelection();
                        //ddlfirstname.ClearSelection();
                    }
                    if (subjectID != 0)
                    {
                        applicant = applicant.Where(x => x.subjectID == subjectID).ToList();
                        ddlsubject.Items.FindByValue(subjectID.ToString()).Selected = true;
                        //ddlcountry.ClearSelection();
                        //ddlfirstname.ClearSelection();
                    }
                    if (modeID != 0)
                    {
                        applicant = applicant.Where(x => x.modeID == modeID).ToList();
                        ddlmode.Items.FindByValue(modeID.ToString()).Selected = true;
                        //ddlcountry.ClearSelection();
                        //ddlfirstname.ClearSelection();
                    }
                    if (typeID != 0)
                    {
                        applicant = applicant.Where(x => x.typeID == typeID).ToList();
                        ddltype.Items.FindByValue(typeID.ToString()).Selected = true;
                        //ddlcountry.ClearSelection();
                        //ddlfirstname.ClearSelection();
                    }


                }

                QuestiontGridView.DataSource = applicant.OrderByDescending(x=>x.classid).ToList();
                QuestiontGridView.DataBind();

            }

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void btn_addnew_Click(object sender, EventArgs e)
    {
        Response.Redirect(webURL + "admin/ec_class_create.aspx", true);
    }

    protected void QuestiontGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        QuestiontGridView.PageIndex = e.NewPageIndex;
        BindGrid();
    }

    protected void QuestiontGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {

    }

    protected void QuestiontGridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        try
        {
            int ID = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName.Equals("Delete"))
            {
                ec_class_master em = db.ec_class_master.Where(b => b.id == ID).First();
                db.ec_class_master.Remove(em);
                db.SaveChanges();
                BindGrid();
            }
            if (e.CommandName.Equals("Edit")) {
                Response.Redirect(webURL + "admin/ec_class_create.aspx?id=" + ID, true);
            }
            if (e.CommandName.Equals("AssignStudent"))
            {
                Response.Redirect(webURL + "admin/ec_class_create_assign_students.aspx?id=" + ID, true);
            }
            if (e.CommandName.Equals("AssignInstructor"))
            {
                Response.Redirect(webURL + "admin/ec_class_create_assign_instructor.aspx?id=" + ID, true);
            }
            if (e.CommandName.Equals("Duplicate"))
            {
                ec_class_master em = db.ec_class_master.Where(b => b.id == ID).First();

                db.ec_class_master.Add(em);
                db.SaveChanges();
                BindGrid();
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void QuestiontGridView_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void btn_downloadexcel_Click(object sender, EventArgs e)
    {
        try {
            Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "ClassList.xls"));
            Response.ContentType = "application/ms-excel";
                        
            DataTable dt = BindDatatable();
            string str = string.Empty;
            foreach (DataColumn dtcol in dt.Columns)
            {   
                Response.Write(str + dtcol.ColumnName);
                str = "\t";
            }
            Response.Write("\n");
            foreach (DataRow dr in dt.Rows)
            {
                str = "";
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    Response.Write(str + Convert.ToString(dr[j]));
                    str = "\t";
                }
                Response.Write("\n");
            }
            
            Response.End();
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected DataTable BindDatatable()
    {
        BindGrid();
        DataTable dt = new DataTable();
        // all columns
        dt.Columns.Add("Class Code", typeof(Int32));
        dt.Columns.Add("Institution Name", typeof(string));
        dt.Columns.Add("Class Name", typeof(string));
        dt.Columns.Add("Grade", typeof(string));
        dt.Columns.Add("Subject", typeof(string));
        dt.Columns.Add("Mode", typeof(string));
        dt.Columns.Add("Type", typeof(string));
        dt.Columns.Add("Duration", typeof(string));
        dt.Columns.Add("Fee", typeof(string));
        dt.Columns.Add("Bookable", typeof(string));
        
        // to print rows
        if (applicant != null)
        {
            int rowNumber = 2;
            for (var i = 0; i < applicant.Count; i++)
            {
                var applicantemployerdetails = applicant[i];
                dt.Rows.Add(applicantemployerdetails.classid, applicantemployerdetails.univeristyname, applicantemployerdetails.classname, applicantemployerdetails.grade, applicantemployerdetails.subject,applicantemployerdetails.mode, applicantemployerdetails.type, applicantemployerdetails.duration, applicantemployerdetails.fee, applicantemployerdetails.bookablestatus);

                rowNumber++;
            }
        }
        return dt;
    }

    protected void ddlclassname_SelectedIndexChanged(object sender, EventArgs e)
    {
        string classID = ddlclassname.SelectedValue;
        BindGrid(classID);
    }

    protected void ddlgrade_SelectedIndexChanged(object sender, EventArgs e)
    {
        int gradeID = Convert.ToInt32(ddlgrade.SelectedValue);
        BindGrid("0", gradeID);
    }

    protected void ddlsubject_SelectedIndexChanged(object sender, EventArgs e)
    {
        int subjectID = Convert.ToInt32(ddlsubject.SelectedValue);
        BindGrid("0",0, subjectID);
    }

    protected void ddlmode_SelectedIndexChanged(object sender, EventArgs e)
    {
        int modeID = Convert.ToInt32(ddlmode.SelectedValue);
        BindGrid("0",0,0,modeID);
    }

    protected void ddltype_SelectedIndexChanged(object sender, EventArgs e)
    {
        int tyepID = Convert.ToInt32(ddltype.SelectedValue);
        BindGrid("0",0,0,0,tyepID);
    }
    void RemoveDuplicateItems(DropDownList ddl)
    {
        for (int i = 0; i < ddl.Items.Count; i++)
        {
            ddl.SelectedIndex = i;
            string str = ddl.SelectedItem.ToString();
            for (int counter = i + 1; counter < ddl.Items.Count; counter++)
            {
                ddl.SelectedIndex = counter;
                string compareStr = ddl.SelectedItem.ToString();
                if (str == compareStr)
                {
                    ddl.Items.RemoveAt(counter);
                    counter = counter - 1;
                }
            }
        }

        ddl.ClearSelection();
    }


    protected void QuestiontGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                
                Label lblIsClassInUse = (Label)e.Row.FindControl("lblIsClassInUse");
                LinkButton lnkDelete = ((LinkButton)e.Row.FindControl("lnkDelete"));

                if (lblIsClassInUse.Text == "In Use")
                {
                    lnkDelete.Attributes.Add("style", "display:none");
                    lblIsClassInUse.Attributes.Add("style", "display:block");
                }
                else
                {
                    lnkDelete.Attributes.Add("style", "display:block");
                    lblIsClassInUse.Attributes.Add("style", "display:none");
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }
}