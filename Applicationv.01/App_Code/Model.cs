﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class adminusers
{
    public int adminid { get; set; }
    public int roleid { get; set; }
    public string username { get; set; }
    public string password { get; set; }
    public string name { get; set; }
    public string email { get; set; }
    public string mobile { get; set; }
    public int status { get; set; }
    public System.DateTime creationdate { get; set; }

    public virtual rolemaster rolemaster { get; set; }
}

public partial class agentmaster
{
    public int agentid { get; set; }
    public string agentname { get; set; }
    public string email { get; set; }
    public string mobile { get; set; }
    public Nullable<int> isactive { get; set; }
}

public partial class alternateadressproofmaster
{
    public int id { get; set; }
    public string description { get; set; }
}

public partial class alternatedobproof
{
    public int id { get; set; }
    public string description { get; set; }
}

public partial class alternateidproofmaster
{
    public int id { get; set; }
    public string description { get; set; }
}

public partial class answer_mastersecondarylanguage
{
    public int secondaryanswerid { get; set; }
    public Nullable<int> answerid { get; set; }
    public string secondaryfieldnamelanguage { get; set; }
    public string secondaryfieldnamevalue { get; set; }
}

public partial class answermaster
{
    public int answerid { get; set; }
    public string answerdescription { get; set; }
    public Nullable<int> gteqscore { get; set; }
    public Nullable<int> riskqscore { get; set; }
}

public partial class answeroptionssecondary
{
    public int answeroptionid { get; set; }
    public Nullable<int> optionid { get; set; }
    public string secondaryfieldnamelanguage { get; set; }
    public string secondaryfieldnamevalue { get; set; }
}

public partial class applcantdetailfieldvalidationmaster
{
    public int id { get; set; }
    public string keyname { get; set; }
}

public partial class applicant_education
{
    public long applicationeduId { get; set; }
    public Nullable<long> applicantid { get; set; }
    public Nullable<int> courseid { get; set; }
    public string board_universityname { get; set; }
    public string Institute { get; set; }
    public string percentage { get; set; }
    public Nullable<System.DateTime> course_startdate { get; set; }
    public Nullable<System.DateTime> course_enddate { get; set; }
    public string repeats_backlog { get; set; }
    public string othercourse_name { get; set; }
}

public partial class applicantdatavalidation
{
    public long id { get; set; }
    public Nullable<int> keyid { get; set; }
    public Nullable<int> isvalid { get; set; }
    public string proofofvalidation { get; set; }
    public Nullable<System.DateTime> lastvalidatedtime { get; set; }
    public Nullable<int> agentid { get; set; }
    public Nullable<int> applicantid { get; set; }
    public string remarks { get; set; }
}

public partial class applicantdetails
{
    public int applicantpersonaldetailsid { get; set; }
    public Nullable<int> applicantid { get; set; }
    public Nullable<int> universityid { get; set; }
    public Nullable<int> title { get; set; }
    public string firstname { get; set; }
    public string lastname { get; set; }
    public string prefferedname { get; set; }
    public string middlename { get; set; }
    public Nullable<System.DateTime> dateofbirth { get; set; }
    public Nullable<int> gender { get; set; }
    public Nullable<int> nationality { get; set; }
    public Nullable<int> countryofbirth { get; set; }
    public Nullable<int> maritalstatus { get; set; }
    public Nullable<int> isdisable { get; set; }
    public string disabilitydescription { get; set; }
    public string postaladdrees1 { get; set; }
    public string postaladdrees2 { get; set; }
    public string postaladdrees3 { get; set; }
    public string postalcity { get; set; }
    public string postalstate { get; set; }
    public Nullable<int> postalcountry { get; set; }
    public string postalpostcode { get; set; }
    public string residentailpostcode { get; set; }
    public string residentialaddress1 { get; set; }
    public string residentialaddress2 { get; set; }
    public string residentialaddress3 { get; set; }
    public string residentialcity { get; set; }
    public string residentialstate { get; set; }
    public Nullable<int> residentialcountry { get; set; }
    public string mobileno { get; set; }
    public string homephone { get; set; }
    public string workphone { get; set; }
    public string email { get; set; }
    public string skypeid { get; set; }
    public Nullable<int> haveskypeid { get; set; }
    public string whatsappno { get; set; }
    public Nullable<int> isdifferentwhatsapp { get; set; }
    public Nullable<int> issameaspostal { get; set; }
    public string nomineefullname { get; set; }
    public string relationshipwithnominee { get; set; }
    public string nomineeemail { get; set; }
    public string nomineemobile { get; set; }
    public string passportno { get; set; }
    public Nullable<System.DateTime> passportissuedate { get; set; }
    public Nullable<System.DateTime> passportexpirydate { get; set; }
    public Nullable<int> alternativeIdentityproofId { get; set; }
    public string passportissuecity { get; set; }
    public string alternativeIdentityproofno { get; set; }
    public Nullable<int> alternativeproofdobId { get; set; }
    public string alternativeproofdobno { get; set; }
    public Nullable<int> alternativeresidenceproofId { get; set; }
    public string alternativeresidenceproofno { get; set; }
    public string linkedprofile { get; set; }
    public string facebookprofle { get; set; }
    public string twiterprofile { get; set; }
    public string othertitle { get; set; }
    public Nullable<System.DateTime> personaldetailsavedtime { get; set; }
    public Nullable<System.DateTime> contactdetailsavetime { get; set; }
    public Nullable<System.DateTime> identificationsavetime { get; set; }
    public Nullable<System.DateTime> socialprofilesavetime { get; set; }
    public string passportissuecountry { get; set; }
    public Nullable<int> havewhatsup { get; set; }
    public Nullable<int> agentid { get; set; }
    public Nullable<int> isstudentreferbyagent { get; set; }
}

