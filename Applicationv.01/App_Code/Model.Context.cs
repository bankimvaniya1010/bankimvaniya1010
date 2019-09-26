﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Core.Objects;
using System.Linq;

public partial class GTEEntities : DbContext
{
    public GTEEntities()
        : base("name=GTEEntities")
    {
    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }

    public virtual DbSet<GTE_documentverification> GTE_documentverification { get; set; }
    public virtual DbSet<accommodationplan> accommodationplan { get; set; }
    public virtual DbSet<admincomments> admincomments { get; set; }
    public virtual DbSet<admintooltips> admintooltips { get; set; }
    public virtual DbSet<adminuniversitywisetooltips> adminuniversitywisetooltips { get; set; }
    public virtual DbSet<adminusers> adminusers { get; set; }
    public virtual DbSet<agentmaster> agentmaster { get; set; }
    public virtual DbSet<alternateadressproofmaster> alternateadressproofmaster { get; set; }
    public virtual DbSet<alternatedobproof> alternatedobproof { get; set; }
    public virtual DbSet<alternateidproofmaster> alternateidproofmaster { get; set; }
    public virtual DbSet<answer_mastersecondarylanguage> answer_mastersecondarylanguage { get; set; }
    public virtual DbSet<answermaster> answermaster { get; set; }
    public virtual DbSet<answeroptionssecondary> answeroptionssecondary { get; set; }
    public virtual DbSet<applcantdetailfieldvalidationmaster> applcantdetailfieldvalidationmaster { get; set; }
    public virtual DbSet<applicant_education> applicant_education { get; set; }
    public virtual DbSet<applicant_scholarships> applicant_scholarships { get; set; }
    public virtual DbSet<applicantcampaign> applicantcampaign { get; set; }
    public virtual DbSet<applicantdatavalidation> applicantdatavalidation { get; set; }
    public virtual DbSet<applicantdocumentmaster> applicantdocumentmaster { get; set; }
    public virtual DbSet<applicanteducationdetails> applicanteducationdetails { get; set; }
    public virtual DbSet<applicantemployerdetails> applicantemployerdetails { get; set; }
    public virtual DbSet<applicantformmaster> applicantformmaster { get; set; }
    public virtual DbSet<applicantfundingmaster> applicantfundingmaster { get; set; }
    public virtual DbSet<applicanthighereducation> applicanthighereducation { get; set; }
    public virtual DbSet<applicantlanguagecompetency> applicantlanguagecompetency { get; set; }
    public virtual DbSet<applicantprogressbar> applicantprogressbar { get; set; }
    public virtual DbSet<applicantreferencecheck> applicantreferencecheck { get; set; }
    public virtual DbSet<applicantresidencehistory> applicantresidencehistory { get; set; }
    public virtual DbSet<applicantscores> applicantscores { get; set; }
    public virtual DbSet<applicantsubjectwisegrade> applicantsubjectwisegrade { get; set; }
    public virtual DbSet<applicantuniversitymapping> applicantuniversitymapping { get; set; }
    public virtual DbSet<applicantvideomaster> applicantvideomaster { get; set; }
    public virtual DbSet<applicantvisadetails> applicantvisadetails { get; set; }
    public virtual DbSet<applicationmaster> applicationmaster { get; set; }
    public virtual DbSet<australiavisadetailmaster> australiavisadetailmaster { get; set; }
    public virtual DbSet<australiavisadocumentmaster> australiavisadocumentmaster { get; set; }
    public virtual DbSet<australiavisaFamilydetailmaster> australiavisaFamilydetailmaster { get; set; }
    public virtual DbSet<cefrlevelmaster> cefrlevelmaster { get; set; }
    public virtual DbSet<citymaster> citymaster { get; set; }
    public virtual DbSet<clarificationquestion_university_mapping> clarificationquestion_university_mapping { get; set; }
    public virtual DbSet<clarificationquestionsmaster> clarificationquestionsmaster { get; set; }
    public virtual DbSet<controlmaster> controlmaster { get; set; }
    public virtual DbSet<countriesmaster> countriesmaster { get; set; }
    public virtual DbSet<countrywisealternateidproofmaster> countrywisealternateidproofmaster { get; set; }
    public virtual DbSet<coursemaster> coursemaster { get; set; }
    public virtual DbSet<coursetypemaster> coursetypemaster { get; set; }
    public virtual DbSet<credentialmaster> credentialmaster { get; set; }
    public virtual DbSet<currency_master> currency_master { get; set; }
    public virtual DbSet<customfieldmaster> customfieldmaster { get; set; }
    public virtual DbSet<customfieldvalue> customfieldvalue { get; set; }
    public virtual DbSet<disabilitymaster> disabilitymaster { get; set; }
    public virtual DbSet<documentvalidationbyagent> documentvalidationbyagent { get; set; }
    public virtual DbSet<educationmediummaster> educationmediummaster { get; set; }
    public virtual DbSet<educationverificationcontactmaster> educationverificationcontactmaster { get; set; }
    public virtual DbSet<entertainment> entertainment { get; set; }
    public virtual DbSet<facilitiesmaster> facilitiesmaster { get; set; }
    public virtual DbSet<facility_campus_mapping> facility_campus_mapping { get; set; }
    public virtual DbSet<familymember> familymember { get; set; }
    public virtual DbSet<faq> faq { get; set; }
    public virtual DbSet<fieldvalidationmaster> fieldvalidationmaster { get; set; }
    public virtual DbSet<formfieldmapping> formfieldmapping { get; set; }
    public virtual DbSet<formfieldmaster> formfieldmaster { get; set; }
    public virtual DbSet<formmaster> formmaster { get; set; }
    public virtual DbSet<grademaster> grademaster { get; set; }
    public virtual DbSet<gte_answer_master> gte_answer_master { get; set; }
    public virtual DbSet<gte_applicantdocument> gte_applicantdocument { get; set; }
    public virtual DbSet<gte_clarification_applicantresponse> gte_clarification_applicantresponse { get; set; }
    public virtual DbSet<gte_clarification_questionmaster> gte_clarification_questionmaster { get; set; }
    public virtual DbSet<gte_preliminary_questionmaster> gte_preliminary_questionmaster { get; set; }
    public virtual DbSet<gte_preliminaryapplicantanswers> gte_preliminaryapplicantanswers { get; set; }
    public virtual DbSet<gte_progressbar> gte_progressbar { get; set; }
    public virtual DbSet<gte_question_master_part2> gte_question_master_part2 { get; set; }
    public virtual DbSet<gte_question_part2_applicant_response> gte_question_part2_applicant_response { get; set; }
    public virtual DbSet<gte_questions_applicant_response> gte_questions_applicant_response { get; set; }
    public virtual DbSet<gte_questions_master> gte_questions_master { get; set; }
    public virtual DbSet<gte_report_admin_comment> gte_report_admin_comment { get; set; }
    public virtual DbSet<gte_statementofpurpose> gte_statementofpurpose { get; set; }
    public virtual DbSet<gte_student_sop> gte_student_sop { get; set; }
    public virtual DbSet<gte_tutorialmaster> gte_tutorialmaster { get; set; }
    public virtual DbSet<gte_videouploadmaster> gte_videouploadmaster { get; set; }
    public virtual DbSet<health_insurance> health_insurance { get; set; }
    public virtual DbSet<inferencemaster> inferencemaster { get; set; }
    public virtual DbSet<invalidatamaster> invalidatamaster { get; set; }
    public virtual DbSet<manageaccomdationplan> manageaccomdationplan { get; set; }
    public virtual DbSet<manageentertainment> manageentertainment { get; set; }
    public virtual DbSet<managehealth_insurance> managehealth_insurance { get; set; }
    public virtual DbSet<managemeal> managemeal { get; set; }
    public virtual DbSet<managemealplan> managemealplan { get; set; }
    public virtual DbSet<managetransportchoice> managetransportchoice { get; set; }
    public virtual DbSet<managetrips> managetrips { get; set; }
    public virtual DbSet<manageutilities> manageutilities { get; set; }
    public virtual DbSet<managevisa> managevisa { get; set; }
    public virtual DbSet<maritalstatusmaster> maritalstatusmaster { get; set; }
    public virtual DbSet<master_name> master_name { get; set; }
    public virtual DbSet<preliminary_questionmaster> preliminary_questionmaster { get; set; }
    public virtual DbSet<preliminaryapplicantanswers> preliminaryapplicantanswers { get; set; }
    public virtual DbSet<primaryfieldmaster> primaryfieldmaster { get; set; }
    public virtual DbSet<profilemaster> profilemaster { get; set; }
    public virtual DbSet<qualificationcountriesmapping> qualificationcountriesmapping { get; set; }
    public virtual DbSet<qualificationmaster> qualificationmaster { get; set; }
    public virtual DbSet<question_master> question_master { get; set; }
    public virtual DbSet<realtionshipmaster> realtionshipmaster { get; set; }
    public virtual DbSet<registrationcourses> registrationcourses { get; set; }
    public virtual DbSet<relative_master> relative_master { get; set; }
    public virtual DbSet<rolemaster> rolemaster { get; set; }
    public virtual DbSet<scholarships> scholarships { get; set; }
    public virtual DbSet<secondarylanguagemaster> secondarylanguagemaster { get; set; }
    public virtual DbSet<studentcoursemapping> studentcoursemapping { get; set; }
    public virtual DbSet<students> students { get; set; }
    public virtual DbSet<studylevelmaster> studylevelmaster { get; set; }
    public virtual DbSet<studymodemaster> studymodemaster { get; set; }
    public virtual DbSet<studyoptionmaster> studyoptionmaster { get; set; }
    public virtual DbSet<subjectmaster> subjectmaster { get; set; }
    public virtual DbSet<subjectwisecountrymapping> subjectwisecountrymapping { get; set; }
    public virtual DbSet<supervisorcomments> supervisorcomments { get; set; }
    public virtual DbSet<timezonemaster> timezonemaster { get; set; }
    public virtual DbSet<titlemaster> titlemaster { get; set; }
    public virtual DbSet<tooltipmaster> tooltipmaster { get; set; }
    public virtual DbSet<transportchoice> transportchoice { get; set; }
    public virtual DbSet<trips> trips { get; set; }
    public virtual DbSet<tuitionAndlivingcostmaster> tuitionAndlivingcostmaster { get; set; }
    public virtual DbSet<tutorialmaster> tutorialmaster { get; set; }
    public virtual DbSet<typemaster> typemaster { get; set; }
    public virtual DbSet<typeofworkexperiencemaster> typeofworkexperiencemaster { get; set; }
    public virtual DbSet<universitycampus> universitycampus { get; set; }
    public virtual DbSet<universitycampus_city_mapping> universitycampus_city_mapping { get; set; }
    public virtual DbSet<universitygrouping> universitygrouping { get; set; }
    public virtual DbSet<universitywisefieldmapping> universitywisefieldmapping { get; set; }
    public virtual DbSet<universitywiseformmapping> universitywiseformmapping { get; set; }
    public virtual DbSet<universitywisemastermapping> universitywisemastermapping { get; set; }
    public virtual DbSet<universitywisetooltipmaster> universitywisetooltipmaster { get; set; }
    public virtual DbSet<utilities> utilities { get; set; }
    public virtual DbSet<visa> visa { get; set; }
    public virtual DbSet<visatype> visatype { get; set; }
    public virtual DbSet<workexperienceyearsmaster> workexperienceyearsmaster { get; set; }
    public virtual DbSet<student_sop> student_sop { get; set; }
    public virtual DbSet<applicantdetails> applicantdetails { get; set; }
    public virtual DbSet<course_campus_mapping> course_campus_mapping { get; set; }
    public virtual DbSet<course_dates> course_dates { get; set; }
    public virtual DbSet<majordiscipline_master> majordiscipline_master { get; set; }
    public virtual DbSet<gte_applicantdetails> gte_applicantdetails { get; set; }
    public virtual DbSet<university_master> university_master { get; set; }
    public virtual DbSet<rejection_reasonmaster> rejection_reasonmaster { get; set; }
    public virtual DbSet<universitywise_rejectionreasonmapping> universitywise_rejectionreasonmapping { get; set; }

    public virtual int fetchapplicantDetail()
    {
        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("fetchapplicantDetail");
    }

    public virtual int shell_creation(string username, string pwd, Nullable<int> aId, string name, string email)
    {
        var usernameParameter = username != null ?
            new ObjectParameter("username", username) :
            new ObjectParameter("username", typeof(string));

        var pwdParameter = pwd != null ?
            new ObjectParameter("pwd", pwd) :
            new ObjectParameter("pwd", typeof(string));

        var aIdParameter = aId.HasValue ?
            new ObjectParameter("aId", aId) :
            new ObjectParameter("aId", typeof(int));

        var nameParameter = name != null ?
            new ObjectParameter("name", name) :
            new ObjectParameter("name", typeof(string));

        var emailParameter = email != null ?
            new ObjectParameter("email", email) :
            new ObjectParameter("email", typeof(string));

        return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction("shell_creation", usernameParameter, pwdParameter, aIdParameter, nameParameter, emailParameter);
    }
}
