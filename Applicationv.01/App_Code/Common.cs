using System;
using System.Configuration;
using System.IO;
using System.Net.Mail;
using System.Linq;
using System.Collections;
using System.Collections.Generic;
using System.Security.Cryptography;
using System.Text;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
public class Common
{
    Logger log = new Logger();
    private GTEEntities db = new GTEEntities();
    public string EncodePasswordToBase64(string password)
    {
        try
        {
            byte[] encData_byte = new byte[password.Length];
            encData_byte = System.Text.Encoding.UTF8.GetBytes(password);
            string encodedData = Convert.ToBase64String(encData_byte);
            return encodedData;
        }
        catch (Exception ex)
        {
            throw new Exception("Error in base64Encode" + ex.Message);
        }
    } //this function Convert to Decord your Password
    public string DecodeFrom64(string encodedData)
    {
        System.Text.UTF8Encoding encoder = new System.Text.UTF8Encoding();
        System.Text.Decoder utf8Decode = encoder.GetDecoder();
        byte[] todecode_byte = Convert.FromBase64String(encodedData);
        int charCount = utf8Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
        char[] decoded_char = new char[charCount];
        utf8Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
        string result = new String(decoded_char);
        return result;
    }

    public string EncodePasswordToMD5(string password)
    {
        string hash = "";
        using (MD5 md5Hash = MD5.Create())
        {
            hash = GetMd5Hash(md5Hash, password);
        }
        return hash.ToString();
    }
    static string GetMd5Hash(MD5 md5Hash, string input)
    {
        // Convert the input string to a byte array and compute the hash.
        byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

        // Create a new Stringbuilder to collect the bytes
        // and create a string.
        StringBuilder sBuilder = new StringBuilder();

        // Loop through each byte of the hashed data 
        // and format each one as a hexadecimal string.
        for (int i = 0; i < data.Length; i++)
        {
            sBuilder.Append(data[i].ToString("x2"));
        }

        // Return the hexadecimal string.
        return sBuilder.ToString();
    }

