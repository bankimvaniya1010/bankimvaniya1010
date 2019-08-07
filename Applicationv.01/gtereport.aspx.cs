using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;
using System.Data;
using System.Drawing;
using IronPdf;

public partial class gtereport : System.Web.UI.Page
{
    protected string _institutionID = "";
    protected string _studentName = "Test Report";
    protected string _reportType = "";
    protected string _reportDate = "";
    protected string _reportNo = "";
    protected string _isRecommended = "";
    protected string _genuineStudentAssesment = "I am an <Indian> national, born in <Country of birth> aged <21 years> currently residing in <India>. Keen to study in Australia a <Answer to Q12 Section 1> Level course in the field of <Answer Q13 Section 1> titled <Answer to Q14 Section 1> at <Answer to Q19 Section 1>>, located at <Answer to Q20 Section 1>. The highest educational qualification I have achieved is <Name_of_Highest_education>, which equates to <10+2> study level. I completed this education <xx years, yy months> ago from <Country of highest educational qualification>. There have been no gaps in my education. There have been gaps in my education. The reason for which are <Answer to CQ1 Section 3>. I do not have any work experience. My total work experience so far is <Work Experience>. There have been breaks in my work experience, <Answer to CQ2 Section 3>. My English language competencies are, <Answer to Q17 Section 2>";
    protected string _situationStudentAssesment = "I am an <Indian> national, born in <Country of birth> aged <21 years> currently residing in <India>. Keen to study in Australia a <Answer to Q12 Section 1> Level course in the field of <Answer Q13 Section 1> titled <Answer to Q14 Section 1> at <Answer to Q19 Section 1>>, located at <Answer to Q20 Section 1>. The highest educational qualification I have achieved is <Name_of_Highest_education>, which equates to <10+2> study level. I completed this education <xx years, yy months> ago from <Country of highest educational qualification>. There have been no gaps in my education. There have been gaps in my education. The reason for which are <Answer to CQ1 Section 3>. I do not have any work experience. My total work experience so far is <Work Experience>. There have been breaks in my work experience, <Answer to CQ2 Section 3>. My English language competencies are, <Answer to Q17 Section 2>";
    protected string _potentialStudentAssesment = "I am an <Indian> national, born in <Country of birth> aged <21 years> currently residing in <India>. Keen to study in Australia a <Answer to Q12 Section 1> Level course in the field of <Answer Q13 Section 1> titled <Answer to Q14 Section 1> at <Answer to Q19 Section 1>>, located at <Answer to Q20 Section 1>. The highest educational qualification I have achieved is <Name_of_Highest_education>, which equates to <10+2> study level. I completed this education <xx years, yy months> ago from <Country of highest educational qualification>. There have been no gaps in my education. There have been gaps in my education. The reason for which are <Answer to CQ1 Section 3>. I do not have any work experience. My total work experience so far is <Work Experience>. There have been breaks in my work experience, <Answer to CQ2 Section 3>. My English language competencies are, <Answer to Q17 Section 2>";
    protected string _studentVideoReview = "Video is perfect";
    protected string _studentDocumentsValidations = "Documents are validated";
    protected string _finalRecommendation = "";
    protected int roleID = 0, ApplicantID = 0, universityID = 0;
    string _universityName;
    private GTEEntities db = new GTEEntities();
    Common objCom = new Common();
    Logger objLog = new Logger();

    string webURL = System.Configuration.ConfigurationManager.AppSettings["WebUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        universityID = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["UniversityID"].ToString());
        //if ((Request.QueryString["ID"] == null) || (Request.QueryString["ID"].ToString() == ""))
        //{
        //    Response.Redirect(webURL + "admin/default.aspx", true);
        //}
        //else
        //    ApplicantID = Convert.ToInt32(Request.QueryString["ID"].ToString());
        //var Personal = db.applicantdetails.Where(x => x.applicantid == ApplicantID && x.universityid == universityID).FirstOrDefault();
        //_studentName = Personal.firstname + "" + Personal.lastname;
        _institutionID = "AU 234";
        _reportType = "AU - GS &amp; GTE (TYPE 1)";
        _reportDate = System.DateTime.Now.ToShortDateString();
        _reportNo = "ECU-6768 68-7878-ZX";
        _isRecommended = "Recommended";
        _finalRecommendation = " Student is fit the admission";
        populateOverAllGraph();
        populateCharacterGraph();
        populatecourseValueGraph();
        populatePotentialGraph();
        populateSituationGraph();
        populateImmigrationGraph();
        populateRetentionGraph();
        populateComplianceGraph();
        populateGenuineGraph();
    }


