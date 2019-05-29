using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_applicantdetailsvalidation : System.Web.UI.Page
{
    private int userID = 0, agentID = 0;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    List<applicantdatavalidation> lstField = new List<applicantdatavalidation>();
    protected List<applicantdetails> objApplicant = new List<applicantdetails>();
    protected List<applicantemployerdetails> objEmployer = new List<applicantemployerdetails>();
    protected List<applicantlanguagecompetency> objLanguage = new List<applicantlanguagecompetency>();
    protected List<applicanthighereducation> objHigherEdu = new List<applicanthighereducation>();
    protected List<applicanteducationdetails> objEdu = new List<applicanteducationdetails>();
    protected string FullName = "";
    protected string PostalAddress = "";
    protected string ResidentailAddress = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginInfo"] == null)
            Response.Redirect(webURL + "Login.aspx");
        var objUser = (students)Session["LoginInfo"];
        agentID = objUser.studentid;
        if ((Request.QueryString["ID"] != null) && (Request.QueryString["ID"] != null))
            userID = Convert.ToInt32(Request.QueryString["ID"]);
        if (!IsPostBack)
        {
            objApplicant = (from pInfo in db.applicantdetails
                            where pInfo.applicantid == userID
                            select pInfo).ToList();
            InsertKeyName(userID);
            string Title = objCom.GetTitle(Convert.ToInt32(objApplicant[0].title));
            if (Title == "Others")
            {
                if ((objApplicant[0].firstname != null) && (objApplicant[0].lastname != null))
                    FullName = objApplicant[0].othertitle.ToString() + " " + objApplicant[0].firstname.ToString() + " " + objApplicant[0].lastname.ToString();
            }
            else
            {
                if ((objApplicant[0].firstname != null) && (objApplicant[0].lastname != null))
                    FullName = Title + " " + objApplicant[0].firstname.ToString() + " " + objApplicant[0].lastname.ToString();
            }
            PostalAddress = objApplicant[0].postaladdrees1==null?"": objApplicant[0].postaladdrees1.ToString() + " " + objApplicant[0].postaladdrees2 == null ? "" : objApplicant[0].postaladdrees2.ToString() + " " + objApplicant[0].postaladdrees3 == null ? "" : objApplicant[0].postaladdrees3.ToString() + " " + objApplicant[0].postalcity == null ? "" : objApplicant[0].postalcity.ToString() + " " + objApplicant[0].postalstate == null ? "" : objApplicant[0].postalstate.ToString() + " " + objApplicant[0].postalpostcode == null ? "" : objApplicant[0].postalpostcode.ToString() + " " + objCom.GetCountryDiscription(objApplicant[0].postalcountry.ToString());
            ResidentailAddress = objApplicant[0].residentialaddress1 == null ? "" : objApplicant[0].residentialaddress1.ToString() + " " + objApplicant[0].residentialaddress2 == null ? "" : objApplicant[0].residentialaddress2.ToString() + " " + objApplicant[0].residentialaddress3 == null ? "" : objApplicant[0].residentialaddress3.ToString() + " " + objApplicant[0].residentialcity == null ? "" : objApplicant[0].residentialcity.ToString() + " " + objApplicant[0].residentialstate == null ? "" : objApplicant[0].residentialstate.ToString() + " " + objApplicant[0].residentailpostcode == null ? "" : objApplicant[0].residentailpostcode.ToString() + " " + objCom.GetCountryDiscription(objApplicant[0].residentialcountry.ToString());
            objEmployer = (from pInfo in db.applicantemployerdetails
                           where pInfo.applicantid == userID
                           select pInfo).ToList();
            objLanguage = (from pInfo in db.applicantlanguagecompetency
                           where pInfo.applicantid == userID
                           select pInfo).ToList();
            objHigherEdu = (from pInfo in db.applicanthighereducation
                            where pInfo.applicantid == userID
                            select pInfo).ToList();
            objEdu = (from pInfo in db.applicanteducationdetails
                      where pInfo.applicantid == userID
                      select pInfo).ToList();
            BindGrid();
        }
    }

    private void InsertKeyName(int applicantID)
    {
        try
        {
            lstField = db.applicantdatavalidation.Where(x => x.applicantid == applicantID).ToList();
            if (lstField.Count == 0)
            {
                applicantdatavalidation objField = new applicantdatavalidation();
                var fieldList = db.applcantdetailfieldvalidationmaster.ToList();
                for (int k = 0; k < fieldList.Count; k++)
                {
                    objField.applicantid = applicantID;
                    objField.keyid = fieldList[k].id;
                    db.applicantdatavalidation.Add(objField);
                    db.SaveChanges();
                }

            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }

    }
    private DataTable SetValues(int applicantID)
    {
        DataTable dt = new DataTable();
        dt.Clear();
        dt.Columns.Add("id");
        dt.Columns.Add("KeyName");
        dt.Columns.Add("KeyValue");
        dt.Columns.Add("isValid");
        dt.Columns.Add("proofofValidation");
        dt.Columns.Add("applicantId");
        dt.Columns.Add("remarks");
        try
        {
            var validateDatalist = (from adv in db.applicantdatavalidation
                                    join adf in db.applcantdetailfieldvalidationmaster on adv.keyid equals adf.id
                                    where adv.applicantid == applicantID
                                    select new
                                    {
                                        id = adv.id,
                                        keyname = adf.keyname,
                                        isvalid = adv.isvalid,
                                        proofofvalidation = adv.proofofvalidation,
                                        applicantid = adv.applicantid,
                                        remarks = adv.remarks
                                    }).ToList();
            for (int k = 0; k < validateDatalist.Count; k++)
            {
                DataRow dr = dt.NewRow();
                switch (validateDatalist[k].keyname)
                {

                    case "Name":
                        dr["id"] = validateDatalist[k].id;
                        dr["KeyName"] = validateDatalist[k].keyname;
                        dr["KeyValue"] = FullName;
                        dr["isValid"] = validateDatalist[k].isvalid;
                        dr["proofofValidation"] = validateDatalist[k].proofofvalidation;
                        dr["remarks"] = validateDatalist[k].remarks;
                        dt.Rows.Add(dr);
                        break;
                    case "Date of Birth":

                        dr["id"] = validateDatalist[k].id;
                        dr["KeyName"] = validateDatalist[k].keyname;
                        dr["KeyValue"] = Convert.ToDateTime(objApplicant[0].dateofbirth).ToString("yyyy-MM-dd");
                        dr["isValid"] = validateDatalist[k].isvalid;
                        dr["proofofValidation"] = validateDatalist[k].proofofvalidation;
                        dr["remarks"] = validateDatalist[k].remarks;
                        dt.Rows.Add(dr);
                        break;
                    case "Gender":
                        dr["id"] = validateDatalist[k].id;
                        dr["KeyName"] = validateDatalist[k].keyname;
                        dr["KeyValue"] = objApplicant[0].gender == 1 ? "Male" : "Female";
                        dr["isValid"] = validateDatalist[k].isvalid;
                        dr["proofofValidation"] = validateDatalist[k].proofofvalidation;
                        dr["remarks"] = validateDatalist[k].remarks;
                        dt.Rows.Add(dr);
                        break;
                    case "Nationality":
                        dr["id"] = validateDatalist[k].id;
                        dr["KeyName"] = validateDatalist[k].keyname;
                        dr["KeyValue"] = objCom.GetCountryDiscription(objApplicant[0].nationality);
                        dr["isValid"] = validateDatalist[k].isvalid;
                        dr["proofofValidation"] = validateDatalist[k].proofofvalidation;
                        dr["remarks"] = validateDatalist[k].remarks;
                        dt.Rows.Add(dr);
                        break;
                    case "Birth Country":
                        dr["id"] = validateDatalist[k].id;
                        dr["KeyName"] = validateDatalist[k].keyname;
                        dr["KeyValue"] = objCom.GetCountryDiscription(objApplicant[0].countryofbirth); ;
                        dr["isValid"] = validateDatalist[k].isvalid;
                        dr["proofofValidation"] = validateDatalist[k].proofofvalidation;
                        dr["remarks"] = validateDatalist[k].remarks;
                        dt.Rows.Add(dr);
                        break;
                    case "Disability":
                        if (objApplicant[0].isdisable == 1)
                        {
                            dr["id"] = validateDatalist[k].id;
                            dr["KeyName"] = validateDatalist[k].keyname;
                            dr["KeyValue"] = objCom.GetDisability(Convert.ToInt32(objApplicant[0].disabilitydescription));
                            dr["isValid"] = validateDatalist[k].isvalid;
                            dr["proofofValidation"] = validateDatalist[k].proofofvalidation;
                            dr["remarks"] = validateDatalist[k].remarks;
                            dt.Rows.Add(dr);
                        }
                        break;
                    case "Postal Address":
                        dr["id"] = validateDatalist[k].id;
                        dr["KeyName"] = validateDatalist[k].keyname;
                        dr["KeyValue"] = PostalAddress;
                        dr["isValid"] = validateDatalist[k].isvalid;
                        dr["proofofValidation"] = validateDatalist[k].proofofvalidation;
                        dr["remarks"] = validateDatalist[k].remarks;
                        dt.Rows.Add(dr);
                        break;
                    case "Residentail Address":
                        dr["id"] = validateDatalist[k].id;
                        dr["KeyName"] = validateDatalist[k].keyname;
                        dr["KeyValue"] = ResidentailAddress;
                        dr["isValid"] = validateDatalist[k].isvalid;
                        dr["proofofValidation"] = validateDatalist[k].proofofvalidation;
                        dr["remarks"] = validateDatalist[k].remarks;
                        dt.Rows.Add(dr);
                        break;
                    case "Passport":
                        dr["id"] = validateDatalist[k].id;
                        dr["KeyName"] = validateDatalist[k].keyname;
                        dr["KeyValue"] = objApplicant[0].passportno;
                        dr["isValid"] = validateDatalist[k].isvalid;
                        dr["proofofValidation"] = validateDatalist[k].proofofvalidation;
                        dr["remarks"] = validateDatalist[k].remarks;
                        dt.Rows.Add(dr);
                        break;
                    case "High School":
                        if (objEdu.Count > 0)
                        {
                            if (objEdu[0].ishighschooldone == 1)
                            {
                                dr["id"] = validateDatalist[k].id;
                                dr["KeyName"] = validateDatalist[k].keyname;
                                dr["KeyValue"] = objEdu[0].highschoolname;
                                dr["isValid"] = validateDatalist[k].isvalid;
                                dr["proofofValidation"] = validateDatalist[k].proofofvalidation;
                                dr["remarks"] = validateDatalist[k].remarks;
                                dt.Rows.Add(dr);
                            }
                        }
                        break;
                    case "Secondary":
                        if (objEdu.Count > 0)
                        {
                            if (objEdu[0].issecondarydone == 1)
                            {
                                dr["id"] = validateDatalist[k].id;
                                dr["KeyName"] = validateDatalist[k].keyname;
                                dr["KeyValue"] = objEdu[0].secondaryname;
                                dr["isValid"] = validateDatalist[k].isvalid;
                                dr["proofofValidation"] = validateDatalist[k].proofofvalidation;
                                dr["remarks"] = validateDatalist[k].remarks;
                                dt.Rows.Add(dr);
                            }
                        }
                        break;
                    case "Gradution":

                        for (int i = 0; i < objHigherEdu.Count; i++)
                        {
                            if (objHigherEdu[i].coursename == "UG")
                            {
                                dr["id"] = validateDatalist[k].id;
                                dr["KeyName"] = validateDatalist[k].keyname;
                                dr["KeyValue"] = "UG";
                                dr["isValid"] = validateDatalist[k].isvalid;
                                dr["proofofValidation"] = validateDatalist[k].proofofvalidation;
                                dr["remarks"] = validateDatalist[k].remarks;
                                dt.Rows.Add(dr);
                            }
                        }

                        break;
                    case "Post Gradution":
                        for (int i = 0; i < objHigherEdu.Count; i++)
                        {
                            if (objHigherEdu[i].coursename == "PG")
                            {
                                dr["id"] = validateDatalist[k].id;
                                dr["KeyName"] = validateDatalist[k].keyname;
                                dr["KeyValue"] = "PG";
                                dr["isValid"] = validateDatalist[k].isvalid;
                                dr["proofofValidation"] = validateDatalist[k].proofofvalidation;
                                dr["remarks"] = validateDatalist[k].remarks;
                                dt.Rows.Add(dr);
                            }
                        }

                        break;
                    case "PhD":
                        for (int i = 0; i < objHigherEdu.Count; i++)
                        {
                            if (objHigherEdu[i].coursename == "PhD")
                            {
                                dr["id"] = validateDatalist[k].id;
                                dr["KeyName"] = validateDatalist[k].keyname;
                                dr["KeyValue"] = "PhD";
                                dr["isValid"] = validateDatalist[k].isvalid;
                                dr["proofofValidation"] = validateDatalist[k].proofofvalidation;
                                dr["remarks"] = validateDatalist[k].remarks;
                                dt.Rows.Add(dr);
                            }
                        }

                        break;
                    case "Other Degree":
                        for (int i = 0; i < objHigherEdu.Count; i++)
                        {
                            if (objHigherEdu[i].coursename == "Other Degree")
                            {
                                dr["id"] = validateDatalist[k].id;
                                dr["KeyName"] = validateDatalist[k].keyname;
                                dr["KeyValue"] = "Other Degree";
                                dr["isValid"] = validateDatalist[k].isvalid;
                                dr["proofofValidation"] = validateDatalist[k].proofofvalidation;
                                dr["remarks"] = validateDatalist[k].remarks;
                                dt.Rows.Add(dr);
                            }
                        }
                        break;
                    case "Diploma":
                        if (objEdu.Count > 0)
                        {
                            if (objEdu[0].isdiplomadone == 1)
                            {
                                dr["id"] = validateDatalist[k].id;
                                dr["KeyName"] = validateDatalist[k].keyname;
                                dr["KeyValue"] = objEdu[0].diplomaschoolname;
                                dr["isValid"] = validateDatalist[k].isvalid;
                                dr["proofofValidation"] = validateDatalist[k].proofofvalidation;
                                dr["remarks"] = validateDatalist[k].remarks;
                                dt.Rows.Add(dr);
                            }
                        }
                        break;
                    case "Intensive Lanuguage":
                        if (objLanguage.Count > 0)
                        {
                            if (objLanguage[0].isenglishintesive == 1)
                            {
                                dr["id"] = validateDatalist[k].id;
                                dr["KeyName"] = validateDatalist[k].keyname;
                                dr["KeyValue"] = objLanguage[0].instituename;
                                dr["isValid"] = validateDatalist[k].isvalid;
                                dr["proofofValidation"] = validateDatalist[k].proofofvalidation;
                                dr["remarks"] = validateDatalist[k].remarks;
                            }
                        }
                        break;
                    case "Language Certification":
                        if (objLanguage.Count > 0)
                        {
                            dr["id"] = validateDatalist[k].id;
                            dr["KeyName"] = validateDatalist[k].keyname;
                            dr["KeyValue"] = objLanguage[0].testname;
                            dr["isValid"] = validateDatalist[k].isvalid;
                            dr["proofofValidation"] = validateDatalist[k].proofofvalidation;
                            dr["remarks"] = validateDatalist[k].remarks;
                            dt.Rows.Add(dr);
                        }
                        break;
                    case "Employment":
                        for (int i = 0; i < objEmployer.Count; i++)
                        {
                            if (objEmployer.Count > 0)
                            {
                                dr["id"] = validateDatalist[k].id;
                                dr["KeyName"] = validateDatalist[k].keyname;
                                dr["KeyValue"] = objEmployer[i].organization;
                                dr["isValid"] = validateDatalist[k].isvalid;
                                dr["proofofValidation"] = validateDatalist[k].proofofvalidation;
                                dr["remarks"] = validateDatalist[k].remarks;
                                dt.Rows.Add(dr);
                            }
                        }
                        break;
                    default:
                        break;
                }
            }
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
        return dt;
    }

    private void BindGrid()
    {
        gvValidateData.DataSource = SetValues(userID);
        gvValidateData.DataBind();
    }

    protected void btnValidate_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gvrow in gvValidateData.Rows)
        {
            int ID = Convert.ToInt32(gvrow.Cells[0].Text);
            var validate = db.applicantdatavalidation.Where(x => x.id == ID).First();
            var checkbox = gvrow.FindControl("chkValid") as CheckBox;
            var Proof = gvrow.FindControl("txtValidationProof") as TextBox;
            var Remarks = gvrow.FindControl("txtRemarks") as TextBox;
            if (checkbox.Checked)
                validate.isvalid = 1;
            else
                validate.isvalid = 0;
            validate.proofofvalidation = Proof.Text;
            validate.remarks = Remarks.Text;
            validate.lastvalidatedtime = DateTime.Now;
            validate.agentid = agentID;
            db.SaveChanges();
        }

    }

}