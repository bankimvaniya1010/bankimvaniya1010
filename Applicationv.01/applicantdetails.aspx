<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantdetails.aspx.cs" Inherits="applicantdetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            margin-left: 0px;
        }

        .auto-style3 {
            width: 121px;
        }
    </style>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function () {
            $('#dob').datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#durationfrom").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#durationto").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#ProfiencyTestDate").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#txtEnglishTest").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#txtGapEnd").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#txtGapFrom").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#txtEmploymentStart").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#txtEmploymentEnd").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#txtSponsersFrom").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#txtSponsersTo").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
            $("#txtAccountOpeningDate").datepicker({
                dateFormat: 'yy-mm-dd'  // CHANGE DATE FORMAT.
            });
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Menu ID="Menu1" Width="216px" runat="server" Orientation="Horizontal" StaticEnableDefaultPopOutImage="False"
                RenderingMode="Table" OnMenuItemClick="Menu1_MenuItemClick">
                <Items>
                    <asp:MenuItem Value="0" Text="Personal Info"></asp:MenuItem>
                    <asp:MenuItem Text="Education Info " Value="1"></asp:MenuItem>
                    <asp:MenuItem Text="Employment Details " Value="2"></asp:MenuItem>
                    <asp:MenuItem Text="Financial Detail " Value="3"></asp:MenuItem>
                </Items>
            </asp:Menu>
            <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                <asp:View ID="Tab1" runat="server">
                    <table width="578" cellpadding="0" cellspacing="0">
                        <tr valign="top">
                            <td class="TabArea" style="width: 578px">
                                <table>
                                    <tr>
                                        <td>Name</td>
                                        <td>
                                            <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Date Of Birth</td>
                                        <td>
                                            <input type="text" id="dob" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td>Passport No</td>
                                        <td>
                                            <asp:TextBox ID="txtPaasportno" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>PAN Card No</td>
                                        <td>
                                            <asp:TextBox ID="txtPanNo" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Adhar Card No</td>
                                        <td>
                                            <asp:TextBox ID="txtAdhar" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Voter Card No</td>
                                        <td>
                                            <asp:TextBox ID="txtVoter" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Gendar</td>
                                        <td>
                                            <asp:RadioButton ID="rbtnMale" runat="server" GroupName="gender" Text="Male" />
                                            <asp:RadioButton ID="rbtnFemale" runat="server" GroupName="gender" Text="Female" /></td>
                                    </tr>
                                    <tr>
                                        <td>Mobile No</td>
                                        <td>
                                            <asp:TextBox ID="txtMobile" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>Email ID</td>
                                        <td>
                                            <asp:TextBox ID="txtEmail" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>University Applied For</td>
                                        <td>
                                            <asp:TextBox ID="txtUniversity" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>Course Applied For</td>
                                        <td>
                                            <asp:TextBox ID="txtCourse" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>Intake For Which Applied</td>
                                        <td>
                                            <asp:TextBox ID="txtIntake" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnSubmit" runat="server" Text="Add Personal Info" OnClick="btnSubmit_Click" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </asp:View>
                <asp:View ID="Tab2" runat="server">
                    <table width="578" cellpadding="0" cellspacing="0">
                        <tr valign="top">
                            <td class="TabArea" style="width: 578px">
                                <table>
                                    <tr>
                                        <td>Course Name</td>
                                        <td>
                                            <asp:DropDownList ID="ddlCourse" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCourse_SelectedIndexChanged">
                                                <asp:ListItem Text="10Th" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="12Th" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Diploma" Value="3"></asp:ListItem>
                                                <asp:ListItem Text="UG" Value="4"></asp:ListItem>
                                                <asp:ListItem Text="PG" Value="5"></asp:ListItem>
                                                <asp:ListItem Text="Others" Value="6"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:TextBox ID="txtOtherCourse" runat="server" Visible="false"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Board/University</td>
                                        <td>
                                            <asp:TextBox type="text" ID="txtBoardUniversity" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>Institute</td>
                                        <td>
                                            <asp:TextBox ID="txtInstitute" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Percentage</td>
                                        <td>
                                            <asp:TextBox ID="txtPercentage" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Duration From</td>
                                        <td>
                                            <input type="text" id="durationfrom" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>To</td>
                                        <td>
                                            <input type="text" id="durationto" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>Reapats/Backlog</td>
                                        <td>
                                            <asp:TextBox ID="txtRepeats" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnCourse" runat="server" Text="Add Course Info" OnClick="btnCourse_Click" /></td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:GridView ID="grdEducation" runat="server"></asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <caption>
                            <br />
                            <tr valign="top">
                                <td class="TabArea" style="width: 578px">
                                    <table>
                                        <tr>
                                            <td>Has the Student Taken English Proeficiency Test?</td>
                                            <td>
                                                <asp:RadioButton ID="rdoYes" runat="server" GroupName="English" Text="Yes" />
                                                <asp:RadioButton ID="rdoNo" runat="server" GroupName="English" Text="No" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Date of Exam booked</td>
                                            <td>
                                                <input type="text" id="txtEnglishTest" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Test Name</td>
                                            <td>
                                                <asp:DropDownList ID="ddlEnglish" runat="server">
                                                    <asp:ListItem Value="1" Text="IELTS"></asp:ListItem>
                                                    <asp:ListItem Value="2" Text="PTE"></asp:ListItem>
                                                    <asp:ListItem Value="3" Text="TOFEL"></asp:ListItem>
                                                </asp:DropDownList>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Overall score</td>
                                            <td>
                                                <asp:TextBox ID="txtOverAll" runat="server" type="text" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Speaking</td>
                                            <td>
                                                <asp:TextBox ID="txtSpeaking" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Reading</td>
                                            <td>
                                                <asp:TextBox ID="txtReading" runat="server"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Listening</td>
                                            <td>
                                                <input id="txtListening" runat="server" type="text"></td>
                                        </tr>
                                        <tr>
                                            <td>Writing</td>
                                            <td>
                                                <asp:TextBox ID="txtWriting" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Test Date</td>
                                            <td>
                                                <input id="ProfiencyTestDate" runat="server" type="text" /></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnProeficiency" runat="server" Text="Add English Test" OnClick="btnProeficiency_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="grdEnglish" runat="server">
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr valign="top">
                                <td class="TabArea" style="width: 578px">Gap Details
                                    <table>
                                        <tr>
                                            <td>Gap Start From</td>
                                            <td>
                                                <input type="text" id="txtGapFrom" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Gap End To</td>
                                            <td>
                                                <input type="text" id="txtGapEnd" runat="server" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Explanation</td>
                                            <td>
                                                <asp:TextBox ID="txtExplanation" runat="server" TextMode="MultiLine" Rows="10" Columns="50" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="btnGapDetails" runat="server" Text="Add GAP Details" OnClick="btnGapDetails_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="grdGaps" runat="server">
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </caption>
                    </table>


                </asp:View>
                <asp:View ID="Tab3" runat="server">
                    <table width="578" cellpadding="0" cellspacing="0">
                        <tr valign="top">

                            <td class="TabArea" style="width: 578px">Employment Details
                                <table>

                                    <tr>
                                        <td>Designation</td>
                                        <td>
                                            <input type="text" id="txtDesignation" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>Organisation</td>
                                        <td>
                                            <input type="text" id="txtOrganisation" runat="server" /></td>
                                    </tr>

                                    <tr>
                                        <td>Contant Person</td>
                                        <td>
                                            <asp:TextBox type="text" ID="txtContactPerson" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>Salary</td>
                                        <td>
                                            <asp:TextBox type="text" ID="txtSalary" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>Duration From</td>
                                        <td>
                                            <input type="text" id="txtEmploymentStart" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>To</td>
                                        <td>
                                            <input type="text" id="txtEmploymentEnd" runat="server" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnEmployment" runat="server" Text="Add Employment Details" OnClick="btnEmployment_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td>
                                            <asp:GridView ID="grdEmployment" runat="server"></asp:GridView>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>

                    </table>

                </asp:View>
                <asp:View ID="Tab4" runat="server">
                    <table width="578" cellpadding="0" cellspacing="0">
                        <tr valign="top">
                            <td class="TabArea" style="width: 578px">
                                <table>
                                    <tr>
                                        <td>3 months old funds available for studies & living expenses for One year (with Source) </td>
                                        <td>
                                            <asp:RadioButton ID="rdFundYes" runat="server" GroupName="Fund" Text="Yes" />
                                            <asp:RadioButton ID="rdFundNo" runat="server" GroupName="Fund" Text="No" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table border="1">
                                                <tr>
                                                    <td>Expenses</td>
                                                    <td>Per Person (complete as appropriate)</td>
                                                    <td>Amount requiredinAUD$
                                                    </td>
                                                    <td>Number of family members/children</td>
                                                    <td>Amount inAUD$</td>
                                                </tr>
                                                <tr>
                                                    <td>Travel</td>
                                                    <td>Yourself<hr />
                                                        Familymembers</td>
                                                    <td>Return air fare to Australia
AUD 2000
                                                       <hr />
                                                        Return air fare to Australia
AUD 2000 per family member


                                                    </td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>Tuition</td>
                                                    <td>Yourself<hr />
                                                        Children aged5-18</td>
                                                    <td>Total Course fees as per Offer
                                                        <hr />
                                                        Total Course fees as per Offer


                                                    </td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>Living</td>
                                                    <td>Yourself<hr />
                                                        Partner<hr />
                                                        Firstchild<hr />
                                                        Each additional child</td>
                                                    <td>AUD 20,209 per year
                                                       <hr />
                                                        AUD 7,100 peryear  
                                                        <hr />
                                                        AUD 3,040peryear
                                                        <hr />
                                                        AUD 3,040peryear

                                                    </td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>OSHC</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td>As per the program </td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Financial Sponsor and support details:</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>

                                                <tr>
                                                    <td>Name of Sponsor</td>
                                                    <td>
                                                        <asp:TextBox ID="txtSponsor" runat="server"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td>Relationship</td>
                                                    <td>
                                                        <asp:TextBox ID="txtRelationship" runat="server"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td>Designation</td>
                                                    <td>
                                                        <asp:TextBox ID="txtSponsarDesignation" runat="server"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td>Employers details</td>
                                                    <td>
                                                        <asp:TextBox ID="txtEmployers" runat="server"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td>Annual Income</td>
                                                    <td>
                                                        <asp:TextBox ID="txtAnnual" runat="server"></asp:TextBox></td>
                                                </tr>
                                                <tr>
                                                    <td>Last 3 Years ITR’s available</td>
                                                    <td>
                                                        <asp:RadioButton ID="rdITRYes" runat="server" GroupName="ITR" Text="Yes" />
                                                        <asp:RadioButton ID="rdITRNo" runat="server" GroupName="ITR" Text="No" /></td>
                                                </tr>
                                                <tr>
                                                    <td>Duration From</td>
                                                    <td>
                                                        <input type="text" id="txtSponsersFrom" runat="server"></td>
                                                </tr>
                                                <tr>
                                                    <td>Duration To</td>
                                                    <td>
                                                        <input type="text" id="txtSponsersTo" runat="server"></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Button ID="btnSponsers" runat="server" Text="Add Sponsers Details" OnClick="btnSponsers_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td>
                                            <asp:GridView ID="grdSponsers" runat="server"></asp:GridView>
                                        </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>
                        <tr>
                            <td class="TabArea" style="width: 578px">
                                <table>
                                    <tr>
                                        <td>Financial Sponsor and support details:</td>
                                    </tr>
                                    <tr>
                                        <td>Name of Financial Institution</td>
                                        <td>
                                            <asp:TextBox ID="txtFinancialName" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Branch Address</td>
                                        <td>
                                            <asp:TextBox ID="txtBranchAddress" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Phone number</td>
                                        <td>
                                            <asp:TextBox ID="txtBranchPhone" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Branch Managers Name </td>
                                        <td>
                                            <asp:TextBox ID="txtManagerName" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Mobile</td>
                                        <td>
                                            <asp:TextBox ID="txtManagerMobile" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Phone number</td>
                                        <td>
                                            <asp:TextBox ID="txtManagerPhoneNo" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Type of Funds</td>
                                        <td>
                                            <asp:TextBox ID="txtFundType" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Account Holder Name</td>
                                        <td>
                                            <asp:TextBox ID="txtAccountHolderName" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Relationship to the Applicant</td>
                                        <td>
                                            <asp:TextBox ID="txtRelationshipWithApplicant" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Account Number</td>
                                        <td>
                                            <asp:TextBox ID="txtAccountNo" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>Account Opening Date</td>
                                        <td>
                                            <input type="text" id="txtAccountOpeningDate" runat="server"></td>
                                    </tr>
                                    <tr>
                                        <td>Account Balance in INR</td>
                                        <td>
                                            <asp:TextBox ID="txtBalanceAmount" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnFinancial" runat="server" Text="Add Financial Details" OnClick="btnFinancial_Click" />
                                        </td>
                                    </tr>
                                </table>

                            </td>
                            <td>
                                
                                            <asp:GridView ID="grdLoans" runat="server"></asp:GridView>
                            </td>
                        </tr>
                        <tr>
                            <td>Self Assesment</td>
                        </tr>
                        <tr>
                            <td>
                                <table>
                                    <tr>
                                        <td>Personal Details</td>
                                        <td>
                                            <asp:RadioButton ID="rdPersonal1" runat="server" GroupName="Personal" Text="1" />
                                            <asp:RadioButton ID="rdPersonal2" runat="server" GroupName="Personal" Text="2" />
                                            <asp:RadioButton ID="rdPersonal3" runat="server" GroupName="Personal" Text="3" />
                                            <asp:RadioButton ID="rdPersonal4" runat="server" GroupName="Personal" Text="4" />
                                            <asp:RadioButton ID="rdPersonal5" runat="server" GroupName="Personal" Text="5" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Academic details </td>
                                        <td>
                                            <asp:RadioButton ID="rdAcademic1" runat="server" GroupName="Academic" Text="1" />
                                            <asp:RadioButton ID="rdAcademic2" runat="server" GroupName="Academic" Text="2" />
                                            <asp:RadioButton ID="rdAcademic3" runat="server" GroupName="Academic" Text="3" />
                                            <asp:RadioButton ID="rdAcademic4" runat="server" GroupName="Academic" Text="4" />
                                            <asp:RadioButton ID="rdAcademic5" runat="server" GroupName="Academic" Text="5" /></td>
                                    </tr>
                                    <tr>
                                        <td>English proficiency</td>
                                        <td>
                                            <asp:RadioButton ID="rdEnglish1" runat="server" GroupName="English" Text="1" />
                                            <asp:RadioButton ID="rdEnglish2" runat="server" GroupName="English" Text="2" />
                                            <asp:RadioButton ID="rdEnglish3" runat="server" GroupName="English" Text="3" />
                                            <asp:RadioButton ID="rdEnglish4" runat="server" GroupName="English" Text="4" />
                                            <asp:RadioButton ID="rdEnglish5" runat="server" GroupName="English" Text="5" /></td>
                                    </tr>
                                    <tr>
                                        <td>Age requirements</td>
                                        <td>
                                            <asp:RadioButton ID="rdAge1" runat="server" GroupName="Age" Text="1" />
                                            <asp:RadioButton ID="rdAge2" runat="server" GroupName="Age" Text="2" />
                                            <asp:RadioButton ID="rdAge3" runat="server" GroupName="Age" Text="3" />
                                            <asp:RadioButton ID="rdAge4" runat="server" GroupName="Age" Text="4" />
                                            <asp:RadioButton ID="rdAge5" runat="server" GroupName="Age" Text="5" /></td>
                                    </tr>
                                    <tr>
                                        <td>Financial capacity </td>
                                        <td>
                                            <asp:RadioButton ID="rdFinancial1" runat="server" GroupName="Financial" Text="1" />
                                            <asp:RadioButton ID="rdFinancial2" runat="server" GroupName="Financial" Text="2" />
                                            <asp:RadioButton ID="rdFinancial3" runat="server" GroupName="Financial" Text="3" />
                                            <asp:RadioButton ID="rdFinancial4" runat="server" GroupName="Financial" Text="4" />
                                            <asp:RadioButton ID="rdFinancial5" runat="server" GroupName="Financial" Text="5" /></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="btnSelfAssesment" runat="server" Text="Self Assesment" OnClick="btnSelfAssesment_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>

                </asp:View>
            </asp:MultiView>
        </div>
    </form>
</body>
</html>