    private DataTable Temptable()
    {
        DataTable dt = new DataTable();
        dt.Clear();
        dt.Columns.Add("Title");
        dt.Columns.Add("Value");
        DataRow _r = dt.NewRow();
        _r["Title"] = "Risk";
        _r["Value"] = "37";

        dt.Rows.Add(_r);
        _r = dt.NewRow();
        _r["Title"] = "GTE";
        _r["Value"] = "87";
        dt.Rows.Add(_r);
        return dt;
    }
    private void populateOverAllGraph()
    {
        DataTable ChartData = Temptable();

        //storing total rows count to loop on each Record  
        string[] XPointMember = new string[ChartData.Rows.Count];
        int[] YPointMember = new int[ChartData.Rows.Count];

        for (int count = 0; count < ChartData.Rows.Count; count++)
        {
            //storing Values for X axis  
            XPointMember[count] = ChartData.Rows[count]["Title"].ToString();
            //storing values for Y Axis  
            YPointMember[count] = Convert.ToInt32(ChartData.Rows[count]["Value"]);


        }
        //binding chart control  
        OverAll.Series[0].Points.DataBindXY(XPointMember, YPointMember);

        //Setting width of line  
        OverAll.Series[0].BorderWidth = 3;
        OverAll.Series[0]["PixelPointWidth"] = "20";
        //setting Chart type   
        OverAll.Series[0].ChartType = SeriesChartType.Bar;
        // Chart1.Series[0].ChartType = SeriesChartType.StackedBar;  
        OverAll.Series[0].IsValueShownAsLabel = true;
        //Hide or show chart back GridLines  


        OverAll.ChartAreas["ChartAreaOverAll"].AxisX.MajorGrid.Enabled = false;
        OverAll.ChartAreas["ChartAreaOverAll"].AxisY.MajorGrid.Enabled = true;
        OverAll.ChartAreas["ChartAreaOverAll"].AxisY.MajorGrid.LineDashStyle = ChartDashStyle.Dash;
        for (int i = 0; i < ChartData.Rows.Count; i++) //xValues.Lenght = 4 in this case where you have 4 Data number
        {
            if (i == 0) // Don't forget xValues[0] is Data4 in your case
                OverAll.Series[0].Points[i].Color = Color.Red;
            if (i == 1)
                OverAll.Series[0].Points[i].Color = Color.Green;

        }

        //Enabled 3D  
        //OverAll.ChartAreas["ChartAreaOverAll"].Area3DStyle.Enable3D = true;
    }
    private void populateCharacterGraph()
    {
        DataTable ChartData = Temptable();

        //storing total rows count to loop on each Record  
        string[] XPointMember = new string[ChartData.Rows.Count];
        int[] YPointMember = new int[ChartData.Rows.Count];

        for (int count = 0; count < ChartData.Rows.Count; count++)
        {
            //storing Values for X axis  
            XPointMember[count] = ChartData.Rows[count]["Title"].ToString();
            //storing values for Y Axis  
            YPointMember[count] = Convert.ToInt32(ChartData.Rows[count]["Value"]);


        }
        //binding chart control  
        Character.Series[0].Points.DataBindXY(XPointMember, YPointMember);

        //Setting width of line  
        Character.Series[0].BorderWidth = 5;
        Character.Series[0]["PixelPointWidth"] = "20";
        //setting Chart type   
        Character.Series[0].ChartType = SeriesChartType.Bar;
        // Chart1.Series[0].ChartType = SeriesChartType.StackedBar;  
        Character.Series[0].IsValueShownAsLabel = true;
        //Hide or show chart back GridLines  


        Character.ChartAreas["ChartAreaCharacter"].AxisX.MajorGrid.Enabled = false;
        Character.ChartAreas["ChartAreaCharacter"].AxisY.MajorGrid.Enabled = true;
        Character.ChartAreas["ChartAreaCharacter"].AxisY.MajorGrid.LineDashStyle = ChartDashStyle.Dash;
        for (int i = 0; i < ChartData.Rows.Count; i++) //xValues.Lenght = 4 in this case where you have 4 Data number
        {
            if (i == 0) // Don't forget xValues[0] is Data4 in your case
                Character.Series[0].Points[i].Color = Color.Red;
            if (i == 1)
                Character.Series[0].Points[i].Color = Color.Green;

        }

        //Enabled 3D  
        //OverAll.ChartAreas["ChartAreaOverAll"].Area3DStyle.Enable3D = true;
    }
    private void populatecourseValueGraph()
    {
        DataTable ChartData = Temptable();

        //storing total rows count to loop on each Record  
        string[] XPointMember = new string[ChartData.Rows.Count];
        int[] YPointMember = new int[ChartData.Rows.Count];

        for (int count = 0; count < ChartData.Rows.Count; count++)
        {
            //storing Values for X axis  
            XPointMember[count] = ChartData.Rows[count]["Title"].ToString();
            //storing values for Y Axis  
            YPointMember[count] = Convert.ToInt32(ChartData.Rows[count]["Value"]);


        }
        //binding chart control  
        courseValue.Series[0].Points.DataBindXY(XPointMember, YPointMember);

        //Setting width of line  
        courseValue.Series[0].BorderWidth = 5;

        courseValue.Series[0]["PixelPointWidth"] = "20";
        //setting Chart type   
        courseValue.Series[0].ChartType = SeriesChartType.Bar;
        // Chart1.Series[0].ChartType = SeriesChartType.StackedBar;  
        courseValue.Series[0].IsValueShownAsLabel = true;
        //Hide or show chart back GridLines  


        courseValue.ChartAreas["ChartAreacourseValue"].AxisX.MajorGrid.Enabled = false;
        courseValue.ChartAreas["ChartAreacourseValue"].AxisY.MajorGrid.Enabled = true;
        courseValue.ChartAreas["ChartAreacourseValue"].AxisY.MajorGrid.LineDashStyle = ChartDashStyle.Dash;
        for (int i = 0; i < ChartData.Rows.Count; i++) //xValues.Lenght = 4 in this case where you have 4 Data number
        {
            if (i == 0) // Don't forget xValues[0] is Data4 in your case
                courseValue.Series[0].Points[i].Color = Color.Red;
            if (i == 1)
                courseValue.Series[0].Points[i].Color = Color.Green;

        }

        //Enabled 3D  
        //OverAll.ChartAreas["ChartAreaOverAll"].Area3DStyle.Enable3D = true;
    }
    private void populatePotentialGraph()
    {
        DataTable ChartData = Temptable();

        //storing total rows count to loop on each Record  
        string[] XPointMember = new string[ChartData.Rows.Count];
        int[] YPointMember = new int[ChartData.Rows.Count];

        for (int count = 0; count < ChartData.Rows.Count; count++)
        {
            //storing Values for X axis  
            XPointMember[count] = ChartData.Rows[count]["Title"].ToString();
            //storing values for Y Axis  
            YPointMember[count] = Convert.ToInt32(ChartData.Rows[count]["Value"]);


        }
        //binding chart control  
        Potential.Series[0].Points.DataBindXY(XPointMember, YPointMember);

        //Setting width of line  
        Potential.Series[0].BorderWidth = 5;
        Potential.Series[0]["PixelPointWidth"] = "20";
        //setting Chart type   
        Potential.Series[0].ChartType = SeriesChartType.Bar;
        // Chart1.Series[0].ChartType = SeriesChartType.StackedBar;  
        Potential.Series[0].IsValueShownAsLabel = true;
        //Hide or show chart back GridLines  


        Potential.ChartAreas["ChartAreaPotential"].AxisX.MajorGrid.Enabled = false;
        Potential.ChartAreas["ChartAreaPotential"].AxisY.MajorGrid.Enabled = true;
        Potential.ChartAreas["ChartAreaPotential"].AxisY.MajorGrid.LineDashStyle = ChartDashStyle.Dash;
        for (int i = 0; i < ChartData.Rows.Count; i++) //xValues.Lenght = 4 in this case where you have 4 Data number
        {
            if (i == 0) // Don't forget xValues[0] is Data4 in your case
                Potential.Series[0].Points[i].Color = Color.Red;
            if (i == 1)
                Potential.Series[0].Points[i].Color = Color.Green;

        }

        //Enabled 3D  
        //OverAll.ChartAreas["ChartAreaOverAll"].Area3DStyle.Enable3D = true;
    }
    private void populateSituationGraph()
    {
        DataTable ChartData = Temptable();

        //storing total rows count to loop on each Record  
        string[] XPointMember = new string[ChartData.Rows.Count];
        int[] YPointMember = new int[ChartData.Rows.Count];

        for (int count = 0; count < ChartData.Rows.Count; count++)
        {
            //storing Values for X axis  
            XPointMember[count] = ChartData.Rows[count]["Title"].ToString();
            //storing values for Y Axis  
            YPointMember[count] = Convert.ToInt32(ChartData.Rows[count]["Value"]);


        }
        //binding chart control  
        Situation.Series[0].Points.DataBindXY(XPointMember, YPointMember);

        //Setting width of line  
        Situation.Series[0].BorderWidth = 5;
        Situation.Series[0]["PixelPointWidth"] = "20";
        //setting Chart type   
        Situation.Series[0].ChartType = SeriesChartType.Bar;
        // Chart1.Series[0].ChartType = SeriesChartType.StackedBar;  
        Situation.Series[0].IsValueShownAsLabel = true;
        //Hide or show chart back GridLines  


        Situation.ChartAreas["ChartAreaSituation"].AxisX.MajorGrid.Enabled = false;
        Situation.ChartAreas["ChartAreaSituation"].AxisY.MajorGrid.Enabled = true;
        Situation.ChartAreas["ChartAreaSituation"].AxisY.MajorGrid.LineDashStyle = ChartDashStyle.Dash;
        for (int i = 0; i < ChartData.Rows.Count; i++) //xValues.Lenght = 4 in this case where you have 4 Data number
        {
            if (i == 0) // Don't forget xValues[0] is Data4 in your case
                Situation.Series[0].Points[i].Color = Color.Red;
            if (i == 1)
                Situation.Series[0].Points[i].Color = Color.Green;

        }

        //Enabled 3D  
        //OverAll.ChartAreas["ChartAreaOverAll"].Area3DStyle.Enable3D = true;
    }
    private void populateImmigrationGraph()
    {
        DataTable ChartData = Temptable();

        //storing total rows count to loop on each Record  
        string[] XPointMember = new string[ChartData.Rows.Count];
        int[] YPointMember = new int[ChartData.Rows.Count];

        for (int count = 0; count < ChartData.Rows.Count; count++)
        {
            //storing Values for X axis  
            XPointMember[count] = ChartData.Rows[count]["Title"].ToString();
            //storing values for Y Axis  
            YPointMember[count] = Convert.ToInt32(ChartData.Rows[count]["Value"]);


        }
        //binding chart control  
        Immigration.Series[0].Points.DataBindXY(XPointMember, YPointMember);

        //Setting width of line  
        Immigration.Series[0].BorderWidth = 5;
        Immigration.Series[0]["PixelPointWidth"] = "20";
        //setting Chart type   
        Immigration.Series[0].ChartType = SeriesChartType.Bar;
        // Chart1.Series[0].ChartType = SeriesChartType.StackedBar;  
        Immigration.Series[0].IsValueShownAsLabel = true;
        //Hide or show chart back GridLines  


        Immigration.ChartAreas["ChartAreaImmigration"].AxisX.MajorGrid.Enabled = false;
        Immigration.ChartAreas["ChartAreaImmigration"].AxisY.MajorGrid.Enabled = true;
        Immigration.ChartAreas["ChartAreaImmigration"].AxisY.MajorGrid.LineDashStyle = ChartDashStyle.Dash;
        for (int i = 0; i < ChartData.Rows.Count; i++) //xValues.Lenght = 4 in this case where you have 4 Data number
        {
            if (i == 0) // Don't forget xValues[0] is Data4 in your case
                Immigration.Series[0].Points[i].Color = Color.Red;
            if (i == 1)
                Immigration.Series[0].Points[i].Color = Color.Green;

        }

        //Enabled 3D  
        //OverAll.ChartAreas["ChartAreaOverAll"].Area3DStyle.Enable3D = true;
    }
    private void populateRetentionGraph()
    {
        DataTable ChartData = Temptable();

        //storing total rows count to loop on each Record  
        string[] XPointMember = new string[ChartData.Rows.Count];
        int[] YPointMember = new int[ChartData.Rows.Count];

        for (int count = 0; count < ChartData.Rows.Count; count++)
        {
            //storing Values for X axis  
            XPointMember[count] = ChartData.Rows[count]["Title"].ToString();
            //storing values for Y Axis  
            YPointMember[count] = Convert.ToInt32(ChartData.Rows[count]["Value"]);


        }
        //binding chart control  
        Retention.Series[0].Points.DataBindXY(XPointMember, YPointMember);

        //Setting width of line  
        Retention.Series[0].BorderWidth = 5;
        Retention.Series[0]["PixelPointWidth"] = "20";
        //setting Chart type   
        Retention.Series[0].ChartType = SeriesChartType.Bar;
        // Chart1.Series[0].ChartType = SeriesChartType.StackedBar;  
        Retention.Series[0].IsValueShownAsLabel = true;
        //Hide or show chart back GridLines  


        Retention.ChartAreas["ChartAreaRetention"].AxisX.MajorGrid.Enabled = false;
        Retention.ChartAreas["ChartAreaRetention"].AxisY.MajorGrid.Enabled = true;
        Retention.ChartAreas["ChartAreaRetention"].AxisY.MajorGrid.LineDashStyle = ChartDashStyle.Dash;
        for (int i = 0; i < ChartData.Rows.Count; i++) //xValues.Lenght = 4 in this case where you have 4 Data number
        {
            if (i == 0) // Don't forget xValues[0] is Data4 in your case
                Retention.Series[0].Points[i].Color = Color.Red;
            if (i == 1)
                Retention.Series[0].Points[i].Color = Color.Green;

        }

        //Enabled 3D  
        //OverAll.ChartAreas["ChartAreaOverAll"].Area3DStyle.Enable3D = true;
    }
    private void populateComplianceGraph()
    {
        DataTable ChartData = Temptable();

        //storing total rows count to loop on each Record  
        string[] XPointMember = new string[ChartData.Rows.Count];
        int[] YPointMember = new int[ChartData.Rows.Count];

        for (int count = 0; count < ChartData.Rows.Count; count++)
        {
            //storing Values for X axis  
            XPointMember[count] = ChartData.Rows[count]["Title"].ToString();
            //storing values for Y Axis  
            YPointMember[count] = Convert.ToInt32(ChartData.Rows[count]["Value"]);


        }
        //binding chart control  
        Compliance.Series[0].Points.DataBindXY(XPointMember, YPointMember);

        //Setting width of line  
        Compliance.Series[0].BorderWidth = 5;
        Compliance.Series[0]["PixelPointWidth"] = "20";
        //setting Chart type   
        Compliance.Series[0].ChartType = SeriesChartType.Bar;
        // Chart1.Series[0].ChartType = SeriesChartType.StackedBar;  
        Compliance.Series[0].IsValueShownAsLabel = true;
        //Hide or show chart back GridLines  


        Compliance.ChartAreas["ChartAreaCompliance"].AxisX.MajorGrid.Enabled = false;
        Compliance.ChartAreas["ChartAreaCompliance"].AxisY.MajorGrid.Enabled = true;
        Compliance.ChartAreas["ChartAreaCompliance"].AxisY.MajorGrid.LineDashStyle = ChartDashStyle.Dash;
        for (int i = 0; i < ChartData.Rows.Count; i++) //xValues.Lenght = 4 in this case where you have 4 Data number
        {
            if (i == 0) // Don't forget xValues[0] is Data4 in your case
                Compliance.Series[0].Points[i].Color = Color.Red;
            if (i == 1)
                Compliance.Series[0].Points[i].Color = Color.Green;

        }

        //Enabled 3D  
        //OverAll.ChartAreas["ChartAreaOverAll"].Area3DStyle.Enable3D = true;
    }
    private void populateGenuineGraph()
    {
        DataTable ChartData = Temptable();

        //storing total rows count to loop on each Record  
        string[] XPointMember = new string[ChartData.Rows.Count];
        int[] YPointMember = new int[ChartData.Rows.Count];

        for (int count = 0; count < ChartData.Rows.Count; count++)
        {
            //storing Values for X axis  
            XPointMember[count] = ChartData.Rows[count]["Title"].ToString();
            //storing values for Y Axis  
            YPointMember[count] = Convert.ToInt32(ChartData.Rows[count]["Value"]);


        }
        //binding chart control  
        Genuine.Series[0].Points.DataBindXY(XPointMember, YPointMember);

        //Setting width of line  
        Genuine.Series[0].BorderWidth = 5;
        Genuine.Series[0]["PixelPointWidth"] = "20";
        //setting Chart type   
        Genuine.Series[0].ChartType = SeriesChartType.Bar;
        // Chart1.Series[0].ChartType = SeriesChartType.StackedBar;  
        Genuine.Series[0].IsValueShownAsLabel = true;
        //Hide or show chart back GridLines  


        Genuine.ChartAreas["ChartAreaGenuine"].AxisX.MajorGrid.Enabled = false;
        Genuine.ChartAreas["ChartAreaGenuine"].AxisY.MajorGrid.Enabled = true;
        Genuine.ChartAreas["ChartAreaGenuine"].AxisY.MajorGrid.LineDashStyle = ChartDashStyle.Dash;
        for (int i = 0; i < ChartData.Rows.Count; i++) //xValues.Lenght = 4 in this case where you have 4 Data number
        {
            if (i == 0) // Don't forget xValues[0] is Data4 in your case
                Genuine.Series[0].Points[i].Color = Color.Red;
            if (i == 1)
                Genuine.Series[0].Points[i].Color = Color.Green;

        }

        //Enabled 3D  
        //OverAll.ChartAreas["ChartAreaOverAll"].Area3DStyle.Enable3D = true;
    }



}