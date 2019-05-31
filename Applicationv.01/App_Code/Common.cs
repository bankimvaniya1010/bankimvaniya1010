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
    public void SendMail(string EmailId, string body, string subject)
    {
        try
        {
            MailMessage mail = new MailMessage();
            SmtpClient SmtpServer = new SmtpClient(ConfigurationManager.AppSettings["Smtp"]);


            mail.From = new MailAddress(ConfigurationManager.AppSettings["FromMail"], "GTE Admin");
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
        var GetTitle = db.titlemaster.Where(x => x.titleid == id).FirstOrDefault();
        if (GetTitle != null)
            title = GetTitle.titlename;
        return title;
    }
    public string GetIdentityProof(int id)
    {
        string proofname = "";
        var GetProof = db.alternateidproofmaster.Where(x => x.id == id).FirstOrDefault();
        if (GetProof != null)
            proofname = GetProof.description;
        return proofname;
    }
    public string GetAddressProof(int id)
    {
        string proofname = "";
        var GetProof = db.alternateadressproofmaster.Where(x => x.id == id).FirstOrDefault();
        if (GetProof != null)
            proofname = GetProof.description;
        return proofname;
    }
    public string GetDOBProof(int id)
    {
        string proofname = "";
        var GetProof = db.alternatedobproof.Where(x => x.id == id).FirstOrDefault();
        if (GetProof != null)
            proofname = GetProof.description;
        return proofname;
    }
    public string GetStudyMode(int id)
    {
        string studyMode = "";
        var StudyMode = db.studymodemaster.Where(x => x.id == id).FirstOrDefault();
        if (StudyMode != null)
            studyMode = StudyMode.description;
        return studyMode;
    }
    public string GetStudyMedium(int id)
    {
        string studyMedium = "";
        var Medium = db.educationmediummaster.Where(x => x.id == id).FirstOrDefault();
        if (Medium != null)
            studyMedium = Medium.description;
        return studyMedium;
    }
    public string GetGrade(int id)
    {
        string studygrade = "";
        var Grade = db.grademaster.Where(x => x.id == id).FirstOrDefault();
        if (Grade != null)
            studygrade = Grade.description;
        return studygrade;
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

        var GetDisability = db.disabilitymaster.Where(x => x.id == id).FirstOrDefault();
        if (GetDisability != null)
            Disability = GetDisability.description;

        return Disability;
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
    public void BindCountries(DropDownList ddl)
    {
        try
        {
            ListItem lst = new ListItem("Please select", "0");
            var studymode = db.countriesmaster.ToList();
            ddl.DataSource = studymode;
            ddl.DataTextField = "country_name";
            ddl.DataValueField = "id";
            ddl.DataBind();
            ddl.Items.Insert(0, lst);
        }
        catch (Exception ex)
        {
            log.WriteLog(ex.ToString());
        }




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