public partial class applicantdocumentmaster
{
    public int documentid { get; set; }
    public Nullable<int> applicantid { get; set; }
    public string documentname { get; set; }
    public string filename { get; set; }
    public Nullable<System.DateTime> uploadedtime { get; set; }
    public string fileextension { get; set; }
}

public partial class applicanteducationdetails
{
    public int applicantdeducationdetailsid { get; set; }
    public Nullable<int> applicantid { get; set; }
    public Nullable<int> ishighschooldone { get; set; }
    public Nullable<int> highschoolcountry { get; set; }
    public string highschoolstartdate { get; set; }
    public string highschoolendate { get; set; }
    public string highschoolname { get; set; }
    public Nullable<int> highschoolqualificationtype { get; set; }
    public Nullable<int> highschoolmodeid { get; set; }
    public Nullable<int> highschoolmediumid { get; set; }
    public Nullable<int> highschoolgradetypeid { get; set; }
    public Nullable<int> highschoolgradedeclared { get; set; }
    public Nullable<System.DateTime> highschoolreusltdate { get; set; }
    public string highschoolverificationname { get; set; }
    public Nullable<int> highschoolverificationrelationship { get; set; }
    public string highschoolverificationemail { get; set; }
    public string highschoolverificationmobile { get; set; }
    public string highestdegree { get; set; }
    public Nullable<int> issecondarydone { get; set; }
    public Nullable<int> secondarycountry { get; set; }
    public string secondarystartdate { get; set; }
    public string secondaryendate { get; set; }
    public string secondaryname { get; set; }
    public Nullable<int> secondaryqualificationtype { get; set; }
    public Nullable<int> secondarymodestudy { get; set; }
    public Nullable<int> secondarymediumstudy { get; set; }
    public Nullable<int> secondarygradetypeid { get; set; }
    public Nullable<int> secondarygradedeclared { get; set; }
    public Nullable<System.DateTime> secondaryresultdate { get; set; }
    public string secondaryverificationname { get; set; }
    public Nullable<int> secondaryverificationrelationship { get; set; }
    public string secondaryverificationemail { get; set; }
    public string secondaryverificationmobile { get; set; }
    public Nullable<int> isdiplomadone { get; set; }
    public Nullable<int> diplomacountry { get; set; }
    public string diplomastartdate { get; set; }
    public string diplomaendate { get; set; }
    public string diplomaschoolname { get; set; }
    public Nullable<int> diplomaqualificationtype { get; set; }
    public Nullable<int> diplomastudymodeid { get; set; }
    public Nullable<int> diplomamediumid { get; set; }
    public Nullable<int> diplomagradetypeid { get; set; }
    public Nullable<int> diplomagradeachieved { get; set; }
    public Nullable<System.DateTime> diplomaresultdate { get; set; }
    public string diplomaverificationname { get; set; }
    public Nullable<int> diplomaverificationrelationship { get; set; }
    public string diplomaverificationemail { get; set; }
    public string diplomaverificationmobile { get; set; }
    public Nullable<int> ishighereducation { get; set; }
    public Nullable<System.DateTime> lastsavetime { get; set; }
}

