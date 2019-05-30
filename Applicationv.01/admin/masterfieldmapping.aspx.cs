using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_mastermapping : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Logger objLog = new Logger();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindUniversity();
            BindMaster();
        }
    }
    private void BindUniversity()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var Universities = db.university_master.ToList();
            ddlUniversity.DataSource = Universities;
            ddlUniversity.DataTextField = "university_name";
            ddlUniversity.DataValueField = "universityID";
            ddlUniversity.DataBind();
            ddlUniversity.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private void BindMaster()
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
           var Master = db.master_name.ToList();
            ddlMaster.DataSource = Master;
            ddlMaster.DataTextField = "mastername";
            ddlMaster.DataValueField = "masterid";
            ddlMaster.DataBind();
            ddlMaster.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    
    protected void ddlMaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        int MasterID = Convert.ToInt16(ddlMaster.SelectedValue);
        dynamic masterdata = null;        
        if (MasterID == 0)
            chkMasterField.Items.Clear();
        else if (MasterID == 1)
            masterdata = db.alternateadressproofmaster.ToList();
        else if (MasterID == 2)
            masterdata = db.alternatedobproof.ToList();
        else if (MasterID == 3)
            masterdata = db.alternateidproofmaster.ToList();
        else if (MasterID == 4)
            masterdata = db.disabilitymaster.ToList();
        else if (MasterID == 5)
            masterdata = db.grademaster.ToList();
        else if (MasterID == 6)
            masterdata = db.majordiscipline_master.ToList();


        chkMasterField.DataSource = masterdata;
        chkMasterField.DataTextField = "description";
        chkMasterField.DataValueField = "id";
        chkMasterField.DataBind();
        int UniversityID = Convert.ToInt32(ddlUniversity.SelectedValue);
        var universityWise = db.universitywisemastermapping.Where(x => x.universityid == UniversityID && x.masterid == MasterID).ToList();
        for (int k = 0; k < universityWise.Count; k++)
        {
            chkMasterField.Items.FindByValue(universityWise[k].mastervalueid.ToString()).Selected = true;
        }      
        
    }


    protected void btn_submit_Click(object sender, EventArgs e)
    {
        int UserID = 0;
        int UniversityID = Convert.ToInt32(ddlUniversity.SelectedValue);
        int MasterID = Convert.ToInt16(ddlMaster.SelectedValue);

        //var objUser = (students)Session["LoginInfo"];
        //userID = objUser.studentid;
        UserID = Convert.ToInt32(Session["UserID"].ToString());
        IEnumerable<universitywisemastermapping> list = db.universitywisemastermapping.Where(x => x.universityid == UniversityID && x.masterid == MasterID).ToList();
        db.universitywisemastermapping.RemoveRange(list);
        db.SaveChanges();

        foreach (ListItem li in chkMasterField.Items)
        {
            if (li.Selected)
            {
                int masterValueid = Convert.ToInt16(li.Value);
                universitywisemastermapping mappingObj = new universitywisemastermapping();
                mappingObj.universityid = UniversityID;
                mappingObj.masterid = MasterID;
                mappingObj.mastervalueid = masterValueid;
                mappingObj.created_by = UserID;
                db.universitywisemastermapping.Add(mappingObj);
                db.SaveChanges();                    
            }

        }          
            
    }    
}


