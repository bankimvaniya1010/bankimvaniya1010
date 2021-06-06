using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_gte_studentdetailsN : System.Web.UI.Page
{
    int formId = 0;
    Common objCom = new Common();
    public int adminID = 0, ApplicantID = 0, universityID;
    private GTEEntities db = new GTEEntities();
    protected List<customfieldmaster> CustomControls = new List<customfieldmaster>();
    List<customfieldvalue> CustomControlsValue = new List<customfieldvalue>();
    Logger objLog = new Logger();
    public string webURL = String.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        webURL = Utility.GetWebUrl();
        if (!Utility.CheckAdminLogin())
            Response.Redirect(webURL + "admin/Login.aspx", true);
        universityID = Utility.GetUniversityId();
        adminID = Convert.ToInt32(Session["UserID"]);
        if ((Request.QueryString["formid"] == null) || (Request.QueryString["formid"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            formId = Convert.ToInt32(Request.QueryString["formid"].ToString());
        if ((Request.QueryString["userid"] == null) || (Request.QueryString["userid"].ToString() == ""))
        {
            Response.Redirect(webURL + "admin/default.aspx", true);
        }
        else
            ApplicantID = Convert.ToInt32(Request.QueryString["userid"].ToString());

        if (!IsPostBack)
        {
            SetAdminComments();            
            populategteapplicantdetail();
        }
    }
    private void populategteapplicantdetail()
    {
        try
        {

            var applicantInfo = (from pInfo in db.applicantdetails
                                 where pInfo.applicantid == ApplicantID && pInfo.universityid == universityID
                                 select pInfo).FirstOrDefault();


            if (applicantInfo != null)
            {

                lblfirstname.Text = applicantInfo.firstname;
                lblMiddleName.Text = applicantInfo.lastname;
                lblLastName.Text = applicantInfo.middlename;
                if (applicantInfo.gender != null)
                {
                    int genderid = Convert.ToInt32(applicantInfo.gender);
                    lblGender.Text = db.gender_master.Where(x => x.id == genderid).Select(x => x.description).FirstOrDefault();
                }
                lblPostalAddress.Text = applicantInfo.postaladdrees1;
                lblPostalAddress.Text += applicantInfo.postaladdrees2;
                lblPostalAddress.Text += applicantInfo.postaladdrees3;
                lblPostalAddress.Text += applicantInfo.postalcity;
                lblPostalAddress.Text += applicantInfo.postalstate;
                lblPostalAddress.Text += applicantInfo.postalpostcode;
                lblPostalAddress.Text += objCom.GetCountryDiscription(Convert.ToInt32(applicantInfo.postalcountry));

                if (applicantInfo.issameaspostal == 1)
                    lblAddress.Text = "Yes";
                else if (applicantInfo.issameaspostal == 2)
                {
                    residential.Attributes.Add("style", "display:block;");
                    lblAddress.Text = "NO";

                    lblResidential.Text = applicantInfo.residentialaddress1;
                    lblResidential.Text += applicantInfo.residentialaddress2;
                    lblResidential.Text += applicantInfo.residentialaddress3;
                    lblResidential.Text = applicantInfo.residentialcity;
                    lblResidential.Text += applicantInfo.residentialstate;
                    lblResidential.Text += applicantInfo.residentailpostcode;
                    lblResidential.Text += objCom.GetCountryDiscription(Convert.ToInt32(applicantInfo.residentialcountry));

                }

                lblEmail.Text = applicantInfo.email;
                lblMobile.Text = applicantInfo.mobileno;

                if (applicantInfo.highestqualifiactionachieved != null)
                {
                    txthighestqualificationAchieved.Text = objCom.GetHighestDegree(Convert.ToInt32(applicantInfo.highestqualifiactionachieved));
                }

                if (applicantInfo.broadFieldID != null)
                {
                    lblbroadfield.Text = objCom.GetBroadFieldDescription(Convert.ToInt32(applicantInfo.broadFieldID));
                }
                if (applicantInfo.narrowFieldID != null)
                {
                    lblnarrowfield.Text = objCom.GetNarrowFieldDescription(Convert.ToInt32(applicantInfo.narrowFieldID));
                }
                if (applicantInfo.detailedFieldID != null)
                {
                    lbldetailedfield.Text = objCom.GetDetailedFieldDescription(Convert.ToInt32(applicantInfo.detailedFieldID));
                }

                if (applicantInfo.levelofcourse != null)
                {
                    lblhighestqualificationyouwillcomplete.Text = objCom.GetHighestDegree(Convert.ToInt32(applicantInfo.levelofcourse));
                }

                // BindBroadField(Convert.ToInt32(applicantInfo.levelofcourse), ddlboradfieldyouwillComplete);
                if (applicantInfo.broadFieldIDyouwillComplete != null)
                {
                    lblbroadfieldyouwillcomplete.Text = objCom.GetBroadFieldDescription(Convert.ToInt32(applicantInfo.broadFieldIDyouwillComplete));
                }
                if (applicantInfo.narrowFieldIDyouwillComplete != null)
                {
                    lblnarrowfieldyouwillcomplete.Text = objCom.GetNarrowFieldDescription(Convert.ToInt32(applicantInfo.narrowFieldIDyouwillComplete));
                }
                if (applicantInfo.detailedFieldIDyouwillComplete != null)
                {
                    lbldetailedfieldyouwillcomplete.Text = objCom.GetDetailedFieldDescription(Convert.ToInt32(applicantInfo.detailedFieldIDyouwillComplete));
                }
                if (applicantInfo.passportno != null)
                    lblpassportnumber.Text = applicantInfo.passportno;

                //if (applicantInfo.highestqualificationfield != null)
                //{
                //    ddlhighestqualificationfield.ClearSelection();
                //    ddlhighestqualificationfield.Items.FindByValue(applicantInfo.highestqualificationfield.ToString()).Selected = true;
                //}
                if (applicantInfo.dateofbirth != null)
                    txtdob.Text = Convert.ToDateTime(applicantInfo.dateofbirth).ToString("yyyy-MM-dd");
                if (applicantInfo.nationality != null)
                {
                    lblnationality.Text = objCom.GetCountryDiscription(Convert.ToInt32(applicantInfo.nationality));
                }
                if (applicantInfo.countryofbirth != null)
                {
                    txtbirthcountry.Text = objCom.GetCountryDiscription(Convert.ToInt32(applicantInfo.countryofbirth));
                }

                if (applicantInfo.maritalstatus != null)
                {
                    lblmaritalstatus.Text = objCom.GetMaritalStatus(Convert.ToInt32(applicantInfo.maritalstatus));
                }




                if (applicantInfo.highestqualificationdate != null)
                {
                    lblhighestqualificationdate.Text = applicantInfo.highestqualificationdate;
                }
                if (applicantInfo.highestqualificationcountry != null)
                {
                    lblhighestqualificationcountry.Text = objCom.GetCountryDiscription(Convert.ToInt32(applicantInfo.highestqualificationcountry));
                }


                if (applicantInfo.commencementdate != null)
                {
                    lbldateyouintendtostartnext.Text = applicantInfo.commencementdate;
                }

                if (applicantInfo.nameofuniversityappliedfor != null)
                {
                    Label33.Text= objCom.GetUniversityName(Convert.ToInt32(applicantInfo.nameofuniversityappliedfor));
                }
                if (applicantInfo.countryofeducationInstitution != null)
                {
                    Label35.Text = objCom.GetCountryDiscription(Convert.ToInt32(applicantInfo.countryofeducationInstitution));
                }
                if (applicantInfo.cityofeducationInstitution != null)
                {
                    Label37.Text = objCom.GetCityName(Convert.ToInt32(applicantInfo.cityofeducationInstitution));
                }


                if (applicantInfo.workexperience != null)
                {
                    lblworkexperience.Text = objCom.Getworkexperience(Convert.ToInt32(applicantInfo.workexperience));
                }
                if (applicantInfo.Iscurrentlyworking != null)
                {
                    if (applicantInfo.Iscurrentlyworking == 1)
                        lblcurrentlyworking.Text = "YES";
                    else
                        lblcurrentlyworking.Text = "NO";
                }
                if (applicantInfo.Isjoboffered != null)
                {
                    if (applicantInfo.Isjoboffered == 1)
                        lbljoboffered.Text = "YES";
                    else
                        lbljoboffered.Text = "NO";
                }

                if (applicantInfo.Ispackage == 1)
                    lblapplyingforpackage.Text = "YES";
                else if (applicantInfo.Ispackage == 0)
                    lblapplyingforpackage.Text = "NO";

                if (applicantInfo.Ispackage == 1)
                    lblwhatpackage.Text = applicantInfo.what_package;
                //agent
                if (applicantInfo.isstudentreferbyagent == 1)
                    txtagent.Text = "YES";
                else if (applicantInfo.isstudentreferbyagent == 0)
                    txtagent.Text = "NO";
                lblpassportnumber.Text = applicantInfo.passportno;
                if (applicantInfo.agentid != null)
                {
                    txtagentList.Text = objCom.GetAgentName(Convert.ToInt32(applicantInfo.agentid));
                }
                //profile pic
                if (applicantInfo.profilephoto != null)
                {
                    uploadedFile.NavigateUrl = webURL + "/Docs/GTEProfileDetail/" + applicantInfo.profilephoto;
                    uploadedFile.Text = "View File";
                }
                if (applicantInfo.passportcopy != null)
                {
                    HyperLink1.NavigateUrl = webURL + "/Docs/GTEProfileDetail/passportcopy/" + applicantInfo.passportcopy;
                    HyperLink1.Text = "View File";
                }
            }
            
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }
    private String setComments(dynamic obj)
    {
        return obj.comments;
    }

    private void SetAdminComments()
    {
        List<admincomments> Comments = objCom.GetAdminComments(formId, universityID, ApplicantID);
        for (int k = 0; k < Comments.Count; k++)
        {
            if (Comments[k].fieldname == "209") {
                txtfirstnameComment.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblfirstNameNo.Checked = true;
                else
                    rblfirstNameyes.Checked = true;
            }
            else if (Comments[k].fieldname == "210")
            {
                txtMiddleName.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblMiddleNameNo.Checked = true;
                else
                    rblMiddleNameYes.Checked = true;
            }
            else if (Comments[k].fieldname == "211")
            {
                txtLastName.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblLastNameNo.Checked = true;
                else
                    rblLastNameYes.Checked = true;
            }
            else if (Comments[k].fieldname == "212")
            {
                txtdobComments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rbldobNo.Checked = true;
                else
                    rbldobYes.Checked = true;
            }
            else if (Comments[k].fieldname == "213")
            {
                txtnationalityComment.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblnationalityyNo.Checked = true;
                else
                    rblnationalityyYes.Checked = true;
            }
            else if (Comments[k].fieldname == "214")
            {
                txtbirthcountryComments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblbirthcountryNo.Checked = true;
                else
                    rblbirthcountryYes.Checked = true;
            }
            else if (Comments[k].fieldname == "215")
            {
                txtmaritalstatusComments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblmaritalstatusNo.Checked = true;
                else
                    rblmaritalstatusYes.Checked = true;
            }
            else if (Comments[k].fieldname == "216")
            {
                txtGender.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblGenderNo.Checked = true;
                else
                    rblGenderYes.Checked = true;
            }
            else if (Comments[k].fieldname == "217")
            {
                txtPostalAddress.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblPostalAddressNo.Checked = true;
                else
                    rblPostalAddressYes.Checked = true;
            }
            else if (Comments[k].fieldname == "218")
            {
                txtAddress.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblAddressNo.Checked = true;
                else
                    rblAddressYes.Checked = true;
            }
            else if (Comments[k].fieldname == "219")
            {
                txtResidential.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblResidentialNo.Checked = true;
                else
                    rblResidentialYes.Checked = true;
            }
            else if (Comments[k].fieldname == "220")
            {
                txtEmail.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblEmailNo.Checked = true;
                else
                    rblEmailYes.Checked = true;
            }
            else if (Comments[k].fieldname == "221")
            {
                txtMobile.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblMobileNo.Checked = true;
                else
                    rblMobileYes.Checked = true;
            }
            else if (Comments[k].fieldname == "222")
            {
                txthighestqualificationAchievedcomments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    RadioButton2.Checked = true;
                else
                    RadioButton1.Checked = true;
            }
            else if (Comments[k].fieldname == "223")
            {
                txtbroadfieldComment.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblbroadfieldNO.Checked = true;
                else
                    rblbroadfieldYes.Checked = true;
            }
            else if (Comments[k].fieldname == "224")
            {
                txtnarrowfieldComments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblnarrowfieldNo.Checked = true;
                else
                    rblnarrowfieldYes.Checked = true;
            }
            else if (Comments[k].fieldname == "225")
            {
                txtdetailedfieldComments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rbldetailedfieldNo.Checked = true;
                else
                    rbldetailedfieldYes.Checked = true;
            }
            else if (Comments[k].fieldname == "226")
            {
                txthighestqualificationdateComments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblhighestqualificationdateNo.Checked = true;
                else
                    rblhighestqualificationdateYes.Checked = true;
            }
            else if (Comments[k].fieldname == "227")
            {
                txthighestqualificationcountryComments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblhighestqualificationcountryNo.Checked = true;
                else
                    rblhighestqualificationcountryYes.Checked = true;
            }
            else if (Comments[k].fieldname == "228")
            {
                txthighestqualificationyouwillcompleteComments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblhighestqualificationyouwillcompleteNo.Checked = true;
                else
                    rblhighestqualificationyouwillcompleteYes.Checked = true;
            }
            else if (Comments[k].fieldname == "229")
            {
                txtbroadfieldyouwillcompletecomments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblbroadfieldyouwillcompleteNo.Checked = true;
                else
                    rblbroadfieldyouwillcompleteYes.Checked = true;
            }
            else if (Comments[k].fieldname == "230")
            {
                txtnarrowfieldyouwillcompleteComments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblnarrowfieldyouwillcompleteNo.Checked = true;
                else
                    rblnarrowfieldyouwillcompleteYes.Checked = true;
            }
            else if (Comments[k].fieldname == "231")
            {
                txtdetailedfieldyouwillcompleteComments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rbldetailedfieldyouwillcompleteNo.Checked = true;
                else
                    rbldetailedfieldyouwillcompleteYes.Checked = true;
            }
            else if (Comments[k].fieldname == "232")
            {
                txtdateyouintendtostartnextcomments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rbldateyouintendtostartnextNo.Checked = true;
                else
                    rbldateyouintendtostartnextYes.Checked = true;
            }
            else if (Comments[k].fieldname == "233")
            {
                Text1.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    RadioButton4.Checked = true;
                else
                    RadioButton3.Checked = true;
            }
            else if (Comments[k].fieldname == "234")
            {
                Text2.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    RadioButton6.Checked = true;
                else
                    RadioButton5.Checked = true;
            }
            else if (Comments[k].fieldname == "235")
            {
                Text3.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    RadioButton8.Checked = true;
                else
                    RadioButton7.Checked = true;
            }
            else if (Comments[k].fieldname == "236")
            {
                txtworkexperiencecomments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblworkexperienceNo.Checked = true;
                else
                    rblworkexperienceYes.Checked = true;
            }
            else if (Comments[k].fieldname == "237")
            {
                txtcurrentlyworkingcomments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblcurrentlyworkingNo.Checked = true;
                else
                    rblcurrentlyworkingYes.Checked = true;
            }
            else if (Comments[k].fieldname == "238")
            {
                txtjobofferedcomments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rbljobofferedNo.Checked = true;
                else
                    rbljobofferedYes.Checked = true;
            }
            else if (Comments[k].fieldname == "239")
            {
                txtapplyingforpackagecomments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblapplyingforpackageNo.Checked = true;
                else
                    rblapplyingforpackageYes.Checked = true;
            }
            else if (Comments[k].fieldname == "240")
            {
                txtwhatpackagecomments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblwhatpackageNo.Checked = true;
                else
                    rblwhatpackageYes.Checked = true;
            }
            else if (Comments[k].fieldname == "241")
            {
                txtprofilephotocomments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblprofilephotoNo.Checked = true;
                else
                    rblprofilephotoYes.Checked = true;
            }
            else if (Comments[k].fieldname == "242")
            {
                txtpassportnumbercomments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblpassportnumberNo.Checked = true;
                else
                    rblpassportnumberYes.Checked = true;
            }
            else if (Comments[k].fieldname == "243")
            {
                txtpassportdoccomments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblpassportdocNo.Checked = true;
                else
                    rblpassportdocYes.Checked = true;
            }
            else if (Comments[k].fieldname == "244")
            {
                txtagentComments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblagentNo.Checked = true;
                else
                    rblagentYes.Checked = true;
            }
            else if (Comments[k].fieldname == "245")
            {
                txtagentListComments.Value = setComments(Comments[k]);
                if (Comments[k].adminaction == 0)
                    rblagentListNo.Checked = true;
                else
                    rblagentListYes.Checked = true;
            }

        }
    }
    
    protected void btnSave_Click(object sender, EventArgs e)
    {
        Hashtable adminInputs = new Hashtable();
        try
        {
            adminInputs.Add("209", txtfirstnameComment.Value.Trim() + "~" + (rblfirstNameNo.Checked == true ? 0 : 1));
            adminInputs.Add("210", txtMiddleName.Value.Trim() + "~" + (rblMiddleNameNo.Checked == true ? 0 : 1));
            adminInputs.Add("211", txtLastName.Value.Trim() + "~" + (rblLastNameNo.Checked == true ? 0 : 1));
            adminInputs.Add("212", txtdobComments.Value.Trim() + "~" + (rbldobNo.Checked == true ? 0 : 1));
            adminInputs.Add("213", txtnationalityComment.Value.Trim() + "~" + (rblnationalityyNo.Checked == true ? 0 : 1));
            adminInputs.Add("214", txtbirthcountryComments.Value.Trim() + "~" + (rblbirthcountryNo.Checked == true ? 0 : 1));
            adminInputs.Add("215", txtmaritalstatusComments.Value.Trim() + "~" + (rblmaritalstatusNo.Checked == true ? 0 : 1));
            adminInputs.Add("216", txtGender.Value.Trim() + "~" + (rblGenderNo.Checked == true ? 0 : 1));
            adminInputs.Add("217", txtPostalAddress.Value.Trim() + "~" + (rblPostalAddressNo.Checked == true ? 0 : 1));
            adminInputs.Add("218", txtAddress.Value.Trim() + "~" + (rblAddressNo.Checked == true ? 0 : 1));
            adminInputs.Add("219", txtResidential.Value.Trim() + "~" + (rblResidentialNo.Checked == true ? 0 : 1));
            adminInputs.Add("220", txtEmail.Value.Trim() + "~" + (rblEmailNo.Checked == true ? 0 : 1));
            adminInputs.Add("221", txtMobile.Value.Trim() + "~" + (rblMobileNo.Checked == true ? 0 : 1));
            adminInputs.Add("222", txthighestqualificationAchievedcomments.Value.Trim() + "~" + (RadioButton2.Checked == true ? 0 : 1));
            adminInputs.Add("223", txtbroadfieldComment.Value.Trim() + "~" + (rblbroadfieldNO.Checked == true ? 0 : 1));
            adminInputs.Add("224", txtnarrowfieldComments.Value.Trim() + "~" + (rblnarrowfieldNo.Checked == true ? 0 : 1));
            adminInputs.Add("225", txtdetailedfieldComments.Value.Trim() + "~" + (rbldetailedfieldNo.Checked == true ? 0 : 1));
            adminInputs.Add("226", txthighestqualificationdateComments.Value.Trim() + "~" + (rblhighestqualificationdateNo.Checked == true ? 0 : 1));
            adminInputs.Add("227", txthighestqualificationcountryComments.Value.Trim() + "~" + (rblhighestqualificationcountryNo.Checked == true ? 0 : 1));
            adminInputs.Add("228", txthighestqualificationyouwillcompleteComments.Value.Trim() + "~" + (rblhighestqualificationyouwillcompleteNo.Checked == true ? 0 : 1));
            adminInputs.Add("229", txtbroadfieldyouwillcompletecomments.Value.Trim() + "~" + (rblbroadfieldyouwillcompleteNo.Checked == true ? 0 : 1));
            adminInputs.Add("230", txtnarrowfieldyouwillcompleteComments.Value.Trim() + "~" + (rblnarrowfieldyouwillcompleteNo.Checked == true ? 0 : 1));
            adminInputs.Add("231", txtdetailedfieldyouwillcompleteComments.Value.Trim() + "~" + (rbldetailedfieldyouwillcompleteNo.Checked == true ? 0 : 1));
            adminInputs.Add("232", txtdateyouintendtostartnextcomments.Value.Trim() + "~" + (rbldateyouintendtostartnextNo.Checked == true ? 0 : 1));
            adminInputs.Add("233", Text1.Value.Trim() + "~" + (RadioButton4.Checked == true ? 0 : 1));
            adminInputs.Add("234", Text2.Value.Trim() + "~" + (RadioButton6.Checked == true ? 0 : 1));
            adminInputs.Add("235", Text3.Value.Trim() + "~" + (RadioButton8.Checked == true ? 0 : 1));
            adminInputs.Add("236", txtworkexperiencecomments.Value.Trim() + "~" + (rblworkexperienceNo.Checked == true ? 0 : 1));
            adminInputs.Add("237", txtcurrentlyworkingcomments.Value.Trim() + "~" + (rblcurrentlyworkingNo.Checked == true ? 0 : 1));
            adminInputs.Add("238", txtjobofferedcomments.Value.Trim() + "~" + (rbljobofferedNo.Checked == true ? 0 : 1));
            adminInputs.Add("239", txtapplyingforpackagecomments.Value.Trim() + "~" + (rblapplyingforpackageNo.Checked == true ? 0 : 1));
            adminInputs.Add("240", txtwhatpackagecomments.Value.Trim() + "~" + (rblwhatpackageNo.Checked == true ? 0 : 1));
            adminInputs.Add("241", txtprofilephotocomments.Value.Trim() + "~" + (rblprofilephotoNo.Checked == true ? 0 : 1));
            adminInputs.Add("242", txtpassportnumbercomments.Value.Trim() + "~" + (rblpassportnumberNo.Checked == true ? 0 : 1));
            adminInputs.Add("243", txtpassportdoccomments.Value.Trim() + "~" + (rblpassportdocNo.Checked == true ? 0 : 1));
            adminInputs.Add("244", txtagentComments.Value.Trim() + "~" + (rblagentNo.Checked == true ? 0 : 1));
            adminInputs.Add("245", txtagentListComments.Value.Trim() + "~" + (rblagentListNo.Checked == true ? 0 : 1));

            objCom.SaveAdminComments(ApplicantID, universityID, formId, adminID, adminInputs);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Saved successfully')", true);
        }
        catch (Exception ex)
        {
            objLog.WriteLog(ex.ToString());
        }
    }

    protected void backNavLink_Click(object sender, EventArgs e)
    {
        Response.Redirect(webURL + "admin/manageapplicant.aspx?ID="+ApplicantID, true);
    }
}