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
    public virtual DbSet<applicantdatavalidation> applicantdatavalidation { get; set; }
    public virtual DbSet<applicantdetails> applicantdetails { get; set; }
    public virtual DbSet<applicantdocumentmaster> applicantdocumentmaster { get; set; }
    public virtual DbSet<applicanteducationdetails> applicanteducationdetails { get; set; }
    public virtual DbSet<applicantemployerdetails> applicantemployerdetails { get; set; }
    public virtual DbSet<applicantformmaster> applicantformmaster { get; set; }
    public virtual DbSet<applicanthighereducation> applicanthighereducation { get; set; }
    public virtual DbSet<applicantlanguagecompetency> applicantlanguagecompetency { get; set; }
    public virtual DbSet<applicantprogressbar> applicantprogressbar { get; set; }
    public virtual DbSet<applicantreferencecheck> applicantreferencecheck { get; set; }
    public virtual DbSet<applicantscores> applicantscores { get; set; }
    public virtual DbSet<applicantsubjectwisegrade> applicantsubjectwisegrade { get; set; }
    public virtual DbSet<applicantuniversitymapping> applicantuniversitymapping { get; set; }
    public virtual DbSet<applicantvideomaster> applicantvideomaster { get; set; }
    public virtual DbSet<applicantvisadetails> applicantvisadetails { get; set; }
    public virtual DbSet<cefrlevelmaster> cefrlevelmaster { get; set; }
    public virtual DbSet<citymaster> citymaster { get; set; }
    public virtual DbSet<controlmaster> controlmaster { get; set; }
    public virtual DbSet<countriesmaster> countriesmaster { get; set; }
    public virtual DbSet<coursemaster> coursemaster { get; set; }
    public virtual DbSet<coursetypemaster> coursetypemaster { get; set; }
    public virtual DbSet<credentialmaster> credentialmaster { get; set; }
    public virtual DbSet<customfieldmaster> customfieldmaster { get; set; }
    public virtual DbSet<customfieldvalue> customfieldvalue { get; set; }
    public virtual DbSet<disabilitymaster> disabilitymaster { get; set; }
    public virtual DbSet<documentvalidationbyagent> documentvalidationbyagent { get; set; }
    public virtual DbSet<educationmediummaster> educationmediummaster { get; set; }
    public virtual DbSet<educationverificationcontactmaster> educationverificationcontactmaster { get; set; }
    public virtual DbSet<facilitiesmaster> facilitiesmaster { get; set; }
    public virtual DbSet<fieldvalidationmaster> fieldvalidationmaster { get; set; }
    public virtual DbSet<formfieldmapping> formfieldmapping { get; set; }
    public virtual DbSet<formfieldmaster> formfieldmaster { get; set; }
    public virtual DbSet<formmaster> formmaster { get; set; }
    public virtual DbSet<grademaster> grademaster { get; set; }
    public virtual DbSet<inferencemaster> inferencemaster { get; set; }
    public virtual DbSet<invalidatamaster> invalidatamaster { get; set; }
    public virtual DbSet<majordiscipline_master> majordiscipline_master { get; set; }
    public virtual DbSet<master_name> master_name { get; set; }
    public virtual DbSet<preliminary_questionmaster> preliminary_questionmaster { get; set; }
    public virtual DbSet<preliminaryapplicantanswers> preliminaryapplicantanswers { get; set; }
    public virtual DbSet<preliminaryvideomaster> preliminaryvideomaster { get; set; }
    public virtual DbSet<primaryfieldmaster> primaryfieldmaster { get; set; }
    public virtual DbSet<profilemaster> profilemaster { get; set; }
    public virtual DbSet<qualificationcountriesmapping> qualificationcountriesmapping { get; set; }
    public virtual DbSet<qualificationmaster> qualificationmaster { get; set; }
    public virtual DbSet<question_master> question_master { get; set; }
    public virtual DbSet<realtionshipmaster> realtionshipmaster { get; set; }
    public virtual DbSet<registrationcourses> registrationcourses { get; set; }
    public virtual DbSet<relative_master> relative_master { get; set; }
    public virtual DbSet<rolemaster> rolemaster { get; set; }
    public virtual DbSet<secondarylanguagemaster> secondarylanguagemaster { get; set; }
    public virtual DbSet<studentcoursemapping> studentcoursemapping { get; set; }
    public virtual DbSet<students> students { get; set; }
    public virtual DbSet<studylevelmaster> studylevelmaster { get; set; }
    public virtual DbSet<studymodemaster> studymodemaster { get; set; }
    public virtual DbSet<subjectmaster> subjectmaster { get; set; }
    public virtual DbSet<subjectwisecountrymapping> subjectwisecountrymapping { get; set; }
    public virtual DbSet<timezonemaster> timezonemaster { get; set; }
    public virtual DbSet<titlemaster> titlemaster { get; set; }
    public virtual DbSet<tooltipmaster> tooltipmaster { get; set; }
    public virtual DbSet<typemaster> typemaster { get; set; }
    public virtual DbSet<university_campusmapping> university_campusmapping { get; set; }
    public virtual DbSet<university_master> university_master { get; set; }
    public virtual DbSet<universitycampus> universitycampus { get; set; }
    public virtual DbSet<universitywisefieldmapping> universitywisefieldmapping { get; set; }
    public virtual DbSet<universitywiseformmapping> universitywiseformmapping { get; set; }
    public virtual DbSet<universitywisemastermapping> universitywisemastermapping { get; set; }
    public virtual DbSet<GTE_documentverification> GTE_documentverification { get; set; }
    public virtual DbSet<facility_campus_mapping> facility_campus_mapping { get; set; }
    public virtual DbSet<maritalstatusmaster> maritalstatusmaster { get; set; }

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