public partial class applicantemployerdetails
{
    public long employerid { get; set; }
    public string designation { get; set; }
    public string organization { get; set; }
    public string website { get; set; }
    public string city { get; set; }
    public Nullable<int> country { get; set; }
    public string contactpersonwithdetails { get; set; }
    public Nullable<float> salary { get; set; }
    public Nullable<System.DateTime> durationfrom { get; set; }
    public Nullable<System.DateTime> durationto { get; set; }
    public Nullable<int> applicantid { get; set; }
    public Nullable<System.DateTime> creationdate { get; set; }
    public Nullable<int> wishtoaddemployer { get; set; }
    public string briefdescription { get; set; }
    public string nameofreportingmanger { get; set; }
    public string relationshipwithcontact { get; set; }
    public string emailid { get; set; }
    public string linkedinidofcontact { get; set; }
    public Nullable<System.DateTime> lastsavedtime { get; set; }
}

public partial class applicantformmaster
{
    public int id { get; set; }
    public Nullable<int> formname { get; set; }
    public Nullable<int> primaryfieldid { get; set; }
    public string secondaryfieldnamelanguage { get; set; }
    public string secondaryfielddnamevalue { get; set; }
    public string fieldnameinstructions { get; set; }
    public string secondaryfieldnameinstructions { get; set; }
}

public partial class applicanthighereducation
{
    public int applicanthighereducationid { get; set; }
    public Nullable<int> applicantid { get; set; }
    public string coursename { get; set; }
    public string countryofhighereducation { get; set; }
    public string startdate { get; set; }
    public string endate { get; set; }
    public string schoolname { get; set; }
    public string qualificationtype { get; set; }
    public Nullable<int> studymodeid { get; set; }
    public Nullable<int> studymediumid { get; set; }
    public Nullable<int> gradetypeid { get; set; }
    public Nullable<int> finalgradeacheived { get; set; }
    public Nullable<System.DateTime> resultdate { get; set; }
    public string verificationname { get; set; }
    public Nullable<int> relationshipwithverification { get; set; }
    public string verificationemail { get; set; }
    public string verificationmobile { get; set; }
}

public partial class applicantlanguagecompetency
{
    public int applicantlanguagecompetencyid { get; set; }
    public Nullable<int> applicantid { get; set; }
    public string homelanuage { get; set; }
    public Nullable<int> isenglishintesive { get; set; }
    public string countryofcourse { get; set; }
    public Nullable<System.DateTime> yearofcompletion { get; set; }
    public string instituename { get; set; }
    public Nullable<int> studymode { get; set; }
    public Nullable<int> qualificationtype { get; set; }
    public string qualificationname { get; set; }
    public string gradetype { get; set; }
    public Nullable<int> giveenglishtest { get; set; }
    public string testname { get; set; }
    public string centerno { get; set; }
    public Nullable<int> isfinalgradeachieved { get; set; }
    public Nullable<System.DateTime> expectedgraderesult { get; set; }
    public string candidateno { get; set; }
    public string candidateid { get; set; }
    public Nullable<System.DateTime> examdate { get; set; }
    public string overallscore { get; set; }
    public string speakingscore { get; set; }
    public string listeningscore { get; set; }
    public string readingscore { get; set; }
    public string writingscore { get; set; }
    public string cefrlevel { get; set; }
    public string testreportreferenceno { get; set; }
    public Nullable<System.DateTime> lastsavedtime { get; set; }
}

public partial class applicantprogressbar
{
    public int id { get; set; }
    public Nullable<int> applicantid { get; set; }
    public Nullable<int> profile { get; set; }
    public Nullable<int> question { get; set; }
    public Nullable<int> video { get; set; }
    public Nullable<int> documents { get; set; }
}

public partial class applicantreferencecheck
{
    public int id { get; set; }
    public Nullable<int> applicantid { get; set; }
    public string name { get; set; }
    public string email { get; set; }
    public string mobile { get; set; }
    public Nullable<int> isverified { get; set; }
    public string referncekey { get; set; }
    public Nullable<System.DateTime> requestsenttime { get; set; }
    public Nullable<System.DateTime> referenceverifiedtime { get; set; }
}

public partial class applicantscores
{
    public long id { get; set; }
    public Nullable<int> applicantid { get; set; }
    public Nullable<int> answerid { get; set; }
    public Nullable<int> answervalue { get; set; }
    public Nullable<int> timetakentoanswervalue { get; set; }
    public Nullable<int> universityid { get; set; }
}

