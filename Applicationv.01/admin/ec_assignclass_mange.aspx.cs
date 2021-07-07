using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ec_assignclass_mange : System.Web.UI.Page
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
            //BindDropdown();
            BindGrid();
        }

    }
    public class details
    {
        public int classid { get; set; }
        public string univeristyname { get; set; }
        public string classname { get; set; }
        public int? startdateID { get; set; }
        public DateTime? startdate { get; set; }
        public string startdate_str { get; set; }
        public string recurrence { get; set; }
        public string classstarttime { get; set; }
        public string classendtime{ get; set; }
        public int Noofstudents { get; set; }
        public int assignID { get; set; }
    }

   
    private void BindGrid(int classid = 0, int gradeID = 0, int subjectID = 0, int modeID = 0, int typeID = 0)
    {
        try
        {
            applicant = (from cm in db.ec_class_assign
                         join um in db.university_master on cm.universityid equals um.universityid
                         join currm in db.ec_class_master on cm.classid equals currm.id
                         join date in db.ec_class_date_master on cm.classstartdateid equals date.id into Ddata
                         from x in Ddata.DefaultIfEmpty()
                         where cm.universityid == universityID && cm.IsDeleted != 1
                         select new details
                         {
                             assignID = cm.id,
                             classid = cm.id,
                             univeristyname = um.university_name,
                             classname = currm.classname,
                             startdateID = cm.classstartdateid,
                             startdate = x.class_startdate,
                             recurrence = cm.recurrenceid == 1?"Daily":cm.recurrenceid == 2?"Weekly":"Monthly",
                             classstarttime = cm.class_starttime,
                             classendtime = cm.class_endtime
                             
                         }).ToList();
            foreach (var item in applicant) {
                item.classstarttime = Convert.ToDateTime(item.classstarttime).ToString("hh:mm tt");
                item.classendtime = Convert.ToDateTime(item.classendtime).ToString("hh:mm tt");
                item.startdate_str = Convert.ToDateTime(item.startdate).ToString("dd/MM/yyyy");
                item.Noofstudents = db.ec_class_assign_student_mapping.Where(x => x.universityid == universityID && x.assign_id == item.assignID).ToList().Count;
            }

            if (applicant != null)
            {
                QuestiontGridView.DataSource = applicant;
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
        Response.Redirect(webURL + "admin/ec_assignclass_create.aspx", true);
    }

    protected void QuestiontGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

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
                ec_class_assign obj = new ec_class_assign();
                var mode = "new";
                var em = db.ec_class_assign.Where(b => b.id == ID).First();
                if (em != null) {
                    mode = "update";
                    obj = em;
                }
                obj.IsDeleted = 1;
                if(mode=="new")
                    db.ec_class_assign.Add(obj);
                db.SaveChanges();
                BindGrid();
            }
            if (e.CommandName.Equals("Edit"))
            {
                Response.Redirect(webURL + "admin/ec_editclass.aspx?id=" + ID, true);
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
        try
        {
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
        //dt.Columns.Add("Class Code", typeof(Int32));
        //dt.Columns.Add("Institution Name", typeof(string));
        //dt.Columns.Add("Class Name", typeof(string));
        //dt.Columns.Add("Grade", typeof(string));
        //dt.Columns.Add("Subject", typeof(string));
        //dt.Columns.Add("Mode", typeof(string));
        //dt.Columns.Add("Type", typeof(string));
        //dt.Columns.Add("Duration", typeof(string));
        //dt.Columns.Add("Fee", typeof(string));
        //dt.Columns.Add("Bookable", typeof(string));
        //// to print rows
        //if (applicant != null)
        //{
        //    int rowNumber = 2;
        //    for (var i = 0; i < applicant.Count; i++)
        //    {
        //        var applicantemployerdetails = applicant[i];
        //        dt.Rows.Add(applicantemployerdetails.classid, applicantemployerdetails.univeristyname, applicantemployerdetails.classname, applicantemployerdetails.grade, applicantemployerdetails.subject, applicantemployerdetails.mode, applicantemployerdetails.type, applicantemployerdetails.duration, applicantemployerdetails.fee, applicantemployerdetails.booklate);

        //        rowNumber++;
        //    }
        //}
        return dt;
    }

    //protected void ddlclassname_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    int classID = Convert.ToInt32(ddlclassname.SelectedValue);
    //    BindGrid(classID);
    //}

    //protected void ddlgrade_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    int gradeID = Convert.ToInt32(ddlgrade.SelectedValue);
    //    BindGrid(0, gradeID);
    //}

    //protected void ddlsubject_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    int subjectID = Convert.ToInt32(ddlsubject.SelectedValue);
    //    BindGrid(0, 0, subjectID);
    //}

    //protected void ddlmode_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    int modeID = Convert.ToInt32(ddlmode.SelectedValue);
    //    BindGrid(0, 0, 0, modeID);
    //}

    //protected void ddltype_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    int tyepID = Convert.ToInt32(ddltype.SelectedValue);
    //    BindGrid(0, 0, 0, 0, tyepID);
    //}
    //void RemoveDuplicateItems(DropDownList ddl)
    //{
    //    for (int i = 0; i < ddl.Items.Count; i++)
    //    {
    //        ddl.SelectedIndex = i;
    //        string str = ddl.SelectedItem.ToString();
    //        for (int counter = i + 1; counter < ddl.Items.Count; counter++)
    //        {
    //            ddl.SelectedIndex = counter;
    //            string compareStr = ddl.SelectedItem.ToString();
    //            if (str == compareStr)
    //            {
    //                ddl.Items.RemoveAt(counter);
    //                counter = counter - 1;
    //            }
    //        }
    //    }

    //    ddl.ClearSelection();
    //}

}