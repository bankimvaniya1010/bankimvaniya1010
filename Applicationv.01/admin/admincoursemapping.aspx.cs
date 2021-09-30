using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_coursemapping : System.Web.UI.Page
{
    private GTEEntities db = new GTEEntities();
    Common objCommon = new Common();
    Logger objLog = new Logger();
    string webURL = String.Empty;
    string docPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"].ToString();
    protected string imagepath = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);

        if (!IsPostBack)
        {
            //int universityId;
            //if (!Int32.TryParse(Request.QueryString["universityID"], out universityId))
            //    Response.Redirect(webURL + "admin/default.aspx");

            //if (Request.QueryString["universityID"] != null)
            //{

            binddata();
            //    }
            //    else
            //        Response.Redirect(webURL + "admin/default.aspx");
            //}
        }
    }
    public void binddata()
    {

        for (int i = 0; i <= 9; i++)
        {
            ddlyear.Items.Insert(i, i.ToString());
            ddlhours.Items.Insert(i, i.ToString());
        }
        for (int i = 0; i <= 11; i++)
        {
            ddlmonths.Items.Insert(i, i.ToString());
        }
        for (int i = 0; i <= 30; i++)
        {
            ddldays.Items.Insert(i, i.ToString());
        }

        ListItem lst = new ListItem("Please select", "0");
        var university_master = (from q in db.university_master

                                 select new
                                 {
                                     id = q.universityid,
                                     text = q.university_name,

                                 }).ToList();
        ddlProvidedByInstitutionName.DataSource = university_master;
        ddlProvidedByInstitutionName.DataTextField = "text";
        ddlProvidedByInstitutionName.DataValueField = "id";
        ddlProvidedByInstitutionName.DataBind();
        ddlProvidedByInstitutionName.Items.Insert(0, lst);

        var type = (from q in db.ec_type_master

                    select new
                    {
                        id = q.type_id,
                        text = q.type_description,

                    }).ToList(); 
        ddlType.DataSource = type;
        ddlType.DataTextField = "text";
        ddlType.DataValueField = "id";
        ddlType.DataBind();
        ddlType.Items.Insert(0, lst);

        var studymodemasterdata = (from q in db.studymodemaster

                                   select new
                                   {
                                       id = q.id,
                                       text = q.description,

                                   }).ToList();
        ddlModel.DataSource = studymodemasterdata;
        ddlModel.DataTextField = "text";
        ddlModel.DataValueField = "id";
        ddlModel.DataBind();
        ddlModel.Items.Insert(0, lst);
        var universitycampusda = (from q in db.universitycampus

                                  select new
                                  {
                                      id = q.campusid,
                                      text = q.campusname,

                                  }).ToList();
        chkLocationsCampusBranch.DataSource = universitycampusda;
        chkLocationsCampusBranch.DataTextField = "text";
        chkLocationsCampusBranch.DataValueField = "id";
        chkLocationsCampusBranch.DataBind();



        var type_masterda = (from q in db.type_master

                             select new
                             {
                                 id = q.id,
                                 text = q.description,

                             }).ToList();
        ddlInstitutionType.DataSource = type_masterda;
        ddlInstitutionType.DataTextField = "text";
        ddlInstitutionType.DataValueField = "id";
        ddlInstitutionType.DataBind();
        ddlInstitutionType.Items.Insert(0, lst);

        var Setting_masterasd = (from q in db.Setting_master
                                 select new
                                 {
                                     id = q.id,
                                     text = q.description,

                                 }).ToList();
        ddlInstitutionSetting.DataSource = Setting_masterasd;
        ddlInstitutionSetting.DataTextField = "text";
        ddlInstitutionSetting.DataValueField = "id";
        ddlInstitutionSetting.DataBind();
        ddlInstitutionSetting.Items.Insert(0, lst);

        var size_masteras = (from q in db.size_master
                             select new
                             {
                                 id = q.id,
                                 text = q.description,

                             }).ToList();
        ddlInstitutionSize.DataSource = size_masteras;
        ddlInstitutionSize.DataTextField = "text";
        ddlInstitutionSize.DataValueField = "id";
        ddlInstitutionSize.DataBind();
        ddlInstitutionSize.Items.Insert(0, lst);

        var course_broadFields_masteras = (from q in db.course_broadFields_master

                                           select new
                                           {
                                               id = q.id,
                                               text = q.fieldname,

                                           }).ToList();
        chkBroadFieldofStudy.DataSource = course_broadFields_masteras;
        chkBroadFieldofStudy.DataTextField = "text";
        chkBroadFieldofStudy.DataValueField = "id";
        chkBroadFieldofStudy.DataBind();

        var course_narrowFields_master = (from q in db.course_narrowFields_master
                                          select new
                                          {
                                              id = q.id,
                                              text = q.fieldname,
                                          }).ToList();
        chkNarrowFieldofStudy.DataSource = course_narrowFields_master;
        chkNarrowFieldofStudy.DataTextField = "text";
        chkNarrowFieldofStudy.DataValueField = "id";
        chkNarrowFieldofStudy.DataBind();


        var course_detailsField_master = (from q in db.course_detailsField_master

                                          select new
                                          {
                                              id = q.id,
                                              text = q.fieldname,
                                          }).ToList();
        chkDetailedFieldofStudy.DataSource = course_detailsField_master;
        chkDetailedFieldofStudy.DataTextField = "text";
        chkDetailedFieldofStudy.DataValueField = "id";
        chkDetailedFieldofStudy.DataBind();


        var majordiscipline_master = (from q in db.majordiscipline_master


                                      select new
                                      {
                                          id = q.id,
                                          text = q.description,
                                      }).ToList();
        chkMajorDiscipline.DataSource = majordiscipline_master;
        chkMajorDiscipline.DataTextField = "text";
        chkMajorDiscipline.DataValueField = "id";
        chkMajorDiscipline.DataBind();

        var studylevelmaster = (from q in db.studylevelmaster
                                select new
                                {
                                    id = q.studylevelid,
                                    text = q.studylevel,
                                }).ToList();
        chkLevelofStudy.DataSource = studylevelmaster;
        chkLevelofStudy.DataTextField = "text";
        chkLevelofStudy.DataValueField = "id";
        chkLevelofStudy.DataBind();

        var ec_major_career_filed_master = (from q in db.ec_major_career_filed_master

                                            select new
                                            {
                                                id = q.id,
                                                text = q.major_name,
                                            }).ToList();
        chkMajorFieldofCareers.DataSource = ec_major_career_filed_master;
        chkMajorFieldofCareers.DataTextField = "text";
        chkMajorFieldofCareers.DataValueField = "id";
        chkMajorFieldofCareers.DataBind();

        var ec_detailed_career_filed_master = (from q in db.ec_detailed_career_filed_master


                                               select new
                                               {
                                                   id = q.id,
                                                   text = q.detailed_name,
                                               }).ToList();
        chkMinorFieldofCareers.DataSource = ec_detailed_career_filed_master;
        chkMinorFieldofCareers.DataTextField = "text";
        chkMinorFieldofCareers.DataValueField = "id";
        chkMinorFieldofCareers.DataBind();

        var ec_broad_career_filed_master = (from q in db.ec_broad_career_filed_master
                                            select new
                                            {
                                                id = q.id,
                                                text = q.broad_name,
                                            }).ToList();
        chkBroadFieldofCareers.DataSource = ec_detailed_career_filed_master;
        chkBroadFieldofCareers.DataTextField = "text";
        chkBroadFieldofCareers.DataValueField = "id";
        chkBroadFieldofCareers.DataBind();

        var scholarships = (from q in db.scholarships

                            select new
                            {
                                id = q.id,
                                text = q.name,
                            }).ToList();
        ddlScholarshipAvailable.DataSource = scholarships;
        ddlScholarshipAvailable.DataTextField = "text";
        ddlScholarshipAvailable.DataValueField = "id";
        ddlScholarshipAvailable.DataBind();
        ddlScholarshipAvailable.Items.Insert(0, lst);

        var currency_master = (from q in db.currency_master
                               select new
                               {
                                   id = q.id,
                                   text = q.currency_symbol + " " + q.currency_code,
                               }).ToList();
        ddlCurrency.DataSource = currency_master;
        ddlCurrency.DataTextField = "text";
        ddlCurrency.DataValueField = "id";
        ddlCurrency.DataBind();
        ddlCurrency.Items.Insert(0, lst);

        var admincoursesource = (from q in db.admincoursesource
                                 select new
                                 {
                                     id = q.id,
                                     text = q.coursesource,
                                 }).ToList();
        ddlSource.DataSource = admincoursesource;
        ddlSource.DataTextField = "text";
        ddlSource.DataValueField = "id";
        ddlSource.DataBind();
        ddlSource.Items.Insert(0, lst);


        var admincoursesuitability = (from q in db.admincoursesuitability
                                      select new
                                      {
                                          id = q.id,
                                          text = q.coursesuitability,
                                      }).ToList();
        chkCourseSuitablefor.DataSource = admincoursesuitability;
        chkCourseSuitablefor.DataTextField = "text";
        chkCourseSuitablefor.DataValueField = "id";
        chkCourseSuitablefor.DataBind();


        var adminfeemode = (from q in db.adminfeemode
                              select new
                              {
                                  id = q.id,
                                  text = q.feemode,
                              }).ToList();
        chkFeePaymentMode.DataSource = adminfeemode;
        chkFeePaymentMode.DataTextField = "text";
        chkFeePaymentMode.DataValueField = "id";
        chkFeePaymentMode.DataBind();

        var adminskillsmaster = (from q in db.adminskillsmaster
                            select new
                            {
                                id = q.id,
                                text = q.skillsmaster,
                            }).ToList();
        chkSkills.DataSource = adminskillsmaster;
        chkSkills.DataTextField = "text";
        chkSkills.DataValueField = "id";
        chkSkills.DataBind();

        

        var adminabilitiesmaster = (from q in db.adminabilitiesmaster
                                    select new
                                    {
                                        id = q.id,
                                        text = q.abilities,
                                    }).ToList();
        chkAbilities.DataSource = adminabilitiesmaster;
        chkAbilities.DataTextField = "text";
        chkAbilities.DataValueField = "id";
        chkAbilities.DataBind();

        var adminworkactivitiesmaster = (from q in db.adminworkactivitiesmaster
                                         select new
                                         {
                                             id = q.id,
                                             text = q.workactivities,
                                         }).ToList();
        chkWorkActivities.DataSource = adminworkactivitiesmaster;
        chkWorkActivities.DataTextField = "text";
        chkWorkActivities.DataValueField = "id";
        chkWorkActivities.DataBind();
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        try
        {

            admincoursetypefieldmapping obj = new admincoursetypefieldmapping();
            Random rndobj = new Random();
            //obj.CourseID = rndobj.Next(100000, 999999);
            // obj.CourseID = 1;

            obj.CourseType = Convert.ToInt32(ddlCourseType.SelectedValue);
            obj.Source = Convert.ToInt32(ddlSource.SelectedValue);
            obj.PartnerCourseID = txtPartnerCourseID.Text;
            if (fpCourseImage.HasFile)
            {
                if (!Directory.Exists(docPath + "\\CourseImage"))
                    Directory.CreateDirectory(docPath + "\\CourseImage");
                string extension = Path.GetExtension(fpCourseImage.PostedFile.FileName);
                string filename = Guid.NewGuid() + extension;
                if (File.Exists(docPath + "\\CourseImage\\" + filename))
                    File.Delete(docPath + "\\CourseImage\\" + filename);
                fpCourseImage.SaveAs(docPath + "\\CourseImage\\" + filename);
                obj.CourseImage = filename;
            }
            if (fpCourseAudioVideo.HasFile)
            {
                if (!Directory.Exists(docPath + "\\CourseAudioVideo"))
                    Directory.CreateDirectory(docPath + "\\CourseAudioVideo");
                string extension = Path.GetExtension(fpCourseImage.PostedFile.FileName);
                string filename = Guid.NewGuid() + extension;
                if (File.Exists(docPath + "\\CourseAudioVideo\\" + filename))
                    File.Delete(docPath + "\\CourseAudioVideo\\" + filename);
                fpCourseAudioVideo.SaveAs(docPath + "\\CourseAudioVideo\\" + filename);
                obj.CourseAudioVideo = filename;
            }
            if (fpCourseBrochure.HasFile)
            {
                if (!Directory.Exists(docPath + "\\CourseBrochure"))
                    Directory.CreateDirectory(docPath + "\\CourseBrochure");
                string extension = Path.GetExtension(fpCourseBrochure.PostedFile.FileName);
                string filename = Guid.NewGuid() + extension;
                if (File.Exists(docPath + "\\CourseBrochure\\" + filename))
                    File.Delete(docPath + "\\CourseBrochure\\" + filename);
                fpCourseBrochure.SaveAs(docPath + "\\CourseBrochure\\" + filename);
                obj.CourseBrochure = filename;
            }
            obj.LinktoWebPageURL = txtLinktoWebPageURL.Text;
            obj.CourseName = txtCourseName.Text;
            obj.ProvidedByInstitutionName = Convert.ToInt32(ddlProvidedByInstitutionName.SelectedValue);
            obj.ShortDescription = txtShortDescription.Text;
            
            if (string.IsNullOrEmpty(ddlNumberofStudentsTakenCourse.SelectedValue)==false)
                obj.NumberofStudentsTakenCourse = Convert.ToInt32(ddlNumberofStudentsTakenCourse.SelectedValue);

            if (string.IsNullOrEmpty(ddlLanguageCourseAvailableIn.SelectedValue)==false)
                obj.LanguageCourseAvailableIn = Convert.ToInt32(ddlLanguageCourseAvailableIn.SelectedValue);

            string CourseSuitablefor = "";
            for (int i = 0; i < chkCourseSuitablefor.Items.Count; i++)
            {
                if (chkCourseSuitablefor.Items[i].Selected)
                {
                    CourseSuitablefor += chkCourseSuitablefor.Items[i].Text + " ,";
                }

            }

            obj.CourseSuitablefor = CourseSuitablefor;
            obj.LearningObjectives = txtLearningObjectives.Text;
            obj.MainFeatures = txtMainFeatures.Text;
            obj.CourseContent = txtCourseContent.Text;
            obj.LongDescription = txtLongDescription.Text;
            if (ddlyear.SelectedItem.Text != "Select")
                obj.DurationYear = Convert.ToInt32(ddlyear.SelectedValue);
            if (ddlmonths.SelectedItem.Text != "Select")
                obj.DurationMonth = Convert.ToInt32(ddlmonths.SelectedValue);
            if (ddldays.SelectedItem.Text != "Select")
                obj.DurationDays = Convert.ToInt32(ddldays.SelectedValue);
            if (ddlhours.SelectedItem.Text != "Select")
                obj.DurationHours = Convert.ToInt32(ddlhours.SelectedValue);
            obj.Fee = string.IsNullOrEmpty(txtFee.Text.Trim()) ? 0 : Convert.ToInt32(txtFee.Text);
            obj.ApplicationEnrollmentFee = string.IsNullOrEmpty(txtFeePaymentMode.Text.Trim()) ? 0 : Convert.ToInt32(txtFeePaymentMode.Text);
            string FeePaymentMode = "";
            for (int i = 0; i < chkFeePaymentMode.Items.Count; i++)
            {
                if (chkFeePaymentMode.Items[i].Selected)
                {
                    FeePaymentMode += chkFeePaymentMode.Items[i].Text + " ,";
                }

            }
            obj.FeePaymentMode = FeePaymentMode;

            obj.Mode = Convert.ToInt32(ddlModel.SelectedValue);
            string LocationsCampusBranch = "";
            for (int i = 0; i < chkLocationsCampusBranch.Items.Count; i++)
            {
                if (chkLocationsCampusBranch.Items[i].Selected)
                {
                    LocationsCampusBranch += chkLocationsCampusBranch.Items[i].Text + " ,";
                }

            }

            obj.LocationsCampusBranch = LocationsCampusBranch;
            obj.Type = Convert.ToInt32(ddlType.SelectedValue);
            obj.AverageNumberParticipantsClassSize = !string.IsNullOrEmpty(txtAverageNumberParticipantsClassSize.Text) ? Convert.ToInt32(txtAverageNumberParticipantsClassSize.Text) : 0;
            obj.DomesticInternationalBoth = Convert.ToInt32(ddlDomesticInternationalBoth.SelectedValue);
            obj.FundingAvailable = rblFundingAvailable.SelectedValue;
            obj.HousingAvailable = rblHousingAvailable.SelectedValue;
            obj.InstitutionType = Convert.ToInt32(ddlInstitutionType.SelectedValue);
            obj.InstitutionSetting = Convert.ToInt32(ddlInstitutionSetting.SelectedValue);
            obj.InstitutionSize = Convert.ToInt32(ddlInstitutionSize.SelectedValue);
            obj.AcceptanceRate = !string.IsNullOrEmpty(txtAcceptanceRate.Text) ? Convert.ToInt32(txtAcceptanceRate.Text) : 0;
            obj.DisabilityServicesAvailable = rblDisabilityServicesAvailable.SelectedValue;
            obj.SelfPaced = rblSelfPaced.SelectedValue;
            if (string.IsNullOrEmpty(txtStartDateIntakeDate.Text)==false)
                obj.StartDateIntakeDate = Convert.ToDateTime(txtStartDateIntakeDate.Text);
            else
                obj.StartDateIntakeDate = null;
            if (string.IsNullOrEmpty(txtApplicationDeadline.Text)==false)
                obj.ApplicationDeadline = Convert.ToDateTime(txtApplicationDeadline.Text);
            else
                obj.ApplicationDeadline = null;

            obj.CourseOutcome = txtCourseOutcome.Text;
            if (fpInstructorDirectorImage1.HasFile)
            {
                if (!Directory.Exists(docPath + "\\InstructorDirectorImage1"))
                    Directory.CreateDirectory(docPath + "\\InstructorDirectorImage1");
                string extension = Path.GetExtension(fpInstructorDirectorImage1.PostedFile.FileName);
                string filename = Guid.NewGuid() + extension;
                if (File.Exists(docPath + "\\InstructorDirectorImage1\\" + filename))
                    File.Delete(docPath + "\\InstructorDirectorImage1\\" + filename);
                fpInstructorDirectorImage1.SaveAs(docPath + "\\InstructorDirectorImage1\\" + filename);
                obj.InstructorDirectorImage1 = filename;
            }

            obj.InstructorDirectorName1 = txtInstructorDirectorName1.Text;
            obj.InstructorDirectorDescription1 = txtInstructorDirectorDescription1.Text;
            if (fpInstructorDirectorImage2.HasFile)
            {
                if (!Directory.Exists(docPath + "\\InstructorDirectorImage2"))
                    Directory.CreateDirectory(docPath + "\\InstructorDirectorImage2");
                string extension = Path.GetExtension(fpInstructorDirectorImage2.PostedFile.FileName);
                string filename = Guid.NewGuid() + extension;
                if (File.Exists(docPath + "\\InstructorDirectorImage2\\" + filename))
                    File.Delete(docPath + "\\InstructorDirectorImage2\\" + filename);
                fpInstructorDirectorImage2.SaveAs(docPath + "\\InstructorDirectorImage2\\" + filename);
                obj.InstructorDirectorImage2 = filename;
            }

            obj.InstructorDirectorName2 = txtInstructorDirectorName2.Text;
            obj.InstructorDirectorDescription2 = txtInstructorDirectorDescription2.Text;
            if (fpInstructorDirectorImage3.HasFile)
            {
                if (!Directory.Exists(docPath + "\\InstructorDirectorImage3"))
                    Directory.CreateDirectory(docPath + "\\InstructorDirectorImage3");
                string extension = Path.GetExtension(fpCourseImage.PostedFile.FileName);
                string filename = Guid.NewGuid() + extension;
                if (File.Exists(docPath + "\\InstructorDirectorImage3/" + filename))
                    File.Delete(docPath + "\\InstructorDirectorImage3/" + filename);
                fpInstructorDirectorImage3.SaveAs(docPath + "\\InstructorDirectorImage3/" + filename);
                obj.InstructorDirectorImage3 = filename;
            }

            obj.InstructorDirectorName3 = txtInstructorDirectorName3.Text;
            obj.InstructorDirectorDescription3 = txtInstructorDirectorDescription3.Text;
            if (fpInstructorDirectorImage4.HasFile)
            {
                if (!Directory.Exists(docPath + "\\InstructorDirectorImage4"))
                    Directory.CreateDirectory(docPath + "\\InstructorDirectorImage4");
                string extension = Path.GetExtension(fpInstructorDirectorImage4.PostedFile.FileName);
                string filename = Guid.NewGuid() + extension;
                if (File.Exists(docPath + "\\InstructorDirectorImage4/" + filename))
                    File.Delete(docPath + "\\InstructorDirectorImage4/" + filename);
                fpInstructorDirectorImage4.SaveAs(docPath + "\\InstructorDirectorImage4/" + filename);
                obj.InstructorDirectorImage4 = filename;
            }
            obj.InstructorDirectorName4 = txtInstructorDirectorName4.Text;
            obj.InstructorDirectorDescription4 = txtInstructorDirectorDescription4.Text;
            if (fpInstructorDirectorImage5.HasFile)
            {
                if (!Directory.Exists(docPath + "\\InstructorDirectorImage5"))
                    Directory.CreateDirectory(docPath + "\\InstructorDirectorImage5");
                string extension = Path.GetExtension(fpInstructorDirectorImage5.PostedFile.FileName);
                string filename = Guid.NewGuid() + extension;
                if (File.Exists(docPath + "\\InstructorDirectorImage5/" + filename))
                    File.Delete(docPath + "\\InstructorDirectorImage5/" + filename);
                fpInstructorDirectorImage5.SaveAs(docPath + "\\InstructorDirectorImage5/" + filename);
                obj.InstructorDirectorImage5 = filename;
            }
            obj.InstructorDirectorName5 = txtInstructorDirectorName5.Text;
            obj.InstructorDirectorDescription5 = txtInstructorDirectorDescription5.Text;


            obj.DeferralPolicy = txtDeferralPolicy.Text;
            obj.OfferAcceptanceRejectionPolicy = txtOfferAcceptanceRejectionPolicy.Text;

            obj.CancellationPolicy = txtCancellationPolicy.Text;
            obj.RefundPolicy = txtRefundPolicy.Text;
            obj.PromotionTag1 = txtPromotionTag1.Text;
            obj.PromotionTag1 = txtPromotionTag2.Text;
            obj.ActiveNotActiveStatus = rblActiveStatus.SelectedValue;
            obj.CertificationEarned = rblCertificationEarned.SelectedValue;
            string BroadFieldofStudy = "";
            for (int i = 0; i < chkBroadFieldofStudy.Items.Count; i++)
            {
                if (chkBroadFieldofStudy.Items[i].Selected)
                {
                    BroadFieldofStudy += chkBroadFieldofStudy.Items[i].Text + " ,";
                }

            }
            obj.BroadFieldofStudy = BroadFieldofStudy;

            string NarrowFieldofStudy = "";
            for (int i = 0; i < chkNarrowFieldofStudy.Items.Count; i++)
            {
                if (chkNarrowFieldofStudy.Items[i].Selected)
                {
                    NarrowFieldofStudy += chkNarrowFieldofStudy.Items[i].Text + " ,";
                }

            }
            obj.NarrowFieldofStudy = NarrowFieldofStudy;

            string DetailedFieldofStudy = "";
            for (int i = 0; i < chkDetailedFieldofStudy.Items.Count; i++)
            {
                if (chkDetailedFieldofStudy.Items[i].Selected)
                {
                    DetailedFieldofStudy += chkDetailedFieldofStudy.Items[i].Text + " ,";
                }

            }
            obj.DetailedFieldofStudy = DetailedFieldofStudy;

            string MajorDiscipline = "";
            for (int i = 0; i < chkMajorDiscipline.Items.Count; i++)
            {
                if (chkMajorDiscipline.Items[i].Selected)
                {
                    MajorDiscipline += chkMajorDiscipline.Items[i].Text + " ,";
                }

            }
            obj.MajorDiscipline = MajorDiscipline;

            string LevelofStudy = "";
            for (int i = 0; i < chkLevelofStudy.Items.Count; i++)
            {
                if (chkLevelofStudy.Items[i].Selected)
                {
                    LevelofStudy += chkLevelofStudy.Items[i].Text + " ,";
                }

            }
            obj.LevelofStudy = LevelofStudy;

            string Skills = "";
            for (int i = 0; i < chkSkills.Items.Count; i++)
            {
                if (chkSkills.Items[i].Selected)
                {
                    Skills += chkSkills.Items[i].Text + " ,";
                }

            }
            obj.Skills = Skills;

            string Abilities = "";
            for (int i = 0; i < chkAbilities.Items.Count; i++)
            {
                if (chkAbilities.Items[i].Selected)
                {
                    Abilities += chkAbilities.Items[i].Text + " ,";
                }

            }

            obj.Abilities = Abilities;
            string WorkActivities = "";
            for (int i = 0; i < chkWorkActivities.Items.Count; i++)
            {
                if (chkWorkActivities.Items[i].Selected)
                {
                    WorkActivities += chkWorkActivities.Items[i].Text + " ,";
                }

            }
            obj.WorkActivities = WorkActivities;

            string MajorFieldofCareers = "";
            for (int i = 0; i < chkMajorFieldofCareers.Items.Count; i++)
            {
                if (chkMajorFieldofCareers.Items[i].Selected)
                {
                    MajorFieldofCareers += chkMajorFieldofCareers.Items[i].Text + " ,";
                }

            }
            obj.MajorFieldofCareers = MajorFieldofCareers;
            string MinorFieldofCareers = "";
            for (int i = 0; i < chkMinorFieldofCareers.Items.Count; i++)
            {
                if (chkMinorFieldofCareers.Items[i].Selected)
                {
                    MinorFieldofCareers += chkMinorFieldofCareers.Items[i].Text + " ,";
                }

            }
            obj.MinorFieldofCareers = MinorFieldofCareers;
            string BroadFieldofCareers = "";
            for (int i = 0; i < chkBroadFieldofCareers.Items.Count; i++)
            {
                if (chkBroadFieldofCareers.Items[i].Selected)
                {
                    BroadFieldofCareers += chkBroadFieldofCareers.Items[i].Text + " ,";
                }

            }
            obj.BroadFieldofCareers = BroadFieldofCareers;
            obj.EligibleforGovtSubsidy = !string.IsNullOrEmpty(rblEligibleforGovtSubsidy.SelectedValue) ? rblEligibleforGovtSubsidy.SelectedValue : "";
            obj.DescriptionofGovtSubsidy = txtDescriptionofGovtSubsidy.Text;
            obj.EligibleforScholarship = !string.IsNullOrEmpty(rblEligibleforScholarship.SelectedValue) ? rblEligibleforScholarship.SelectedValue : "";
            obj.ScholarshipAvailable = ddlScholarshipAvailable.SelectedItem.Text;
            obj.Requirements = txtRequirements.Text;
            if (string.IsNullOrEmpty(ddlLevelStudyCompleted.SelectedValue) == false)
                obj.LevelStudyCompleted = Convert.ToInt32(ddlLevelStudyCompleted.SelectedValue);
            if (string.IsNullOrEmpty(ddlSelectBaseQualificationCountry.SelectedValue) == false)
                obj.SelectBaseQualificationCountry = Convert.ToInt32(ddlSelectBaseQualificationCountry.SelectedValue);
            if (string.IsNullOrEmpty(ddlSelectQualificationLevel.SelectedValue) == false)
                obj.SelectQualificationLevel = Convert.ToInt32(ddlSelectQualificationLevel.SelectedValue);
            obj.SubjectQualification = !string.IsNullOrEmpty(rblSubjectQualification.SelectedValue) ? rblSubjectQualification.SelectedValue : "";
            obj.SubjectAndGrade = txtSubjectAndGrade.Text;
            obj.MoreSubjectsAndGrades = txtMoreSubjectsAndGrades.Text;
            obj.EnglishLanguageCompetency = !string.IsNullOrEmpty(rblEnglishLanguageCompetency.SelectedValue) ? rblEnglishLanguageCompetency.SelectedValue : "";
            obj.AcceptableEnglishQualifications = txtAcceptableEnglishQualifications.Text;
            obj.EnglishLanguageCompetencyLevel = txtEnglishLanguageCompetencyLevel.Text;
            obj.GraduateAdmissionTest = !string.IsNullOrEmpty(rblGraduateAdmissionTest.SelectedValue) ? rblGraduateAdmissionTest.SelectedValue : "";
            obj.SelectGraduateAdmissionsTestsMinGrades = txtSelectGraduateAdmissionsTestsMinGrades.Text;
            obj.IsInterview = !string.IsNullOrEmpty(rblIsInterview.SelectedValue) ? rblIsInterview.SelectedValue : "";
            obj.DetailsOfInterview = txtDetailsOfInterview.Text;
            obj.RelatedPathwayCourses = txtRelatedPathwayCourses.Text;
            obj.Grade = txtGrade.Text;
            obj.TimeZone = Request.Form["timezone"];
            obj.Recurrence = txtRecurrence.Text;
            if (!string.IsNullOrEmpty(txtClassStartTime.Text))
                obj.ClassStartTime = txtClassStartTime.Text;
            else
                obj.ClassStartTime = null;
            if (!string.IsNullOrEmpty(txtClassEndTime.Text))
                obj.ClassEndTime = txtClassEndTime.Text;
            else
                obj.ClassEndTime = null;

            obj.Instruction = txtInstruction.Text;
            obj.InstructionFile = txtInstructionFile.Text;
            obj.Group = txtGroup.Text;
            obj.Subject = txtSubject.Text;
            obj.Currency = Convert.ToInt32(ddlCurrency.SelectedValue);
            db.admincoursetypefieldmapping.Add(obj);
            db.SaveChanges();
            Response.Redirect(webURL + "admin/adminlistcoursetypefieldmapping.aspx", true);

        }
        catch (Exception ex) { objLog.WriteLog(ex.StackTrace.ToString()); }
    }

    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetNarrow(int broadID)
    {
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();

        var narrow = (from nf in db1.course_narrowFields_master
                      join mapp in db1.broad_narrow_mapping on broadID equals mapp.broadField_Id
                      where nf.id == mapp.narrowField_Id
                      select new
                      {
                          fieldname = nf.fieldname,
                          id = nf.id,
                      }).Distinct().OrderBy(x => x.id).ToList();

        return JsonConvert.SerializeObject(narrow);
    }
    [WebMethod]
    [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
    public static string GetDetailed(int narrowID)
    {
        GTEEntities db1 = new GTEEntities();
        int universityID1 = Utility.GetUniversityId();

        var temp = (from df in db1.course_detailsField_master
                    join mapp in db1.narrow_detailed_mapping on narrowID equals mapp.narrowField_Id
                    where df.id == mapp.deatailedField_Id
                    select new
                    {
                        fieldname = df.fieldname,
                        id = df.id,
                    }).Distinct().OrderBy(x => x.id).ToList();

        return JsonConvert.SerializeObject(temp);
    }
}