public partial class applicantsubjectwisegrade
{
    public int applicantgradeid { get; set; }
    public string coursename { get; set; }
    public Nullable<int> applicantid { get; set; }
    public Nullable<int> gradeid { get; set; }
    public string othersubject { get; set; }
    public string grade { get; set; }
    public Nullable<int> subjectid { get; set; }
}

public partial class applicantuniversitymapping
{
    public int mappingid { get; set; }
    public Nullable<int> applicantid { get; set; }
    public Nullable<int> universityid { get; set; }
}

public partial class applicantvideomaster
{
    public int id { get; set; }
    public Nullable<int> applicantid { get; set; }
    public string videofilename { get; set; }
    public Nullable<System.DateTime> uploadedtime { get; set; }
}

public partial class applicantvisadetails
{
    public int applicantvisadetailsid { get; set; }
    public Nullable<int> applicantid { get; set; }
    public Nullable<int> hasvisa { get; set; }
    public string applicantvisatype { get; set; }
    public Nullable<System.DateTime> validityfrom { get; set; }
    public Nullable<System.DateTime> validityto { get; set; }
    public string visano { get; set; }
    public Nullable<int> visaapplied { get; set; }
    public string city { get; set; }
    public string country { get; set; }
    public Nullable<System.DateTime> firstvisit { get; set; }
    public Nullable<int> havelivedearlier { get; set; }
    public Nullable<int> haveparent { get; set; }
    public Nullable<int> isvisadenied { get; set; }
    public Nullable<int> isparentvisadenied { get; set; }
}

public partial class cefrlevelmaster
{
    public int id { get; set; }
    public string name { get; set; }
}

public partial class citymaster
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public citymaster()
    {
        this.university_master = new HashSet<university_master>();
    }

    public int city_id { get; set; }
    public string description { get; set; }
    public decimal cost_of_living { get; set; }
    public string around { get; set; }
    public string weather { get; set; }
    public string geting_there { get; set; }
    public string name { get; set; }
    public int country_id { get; set; }

    public virtual countriesmaster countriesmaster { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<university_master> university_master { get; set; }
}

public partial class controlmaster
{
    public int id { get; set; }
    public string controltype { get; set; }
}

