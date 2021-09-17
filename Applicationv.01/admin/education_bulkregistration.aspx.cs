using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_education_bulkregistration : System.Web.UI.Page
{
    int roleID = 0, universityID = 0;
    string universityName;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();
    string roleName = string.Empty;
    string webURL = String.Empty;
    public List<educational_institutionmaster> employees = new List<educational_institutionmaster>();
    public List<details> invalidlist = new List<details>();
    protected string LoginURL = "";
    public string demolink, unregisteredapplicantlistLink;
    public static string filePath = string.Empty;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    public string invalid_fileName = null;
    public int? noofapplicantsave;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        roleName = Utility.GetRoleName();
        if (String.IsNullOrEmpty(roleName))
            Response.Redirect(webURL + "admin/Login.aspx", true);

        universityID = Utility.GetUniversityId();

        roleID = Convert.ToInt32(Session["Role"]);

        HttpFileCollection httpPostedFile = HttpContext.Current.Request.Files;
        if (httpPostedFile.Count > 0)
            uploadDoc(httpPostedFile[0]);

        if (!IsPostBack)
        {
            objCom.BindCountries(ddlcountry);
            demolink = webURL + "Docs/BulkRegistrations/DemoSheet.csv";
            populate();
        }
    }
    private void populate()
    {
        try
        {
            //var isrecordpresent = db.bulk_registrations_master.Where(x => x.universityid == universityID).OrderByDescending(x => x.id).FirstOrDefault();
            //if (isrecordpresent != null)
            //{
            //    noofapplicantsave = isrecordpresent.noofrecordsaved;
            //    noofapplicantsaveDiv.Attributes.Add("style", "display:block;");

            //    if (!string.IsNullOrEmpty(isrecordpresent.invalidfilepath))
            //    {
            //        unregisteredapplicantlistDiv.Attributes.Add("style", "display:block;");
            //        unregisteredapplicantlistLink = webURL + "/Docs/BulkRegistrations/" + universityID + "/" + isrecordpresent.invalidfilepath;
            //    }
            //}
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }

    }

    protected void uploadDoc(HttpPostedFile postedFile)
    {
        try
        {
           // int countryid = 13;//Convert.ToInt32(ddlcountry.SelectedValue);
            if (postedFile != null)
            {
                try
                {
                    string fileExtension = Path.GetExtension(postedFile.FileName);
                    string path1 = docPath + "/educationBulkUpload/" + universityID + "/";
                    string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(postedFile.FileName));
                    string filePath = string.Concat(path1, fileName);
                    if (!Directory.Exists(path1))
                        Directory.CreateDirectory(path1);
                    postedFile.SaveAs(filePath);

                    //Validate uploaded file and return error.
                    if (fileExtension != ".csv")
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please select the csv file with .csv extension.')", true);
                    }

                    employees = new List<educational_institutionmaster>();
                    invalidlist = new List<details>();

                    using (var sreader = new StreamReader(postedFile.InputStream))
                    {
                        //First line is header. If header is not passed in csv then we can neglect the below line.
                        string[] headers = sreader.ReadLine().Split(',');
                        //Loop through the records
                        while (!sreader.EndOfStream)
                        {
                            string[] rows = sreader.ReadLine().Split(',');

                            string code = rows[0].ToString().Trim();
                            string fieldname = rows[1].ToString().Trim();
                            //string description = rows[2].ToString().Trim();

                            if (!string.IsNullOrEmpty(code))
                            {
                                if (!string.IsNullOrEmpty(fieldname))
                                {
                                    //if (!string.IsNullOrEmpty(description))
                                     savetoDatabase(code, fieldname);
                                }
                            }
                            else
                            {
                                invalidlist.Add(new details
                                {
                                    name = rows[0].ToString().Trim(),
                                    invalidreason = "InValid City Name"
                                });
                            }

                        }
                    }
                    if (invalidlist.Count > 0)
                    {
                        BindDatatable();
                    }
                    else
                        unregisteredapplicantlistDiv.Attributes.Add("style", "display:none;");


                    //saverecordofBulkRegistration(employees.Count, fileName, invalid_fileName);
                }
                catch (Exception ex)
                {
                    objLog.WriteLog(ex.ToString());
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please select the file first to upload.')", true);
            }
        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }

    private void savetoDatabase(string code, string name)
    {
        try
        {

            //var record = db.course_narrowFields_master.Where(x => x.fieldname == name).FirstOrDefault();
            //if (record == null)
            //{
            //    course_narrowFields_master cityObj = new course_narrowFields_master();
            //    cityObj.fieldname = name;
            //    //cityObj.description = description;
            //    cityObj.code= code;
            //    db.course_narrowFields_master.Add(cityObj);
            //    db.SaveChanges();
            //}
            //else
            //{
            //    //same cityname id presenet
            //    invalidlist.Add(new details
            //    {
            //        name = name,
            //        invalidreason = "Already Exists"
            //    });
            //}

        }
        catch (Exception ex) { objLog.WriteLog(ex.ToString()); }
    }


    public class details
    {
        public string name { get; set; }
        public string invalidreason { get; set; }
    }


    protected System.Data.DataTable BindDatatable()
    {
        System.Data.DataTable dt = new System.Data.DataTable();
        // all columns
        dt.Columns.Add("City Name", typeof(string));
        dt.Columns.Add("Reason", typeof(string));
        // to print rows

        if (invalidlist != null)
        {
            int rowNumber = 2;
            for (var i = 0; i < invalidlist.Count; i++)
            {
                var details = invalidlist[i];

                dt.Rows.Add(details.name, details.invalidreason);

                rowNumber++;
            }
        }
        SaveExcel(dt);
        return dt;
    }

    private void SaveExcel(System.Data.DataTable dt1)
    {
        try
        {

            string csv = string.Empty;

            foreach (DataColumn column in dt1.Columns)
            {
                //Add the Header row for CSV file.
                csv += column.ColumnName + ',';
            }

            //Add new line.
            csv += "\r\n";

            foreach (DataRow row in dt1.Rows)
            {
                foreach (DataColumn column in dt1.Columns)
                {
                    //Add the Data rows.
                    csv += row[column.ColumnName].ToString().Replace(",", ";") + ',';
                }

                //Add new line.
                csv += "\r\n";
            }

            string datetime = Convert.ToString(DateTime.Today.ToString("dd-MM-yyyy")).Trim();
            string filepath = @"" + docPath + "/CityBulkUpload/" + universityID + "/";
            if (!Directory.Exists(filepath))
                Directory.CreateDirectory(filepath);

            string filename = "educationBulkUpload" + "_" + universityID + ".CSV";
            string combinepath = filepath + filename;
            invalid_fileName = filename;
            System.IO.File.WriteAllText(combinepath, csv);

        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
}