    public int GetUniversityservice(int universityid)
    {
        int Service = -1;
        try
        {
            var GetService = db.university_master.Where(x => x.universityid == universityid).FirstOrDefault();
            if (GetService != null)
                Service = GetService.full_service;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return Service;
    }

    public void SendMail(string EmailId, string body, string subject)
    {
        try
        {
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient(ConfigurationManager.AppSettings["Smtp"]);

            string address = string.Empty;
            int uniid = Utility.GetUniversityId();
            int service = GetUniversityservice(uniid);

            if (service == 0)
                address = "support@studecare.com";
            else if (service == 1)
                address = "support@gte.direct";
            else if (service == 2)
                address = "support@testyt.com";
            else
                address = ConfigurationManager.AppSettings["FromMail"];

            mail.From = new MailAddress(address, "Application Center Admin");
            //  mail.To.Add(ConfigurationManager.AppSettings["ToMail"]);
            mail.To.Add(EmailId);
            // MailAddress copy = new MailAddress(ConfigurationManager.AppSettings["FromMail"]);
            //string[] bccid = ConfigurationManager.AppSettings["ToMail"].Split(',');
            //foreach (string bccEmailId in bccid)
            //{
            //   // mail.Bcc.Add(new MailAddress(bccEmailId)); //Adding Multiple BCC email Id
            //}
            mail.Subject = subject;
            mail.Body = body;
            mail.IsBodyHtml = true;
            // Attachment data = new Attachment(Path);
            // your path may look like Server.MapPath("~/file.ABC")
            // mail.Attachments.Add(data);
            SmtpServer.Port = Convert.ToInt32(ConfigurationManager.AppSettings["Port"]);
            SmtpServer.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["UserName"], ConfigurationManager.AppSettings["Password"]);
            SmtpServer.EnableSsl = true;
            SmtpServer.Send(mail);
            //  Console.WriteLine(EmailId + " , Mail Send Successfully!");
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
            // Console.WriteLine(EmailId + " , Mail did not Send!");
            //  Console.WriteLine(ex.Message);
            //  Console.ReadLine();
        }
    }
    public string GetTitle(int id)
    {
        string title = "";
        try
        {
            var GetTitle = db.titlemaster.Where(x => x.titleid == id).FirstOrDefault();
        if (GetTitle != null)
            title = GetTitle.titlename;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return title;
    }
    public bool? is_review(int applicantid, int universityid)
    {       
        var data = db.applicantdetails.Where(x => x.applicantid == applicantid && x.universityid == universityid).Select(x=>x.is_review).FirstOrDefault();
        return data;
    }
    public int getclassid(string classname)
    {
        int classid= 0;
        try
        {
            var Getclassid = db.class_master.Where(x => x.description.Trim().ToLower() == classname.ToLower()).FirstOrDefault();
            if (Getclassid != null)
                classid = Getclassid.id;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return classid;
    }
    public int getgroupid(string groupname)
    {
        int groupid = 0;
        try
        {
            var Getgroupid = db.group_master.Where(x => x.description.Trim().ToLower() == groupname.Trim().ToLower()).FirstOrDefault();
            if (Getgroupid != null)
                groupid = Getgroupid.id;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return groupid;
    }
    public string GetCourseName(int id)
    {
        string CourseName = "";
        try
        {
            var GetCourse = db.coursemaster.Where(x => x.courseid == id).FirstOrDefault();
            if (GetCourse != null)
                CourseName = GetCourse.coursename;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return CourseName;
    }
    
    public string Get_AgentName(int id)
    {
        string agentName = "";
        try
        {
            var GetTitle = db.agentmaster.Where(x => x.agentid == id).FirstOrDefault();
            if (GetTitle != null)
                agentName = GetTitle.agentname;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return agentName;
    }
    public string GetAgentName(int id)
    {
        string agentName = "";
        try
        {
            var GetTitle = db.adminusers.Where(x => x.adminid == id).FirstOrDefault();
        if (GetTitle != null)
            agentName = GetTitle.name;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return agentName;
    }
    public string GetIdentityProof(int id)
    {
        string proofname = "";
        try
        {
            var GetProof = db.alternateidproofmaster.Where(x => x.id == id).FirstOrDefault();
        if (GetProof != null)
            proofname = GetProof.description;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return proofname;
    }
    public string GetAddressProof(int id)
    {
        string proofname = "";
        try
        {
            var GetProof = db.alternateadressproofmaster.Where(x => x.id == id).FirstOrDefault();
            if (GetProof != null)
                proofname = GetProof.description;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return proofname;
    }
    public string GetApplicantFirstName(int applicantid)
    {
        string firstname = "";
        try
        {
            var data = db.applicantdetails.Where(x => x.applicantid == applicantid).FirstOrDefault();
            if (data != null)
                firstname = data.firstname;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return firstname;
    }
    public string GetApplicantLastName(int applicantid)
    {
        string lastname = "";
        try
        {
            var data = db.applicantdetails.Where(x => x.applicantid == applicantid).FirstOrDefault();
            if (data != null)
                lastname = data.lastname;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return lastname;
    }
    public string GetDOBProof(int id)
    {
        string proofname = "";
        try
        {
            var GetProof = db.alternatedobproof.Where(x => x.id == id).FirstOrDefault();
        if (GetProof != null)
            proofname = GetProof.description;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return proofname;
    }
    public string GetStudyMode(int id)
    {
        string studyMode = "";
        try
        {
            var StudyMode = db.studymodemaster.Where(x => x.id == id).FirstOrDefault();
        if (StudyMode != null)
            studyMode = StudyMode.description;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return studyMode;
    }
    public string GetStudyMedium(int id)
    {
        string studyMedium = "";
        try
        {
            var Medium = db.educationmediummaster.Where(x => x.id == id).FirstOrDefault();
        if (Medium != null)
            studyMedium = Medium.description;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return studyMedium;
    }
    public string GetGrade(int id)
    {
        string studygrade = "";
        try
        {
            var Grade = db.grademaster.Where(x => x.id == id).FirstOrDefault();
        if (Grade != null)
            studygrade = Grade.description;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return studygrade;
    }
    public string GetMaritalStatusDiscrition(int id)
    {
        string maritalstatus = "";
        try
        {
            var data = db.maritalstatusmaster.Where(x => x.id == id).FirstOrDefault();
            if (data != null)
                maritalstatus = data.description;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return maritalstatus;
    }

    public string GetMaritalStatus(int id)
    {
        string MaritalStatus = "";
        switch (id)
        {

            case 1:
                MaritalStatus = "Married";
                break;
            case 2:
                MaritalStatus = "Widowed";
                break;
            case 3:
                MaritalStatus = "Separated";
                break;
            case 4:
                MaritalStatus = "Divorced";
                break;
            case 5:
                MaritalStatus = "Single";
                break;
            default:
                MaritalStatus = "";
                break;
        }
        return MaritalStatus;
    }
    public string GetQualification(string code)
    {
        string Qualification = "";
        switch (code)
        {

            case "UG":
                Qualification = "Under Graduate";
                break;
            case "PG":
                Qualification = "Post Graduate";
                break;
            case "Phd":
                Qualification = "PhD";
                break;
            case "Other":
                Qualification = "Divorced";
                break;

            default:
                Qualification = "Other";
                break;
        }
        return Qualification;
    }
    public string GetDisability(int id)
    {
        string Disability = "";
        try
        {
            var GetDisability = db.disabilitymaster.Where(x => x.id == id).FirstOrDefault();
        if (GetDisability != null)
            Disability = GetDisability.description;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }

        return Disability;
    }
    public string GetUniversityName(int id)
    {
        string UniversityName = "";
        try
        {
            var GetUniversity = db.university_master.Where(x => x.universityid == id).FirstOrDefault();
            if (GetUniversity != null)
                UniversityName = GetUniversity.university_name;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }

        return UniversityName;
    }
    public string GetQualificationType(int id)
    {
        string QualificationType = "";
        try
        {
            var Qualification = db.qualificationmaster.Where(x => x.qualificationid == id).FirstOrDefault();
        if (Qualification != null)
            QualificationType = Qualification.qualificationname;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }

        return QualificationType;
    }
    public string GetVerificationRelation(int id)
    {
        string relationshipname = "";
        try
        {
            var Realtionships = db.realtionshipmaster.Where(x => x.relationshiptid == id).FirstOrDefault();
        if (Realtionships != null)
            relationshipname = Realtionships.relationshipname;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }

        return relationshipname;
    }
    public string GetCEFR(int id)
    {
        string CEFR = "";
        try
        {
            var GetCEFR = db.cefrlevelmaster.Where(x => x.id == id).FirstOrDefault();
        if (GetCEFR != null)
            CEFR = GetCEFR.name;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return CEFR;
    }
    public string GetVisaType(int id)
    {
        string VisaType = "";
        try
        {
            var GetVisa = db.visatype.Where(x => x.id == id).FirstOrDefault();
        if (GetVisa != null)
            VisaType = GetVisa.description;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return VisaType;
    }
    public string GetStudyOption(int id)
    {
        string StudyOption = "";
        try
        {
            var GetStudyOption = db.studyoptionmaster.Where(x => x.id == id).FirstOrDefault();
        if (GetStudyOption != null)
            StudyOption = GetStudyOption.description;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return StudyOption;
    }
    public string GetFamilyMember(int id)
    {
        string familyMember = "";
        try
        {
            var GetfamilyMember = db.familymember.Where(x => x.id == id).FirstOrDefault();
        if (GetfamilyMember != null)
            familyMember = GetfamilyMember.description;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return familyMember;
    }
    public string GetAccomdation(int id)
    {
        string Accomdation = "";
        try
        {
            var GetAccomdation = db.accommodationplan.Where(x => x.id == id).FirstOrDefault();
        if (GetAccomdation != null)
            Accomdation = GetAccomdation.description;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return Accomdation;
    }
    public string GetMeal(int id)
    {
        string Meal = "";
        try
        {
            var GetMeal = db.managemeal.Where(x => x.id == id).FirstOrDefault();
        if (GetMeal != null)
            Meal = GetMeal.description;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return Meal;
    }
    public string GetTransportChoice(int id)
    {
        string Transport = "";
        try
        {
            var GetTransport = db.transportchoice.Where(x => x.id == id).FirstOrDefault();
        if (GetTransport != null)
            Transport = GetTransport.description;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return Transport;
    }
    public string GetTrips(int id)
    {
        string Trips = "";
        try
        {
            var GetTrips = db.trips.Where(x => x.id == id).FirstOrDefault();
        if (GetTrips != null)
            Trips = GetTrips.description;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return Trips;
    }
    public string GetEntertainment(int id)
    {
        string Entertainment = "";
        try
        {
            var GetEntertainment = db.entertainment.Where(x => x.id == id).FirstOrDefault();
        if (GetEntertainment != null)
            Entertainment = GetEntertainment.description;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return Entertainment;
    }
    public string GetRealtionship(int id)
    {
        string RelationShip = "";
        try
        {
            var GetRelationShip = db.realtionshipmaster.Where(x => x.relationshiptid == id).FirstOrDefault();
            if (GetRelationShip != null)
                RelationShip = GetRelationShip.relationshipname;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return RelationShip;
    }
    public string GetCountryDiscription(string Code)
    {
        string country = "";
        switch (Code)
        {

            case "AF": country = "Afghanistan"; break;
            case "AL": country = "Albania"; break;
            case "DZ": country = "Algeria"; break;
            case "AS": country = "American Samoa"; break;
            case "AD": country = "Andorra"; break;
            case "AO": country = "Angola"; break;
            case "AI": country = "Anguilla"; break;
            case "AQ": country = "Antarctica"; break;
            case "AG": country = "Antigua And Barbuda"; break;
            case "AR": country = "Argentina"; break;
            case "AM": country = "Armenia"; break;
            case "AW": country = "Aruba"; break;
            case "AU": country = "Australia"; break;
            case "AT": country = "Austria"; break;
            case "AZ": country = "Azerbaijan"; break;
            case "BS": country = "Bahamas"; break;
            case "BH": country = "Bahrain"; break;
            case "BD": country = "Bangladesh"; break;
            case "BB": country = "Barbados"; break;
            case "BY": country = "Belarus"; break;
            case "BE": country = "Belgium"; break;
            case "BZ": country = "Belize"; break;
            case "BJ": country = "Benin"; break;
            case "BM": country = "Bermuda"; break;
            case "BT": country = "Bhutan"; break;
            case "BO": country = "Bolivia"; break;
            case "BA": country = "Bosnia And Herzegowina"; break;
            case "BW": country = "Botswana"; break;
            case "BV": country = "Bouvet Island"; break;
            case "BR": country = "Brazil"; break;
            case "IO": country = "British Indian Ocean Territory"; break;
            case "BN": country = "Brunei Darussalam"; break;
            case "BG": country = "Bulgaria"; break;
            case "BF": country = "Burkina Faso"; break;
            case "BI": country = "Burundi"; break;
            case "KH": country = "Cambodia"; break;
            case "CM": country = "Cameroon"; break;
            case "CA": country = "Canada"; break;
            case "CV": country = "Cape Verde"; break;
            case "KY": country = "Cayman Islands"; break;
            case "CF": country = "Central African Republic"; break;
            case "TD": country = "Chad"; break;
            case "CL": country = "Chile"; break;
            case "CN": country = "China"; break;
            case "CX": country = "Christmas Island"; break;
            case "CC": country = "Cocos (Keeling) Islands"; break;
            case "CO": country = "Colombia"; break;
            case "KM": country = "Comoros"; break;
            case "CG": country = "Congo"; break;
            case "CK": country = "Cook Islands"; break;
            case "CR": country = "Costa Rica"; break;
            case "CI": country = "Cote D'Ivoire"; break;
            case "HR": country = "Croatia (Local Name: Hrvatska)"; break;
            case "CU": country = "Cuba"; break;
            case "CY": country = "Cyprus"; break;
            case "CZ": country = "Czech Republic"; break;
            case "DK": country = "Denmark"; break;
            case "DJ": country = "Djibouti"; break;
            case "DM": country = "Dominica"; break;
            case "DO": country = "Dominican Republic"; break;
            case "TP": country = "East Timor"; break;
            case "EC": country = "Ecuador"; break;
            case "EG": country = "Egypt"; break;
            case "SV": country = "El Salvador"; break;
            case "GQ": country = "Equatorial Guinea"; break;
            case "ER": country = "Eritrea"; break;
            case "EE": country = "Estonia"; break;
            case "ET": country = "Ethiopia"; break;
            case "FK": country = "Falkland Islands (Malvinas)"; break;
            case "FO": country = "Faroe Islands"; break;
            case "FJ": country = "Fiji"; break;
            case "FI": country = "Finland"; break;
            case "FR": country = "France"; break;
            case "GF": country = "French Guiana"; break;
            case "PF": country = "French Polynesia"; break;
            case "TF": country = "French Southern Territories"; break;
            case "GA": country = "Gabon"; break;
            case "GM": country = "Gambia"; break;
            case "GE": country = "Georgia"; break;
            case "DE": country = "Germany"; break;
            case "GH": country = "Ghana"; break;
            case "GI": country = "Gibraltar"; break;
            case "GR": country = "Greece"; break;
            case "GL": country = "Greenland"; break;
            case "GD": country = "Grenada"; break;
            case "GP": country = "Guadeloupe"; break;
            case "GU": country = "Guam"; break;
            case "GT": country = "Guatemala"; break;
            case "GN": country = "Guinea"; break;
            case "GW": country = "Guinea-Bissau"; break;
            case "GY": country = "Guyana"; break;
            case "HT": country = "Haiti"; break;
            case "HM": country = "Heard And Mc Donald Islands"; break;
            case "VA": country = "Holy See (Vatican City State)"; break;
            case "HN": country = "Honduras"; break;
            case "HK": country = "Hong Kong"; break;
            case "HU": country = "Hungary"; break;
            case "IS": country = "Icel And"; break;
            case "IN": country = "India"; break;
            case "ID": country = "Indonesia"; break;
            case "IR": country = "Iran (Islamic Republic Of)"; break;
            case "IQ": country = "Iraq"; break;
            case "IE": country = "Ireland"; break;
            case "IL": country = "Israel"; break;
            case "IT": country = "Italy"; break;
            case "JM": country = "Jamaica"; break;
            case "JP": country = "Japan"; break;
            case "JO": country = "Jordan"; break;
            case "KZ": country = "Kazakhstan"; break;
            case "KE": country = "Kenya"; break;
            case "KI": country = "Kiribati"; break;
            case "KP": country = "Korea, Dem People'S Republic"; break;
            case "KR": country = "Korea, Republic Of"; break;
            case "KW": country = "Kuwait"; break;
            case "KG": country = "Kyrgyzstan"; break;
            case "LA": country = "Lao People'S Dem Republic"; break;
            case "LV": country = "Latvia"; break;
            case "LB": country = "Lebanon"; break;
            case "LS": country = "Lesotho"; break;
            case "LR": country = "Liberia"; break;
            case "LY": country = "Libyan Arab Jamahiriya"; break;
            case "LI": country = "Liechtenstein"; break;
            case "LT": country = "Lithuania"; break;
            case "LU": country = "Luxembourg"; break;
            case "MO": country = "Macau"; break;
            case "MK": country = "Macedonia"; break;
            case "MG": country = "Madagascar"; break;
            case "MW": country = "Malawi"; break;
            case "MY": country = "Malaysia"; break;
            case "MV": country = "Maldives"; break;
            case "ML": country = "Mali"; break;
            case "MT": country = "Malta"; break;
            case "MH": country = "Marshall Islands"; break;
            case "MQ": country = "Martinique"; break;
            case "MR": country = "Mauritania"; break;
            case "MU": country = "Mauritius"; break;
            case "YT": country = "Mayotte"; break;
            case "MX": country = "Mexico"; break;
            case "FM": country = "Micronesia, Federated States"; break;
            case "MD": country = "Moldova, Republic Of"; break;
            case "MC": country = "Monaco"; break;
            case "MN": country = "Mongolia"; break;
            case "MS": country = "Montserrat"; break;
            case "MA": country = "Morocco"; break;
            case "MZ": country = "Mozambique"; break;
            case "MM": country = "Myanmar"; break;
            case "NA": country = "Namibia"; break;
            case "NR": country = "Nauru"; break;
            case "NP": country = "Nepal"; break;
            case "NL": country = "Netherlands"; break;
            case "AN": country = "Netherlands Ant Illes"; break;
            case "NC": country = "New Caledonia"; break;
            case "NZ": country = "New Zealand"; break;
            case "NI": country = "Nicaragua"; break;
            case "NE": country = "Niger"; break;
            case "NG": country = "Nigeria"; break;
            case "NU": country = "Niue"; break;
            case "NF": country = "Norfolk Island"; break;
            case "MP": country = "Northern Mariana Islands"; break;
            case "NO": country = "Norway"; break;
            case "OM": country = "Oman"; break;
            case "PK": country = "Pakistan"; break;
            case "PW": country = "Palau"; break;
            case "PA": country = "Panama"; break;
            case "PG": country = "Papua New Guinea"; break;
            case "PY": country = "Paraguay"; break;
            case "PE": country = "Peru"; break;
            case "PH": country = "Philippines"; break;
            case "PN": country = "Pitcairn"; break;
            case "PL": country = "Poland"; break;
            case "PT": country = "Portugal"; break;
            case "PR": country = "Puerto Rico"; break;
            case "QA": country = "Qatar"; break;
            case "RE": country = "Reunion"; break;
            case "RO": country = "Romania"; break;
            case "RU": country = "Russian Federation"; break;
            case "RW": country = "Rwanda"; break;
            case "KN": country = "Saint K Itts And Nevis"; break;
            case "LC": country = "Saint Lucia"; break;
            case "VC": country = "Saint Vincent, The Grenadines"; break;
            case "WS": country = "Samoa"; break;
            case "SM": country = "San Marino"; break;
            case "ST": country = "Sao Tome And Principe"; break;
            case "SA": country = "Saudi Arabia"; break;
            case "SN": country = "Senegal"; break;
            case "SC": country = "Seychelles"; break;
            case "SL": country = "Sierra Leone"; break;
            case "SG": country = "Singapore"; break;
            case "SK": country = "Slovakia (Slovak Republic)"; break;
            case "SI": country = "Slovenia"; break;
            case "SB": country = "Solomon Islands"; break;
            case "SO": country = "Somalia"; break;
            case "ZA": country = "South Africa"; break;
            case "GS": country = "South Georgia , S Sandwich Is."; break;
            case "ES": country = "Spain"; break;
            case "LK": country = "Sri Lanka"; break;
            case "SH": country = "St. Helena"; break;
            case "PM": country = "St. Pierre And Miquelon"; break;
            case "SD": country = "Sudan"; break;
            case "SR": country = "Suriname"; break;
            case "SJ": country = "Svalbard, Jan Mayen Islands"; break;
            case "SZ": country = "Sw Aziland"; break;
            case "SE": country = "Sweden"; break;
            case "CH": country = "Switzerland"; break;
            case "SY": country = "Syrian Arab Republic"; break;
            case "TW": country = "Taiwan"; break;
            case "TJ": country = "Tajikistan"; break;
            case "TZ": country = "Tanzania, United Republic Of"; break;
            case "TH": country = "Thailand"; break;
            case "TG": country = "Togo"; break;
            case "TK": country = "Tokelau"; break;
            case "TO": country = "Tonga"; break;
            case "TT": country = "Trinidad And Tobago"; break;
            case "TN": country = "Tunisia"; break;
            case "TR": country = "Turkey"; break;
            case "TM": country = "Turkmenistan"; break;
            case "TC": country = "Turks And Caicos Islands"; break;
            case "TV": country = "Tuvalu"; break;
            case "UG": country = "Uganda"; break;
            case "UA": country = "Ukraine"; break;
            case "AE": country = "United Arab Emirates"; break;
            case "GB": country = "United Kingdom"; break;
            case "US": country = "United States"; break;
            case "UM": country = "United States Minor Is."; break;
            case "UY": country = "Uruguay"; break;
            case "UZ": country = "Uzbekistan"; break;
            case "VU": country = "Vanuatu"; break;
            case "VE": country = "Venezuela"; break;
            case "VN": country = "Viet Nam"; break;
            case "VG": country = "Virgin Islands (British)"; break;
            case "VI": country = "Virgin Islands (U.S.)"; break;
            case "WF": country = "Wallis And Futuna Islands"; break;
            case "EH": country = "Western Sahara"; break;
            case "YE": country = "Yemen"; break;
            case "ZR": country = "Zaire"; break;
            case "ZM": country = "Zambia"; break;
            case "ZW": country = "Zimbabwe"; break;
            case "YU": country = "Yugoslavia"; break;
            default:
                country = "";
                break;
        }
        return country;
    }
    public string GetCountryDiscription(int countryid)
    {
        string country = "";
        try
        {
            var Country = db.countriesmaster.Where(x => x.id == countryid).FirstOrDefault();
            if (Country != null)
                country = Country.country_name;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return country;
    }

    public string GetCityName(int cityid)
    {
        string city = "";
        try
        {
            var citydata = db.citymaster.Where(x => x.city_id == cityid).FirstOrDefault();
            if (citydata != null)
                city = citydata.name;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return city;
    }

    public void BindCountries(DropDownList ddl, bool addCitizenshipFlag = false)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var studymode = db.countriesmaster.ToList();
            if (addCitizenshipFlag)
            {
                lst.Value += "_False";
                ddl.Items.Insert(0, lst);
                for (int i = 0; i < studymode.Count; i++)
                {
                    ListItem item = new ListItem();
                    item.Text = studymode[i].country_name;
                    item.Value = studymode[i].id + "_" + studymode[i].dual_citizenship_allowed;
                    ddl.Items.Insert(i + 1, item);
                }
            }
            else
            {
                ddl.DataSource = studymode;
                ddl.DataTextField = "country_name";
                ddl.DataValueField = "id";
                ddl.DataBind();
                ddl.Items.Insert(0, lst);
            }
                
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }
    public void BindInstitution(DropDownList ddl, int universityID)
    {
        try
        {
            string roleName = Utility.GetRoleName();
            ListItem lst = new ListItem("Please select", "0");
            dynamic Universities;
            if (roleName.ToLower() == "admin")
                Universities = db.university_master.ToList();
            else
                Universities = db.university_master.Where(x => x.universityid == universityID).ToList();

            ddl.DataSource = Universities;
            ddl.DataTextField = "university_name";
            ddl.DataValueField = "universityid";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }
   
    public void BindTimeZone(DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select time zone", "0");
            var timezones = db.timezonemaster.Select(x => new { id = x.ID, textField = "(" + x.time_zone_value + ") " + x.time_zone_name }).ToList();
            ddl.DataSource = timezones;
            ddl.DataTextField = "textField";
            ddl.DataValueField = "id";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }
    public List<faq> FaqQuestionList(string formID = "", int universityId = 0)
    {
        List<faq> faqList = new List<faq>();
        try
        {
            if(formID == "" && universityId == 0)
                faqList = db.faq.ToList();
            else
                faqList = (from q in db.faq
                           join ufm in db.universitywise_faqmapping on q.id equals ufm.faq_questionID into unifaqData
                           from x in unifaqData.DefaultIfEmpty()
                           join uform in db.universitywiseformmapping on x.formid equals uform.formid into uniformData
                           from x1 in uniformData.DefaultIfEmpty()
                           where (x.universityid == universityId && x1.universityid == universityId && x1.formid.ToString() == formID)
                           select q).ToList();

        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return faqList;
    }
    public List<customfieldmaster> CustomControlist(int formID, int universityID)
    {
        List<customfieldmaster> ControlsList = new List<customfieldmaster>();
        try
        {

            ControlsList = db.customfieldmaster.Where(x => x.formid == formID && x.universityid == universityID).ToList();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return ControlsList;
    }
    public List<customfieldvalue> CustomControValue(int formID, int applicatiID)
    {
        List<customfieldvalue> ControlsValue = new List<customfieldvalue>();
        try
        {

            ControlsValue = db.customfieldvalue.Where(x => x.formid == formID && x.applicantid == applicatiID).ToList();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return ControlsValue;
    }
    public void AddCustomControl(List<customfieldmaster> ControlsList, HtmlGenericControl mainDiv)
    {
        try
        {
            for (int k = 0; k < ControlsList.Count; k++)
            {

                System.Web.UI.HtmlControls.HtmlGenericControl lstDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                lstDiv.Attributes["class"] = "list-group-item";
                mainDiv.Controls.Add(lstDiv);

                lstDiv.Attributes["controltype"] = ControlsList[k].type.ToString();

                System.Web.UI.HtmlControls.HtmlGenericControl formgroupDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                formgroupDiv.Attributes["class"] = "form-group m-0";
                formgroupDiv.Attributes["role"] = "group";
                formgroupDiv.Attributes["aria - labelledby"] = ControlsList[k].labeldescription;
                lstDiv.Controls.Add(formgroupDiv);
                System.Web.UI.HtmlControls.HtmlGenericControl divFormRow = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                divFormRow.Attributes["class"] = "form-row";
                formgroupDiv.Controls.Add(divFormRow);


                System.Web.UI.HtmlControls.HtmlGenericControl label1 = new System.Web.UI.HtmlControls.HtmlGenericControl("Label");
                label1.ID = "label" + ControlsList[k].labeldescription;
                label1.Attributes["class"] = "col-md-3 col-form-label form-label";
                label1.Attributes["for"] = ControlsList[k].labeldescription;
                label1.InnerHtml = ControlsList[k].labeldescription;
                divFormRow.Controls.Add(label1);
                System.Web.UI.HtmlControls.HtmlGenericControl mycontrol = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                mycontrol.Attributes["class"] = "col-md-6";
                divFormRow.Controls.Add(mycontrol);

                if (ControlsList[k].type.ToLower() == "textbox")
                {
                    TextBox txtcustombox = new TextBox();
                    txtcustombox.ID = "txt" + ControlsList[k].customfieldid;

                    txtcustombox.Attributes["class"] = "form-control";
                    // txtcustombox.Attributes.Add("title", ControlsList[k].tooltips);
                    mycontrol.Controls.Add(txtcustombox);
                }
                else if (ControlsList[k].type.ToLower() == "file")
                {
                    FileUpload fileUploadcustombox = new FileUpload();
                    fileUploadcustombox.ID = "file" + ControlsList[k].customfieldid;

                    HyperLink hyperLinkcustombox = new HyperLink();
                    hyperLinkcustombox.ID = "hyperlink" + ControlsList[k].customfieldid;

                   
                    mycontrol.Controls.Add(fileUploadcustombox);
                    mycontrol.Controls.Add(hyperLinkcustombox);
                }
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }

    }
    public void AddCustomControlinAdmin(List<customfieldmaster> ControlsList, HtmlGenericControl mainDiv)
    {
        try
        {
            for (int k = 0; k < ControlsList.Count; k++)
            {

                System.Web.UI.HtmlControls.HtmlGenericControl lstDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                lstDiv.Attributes["class"] = "list-group-item";
                mainDiv.Controls.Add(lstDiv);

                lstDiv.Attributes["controltype"] = ControlsList[k].type.ToString();

                System.Web.UI.HtmlControls.HtmlGenericControl formgroupDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                formgroupDiv.Attributes["class"] = "form-group m-0";
                formgroupDiv.Attributes["role"] = "group";
                formgroupDiv.Attributes["aria - labelledby"] = ControlsList[k].labeldescription;
                lstDiv.Controls.Add(formgroupDiv);
                System.Web.UI.HtmlControls.HtmlGenericControl divFormRow = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                divFormRow.Attributes["class"] = "form-row";
                formgroupDiv.Controls.Add(divFormRow);


                System.Web.UI.HtmlControls.HtmlGenericControl label1 = new System.Web.UI.HtmlControls.HtmlGenericControl("Label");
                label1.ID = "label" + ControlsList[k].labeldescription;
                label1.Attributes["class"] = "col-md-2 col-form-label form-label";
                label1.Attributes["for"] = ControlsList[k].labeldescription;
                label1.InnerHtml = ControlsList[k].labeldescription;
                divFormRow.Controls.Add(label1);
                System.Web.UI.HtmlControls.HtmlGenericControl mycontrol = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                mycontrol.Attributes["class"] = "col-md-3 prdtl-ans";
                divFormRow.Controls.Add(mycontrol);
                System.Web.UI.HtmlControls.HtmlGenericControl rbcontrol = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                rbcontrol.Attributes["class"] = "col-md-3 prdtl-vrfy";
                divFormRow.Controls.Add(rbcontrol);
                System.Web.UI.HtmlControls.HtmlGenericControl adminControl = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                adminControl.Attributes["class"] = "col-md-3";
                divFormRow.Controls.Add(adminControl);

                if (ControlsList[k].type.ToLower() == "textbox")
                {
                    Label lblinput = new Label();
                    lblinput.ID = "lbl" + ControlsList[k].customfieldid;

                    //  lblinput.Attributes["class"] = "form-control";
                    // txtcustombox.Attributes.Add("title", ControlsList[k].tooltips);
                    mycontrol.Controls.Add(lblinput);
                    RadioButton rbYes = new RadioButton();
                    RadioButton rbNo = new RadioButton();
                    rbYes.Text = "Yes";
                    rbNo.Text = "No";
                    rbYes.ID = "rblYes" + ControlsList[k].customfieldid;
                    rbYes.Attributes.Add("value", "1");
                    rbNo.Attributes.Add("value", "0");
                    rbNo.ID = "rblNo" + ControlsList[k].customfieldid;
                    rbNo.GroupName = ControlsList[k].customfieldid.ToString();
                    rbYes.GroupName = ControlsList[k].customfieldid.ToString();
                    rbcontrol.Controls.Add(rbYes);
                    rbcontrol.Controls.Add(rbNo);
                    TextBox txtcustombox = new TextBox();
                    txtcustombox.ID = "txt" + ControlsList[k].customfieldid;
                    HtmlInputButton btnCustom = new HtmlInputButton();
                    btnCustom.ID = "btn" + ControlsList[k].customfieldid;
                    btnCustom.Value = "Add Remarks";
                    txtcustombox.Attributes["class"] = "form-control";
                    txtcustombox.Attributes.Add("style", "display:none;");
                    // txtcustombox.Attributes.Add("title", ControlsList[k].tooltips);
                    adminControl.Controls.Add(btnCustom);
                    adminControl.Controls.Add(txtcustombox);
                }
            }

        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }

    }
    public void AddCustomControlForSupervisor(List<customfieldmaster> ControlsList, HtmlGenericControl mainDiv , List<admincomments> Comments)
    {
        try
        {
            for (int k = 0; k < ControlsList.Count; k++)
            {

                System.Web.UI.HtmlControls.HtmlGenericControl lstDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                lstDiv.Attributes["class"] = "list-group-item";
                mainDiv.Controls.Add(lstDiv);

                lstDiv.Attributes["controltype"] = ControlsList[k].type.ToString();

                System.Web.UI.HtmlControls.HtmlGenericControl formgroupDiv = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                formgroupDiv.Attributes["class"] = "form-group m-0";
                formgroupDiv.Attributes["role"] = "group";
                formgroupDiv.Attributes["aria - labelledby"] = ControlsList[k].labeldescription;
                lstDiv.Controls.Add(formgroupDiv);
                System.Web.UI.HtmlControls.HtmlGenericControl divFormRow = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                divFormRow.Attributes["class"] = "form-row";
                formgroupDiv.Controls.Add(divFormRow);


                System.Web.UI.HtmlControls.HtmlGenericControl label1 = new System.Web.UI.HtmlControls.HtmlGenericControl("Label");
                label1.ID = "label" + ControlsList[k].labeldescription;
                label1.Attributes["class"] = "col-md-3 col-form-label form-label";
                label1.Attributes["for"] = ControlsList[k].labeldescription;
                label1.InnerHtml = ControlsList[k].labeldescription;
                divFormRow.Controls.Add(label1);
                System.Web.UI.HtmlControls.HtmlGenericControl mycontrol = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                mycontrol.Attributes["class"] = "col-md-4";
                divFormRow.Controls.Add(mycontrol);
                System.Web.UI.HtmlControls.HtmlGenericControl adminControl = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                adminControl.Attributes["class"] = "col-md-2";
                divFormRow.Controls.Add(adminControl);
                System.Web.UI.HtmlControls.HtmlGenericControl admincommentControl = new System.Web.UI.HtmlControls.HtmlGenericControl("div");
                admincommentControl.Attributes["class"] = "col-md-3";
                divFormRow.Controls.Add(admincommentControl);

                if (ControlsList[k].type.ToLower() == "textbox")
                {
                    Label lblinput = new Label();
                    lblinput.ID = "lbl" + ControlsList[k].customfieldid;

                    //  lblinput.Attributes["class"] = "form-control";
                    // txtcustombox.Attributes.Add("title", ControlsList[k].tooltips);
                    mycontrol.Controls.Add(lblinput);
                                      

                    RadioButton rbYes = new RadioButton();
                    RadioButton rbNo = new RadioButton();
                    rbYes.Text = "Yes";
                    rbNo.Text = "No";
                    rbYes.ID = "rblYes" + ControlsList[k].customfieldid;
                    rbYes.Attributes.Add("value", "1");
                    rbNo.Attributes.Add("value", "0");
                    rbNo.ID = "rblNo" + ControlsList[k].customfieldid;
                    rbNo.GroupName = ControlsList[k].customfieldid.ToString();
                    rbYes.GroupName = ControlsList[k].customfieldid.ToString();

                    //

                    for (int c = 0; c < Comments.Count; c++)
                    {
                        if (Comments[c].fieldname == ControlsList[k].labeldescription)
                        {
                            if (Comments[c].adminaction == 1)
                                rbYes.Checked = true;
                            else if (Comments[c].adminaction == 0)
                                rbNo.Checked = true;

                            Label lblinputComments = new Label();
                            lblinputComments.ID = "lblComments" + ControlsList[k].customfieldid;
                            lblinputComments.Text = Comments[c].comments;
                            admincommentControl.Controls.Add(lblinputComments);
                        }
                    }
                    adminControl.Controls.Add(rbYes);
                    adminControl.Controls.Add(rbNo);                    
                }
            }

        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }

    }
    public void SaveCustomValue(int applicatID, int CustomFieldId, string Userinput, int formid)
    {
        customfieldvalue objCustom = new customfieldvalue();
        try
        {
            var existingCustomValue = (from customvalue in db.customfieldvalue
                                       where (customvalue.applicantid == applicatID && customvalue.customfieldid == CustomFieldId)
                                       select customvalue).FirstOrDefault();
            if (existingCustomValue != null)
                objCustom = existingCustomValue;

            objCustom.applicantid = applicatID;
            objCustom.customfieldid = CustomFieldId;
            objCustom.value = Userinput;
            objCustom.formid = formid;
            if (existingCustomValue == null)
                db.customfieldvalue.Add(objCustom);
            db.SaveChanges();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }

    }
    public void SetCustomData(int formID, int applicatiID, List<customfieldmaster> CustomControls, HtmlGenericControl mainDiv)
    {
        try
        {
            var CustomControlsValue = CustomControValue(formID, applicatiID);
            for (int k = 0; k < CustomControlsValue.Count; k++)
            {
                int customValueFieldId = (int)CustomControlsValue[k].customfieldid;
                for (int j = 0; j < CustomControls.Count; j++)
                {
                    int customControlFieldId = (int)CustomControls[j].customfieldid;
                    if (customValueFieldId == customControlFieldId)
                    {
                        if (CustomControls[k].type.ToLower() == "textbox")
                        {
                            string OptionID = "txt" + customValueFieldId;
                            TextBox txtDynamic = (TextBox)mainDiv.FindControl(OptionID);
                            txtDynamic.Text = CustomControlsValue[k].value;
                            break;
                        }
                        else if (CustomControls[k].type.ToLower() == "file")
                        {
                            string hyperlinkOptionID = "hyperlink" + customValueFieldId;
                            HyperLink hyperlinkDynamic = (HyperLink)mainDiv.FindControl(hyperlinkOptionID);
                            hyperlinkDynamic.Target = "_blank";
                            hyperlinkDynamic.NavigateUrl = Utility.GetWebUrl() + "/Docs/GTEApplicantDocument/" + CustomControlsValue[k].value;
                            hyperlinkDynamic.Text = "View File";
                            break;
                        }

                    }
                }
                // objCom.SaveCustomValue(applicatID, customFieldId, txtDynamic.Text, formId);
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }
    public void SetCustomDataAdmin(int formID, int applicatiID, List<customfieldmaster> CustomControls, HtmlGenericControl mainDiv)
    {
        try
        {
            var CustomControlsValue = CustomControValue(formID, applicatiID);
            for (int k = 0; k < CustomControlsValue.Count; k++)
            {
                int customValueFieldId = (int)CustomControlsValue[k].customfieldid;
                for (int j = 0; j < CustomControls.Count; j++)
                {
                    int customControlFieldId = (int)CustomControls[j].customfieldid;
                    if (customValueFieldId == customControlFieldId)
                    {
                        string OptionID = "lbl" + customValueFieldId;
                        Label lblDynamic = (Label)mainDiv.FindControl(OptionID);
                        lblDynamic.Text = CustomControlsValue[k].value;
                        break;
                    }
                }
                // objCom.SaveCustomValue(applicatID, customFieldId, txtDynamic.Text, formId);
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }
    public void SaveCustomData(int applicatID, int formID, List<customfieldmaster> CustomControls, HtmlGenericControl mainDiv)
    {
        try
        {
            for (int k = 0; k < CustomControls.Count; k++)
            {
                int customFieldId = CustomControls[k].customfieldid;

                if (CustomControls[k].type.ToLower() == "textbox") {
                    string OptionID = "txt" + customFieldId;
                    TextBox txtDynamic = (TextBox)mainDiv.FindControl(OptionID);
                    SaveCustomValue(applicatID, customFieldId, txtDynamic.Text, formID);
                }
                else if(CustomControls[k].type.ToLower() == "file")
                {
                    string fileOptionID = "file" + customFieldId;
                    FileUpload fileUploadDynamic = (FileUpload)mainDiv.FindControl(fileOptionID);
                    if (fileUploadDynamic.HasFile) {
                        string dirPath = System.Configuration.ConfigurationManager.AppSettings["DocPath"] + "/GTEApplicantDocument";
                        DirectoryInfo di = new DirectoryInfo(dirPath);
                        if (!di.Exists)
                            di.Create();

                        string fileName = string.Concat(Guid.NewGuid(), Path.GetExtension(fileUploadDynamic.PostedFile.FileName));
                        string filePath = string.Concat(dirPath, "/", fileName);
                        fileUploadDynamic.PostedFile.SaveAs(filePath);
                        SaveCustomValue(applicatID, customFieldId, fileName, formID);
                    }                    
                }
                
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }
    public List<dynamic> GetToolTips(int universityID, int formId)
    {
        var fields = (from pfm in db.primaryfieldmaster
                      join utm in db.universitywisetooltipmaster
                      on pfm.primaryfieldid equals utm.fieldid into
                      tmpUniversity
                      from z in tmpUniversity.Where(x => x.universityid == universityID && x.formid == formId).DefaultIfEmpty()
                      join tm in db.tooltipmaster on pfm.primaryfieldid equals tm.fieldid into tmp
                      from x in tmp.Where(c => c.formid == formId).DefaultIfEmpty()
                      where (x.formid == formId || z.formid == formId)
                      select new
                      {
                          primaryfiledname = pfm.primaryfiledname,
                          universitywiseToolTips = (z == null ? String.Empty : z.tooltips),
                          tooltips = (x == null ? String.Empty : x.tooltips)
                      }).ToList();
        return fields.ToList<dynamic>();
    }
    public void SaveAdminComments(int applicantId, int universityID, int formID, int adminID, Hashtable adminInputs)
    {
        var fieldName = "";
        var Comments = "";
        ICollection key = adminInputs.Keys;
        foreach (var val in key)
        {
            fieldName = Convert.ToString(val);
            Comments = adminInputs[val].ToString();

            var mode = "new";
            var adminComments = (from cInfo in db.admincomments
                                 where cInfo.applicantid == applicantId && cInfo.universityid == universityID
                                 && cInfo.formid == formID && cInfo.fieldname == fieldName
                                 select cInfo).FirstOrDefault();
            admincomments objComments = new admincomments();
            if (adminComments != null)
            {
                mode = "update";
                objComments = adminComments;
            }
            objComments.formid = formID;
            objComments.adminid = adminID;
            objComments.applicantid = applicantId;
            objComments.universityid = universityID;
            objComments.fieldname = fieldName;
            string[] inputs = Comments.Split('~');

            objComments.comments = inputs[0].ToString();
            if (inputs.Length > 1)
                objComments.adminaction = Convert.ToInt32(inputs[1].ToString());
            if (mode == "new")
                db.admincomments.Add(objComments);
            db.SaveChanges();
        }

    }
    public Hashtable ReadCustomfieldAdmininput(int applicatID, int formID, List<customfieldmaster> CustomControls, HtmlGenericControl mainDiv, Hashtable adminInputs)
    {
        try
        {
            for (int k = 0; k < CustomControls.Count; k++)
            {
                int customFieldId = CustomControls[k].customfieldid;
                string OptionID = "txt" + customFieldId;
                TextBox txtDynamic = (TextBox)mainDiv.FindControl(OptionID);

                string radioNo = "rblNo" + CustomControls[k].customfieldid;
                RadioButton rblRadioNo = (RadioButton)mainDiv.FindControl(radioNo);
                adminInputs.Add(CustomControls[k].labeldescription, txtDynamic.Text + "~" + (rblRadioNo.Checked == true ? 0 : 1));
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return adminInputs;
    }
    public List<admincomments> GetAdminComments(int formID, int universityID, int ApplicantID)
    {
        List<admincomments> Comments = new List<admincomments>();
        try
        {
            Comments = db.admincomments.Where(x => x.formid == formID && x.universityid == universityID && x.applicantid == ApplicantID).ToList();
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return Comments;
    }
    public void SaveSupervisorComments(int applicantId, int universityID,int formID, int SupervisorID,string Comments, int supervisorAction)
    {
        try
        {
            var mode = "new";
            var supervisorComments = (from cInfo in db.supervisorcomments
                                 where cInfo.applicantid == applicantId && cInfo.universityid == universityID
                                 && cInfo.formid == formID 
                                 select cInfo).FirstOrDefault();
            supervisorcomments objComments = new supervisorcomments();
            if (supervisorComments != null)
            {
                mode = "update";
                objComments = supervisorComments;
            }
            objComments.formid = formID;
            objComments.supervisorid = SupervisorID;
            objComments.applicantid = applicantId;
            objComments.universityid = universityID;
            objComments.supervisoraction = supervisorAction;
            objComments.comments = Comments;
            if (mode == "new")
                db.supervisorcomments.Add(objComments);
            db.SaveChanges();

        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }
    public List<supervisorcomments> GetSupervisorComments(int applicantId, int universityID, int formID)
    {
        List<supervisorcomments> lstComments = new List<supervisorcomments>();
        try
        {
           
            lstComments = (from cInfo in db.supervisorcomments
                                      where cInfo.applicantid == applicantId && cInfo.universityid == universityID
                                      && cInfo.formid == formID
                                      select cInfo).ToList();
           

        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return lstComments;
    }
    public bool IsDeclarationDoneByApplicant(int applicantId, int universityID)
    {
        try
        {
            var applicantProgressInfo = db.applicantprogressbar.Where(x => x.applicantid == applicantId && x.universityid == universityID).FirstOrDefault();
            if (applicantProgressInfo != null)
            {
                if (applicantProgressInfo.declarationdone.HasValue && applicantProgressInfo.declarationdone.Value)
                    return true;
                else
                    return false;
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return false;
    }

    public bool IsGteDeclarationDoneByApplicant(int applicantId, int UniversityID)
    {
        try
        {
            var applicantGteProgressInfo = db.gte_progressbar.Where(x => x.applicantid == applicantId && x.universityId == UniversityID).FirstOrDefault();
            if (applicantGteProgressInfo != null)
            {
                if (applicantGteProgressInfo.is_gte_declaration_completed.HasValue && applicantGteProgressInfo.is_gte_declaration_completed.Value)
                    return true;
                else
                    return false;
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return false;
    }

    public bool SetStudentDetailsCompletedStatus(int applicantId, int universityID)
    {
        try
        {
            var isPersonalDetailsComplete = db.applicantdetails
                                              .Where(x => x.applicantid == applicantId && x.universityid == universityID)
                                              .Select(x => x.iscontactdetailspresent && x.ispersonaldetailspresent && x.issocialprofilepresent && x.isidentificationpresent).FirstOrDefault();

            var isEducationDetailsComplete = db.applicanteducationdetails
                                               .Where(x => x.applicantid == applicantId && x.universityid == universityID)
                                               .Select(x => x.iseducationdetailspresent).FirstOrDefault();

            var isLanguageCompetencyComplete = db.applicantlanguagecompetency
                                                 .Where(x => x.applicantid == applicantId && x.universityid == universityID)
                                                 .Select(x => x.islanguagecompetencypresent).FirstOrDefault();

            if (isPersonalDetailsComplete && isEducationDetailsComplete && isLanguageCompetencyComplete)
                return true;
            else
                return false;

        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return false;
    }
    public bool SetGteStudentDetailsCompletedStatus(int applicantId, int universityID)
    {
        try
        {
            var applicantDetails = db.gte_applicantdetails.Where(x => x.applicantid.Value == applicantId && x.universityid == universityID).FirstOrDefault();

            if (applicantDetails != null)
                return true;
            else
                return false;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return false;
    }
    public void SetCustomDataAdminComments(int formID, int applicatiID, List<customfieldmaster> CustomControls, HtmlGenericControl mainDiv, List<admincomments> Comments)
    {
        try
        {

            for (int k = 0; k < Comments.Count; k++)
            {
                string customFieldName = Comments[k].fieldname;
                for (int j = 0; j < CustomControls.Count; j++)
                {
                    string FieldName = CustomControls[j].labeldescription;
                    int customControlFieldId = (int)CustomControls[j].customfieldid;
                    if (customFieldName == FieldName)
                    {
                        string OptionID = "txt" + customControlFieldId;
                        TextBox lblDynamic = (TextBox)mainDiv.FindControl(OptionID);
                        lblDynamic.Text = Comments[k].comments;
                        string radioYes = "rblYes" + customControlFieldId;
                        RadioButton rblRadioYes = (RadioButton)mainDiv.FindControl(radioYes);
                        //rblRadioYes.Text = "Yes";
                        //rblRadioYes.GroupName = radioYes;
                        string radioNo = "rblNo" + customControlFieldId;
                        RadioButton rblRadioNo = (RadioButton)mainDiv.FindControl(radioNo);
                        if (Comments[k].adminaction == 0)
                            rblRadioNo.Checked = true;
                        else
                            rblRadioYes.Checked = true;

                        break;
                    }
                }
                // objCom.SaveCustomValue(applicatID, customFieldId, txtDynamic.Text, formId);
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }
    public void SetCustomDataCommentForSupervisor(int formID, int applicatiID, List<customfieldmaster> CustomControls, HtmlGenericControl mainDiv, List<admincomments> Comments)
    {
        try
        {

            for (int k = 0; k < Comments.Count; k++)
            {
                string customFieldName = Comments[k].fieldname;
                for (int j = 0; j < CustomControls.Count; j++)
                {
                    string FieldName = CustomControls[j].labeldescription;
                    int customControlFieldId = (int)CustomControls[j].customfieldid;
                    if (customFieldName == FieldName)
                    {
                        string OptionID = "lblComments" + customControlFieldId;
                        Label lblDynamic = (Label)mainDiv.FindControl(OptionID);
                        lblDynamic.Text = Comments[k].comments;
                        break;
                    }
                }
                // objCom.SaveCustomValue(applicatID, customFieldId, txtDynamic.Text, formId);
            }
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
    }
    public int RandomNumber(int min, int max)
    {
        Random random = new Random();
        return random.Next(min, max);
    }
    public string GetCustomFieldValue(int applicatID, int formID, int fieldID)
    {
        string FieldValue = "";
        var ControlsValue = db.customfieldvalue.Where(x => x.formid == formID && x.applicantid == applicatID && x.customfieldid == fieldID).FirstOrDefault();
        if (ControlsValue != null)
            FieldValue = ControlsValue.value;
        return FieldValue;
    }
    public string GetCustomFieldAdminComments(int applicatID, int formID, string labelDescription, int University)
    {
        string AdminComments = "";
        var ControlsValue = db.admincomments.Where(x => x.formid == formID && x.applicantid == applicatID && x.fieldname == labelDescription && x.universityid == University).FirstOrDefault();
        if (ControlsValue != null)
            AdminComments = ControlsValue.comments + "~" + (ControlsValue.adminaction == null ? "0" : ControlsValue.adminaction.ToString());
        return AdminComments;
    }
    public string GetHighestDegree(int id)
    {
        string HighestDegree = "";
        try
        {
            var GetHighestDegree = db.studylevelmaster.Where(x => x.studylevelid == id).FirstOrDefault();
            if (GetHighestDegree != null)
                HighestDegree = GetHighestDegree.studylevel;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return HighestDegree;
    }

    public string Getworkexperience(int id)
    {
        string workexperienceyears = "";
        try
        {
            var major = db.workexperienceyearsmaster.FirstOrDefault();
            if (major != null)
                workexperienceyears = major.description;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return workexperienceyears;
    }
    public string GetTypeworkexperience(int id)
    {
        string workexperiencetype = "";
        try
        {
            var major = db.typeofworkexperiencemaster.FirstOrDefault();
            if (major != null)
                workexperiencetype = major.description;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return workexperiencetype;
    }
    public string GettuitionAndlivingcostmaster(int id)
    {
        string tuitionAndlivingcostmaster = "";
        try
        {
            var major = db.tuitionAndlivingcostmaster.FirstOrDefault();
            if (major != null)
                tuitionAndlivingcostmaster = major.description;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return tuitionAndlivingcostmaster;
    }
    public string GetHighestStudyField(int id)
    {
        string Highestfieldofstudy = "";
        try
        {
            var major = db.majordiscipline_master.FirstOrDefault();
            if (major != null)
                Highestfieldofstudy = major.description;
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }
        return Highestfieldofstudy;        
    }
    [Serializable]
    public class FieldList
    {
        public List<FieldInfo> FieldInfos { get; set; }
    }
    [Serializable]
    public class FieldInfo
    {
        public string PrimaryFiledName { get; set; }
        public string FieldNameInstructions { get; set; }
        public string SecondaryFieldnameInstructions { get; set; }
        public string SecondaryFieldnameLanguage { get; set; }
        public string SecondaryFielddnameValue { get; set; }
    }
}