public partial class countriesmaster
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public countriesmaster()
    {
        this.citymaster = new HashSet<citymaster>();
        this.qualificationcountriesmapping = new HashSet<qualificationcountriesmapping>();
    }

    public int id { get; set; }
    public string country_code { get; set; }
    public string country_name { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<citymaster> citymaster { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<qualificationcountriesmapping> qualificationcountriesmapping { get; set; }
}

public partial class coursemaster
{
    public int courseid { get; set; }
    public string coursename { get; set; }
    public Nullable<int> coursetypeid { get; set; }
}

public partial class coursetypemaster
{
    public int coursetypeid { get; set; }
    public string coursetypename { get; set; }
}

public partial class credentialmaster
{
    public int id { get; set; }
    public string description { get; set; }
    public string overall_rank_type1 { get; set; }
    public string overall_rank_type2 { get; set; }
    public string overall_rank_type3 { get; set; }
    public string awards { get; set; }
    public string ranking_by_subject { get; set; }
    public string ranking_by_region { get; set; }
    public bool rank_improved { get; set; }
}

public partial class disabilitymaster
{
    public int id { get; set; }
    public string description { get; set; }
}

public partial class documentvalidationbyagent
{
    public int documentvalidationid { get; set; }
    public Nullable<int> documentid { get; set; }
    public Nullable<int> agentid { get; set; }
    public Nullable<System.DateTime> lastupdatedate { get; set; }
    public string remarks { get; set; }
}

public partial class educationmediummaster
{
    public int id { get; set; }
    public string description { get; set; }
}

public partial class educationverificationcontactmaster
{
    public int id { get; set; }
    public string description { get; set; }
}

public partial class facilitiesmaster
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public facilitiesmaster()
    {
        this.universitycampus = new HashSet<universitycampus>();
    }

    public int id { get; set; }
    public string facility_name { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<universitycampus> universitycampus { get; set; }
}

public partial class fieldvalidationmaster
{
    public int fieldvalidationid { get; set; }
    public Nullable<int> formfieldid { get; set; }
    public string regularexpression { get; set; }
}

public partial class formfieldmapping
{
    public int id { get; set; }
    public Nullable<int> formfieldid { get; set; }
    public Nullable<int> formid { get; set; }
    public Nullable<int> universityid { get; set; }
    public Nullable<int> displayorder { get; set; }
}

public partial class formfieldmaster
{
    public int formfieldid { get; set; }
    public string name { get; set; }
    public string type { get; set; }
    public string tooltips { get; set; }
    public Nullable<int> isvalidation { get; set; }
    public Nullable<bool> isdepedent { get; set; }
    public Nullable<int> depedentformfieldid { get; set; }
    public string depedentformfieldvalue { get; set; }
}

public partial class formmaster
{
    public int formid { get; set; }
    public string formname { get; set; }
}

public partial class grademaster
{
    public int id { get; set; }
    public string description { get; set; }
}

public partial class inferencemaster
{
    public int inferenceid { get; set; }
    public string description { get; set; }
}

public partial class invalidatamaster
{
    public int id { get; set; }
    public string emailaddress { get; set; }
    public string name { get; set; }
    public string passportno { get; set; }
    public Nullable<System.DateTime> creationtime { get; set; }
    public Nullable<int> isfollowupdone { get; set; }
    public Nullable<int> status { get; set; }
}

public partial class majordiscipline_master
{
    public int id { get; set; }
    public string description { get; set; }
}

public partial class master_name
{
    public int masterid { get; set; }
    public string mastername { get; set; }
}

public partial class preliminary_questionmaster
{
    public long preliminaryid { get; set; }
    public string question { get; set; }
    public string answer1 { get; set; }
    public string answer2 { get; set; }
    public string answer3 { get; set; }
    public string answer4 { get; set; }
    public Nullable<int> status { get; set; }
    public string correctanswer { get; set; }
    public Nullable<int> universityid { get; set; }
}

public partial class preliminaryapplicantanswers
{
    public long preliminaryapplicantanswersid { get; set; }
    public Nullable<int> applicantid { get; set; }
    public Nullable<int> preliminaryid { get; set; }
    public string answer { get; set; }
    public Nullable<System.DateTime> answersubmittedtime { get; set; }
}

public partial class preliminaryvideomaster
{
    public int id { get; set; }
    public string videourl { get; set; }
    public string description { get; set; }
    public Nullable<int> status { get; set; }
    public Nullable<int> universityid { get; set; }
}

public partial class primaryfieldmaster
{
    public int primaryfieldid { get; set; }
    public Nullable<int> formid { get; set; }
    public string primaryfiledname { get; set; }
}

public partial class profilemaster
{
    public int id { get; set; }
    public Nullable<int> applicantid { get; set; }
    public Nullable<int> basicinfo { get; set; }
    public Nullable<int> educationinfo { get; set; }
    public Nullable<int> employerinfo { get; set; }
    public Nullable<int> finacialinfo { get; set; }
    public Nullable<int> englishtest { get; set; }
    public Nullable<int> sponsorsdetails { get; set; }
}

public partial class qualificationcountriesmapping
{
    public int id { get; set; }
    public int qualificationid { get; set; }
    public int countryid { get; set; }

    public virtual countriesmaster countriesmaster { get; set; }
    public virtual qualificationmaster qualificationmaster { get; set; }
}

public partial class qualificationmaster
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public qualificationmaster()
    {
        this.qualificationcountriesmapping = new HashSet<qualificationcountriesmapping>();
    }

    public int qualificationid { get; set; }
    public string qualificationname { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<qualificationcountriesmapping> qualificationcountriesmapping { get; set; }
}

public partial class question_master
{
    public int questionid { get; set; }
    public string description { get; set; }
    public Nullable<int> isprimary { get; set; }
    public Nullable<int> infrencecategoryid { get; set; }
}

public partial class registrationcourses
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public registrationcourses()
    {
        this.studentcoursemapping = new HashSet<studentcoursemapping>();
    }

    public int courseid { get; set; }
    public string coursename { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<studentcoursemapping> studentcoursemapping { get; set; }
}

public partial class relative_master
{
    public long id { get; set; }
    public Nullable<long> applicantid { get; set; }
    public string name { get; set; }
    public Nullable<int> age { get; set; }
    public string relationship { get; set; }
    public string city { get; set; }
    public string country { get; set; }
    public Nullable<int> isinautralia { get; set; }
    public Nullable<int> isdependent { get; set; }
    public string firstName { get; set; }
    public string passport_no { get; set; }
    public string nationality { get; set; }
    public Nullable<System.DateTime> dob { get; set; }
}

public partial class rolemaster
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public rolemaster()
    {
        this.adminusers = new HashSet<adminusers>();
    }

    public int roleid { get; set; }
    public string rolename { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<adminusers> adminusers { get; set; }
}

public partial class secondarylanguagemaster
{
    public int id { get; set; }
    public string languagecode { get; set; }
    public string secondarylanguagename { get; set; }
}

public partial class studentcoursemapping
{
    public int id { get; set; }
    public int studentid { get; set; }
    public int courseid { get; set; }

    public virtual registrationcourses registrationcourses { get; set; }
    public virtual students students { get; set; }
}

public partial class students
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public students()
    {
        this.studentcoursemapping = new HashSet<studentcoursemapping>();
    }

    public int studentid { get; set; }
    public string username { get; set; }
    public string password { get; set; }
    public string name { get; set; }
    public string email { get; set; }
    public int enrollmentyear { get; set; }
    public int studylevelid { get; set; }
    public int status { get; set; }
    public System.DateTime creationdate { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<studentcoursemapping> studentcoursemapping { get; set; }
    public virtual studylevelmaster studylevelmaster { get; set; }
}

public partial class studylevelmaster
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public studylevelmaster()
    {
        this.students = new HashSet<students>();
    }

    public int studylevelid { get; set; }
    public string studylevel { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<students> students { get; set; }
}

public partial class studymodemaster
{
    public int id { get; set; }
    public string description { get; set; }
}

public partial class subjectmaster
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public subjectmaster()
    {
        this.subjectwisecountrymapping = new HashSet<subjectwisecountrymapping>();
    }

    public int id { get; set; }
    public string description { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<subjectwisecountrymapping> subjectwisecountrymapping { get; set; }
}

public partial class subjectwisecountrymapping
{
    public int id { get; set; }
    public int subjectid { get; set; }
    public int countryid { get; set; }

    public virtual subjectmaster subjectmaster { get; set; }
}

public partial class titlemaster
{
    public int titleid { get; set; }
    public string titlename { get; set; }
}

public partial class tooltipmaster
{
    public int id { get; set; }
    public string field { get; set; }
    public string tooltips { get; set; }
}

public partial class typemaster
{
    public int typemasterid { get; set; }
    public Nullable<int> typeid { get; set; }
    public string value { get; set; }
    public Nullable<int> formfieldid { get; set; }
}

public partial class university_campusmapping
{
    public int universitylocationid { get; set; }
    public Nullable<int> campusid { get; set; }
    public string cityname { get; set; }
    public Nullable<int> countryid { get; set; }
}

public partial class university_master
{
    public int universityid { get; set; }
    public string university_name { get; set; }
    public string address { get; set; }
    public string website { get; set; }
    public string contact_person { get; set; }
    public string email { get; set; }
    public string mobile { get; set; }
    public string affiliation { get; set; }
    public string type { get; set; }
    public string year_established { get; set; }
    public string short_description { get; set; }
    public string long_description { get; set; }
    public Nullable<int> cityid { get; set; }
    public Nullable<int> countryid { get; set; }
    public Nullable<decimal> latitude { get; set; }
    public Nullable<decimal> longitude { get; set; }
    public string time_zone { get; set; }
    public string closest_airport { get; set; }
    public string distance_from_airport { get; set; }
    public string distance_from_railway { get; set; }
    public string getting_around { get; set; }

    public virtual citymaster citymaster { get; set; }
}

public partial class universitycampus
{
    public int campusid { get; set; }
    public string campusname { get; set; }
    public Nullable<int> universityid { get; set; }
    public string description { get; set; }
    public string facilities { get; set; }
    public string research { get; set; }
    public string faculty_description { get; set; }
    public Nullable<int> facility_id { get; set; }

    public virtual facilitiesmaster facilitiesmaster { get; set; }
}

public partial class universitywisefieldmapping
{
    public int universitywisefieldmappingid { get; set; }
    public Nullable<int> universityid { get; set; }
    public Nullable<int> primaryfieldid { get; set; }
    public Nullable<int> formid { get; set; }
}

public partial class universitywiseformmapping
{
    public int universitywiseformmappingid { get; set; }
    public Nullable<int> universityid { get; set; }
    public Nullable<int> formid { get; set; }
}

public partial class universitywisemastermapping
{
    public int universitywisemastermappingid { get; set; }
    public Nullable<int> universityid { get; set; }
    public Nullable<int> masterid { get; set; }
    public Nullable<int> mastervalueid { get; set; }
    public Nullable<int> created_by { get; set; }
    public Nullable<System.DateTime> created_at { get; set; }
}
