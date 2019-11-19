<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicanteducation.aspx.cs" Inherits="applicanteducation" MasterPageFile="~/student.master" EnableEventValidation="false" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Education Details</li>
        </ol>
        <h1 class="h2">EDUCATION DETAILS</h1>

    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">
                        <div class="card-body list-group list-group-fit">
                            <!--USI Fields -->

                        <div id="USIFields">
                             <div class="list-group-item frm-rdbtn" id="studiedbefore" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                    <div class="form-row">
                                        <label id="label1" runat="server" for="studiedbefore" class="col-md-3 col-form-label form-label">Have you studied IN <asp:label id="nameofcountry" runat="server"></asp:label> before ?</label>
                                        <div class="col-md-9">
                                            <asp:RadioButton ID="studiedYes" CssClass="form-control" runat="server" GroupName="studied" Text="Yes" />
                                            <asp:RadioButton ID="studiedNo" CssClass="form-control frm-cntrl-rdo" runat="server" GroupName="studied" Text="No" />
                                            <span class="helpicon"><i id="icstudied" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="HaveUSINo" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                    <div class="form-row">
                                        <label id="label2" runat="server" for="HaveUSINo" class="col-md-3 col-form-label form-label">Do You have an Australian  Unique Student Identifier (USI) Number?</label>
                                        <div class="col-md-9">
                                            <asp:RadioButton ID="USINumberYes" CssClass="form-control" runat="server" GroupName="USINumber" Text="Yes" />
                                            <asp:RadioButton ID="USINumberNo" CssClass="form-control frm-cntrl-rdo" runat="server" GroupName="USINumber" Text="No" />
                                            <asp:RadioButton ID="USINumberNotsure" CssClass="form-control frm-cntrl-rdo" runat="server" GroupName="USINumber" Text="I Am Not Sure" />
                                            <span class="helpicon"><i id="icUSINumber" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="USINumber" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolName">
                                    <div class="form-row">
                                        <label id="label3" runat="server" for="USINumber" class="col-md-3 col-form-label form-label">Enter Your Australian Unique Student Identifier (USI) Number Here</label>
                                        <div class="col-md-6">
                                            <input id="txtUSINumber" runat="server" type="text" class="form-control" placeholder="USI Number ">
                                            <span class="helpicon"><i id="i1" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>                            
                            <div class="list-group-item frm-rdbtn" id="haveyoustudiedininstitution" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                    <div class="form-row">
                                        <label id="label4" runat="server" for="haveyoustudiedininstitution" class="col-md-3 col-form-label form-label">HAve you studeied at <asp:label id="nameofinstitue1" runat="server"></asp:label> before?</label>
                                        <div class="col-md-9">
                                            <asp:RadioButton ID="studiedininstitutionYes" CssClass="form-control" runat="server" GroupName="studiedininstitution" Text="Yes" />
                                            <asp:RadioButton ID="studiedininstitutionNo" CssClass="form-control frm-cntrl-rdo" runat="server" GroupName="studiedininstitution" Text="No" />
                                            <span class="helpicon"><i id="i2" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="studentID" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolName">
                                    <div class="form-row">
                                        <label id="label5" runat="server" for="studentID" class="col-md-3 col-form-label form-label">Enter Your Student Number/ Student ID from <asp:label id="nameofinstitue2" runat="server"></asp:label> here</label>
                                        <div class="col-md-6">
                                            <input id="txtstudentID" runat="server" type="text" class="form-control" placeholder="Student ID">
                                            <span class="helpicon"><i id="icstudentID" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>      


                        </div>
                            <!----High School Start------>
                        <div id="highshool">
                            <div class="list-group-item frm-rdbtn" id="highschool" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                    <div class="form-row">
                                        <label id="labelhighschool" runat="server" for="highschool" class="col-md-3 col-form-label form-label">Have you completed high school?</label>
                                        <div class="col-md-9">
                                            <asp:RadioButton ID="rblHighYes" CssClass="form-control" runat="server" GroupName="highschool" Text="Yes" />
                                            <asp:RadioButton ID="rblHighNo" CssClass="form-control frm-cntrl-rdo" runat="server" GroupName="highschool" Text="No- I am currently studying for my high school qualification " />
                                            <asp:RadioButton ID="rblHighNot" CssClass="form-control" runat="server" GroupName="highschool" Text="No- I do not have a high school qualification " />
                                            <span class="helpicon"><i id="ichighschool" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="highschoolCountry" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolCountry">
                                    <div class="form-row">
                                        <label id="labelhighschoolCountry" runat="server" for="highschoolCountry" class="col-md-3 col-form-label form-label">Country of High School</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCountryHighSchool" CssClass="form-control" runat="server" AutoPostBack="false">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="ichighschoolCountry" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="highschoolstartDate" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstartDate">
                                    <div class="form-row">
                                        <label id="labelhighschoolstartDate" runat="server" for="highschoolstartDate" class="col-md-3 col-form-label form-label">Start Date </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlHighSchoolStartDateMonth" CssClass="form-control" runat="server"></asp:DropDownList>
                                            <asp:DropDownList ID="ddlHighSchoolStartDateYear" CssClass="form-control" runat="server"></asp:DropDownList>
                                            <span class="helpicon"><i id="ichighschoolstartDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="highschoolendDate" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolendateDate">
                                    <div class="form-row">
                                        <label id="labelhighschoolendDate" runat="server" for="highschoolendDate" class="col-md-3 col-form-label form-label">End Date </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlHighSchoolEndDateMonth" CssClass="form-control" runat="server"></asp:DropDownList>
                                            <asp:DropDownList ID="ddlHighSchoolEndDateYear" CssClass="form-control" runat="server"></asp:DropDownList>
                                            <span class="helpicon"><i id="ichighschoolendDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="highschoolName" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolName">
                                    <div class="form-row">
                                        <label id="labelhighschoolName" runat="server" for="highschoolName" class="col-md-3 col-form-label form-label">Name of School</label>
                                        <div class="col-md-6">
                                            <input id="txthighschoolName" runat="server" type="text" class="form-control" placeholder="Name of School">
                                            <span class="helpicon"><i id="ichighschoolName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="highschoolQualificationtype" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolQualificationtype">
                                    <div class="form-row">
                                        <label id="labelhighschoolQualificationtype" runat="server" for="highschoolQualificationtype" class="col-md-3 col-form-label form-label">Qualification Name</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlHighSchoolQualificationType" CssClass="form-control" runat="server">
                                                  <asp:ListItem value="" selected="True" >Please Select</asp:ListItem>
                                            </asp:DropDownList>
                                             <asp:HiddenField runat="server" ID="hidddlHighSchoolQualificationType"/>
                                            <span class="helpicon"><i id="ichighschoolQualificationtype" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="highschoolstudymode" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstudymode">
                                    <div class="form-row">
                                        <label id="labelhighschoolstudymode" runat="server" for="highschoolstudymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlHighSchoolStudyMode" runat="server" CssClass="form-control"></asp:DropDownList>
                                            <span class="helpicon"><i id="ichighschoolstudymode" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="highschoollanguage" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoollanguage">
                                    <div class="form-row">
                                        <label id="labelhighschoollanguage" runat="server" for="highschoollanguage" class="col-md-3 col-form-label form-label">Language (Medium) of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlHighschoolMedium" runat="server" CssClass="form-control"></asp:DropDownList>
                                            <span class="helpicon"><i id="ichighschoollanguage" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="gradetype" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-gradetype">
                                    <div class="form-row">
                                        <label id="labelgradetype" runat="server" for="EnglishCourse" class="col-md-3 col-form-label form-label">Grade Type</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlHighSchoolGrade" runat="server" CssClass="form-control"></asp:DropDownList>
                                            <span class="helpicon"><i id="icgradetype" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="highschoolgradeachieved" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-gradeachieved">
                                    <div class="form-row">
                                        <label id="labelgradeachieved" runat="server" for="gradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                                        <div class="col-md-9">
                                            <asp:RadioButton ID="rblYes" CssClass="form-control" runat="server" GroupName="HighschoolGrade" Text="Results Declared" />
                                            <asp:RadioButton ID="rblYetToConduct" CssClass="form-control" runat="server" GroupName="HighschoolGrade" Text=" Examination not conducted yet" />
                                            <asp:RadioButton ID="rblNot" runat="server" CssClass="form-control" GroupName="HighschoolGrade" Text="Examination Conducted, but Result not declared" />
                                            <span class="helpicon"><i id="ichighschoolgradeachieved" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="ExpectedHighSchoolDategrade" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedHighSchoolDategrade">
                                    <div class="form-row">
                                        <label id="labelExpectedHighSchoolDategrade" runat="server" for="EnglishCourse" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                        <div class="col-md-6">
                                            <input id="txtExpectedHighSchoolResult" runat="server" type="text" class="form-control" placeholder="" data-toggle="flatpickr" value="">
                                            <span class="helpicon"><i id="icExpectedHighSchoolDategrade" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="highschoolverify" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolverify">
                                    <div class="form-row">
                                        <label id="labelhighschoolverify" runat="server" for="highschoolverify" class="col-md-3 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                        <div class="col-md-6">

                                            <input id="txtHighSchoolVerificationName" runat="server" type="text" class="form-control" placeholder="Name of Contact who can verify this qualification">
                                            <span class="helpicon"><i id="ichighschoolverify" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="highschoolrelation" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolrelation">
                                    <div class="form-row">
                                        <label id="labelhighschoolrelation" runat="server" for="highschoolrelation" class="col-md-3 col-form-label form-label">Relationship with the Contact </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlHighSchoolVerificationRelationship" runat="server" CssClass="form-control"></asp:DropDownList>
                                            <span class="helpicon"><i id="ichighschoolrelation" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="highschoolcontactEmail" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolcontactEmail">
                                    <div class="form-row">
                                        <label id="labelhighschoolcontactEmail" runat="server" for="highschoolcontactEmail" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                                        <div class="col-md-6">
                                            <input id="txtHighSchoolcontactEmail" runat="server" type="text" class="form-control" placeholder="Email ID of Contact who can verify your employment">
                                            <span class="helpicon"><i id="ichighschoolcontactEmail" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="highschoolcontactMobile" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolcontactMobile">
                                    <div class="form-row">
                                        <label id="labelhighschoolcontactMobile" runat="server" for="highschoolcontactMobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number of Contact who can verify your qualification</label>
                                        <div class="col-md-6">
                                            <input id="txtHighSchoolcontactMobile" runat="server" type="text" class="form-control" placeholder="Mobile no of Contact who can verify">
                                            <span class="helpicon"><i id="ichighschoolcontactMobile" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                         </div>   

                        <div class="list-group-item" id="highshoolgrade" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolYear">
                                    <div class="form-row">
                                        <input type="button" runat="server" class="btn btn-success" id="btn10th" value="Add Subject and their Grades" />
                                    </div>
                                        <div class="form-row">
                                        <div class="col-md-12">                                            
                                            <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                             
                                                <table class="table" border="1" id="ContentPlaceHolder1_grd10" style="border-collapse:collapse;">
		                                        <tbody>                                                       
                                                    <tr>
			                                            <th scope="col">ID</th>
                                                        <th scope="col">Course Name</th>
                                                        <th scope="col">Subject</th>
                                                        <th scope="col">Others </th>
                                                        <th scope="col">Grade Type</th>
                                                        <th scope="col">Grade </th>
                                                        <th scope="col">Delete</th>
		                                            </tr>
                                                    <%if (grade10.Count > 0)
                                                        {
                                                            for (var i = 0; i < grade10.Count; i++)
                                                            { %>
                                                    <tr id="grade_tr_<%=grade10[i].applicantgradeid %>">
                                                        <td><%=grade10[i].applicantgradeid %></td>
                                                        <td style="width: 30px;">
                                                            <span><%=grade10[i].coursename %></span>
                                                        </td>
                                                        <td style="width: 30px;">
                                                            <span><%=grade10[i].subject%></span>
                                                        </td>
                                                        <td style="width: 30px;">
                                                            <span><%=grade10[i].othersubject%></span>
                                                        </td>
                                                        <td style="width: 30px;">
                                                            <span><%=grade10[i].gradetype%></span>
                                                        </td>
                                                        <td style="width: 30px;">
                                                            <span><%=grade10[i].studentgrade%></span>
                                                        </td>
                                                        <td>
                                                            <a href="javascript:void(0)" onclick="ConfirmOnDelete('<%=grade10[i].applicantgradeid%>','<%=grade10[i].subject%>','<%=grade10[i].coursename%>');">Delete</a>
                                                        </td>
                                                    </tr>

                                                    <% }
                                                    } %>
                                                    

		                                        </tbody>
                                            </table>
                                            </div>                                           
                                        </div>
                                    </div>                                  
                                </div>
                            </div>

                            <!----High School END------>

                            <!----Secondary Start------>
                        <div id="SecondarySection">
                                <div class="list-group-item frm-rdbtn" id="Secondary" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Secondary">
                                        <div class="form-row">
                                            <label id="labelSecondary" runat="server" for="Secondary" class="col-md-3 col-form-label form-label">Have you completed Senior Secondary school? (Year 12)?</label>
                                            <div class="col-md-9">
                                                <asp:RadioButton ID="rblSecondaryYes" CssClass="form-control" runat="server" GroupName="Secondary" Text="Yes" />
                                                <asp:RadioButton ID="rblSecondaryNo" CssClass="form-control" runat="server" GroupName="Secondary" Text="No  - I am currently still studying for my Senior Secondary " />
                                                <asp:RadioButton ID="rblSecondaryNot" CssClass="form-control" runat="server" GroupName="Secondary" Text="No - I do not have a Senior Secondary qualification" />
                                                <span class="helpicon"><i id="icSecondary" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="SecondaryCountry" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-SecondaryCountry">
                                        <div class="form-row">
                                            <label id="labelSecondaryCountry" runat="server" for="SecondaryCountry" class="col-md-3 col-form-label form-label">Country of Secondary Education</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSecondaryCountry" CssClass="form-control" AutoPostBack="false" runat="server">
                                                </asp:DropDownList>
                                                <span class="helpicon"><i id="icSecondaryCountry" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="SecondarystartDate" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-SecondarystartDate">
                                        <div class="form-row">
                                            <label id="labelSecondarystartDate" runat="server" for="SecondarystartDate" class="col-md-3 col-form-label form-label">Start Date </label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSecondaryStartDateMonth" CssClass="form-control" runat="server"></asp:DropDownList>
                                                <asp:DropDownList ID="ddlSecondaryStartDateYear" CssClass="form-control" runat="server"></asp:DropDownList>
                                                <span class="helpicon"><i id="icSecondarystartDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="SecondaryendDate" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-SecondaryendDate">
                                        <div class="form-row">
                                            <label id="labelSecondaryendDate" runat="server" for="SecondaryendDate" class="col-md-3 col-form-label form-label">End Date </label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSecondaryEndDateMonth" CssClass="form-control" runat="server"></asp:DropDownList>
                                                <asp:DropDownList ID="ddlSecondaryEndDateYear" CssClass="form-control" runat="server"></asp:DropDownList>
                                                <span class="helpicon"><i id="icSecondaryendDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="SecondaryschoolName" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-SecondaryschoolName">
                                        <div class="form-row">
                                            <label id="labelSecondaryschoolName" runat="server" for="SecondaryschoolName" class="col-md-3 col-form-label form-label">Name of School</label>
                                            <div class="col-md-6">
                                                <input id="txtSecondarySchoolName" runat="server" type="text" class="form-control" placeholder="Name of School

"><span class="helpicon"><i id="icSecondaryschoolName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="SecondaryQualificationtype" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-SecondaryQualificationtype">
                                        <div class="form-row">
                                            <label id="labelSecondaryQualificationtype" runat="server" for="SecondaryQualificationtype" class="col-md-3 col-form-label form-label">Qualification Name</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSecondaryQualificationType" CssClass="form-control" runat="server">
                                                     <asp:ListItem value="" selected="True">Please Select</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:HiddenField runat="server" ID="hidddlSecondaryQualificationType"/>
                                                <span class="helpicon"><i id="icSecondaryQualificationtype" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="Secondarystudymode" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Secondarystudymode">
                                        <div class="form-row">
                                            <label id="labelSecondarystudymode" runat="server" for="Secondarystudymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSecondaryStudyMode" runat="server" CssClass="form-control"></asp:DropDownList>
                                                <span class="helpicon"><i id="icSecondarystudymode" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="Secondarylanguage" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Secondarylanguage">
                                        <div class="form-row">
                                            <label id="labelSecondarylanguage" runat="server" for="Secondarylanguage" class="col-md-3 col-form-label form-label">Language (Medium) of Study</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSecondaryMedium" runat="server" CssClass="form-control"></asp:DropDownList>
                                                <span class="helpicon"><i id="icSecondarylanguage" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="Secondarygradetype" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Secondarygradetype">
                                        <div class="form-row">
                                            <label id="labelSecondarygradetype" runat="server" for="Secondarygradetype" class="col-md-3 col-form-label form-label">Grade Type</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSecondaryGrade" runat="server" CssClass="form-control"></asp:DropDownList>
                                                <span class="helpicon"><i id="icSecondarygradetype" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="Secondarygradeachieved" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Secondarygradeachieved">
                                        <div class="form-row">
                                            <label id="labelSecondarygradeachieved" runat="server" for="Secondarygradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                                            <div class="col-md-9">
                                                <asp:RadioButton CssClass="form-control" ID="rblSecondarygradeachievedYes" runat="server" GroupName="Secondarygradeachieved" Text="Results Declared" />
                                                <asp:RadioButton CssClass="form-control" ID="SecondarygradeachievedYet" runat="server" GroupName="Secondarygradeachieved" Text=" Examination not conducted yet" />
                                                <asp:RadioButton CssClass="form-control" ID="SecondarygradeachievedNo" runat="server" GroupName="Secondarygradeachieved" Text="Examination Conducted, but Result not declared" />
                                                <span class="helpicon"><i id="icSecondarygradeachieved" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="ExpectedSecondaryDategrade" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedSecondaryDategrade">
                                        <div class="form-row">
                                            <label id="labelExpectedSecondaryDategrade" runat="server" for="ExpectedSecondaryDategrade" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                            <div class="col-md-6">
                                                <input id="txtExpectedSecondaryResult" runat="server" type="text" class="form-control" placeholder="" data-toggle="flatpickr" value="">
                                                <span class="helpicon"><i id="icExpectedSecondaryDategrade" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="Secondaryverify" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Secondaryverify">
                                        <div class="form-row">
                                            <label id="labelSecondaryverify" runat="server" for="Secondaryverify" class="col-md-3 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                            <div class="col-md-6">
                                                <input id="txtSecondaryVerificationName" runat="server" type="text" class="form-control" placeholder="Name of Contact who can verify this qualification">
                                                <span class="helpicon"><i id="icSecondaryverify" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="secondaryschoolrelation" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-secondaryschoolrelation">
                                        <div class="form-row">
                                            <label id="labelsecondaryschoolrelation" runat="server" for="secondaryschoolrelation" class="col-md-3 col-form-label form-label">Relationship with the Contact </label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSecondaryVerificationRelationship" runat="server" CssClass="form-control"></asp:DropDownList>
                                                <span class="helpicon"><i id="icsecondaryschoolrelation" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="secondarycontactEmail" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-secondarycontactEmail">
                                        <div class="form-row">
                                            <label id="labelsecondarycontactEmail" runat="server" for="secondarycontactEmail" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                                            <div class="col-md-6">
                                                <input id="txtSecondarycontactEmail" runat="server" type="text" class="form-control" placeholder="Email ID of Contact who can verify your employment">
                                                <span class="helpicon"><i id="icsecondarycontactEmail" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="secondarycontactMobile" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-secondarycontactMobile">
                                        <div class="form-row">
                                            <label id="labelsecondarycontactMobile" runat="server" for="secondarycontactMobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number of Contact who can verify your qualification </label>
                                            <div class="col-md-6">
                                                <input id="txtSecondarycontactMobile" runat="server" type="text" class="form-control" placeholder="Mobile no of Contact who can verify">
                                                <span class="helpicon"><i id="icsecondarycontactMobile" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                               </div> 

                        <div class="list-group-item" id="secondarygrade" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolYear">
                                        <div class="form-row">
                                            <input type="button" runat="server" class="btn btn-success" id="btn12th" value="Add Subject and their Grades" />
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-12">
                                                 <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                                  <table class="table" cellspacing="0" rules="all" border="1" id="ContentPlaceHolder1_grdSecondary" style="border-collapse:collapse;">
		                                            
                                                      <tbody>
                                                            <tr>
			                                                    <th scope="col">ID</th>
                                                                <th scope="col">Course Name</th>
                                                                <th scope="col">Subject</th>
                                                                <th scope="col">Others </th>
                                                                <th scope="col">Grade Type</th>
                                                                <th scope="col">Grade </th>
                                                                <th scope="col">Delete</th>
		                                                    </tr>
                                                          <%if (gradeSecondary.Count > 0)
                                                              {
                                                                  for (var i = 0; i < gradeSecondary.Count; i++)
                                                                  {
                                                          %>
                                                          <tr id="grade_tr_<%=gradeSecondary[i].applicantgradeid %>">
                                                              <td><%=gradeSecondary[i].applicantgradeid %></td>
                                                              <td style="width: 30px;">
                                                                  <span><%=gradeSecondary[i].coursename %></span>
                                                              </td>
                                                              <td style="width: 30px;">
                                                                  <span><%=gradeSecondary[i].subject%></span>
                                                              </td>
                                                              <td style="width: 30px;">
                                                                  <span><%=gradeSecondary[i].othersubject%></span>
                                                              </td>
                                                              <td style="width: 30px;">
                                                                  <span><%=gradeSecondary[i].gradetype%></span>
                                                              </td>
                                                              <td style="width: 30px;">
                                                                  <span><%=gradeSecondary[i].studentgrade%></span>
                                                              </td>
                                                              <td>
                                                                  <a onclick="ConfirmOnDelete('<%=gradeSecondary[i].applicantgradeid%>','<%=gradeSecondary[i].subject%>','<%=gradeSecondary[i].coursename%>');" href="javascript:void(0)">Delete</a>
                                                              </td>
                                                          </tr>

                                                          <% }
                                                          }%>

		                                            </tbody>
                                                </table>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>



                            
                            <!----Secondary END------>
                            <!----Higher Education Start------>
                         <div id="HigherSectionSection">
                                <div class="list-group-item frm-rdbtn" id="higher" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higher">
                                        <div class="form-row">
                                            <label id="labelhigher" runat="server" for="higher" class="col-md-3 col-form-label form-label">
                                                Have you completed any Higher (Under Graduate, Masters or PhD) degree? 
?</label>
                                            <div class="col-md-9">
                                                <asp:RadioButton CssClass="form-control" ID="rblhigherYes" runat="server" GroupName="higher" Text="Yes" />
                                                <asp:RadioButton CssClass="form-control" ID="rblhigherNot" runat="server" GroupName="higher" Text=" I am currently studying for my higher qualification" />
                                                <asp:RadioButton CssClass="form-control" ID="rblhigherNo" runat="server" GroupName="higher" Text="No- I do not have a higher qualification " />
                                                <span class="helpicon"><i id="ichigher" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="highercourse" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highercourse">
                                        <div class="form-row">
                                            <label id="labelhighercourse" runat="server" for="highercourse" class="col-md-3 col-form-label form-label">Higher Course</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control">
                                                    <asp:ListItem Value="" Selected="True">Select Course</asp:ListItem>
                                                    <asp:ListItem Value="UG">Under Graduate</asp:ListItem>
                                                    <asp:ListItem Value="PG">Post Graduate</asp:ListItem>
                                                    <asp:ListItem Value="Phd">PhD</asp:ListItem>
                                                    <asp:ListItem Value="Other">Other</asp:ListItem>
                                                </asp:DropDownList>
                                                <span class="helpicon"><i id="ichighercourse" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="higherCountry" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherCountry">
                                        <div class="form-row">
                                            <label id="labelhigherCountry" runat="server" for="higherCountry" class="col-md-3 col-form-label form-label">Country of Higher Education</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlHigherCountry" AutoPostBack="false" CssClass="form-control" runat="server">
                                                </asp:DropDownList>
                                                <span class="helpicon"><i id="ichigherCountry" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="higherstartDate" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstartDate">
                                        <div class="form-row">
                                            <label id="labelhigherstartDate" runat="server" for="highschoolstartDate" class="col-md-3 col-form-label form-label">Start Date </label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlHigherStartDateMonth" CssClass="form-control" runat="server"></asp:DropDownList>
                                                <asp:DropDownList ID="ddlHigherStartDateYear" CssClass="form-control" runat="server"></asp:DropDownList>
                                                <span class="helpicon"><i id="ichigherstartDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="higherendDate" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherendDate">
                                        <div class="form-row">
                                            <label id="labelhigherendDate" runat="server" for="higherendDate" class="col-md-3 col-form-label form-label">End Date </label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlHigherEndDateMonth" CssClass="form-control" runat="server"></asp:DropDownList>
                                                <asp:DropDownList ID="ddlHigherEndDateYear" CssClass="form-control" runat="server"></asp:DropDownList>
                                                <span class="helpicon"><i id="ichigherendDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="higherschoolName" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherschoolName">
                                        <div class="form-row">
                                            <label id="labelhigherschoolName" runat="server" for="higherschoolName" class="col-md-3 col-form-label form-label">Name of School</label>
                                            <div class="col-md-6">
                                                <input id="txtHigherschoolName" runat="server" type="text" class="form-control" placeholder="Name of School

"><span class="helpicon"><i id="ichigherschoolName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="higherQualificationtype" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherQualificationtype">
                                        <div class="form-row">
                                            <label id="labelhigherQualificationtype" runat="server" for="higherQualificationtype" class="col-md-3 col-form-label form-label">Qualification Name</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlHigherQualificationType" CssClass="form-control" runat="server">
                                                     <asp:ListItem value="" selected="True">Please Select</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:HiddenField runat="server" ID="hidddlHigherQualificationType"/>
                                                <span class="helpicon"><i id="ichigherQualificationtype" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="higherstudymode" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherstudymode">
                                        <div class="form-row">
                                            <label id="labelhigherstudymode" runat="server" for="higherstudymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlHigherStudyMode" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                            <span class="helpicon"><i id="ichigherstudymode" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="higherlanguage" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherlanguage">
                                        <div class="form-row">
                                            <label id="labelhigherlanguage" runat="server" for="higherlanguage" class="col-md-3 col-form-label form-label">Language (Medium) of Study</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlHigherMedium" runat="server" CssClass="form-control"></asp:DropDownList>
                                                <span class="helpicon"><i id="ichigherlanguage" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="highergradetype" runat="server">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highergradetype">
                                        <div class="form-row">
                                            <label id="labelhighergradetype" runat="server" for="highergradetype" class="col-md-3 col-form-label form-label">Grade Type</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlHigherGrade" runat="server" CssClass="form-control"></asp:DropDownList>
                                                <span class="helpicon"><i id="ichighergradetype" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="highergradeachieved" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highergradeachieved">
                                        <div class="form-row">
                                            <label id="labelhighergradeachieved" runat="server" for="highergradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                                            <div class="col-md-9">
                                                <asp:RadioButton CssClass="form-control" ID="rblhighergradeachievedYes" runat="server" GroupName="highergradeachieved" Text="Results Declared" />
                                                <asp:RadioButton CssClass="form-control" ID="rblhighergradeachievedYet" runat="server" GroupName="highergradeachieved" Text=" Examination not conducted yet" />
                                                <asp:RadioButton CssClass="form-control" ID="rblhighergradeachievedNo" runat="server" GroupName="highergradeachieved" Text="Examination Conducted, but Result not declared" />
                                                <span class="helpicon"><i id="ichighergradeachieved" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="ExpectedHigherDategrade" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedHigherDategrade">
                                        <div class="form-row">
                                            <label id="labelExpectedHigherDategrade" runat="server" for="ExpectedHigherDategrade" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                            <div class="col-md-6">
                                                <input id="txtExpectedHigherDategrade" runat="server" type="text" class="form-control" placeholder="Test Date" data-toggle="flatpickr" value="">
                                                <span class="helpicon"><i id="icExpectedHigherDategrade" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="higherverify" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherverify">
                                        <div class="form-row">
                                            <label id="labelhigherverify" runat="server" for="higherverify" class="col-md-3 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                            <div class="col-md-6">
                                                <input id="txtHigherVerificationName" runat="server" type="text" class="form-control" placeholder="Name of Contact who can verify this qualification">
                                                <span class="helpicon"><i id="ichigherverify" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="higherrelation" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherrelation">
                                        <div class="form-row">
                                            <label id="labelhigherrelation" runat="server" for="highschoolrelation" class="col-md-3 col-form-label form-label">Relationship with the Contact </label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlHigherVerificationRelationship" runat="server" CssClass="form-control"></asp:DropDownList>
                                                <span class="helpicon"><i id="ichigherrelation" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="highercontactEmail" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highercontactEmail">
                                        <div class="form-row">
                                            <label id="labelhighercontactEmail" runat="server" for="highercontactEmail" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                                            <div class="col-md-6">
                                                <input id="txtHighercontactEmail" runat="server" type="text" class="form-control" placeholder="Email ID of Contact who can verify your employment">
                                                <span class="helpicon"><i id="ichighercontactEmail" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item frm-rdbtn" id="highercontactMobile" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highercontactMobile">
                                        <div class="form-row">
                                            <label id="labelhighercontactMobile" runat="server" for="highercontactMobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number who can verify this qualification </label>
                                            <div class="col-md-6">
                                                <input id="txtHighercontactMobile" runat="server" type="text" class="form-control" placeholder="Mobile/Cellular Number who can verify this qualification ">
                                                <span class="helpicon"><i id="ichighercontactMobile" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                </div>

                         <div class="list-group-item frm-rdbtn" id="highergrade" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolYear">
                                        <div class="form-row">
                                            <input type="button" runat="server" class="btn btn-success" id="btnhigher" value="Add Subject and their Grades" />
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-12">
                                                <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                                    <table class="table" border="1" id="ContentPlaceHolder1_grdHigher" style="border-collapse:collapse;">
                                                        <tbody>
                                                        <tr>
                                                            <th scope="col">ID</th>
                                                            <th scope="col">Course Name</th>
                                                            <th scope="col">Subject</th>
                                                            <th scope="col">Others </th>
                                                            <th scope="col">Grade Type</th>
                                                            <th scope="col">Grade </th>
                                                            <th scope="col">Delete</th>
                                                        </tr>
                                                            <%if (gradehigher.Count > 0)
                                                                {
                                                                    for (var i = 0; i < gradehigher.Count; i++)
                                                                    {
                                                            %>
                                                            <tr id="grade_tr_<%=gradehigher[i].applicantgradeid %>">
                                                                <td><%=gradehigher[i].applicantgradeid %></td>
                                                                <td style="width: 30px;">
                                                                    <span><%=gradehigher[i].coursename %></span>
                                                                </td>
                                                                <td style="width: 30px;">
                                                                    <span><%=gradehigher[i].subject%></span>
                                                                </td>
                                                                <td style="width: 30px;">
                                                                    <span><%=gradehigher[i].othersubject%></span>
                                                                </td>
                                                                <td style="width: 30px;">
                                                                    <span><%=gradehigher[i].gradetype%></span>
                                                                </td>
                                                                <td style="width: 30px;">
                                                                    <span><%=gradehigher[i].studentgrade%></span>
                                                                </td>
                                                                <td>
                                                                    <a onclick="ConfirmOnDelete('<%=gradehigher[i].applicantgradeid %>','<%=gradehigher[i].subject%>','<%=gradehigher[i].coursename%>');" href="javascript:void(0)">Delete</a>
                                                                </td>
                                                            </tr>

                                                            <% }
                                                            } %>
                                                    

                                                </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                         <div class="list-group-item frm-rdbtn" id="addanother" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highergrade">
                                        <div class="form-row">

                                            <div class="col-md-6">

                                                <asp:Button ID="btnAddanother" runat="server" Text="Add Another Higher Qualification" CssClass="btn btn-success" OnClick="btnAddanother_Click" />
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-12">
                                                <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                                    <asp:GridView ID="grdHigherCourses" DataKeyNames="applicanthighereducationid" runat="server" CssClass="table" AutoGenerateColumns="false" OnDataBound="grdHigherCourses_DataBound" OnRowDeleted="grdHigherCourses_RowDeleted" OnRowDeleting="grdHigherCourses_RowDeleting" OnRowEditing="grdHigherCourses_RowEditing" OnRowCommand="grdHigherCourses_RowCommand">
                                                        <Columns>

                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="id" Visible="false">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblId" runat="server"
                                                                        Text='<%#Eval("applicanthighereducationid")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Course Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblCourse" runat="server"
                                                                        Text='<%#Eval("coursename")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="School Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblSchool" runat="server"
                                                                        Text='<%#Eval("schoolname")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Start Date">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblStart" runat="server"
                                                                        Text='<%#Eval("startdate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="End Date ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEnd" runat="server"
                                                                        Text='<%#Eval("endate", "{0:dd/MM/yyyy}")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Edit" ShowHeader="False">

                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%#Eval("applicanthighereducationid")%>' CommandName="Edit" Text="Edit"></asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
                                                        </Columns>
                                                    </asp:GridView>

                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            
                            <!----Higher Education END------>
                            <!----Diploma Start------>
                         <div id="diplomadiv">
                            <div class="list-group-item frm-rdbtn" id="diploma" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diploma">
                                    <div class="form-row">
                                        <label id="labeldiploma" runat="server" for="diploma" class="col-md-3 col-form-label form-label">Have you completed any Diploma or Certificate Programs ?</label>
                                        <div class="col-md-9">
                                            <asp:RadioButton CssClass="form-control" ID="rbldiplomaYes" runat="server" GroupName="diploma" Text="Yes" />
                                            <asp:RadioButton CssClass="form-control" ID="rbldiplomaNo" runat="server" GroupName="diploma" Text="I am currently studying for my Diploma/Certificate" />
                                            <asp:RadioButton CssClass="form-control" ID="rbldiplomaNot" runat="server" GroupName="diploma" Text="No - I do not have a Diploma/Certificate qualification" />
                                            <span class="helpicon"><i id="icdiploma" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="diplomaCountry" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomaCountry">
                                    <div class="form-row">
                                        <label id="labeldiplomaCountry" runat="server" for="diplomaCountry" class="col-md-3 col-form-label form-label">Country of Diploma or Certificate Programs</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlDiplomaCountry" AutoPostBack="false" runat="server" CssClass="form-control">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="icdiplomaCountry" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="diplomastartDate" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomastartDate">
                                    <div class="form-row">
                                        <label id="labeldiplomastartDate" runat="server" for="diplomastartDate" class="col-md-3 col-form-label form-label">Start Date </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlDiplomaStartDateMonth" CssClass="form-control" runat="server"></asp:DropDownList>
                                            <asp:DropDownList ID="ddlDiplomaStartDateYear" CssClass="form-control" runat="server"></asp:DropDownList>
                                            <span class="helpicon"><i id="icdiplomastartDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="diplomaendDate" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomaendDate">
                                    <div class="form-row">
                                        <label id="labeldiplomaendDate" runat="server" for="diplomaendDate" class="col-md-3 col-form-label form-label">End Date </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlDiplomaEndDateMonth" CssClass="form-control" runat="server"></asp:DropDownList>
                                            <asp:DropDownList ID="ddlDiplomaEndDateYear" CssClass="form-control" runat="server"></asp:DropDownList>
                                            <span class="helpicon"><i id="icdiplomaendDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="diplomaschoolName" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomaschoolName">
                                    <div class="form-row">
                                        <label id="labeldiplomaschoolName" runat="server" for="diplomaschoolName" class="col-md-3 col-form-label form-label">Name of School</label>
                                        <div class="col-md-6">
                                            <input id="txtDiplomaschoolName" runat="server" type="text" class="form-control" placeholder="Name of School

"><span class="helpicon"><i id="icdiplomaschoolName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="diplomaQualificationtype" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomaQualificationtype">
                                    <div class="form-row">
                                        <label id="labeldiplomaQualificationtype" runat="server" for="diplomaQualificationtype" class="col-md-3 col-form-label form-label">Qualification Name</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlDiplomaQualificationType" CssClass="form-control" runat="server">
                                                 <asp:ListItem value="" selected="True">Please Select</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField runat="server" ID="hidddlDiplomaQualificationType"/>

                                            <span class="helpicon"><i id="icdiplomaQualificationtype" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="diplomastudymode" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomastudymode">
                                    <div class="form-row">
                                        <label id="labeldiplomastudymode" runat="server" for="diplomastudymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlDiplomaStudyMode" runat="server" CssClass="form-control"></asp:DropDownList>
                                            <span class="helpicon"><i id="icdiplomastudymode" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="diplomalanguage" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomalanguage">
                                    <div class="form-row">
                                        <label id="labeldiplomalanguage" runat="server" for="diplomalanguage" class="col-md-3 col-form-label form-label">Language (Medium) of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlDiplomaMedium" runat="server" CssClass="form-control"></asp:DropDownList>
                                            <span class="helpicon"><i id="icdiplomalanguage" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="diplomagradetype" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomagradetype">
                                    <div class="form-row">
                                        <label id="labeldiplomagradetype" runat="server" for="diplomagradetype" class="col-md-3 col-form-label form-label">Grade Type</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlDiplomaGrade" runat="server" CssClass="form-control"></asp:DropDownList>
                                            <span class="helpicon"><i id="icdiplomagradetype" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="diplomagradeachieved" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomagradeachieved">
                                    <div class="form-row">
                                        <label id="labeldiplomagradeachieved" runat="server" for="diplomagradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                                        <div class="col-md-9">
                                            <asp:RadioButton CssClass="form-control" ID="rblDiplomaGradeYes" runat="server" GroupName="DiplomaGrade" Text="Results Declared" />
                                            <asp:RadioButton CssClass="form-control" ID="rblDiplomaGradeYet" runat="server" GroupName="DiplomaGrade" Text=" Examination not conducted yet" />
                                            <asp:RadioButton CssClass="form-control" ID="rblDiplomaGradeNot" runat="server" GroupName="DiplomaGrade" Text="Examination Conducted, but Result not declared" />
                                            <span class="helpicon"><i id="icdiplomagradeachieved" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="ExpectedDiplomaDategrade" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedDiplomaDategrade">
                                    <div class="form-row">
                                        <label id="labelExpectedDiplomaDategrade" runat="server" for="ExpectedDiplomaDategrade" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                        <div class="col-md-6">
                                            <input id="txtExpectedDiplomaResult" runat="server" type="text" class="form-control" placeholder="Test Date" data-toggle="flatpickr" value="">
                                            <span class="helpicon"><i id="icExpectedDiplomaDategrade" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="diplomaverify" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomaverify">
                                    <div class="form-row">
                                        <label id="labeldiplomaverify" runat="server" for="diplomaverify" class="col-md-3 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                        <div class="col-md-6">
                                            <input id="txtDiplomaVerificationName" runat="server" type="text" class="form-control" placeholder="Name of Contact who can verify this qualification">
                                            <span class="helpicon"><i id="icdiplomaverify" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="diplomarelation" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomarelation">
                                    <div class="form-row">
                                        <label id="labeldiplomarelation" runat="server" for="diplomarelation" class="col-md-3 col-form-label form-label">Relationship with the Contact </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlDiplomaVerificationRelationship" runat="server" CssClass="form-control"></asp:DropDownList>

                                            <span class="helpicon"><i id="icdiplomarelation" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="diplomacontactEmail" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomacontactEmail">
                                    <div class="form-row">
                                        <label id="labeldiplomacontactEmail" runat="server" for="diplomacontactEmail" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your employment  </label>
                                        <div class="col-md-6">
                                            <input id="txtDiplomacontactEmail" runat="server" type="text" class="form-control" placeholder="Email ID of Contact who can verify your employment">
                                            <span class="helpicon"><i id="icdiplomacontactEmail" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="diplomacontactMobile" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomacontactMobile">
                                    <div class="form-row">
                                        <label id="labeldiplomacontactMobile" runat="server" for="diplomacontactMobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number who can verify this qualification </label>
                                        <div class="col-md-6">
                                            <input id="txtDiplomacontactMobile" runat="server" type="text" class="form-control" placeholder="Mobile/Cellular Number who can verify this qualification ">
                                            <span class="helpicon"><i id="icdiplomacontactMobile" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                </div>

                          <div class="list-group-item" id="diplomagrade" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolYear">
                                    <div class="form-row">
                                        <input type="button" runat="server" class="btn btn-success" id="btndiploma" value="Add Subject and their Grades" />
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-12">
                                            <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                                 <table class="table" cellspacing="0" rules="all" border="1" id="ContentPlaceHolder1_grdDiploma" style="border-collapse:collapse;">
                                                     <tbody>
                                                            <tr>
                                                                <th scope="col">ID</th>
                                                                <th scope="col">Course Name</th>
                                                                <th scope="col">Subject</th>
                                                                <th scope="col">Others </th>
                                                                <th scope="col">Grade Type</th>
                                                                <th scope="col">Grade </th>
                                                                <th scope="col">Delete</th>
                                                            </tr>
                                                         <%if (gradediploma.Count > 0)
                                                             {
                                                                 for (var i = 0; i < gradediploma.Count; i++)
                                                                 {
                                                         %>
                                                         <tr id="grade_tr_<%=gradediploma[i].applicantgradeid %>">
                                                             <td><%=gradediploma[i].applicantgradeid %></td>
                                                             <td style="width: 30px;">
                                                                 <span><%=gradediploma[i].coursename %></span>
                                                             </td>
                                                             <td style="width: 30px;">
                                                                 <span><%=gradediploma[i].subject%></span>
                                                             </td>
                                                             <td style="width: 30px;">
                                                                 <span><%=gradediploma[i].othersubject%></span>
                                                             </td>
                                                             <td style="width: 30px;">
                                                                 <span><%=gradediploma[i].gradetype%></span>
                                                             </td>
                                                             <td style="width: 30px;">
                                                                 <span><%=gradediploma[i].studentgrade%></span>
                                                             </td>
                                                             <td>
                                                                 <a onclick="ConfirmOnDelete('<%=gradediploma[i].applicantgradeid%>','<%=gradediploma[i].subject%>','<%=gradediploma[i].coursename%>');" href="javascript:void(0)">Delete</a>
                                                             </td>
                                                         </tr>

                                                         <% }
                                                             } %>
                                                        

                                                    </tbody>
                                                 </table>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!----Diploma END------>
                            <div id="mainDiv" runat="server"></div>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row justify-content-between">
                                        <asp:Button ID="btn_Save" runat="server" Text="Save Changes" OnClientClick="return validateForm()" CssClass="btn btn-success" OnClick="btn_Save_Click" />
                                        <asp:Button ID="gotoNextPage" runat="server" Text="Go To English Competency" CssClass="btn btn-success" OnClick="gotoNextPage_Click" OnClientClick="return validateForm()"/>
                                        <div class="col-md-6">
                                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="lblSaveTime" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    </div>
                    <div class="col-md-4">
                        <div class="banImg-wrp">
                           <img src="/assets/images/Banner1.jpg" class="img-fluid">
                        </div>
                    <div class="card faq-qwrp" id="questions" runat="server">
							
                            <div class="card-body">
                            <%  if (allQuestions.Count > 0)
                                { %>
                            <div id="question" runat="server">
                                    <h5>FAQ's</h5>
                                    <div class="">
                                    <%for (int q = 0; q < allQuestions.Count; q++)
                                        {%>  <div class="star-list">                                                             
                                               <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer%>')">  <%=allQuestions[q].question%> </label>
                                            </div>                                                  
                                    <%} %>
                                </div>
                            </div>      
                                <%} %>  
                                     
                            </div>
                        </div>
                     </div>                
                
                <div id="page-nav" class="col-lg-auto page-nav">

                    <div>
                        <span id="tooltip"></span>
                    </div>


                </div>

            </div>
        </div>

        <div class="container page__container">
            <div class="footer">
            </div>

        </div>
    </div>
    <script>
        $(document).ready(function () {
            $('.fa-info-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });
            var input = document.querySelector("#<%=txtHighSchoolcontactMobile.ClientID%>");
            window.intlTelInput(input, {
                utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
            });
            var input = document.querySelector("#<%=txtSecondarycontactMobile.ClientID%>");
            window.intlTelInput(input, {
                utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
            });
            var input = document.querySelector("#<%=txtHighercontactMobile.ClientID%>");
            window.intlTelInput(input, {
                utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
            });
            var input = document.querySelector("#<%=txtDiplomacontactMobile.ClientID%>");
            window.intlTelInput(input, {
                utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
            });

            // Attach Button click event listener 

            var left = ($(window).width() / 2) - (700 / 2),
                top = ($(window).height() / 2) - (500 / 2);
            
            $("#<%=btn10th.ClientID%>").click(function () {
                var country = $("#<%=ddlCountryHighSchool.ClientID%>").val();
                var grade = $("#<%=ddlHighSchoolGrade.ClientID%>").val();
                var course = "tenth";
                var w = window.open("/addgrade.aspx?formid=13&g=" + grade + "&c=" + course + "&country=" + country, 'popupWindow', 'scrollbars=no,width=screen.width,height = screen.height,fullscreen=yes,top='+top+',left='+left);

            });
            $("#<%=btn12th.ClientID%>").click(function () {
                var country = $("#<%=ddlSecondaryCountry.ClientID%>").val();
                var grade = $("#<%=ddlSecondaryGrade.ClientID%>").val();
                var course = "twelth";
                var w = window.open("/addgrade.aspx?formid=13&g=" + grade + "&c=" + course + "&country=" + country, 'popupWindow', 'scrollbars=no,width=screen.width,height=screen.height,fullscreen=yes,top='+top+',left='+left);

            });
            $("#<%=btnhigher.ClientID%>").click(function () {
                var country = $("#<%=ddlHigherCountry.ClientID%>").val();
                var grade = $("#<%=ddlHigherGrade.ClientID%>").val();
                var course = $("#<%=ddlCourse.ClientID%>").val();
                var w = window.open("/addgrade.aspx?formid=13&g=" + grade + "&c=" + course + "&country=" + country, 'popupWindow', 'scrollbars=no,width=screen.width,height=screen.height,fullscreen=yes,top='+top+',left='+left);

            });
            $("#<%=btndiploma.ClientID%>").click(function () {
                var country = $("#<%=ddlDiplomaCountry.ClientID%>").val();
                var grade = $("#<%=ddlDiplomaGrade.ClientID%>").val();
                var course = "diploma";
                var w = window.open("/addgrade.aspx?formid=13&g=" + grade + "&c=" + course + "&country=" + country, 'popupWindow', 'scrollbars=no,width=screen.width,height=screen.height,fullscreen=yes,top='+top+',left='+left);

            });

            ToggleDiploma();
            ToggleHigherEducatin();
            ToggleSecondary();
            ToggleHighSchool();
            //USI
            if ($("#<%=studiedNo.ClientID%>").is(":checked"))
            {
                $("#<%=HaveUSINo.ClientID%>").hide();
                $("#<%=USINumber.ClientID%>").hide();
                $("#<%=haveyoustudiedininstitution.ClientID%>").hide();
                $("#<%=studentID.ClientID%>").hide();
            }
            else if ($("#<%=studiedYes.ClientID%>").is(":checked")) 
                $("#<%=HaveUSINo.ClientID%>").show();

            if ($("#<%=USINumberYes.ClientID%>").is(":checked")) {
                $("#<%=USINumber.ClientID%>").show();
                $("#<%=haveyoustudiedininstitution.ClientID%>").hide();
                $("#<%=studentID.ClientID%>").hide();
            }
            else if ($("#<%=USINumberNo.ClientID%>").is(":checked") || $("#<%=USINumberNotsure.ClientID%>").is(":checked")) 
            {                
                $("#<%=haveyoustudiedininstitution.ClientID%>").show();
                $("#<%=studentID.ClientID%>").hide();
            }

            if ($("#<%=studiedininstitutionYes.ClientID%>").is(":checked")) 
                $("#<%=studentID.ClientID%>").show();
            else
                $("#<%=studentID.ClientID%>").hide();

        });
        //USI NUmber
         $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$studied']").click(function () {
                if ($("#<%=studiedNo.ClientID%>").is(":checked")) {
                    $("#<%=HaveUSINo.ClientID%>").hide();
                    $("#<%=USINumber.ClientID%>").hide();
                    $("#<%=haveyoustudiedininstitution.ClientID%>").hide();
                    $("#<%=studentID.ClientID%>").hide();
                }
                else if ($("#<%=studiedYes.ClientID%>").is(":checked")) 
                    $("#<%=HaveUSINo.ClientID%>").show();

            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$USINumber']").click(function () {
                if ($("#<%=USINumberYes.ClientID%>").is(":checked")) {
                    $("#<%=USINumber.ClientID%>").show();
                    $("#<%=haveyoustudiedininstitution.ClientID%>").hide();
                    $("#<%=studentID.ClientID%>").hide();
                }
                else if ($("#<%=USINumberNo.ClientID%>").is(":checked") || $("#<%=USINumberNotsure.ClientID%>").is(":checked")) 
                {
                    $("#<%=USINumber.ClientID%>").hide();
                    $("#<%=haveyoustudiedininstitution.ClientID%>").show();
                    $("#<%=studentID.ClientID%>").hide();
                }
            });
        });
         $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$studiedininstitution']").click(function () {
                if ($("#<%=studiedininstitutionYes.ClientID%>").is(":checked")) 
                    $("#<%=studentID.ClientID%>").show();
                else
                    $("#<%=studentID.ClientID%>").hide();
            });
        });
        function refreshGrid(gradeid, mode, course, subject, otherSubject, gradeType, grade)
         {             
                if (course == "tenth")
                {
                    if (mode == "new") 
                        $('#ContentPlaceHolder1_grd10').append('<tr id=grade_tr_' +gradeid + '><td>' + gradeid + '</td><td>' + course + '</td><td>' + subject + '</td><td>' + otherSubject + '</td><td>' + gradeType + '</td><td>' + grade + '</td><td><a onclick="return ConfirmOnDelete(' + gradeid +',\'' + subject +'\',\'' +course + '\');" href="javascript:void(0)">Delete</a></td></tr>');                        
                    else
                        $("#ContentPlaceHolder1_grd10").find('#grade_tr_' + gradeid).html('<td>' + gradeid + '</td><td>' + course + '</td><td>' + subject + '</td><td>' + otherSubject + '</td><td>' + gradeType + '</td><td>' + grade + '</td><td><a onclick="return ConfirmOnDelete(' + gradeid +',\'' + subject +'\',\'' +course + '\');" href="javascript:void(0)">Delete</a></td>');
                }
                else if (course == "twelth")
                {  
                    if (mode == "new")
                        $('#ContentPlaceHolder1_grdSecondary').append('<tr id=grade_tr_' +gradeid + '><td>' + gradeid + '</td><td>' + course + '</td><td>' + subject + '</td><td>' + otherSubject + '</td><td>' + gradeType + '</td><td>' + grade + '</td><td><a onclick="return ConfirmOnDelete(' + gradeid +',\'' + subject +'\',\'' +course + '\');" href="javascript:void(0)">Delete</a></td></tr>');
                    else
                        $("#ContentPlaceHolder1_grdSecondary").find('#grade_tr_' + gradeid).html('<td>' + gradeid + '</td><td>' + course + '</td><td>' + subject + '</td><td>' + otherSubject + '</td><td>' + gradeType + '</td><td>' + grade + '</td><td><a onclick="return ConfirmOnDelete(' + gradeid +',\'' + subject +'\',\'' +course + '\');" href="javascript:void(0)">Delete</a></td>');
                    
                }
                else if (course == "UG" || course == "PG" || course == "Phd" || course == "Other" )
                {
                    if (mode == "new")
                        $('#ContentPlaceHolder1_grdHigher').append('<tr id=grade_tr_' +gradeid + '><td>' + gradeid + '</td><td>' + course + '</td><td>' + subject + '</td><td>' + otherSubject + '</td><td>' + gradeType + '</td><td>' + grade + '</td><td><a onclick="return ConfirmOnDelete(' + gradeid +',\'' + subject +'\',\'' +course + '\');" href="javascript:void(0)">Delete</a></td></tr>');
                    else
                        $("#ContentPlaceHolder1_grdHigher").find('#grade_tr_' + gradeid).html('<td>' + gradeid + '</td><td>' + course + '</td><td>' + subject + '</td><td>' + otherSubject + '</td><td>' + gradeType + '</td><td>' + grade + '</td><td><a onclick="return ConfirmOnDelete(' + gradeid +',\'' + subject +'\',\'' +course + '\');" href="javascript:void(0)">Delete</a></td>');
                }
                else if (course == "diploma")
                {
                    if (mode == "new")
                        $('#ContentPlaceHolder1_grdDiploma').append('<tr id=grade_tr_' +gradeid + '><td>' + gradeid + '</td><td>' + course + '</td><td>' + subject + '</td><td>' + otherSubject + '</td><td>' + gradeType + '</td><td>' + grade + '</td><td><a onclick="return ConfirmOnDelete(' + gradeid +',\'' + subject +'\',\'' +course + '\');" href="javascript:void(0)">Delete</a></td></tr>');
                    else
                        $("#ContentPlaceHolder1_grdDiploma").find('#grade_tr_' + gradeid).html('<td>' + gradeid + '</td><td>' + course + '</td><td>' + subject + '</td><td>' + otherSubject + '</td><td>' + gradeType + '</td><td>' + grade + '</td><td><a onclick="return ConfirmOnDelete' + gradeid +',\'' + subject +'\',\'' +course + '\');" href="javascript:void(0)">Delete</a></td>');    
                }
         }
          function ConfirmOnDelete(recordID, subject, coursename) {
            if (confirm("Are you sure wants to delete record of " + coursename + " of Subject "+ subject + "")) {
                $.ajax({
                    type: "POST",
                    url: "applicanteducation.aspx/RemoveSubjectData",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'recordID': '" + recordID + "'}",
                    success: function (result) {
                        if (result) {
                            $("#grade_tr_" + recordID + "").remove();
                            alert("Record Deleted Successfully");
                        }
                    }
                });

            }
        }
                
        //Handle High School
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$highschool']").click(function () {
                ToggleHighSchool();
            });
        });
        //handle higher secondary
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$Secondary']").click(function () {
                ToggleSecondary();
            });
        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$higher']").click(function () {
                ToggleHigherEducatin();
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$diploma']").click(function () {
                ToggleDiploma();
            });
        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$HighschoolGrade']").click(function () {
                if ($("#<%=rblYes.ClientID%>").is(":checked")) {
                    $("#<%=ExpectedHighSchoolDategrade.ClientID%>").hide();
                }
                else {
                    $("#<%=ExpectedHighSchoolDategrade.ClientID%>").show();
                }
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$DiplomaGrade']").click(function () {
                if ($("#<%=rblDiplomaGradeYes.ClientID%>").is(":checked")) {
                    $("#<%=ExpectedDiplomaDategrade.ClientID%>").hide();
                }
                else {
                    $("#<%=ExpectedDiplomaDategrade.ClientID%>").show();
                }
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$Secondarygradeachieved']").click(function () {
                if ($("#<%=rblSecondarygradeachievedYes.ClientID%>").is(":checked")) {
                    $("#<%=ExpectedSecondaryDategrade.ClientID%>").hide();
                }
                else {
                    $("#<%=ExpectedSecondaryDategrade.ClientID%>").show();
                }
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$highergradeachieved']").click(function () {
                if ($("#<%=rblhighergradeachievedYes.ClientID%>").is(":checked")) {
                    $("#<%=ExpectedHigherDategrade.ClientID%>").hide();
                }
                else {
                    $("#<%=ExpectedHigherDategrade.ClientID%>").show();
                }
            });
        });

        function ToggleDiploma() {
            if ($("#<%=rbldiplomaYes.ClientID%>").is(":checked")) {
                $("#<%=diplomaCountry.ClientID%>").show();
                $("#<%=diplomastartDate.ClientID%>").show();
                $("#<%=diplomaendDate.ClientID%>").show();
                $("#<%=diplomaschoolName.ClientID%>").show();
                $("#<%=diplomaQualificationtype.ClientID%>").show();
                $("#<%=diplomastudymode.ClientID%>").show();
                $("#<%=diplomalanguage.ClientID%>").show();
                $("#<%=diplomagradetype.ClientID%>").show();
                $("#<%=diplomagradeachieved.ClientID%>").show();
                $("#<%=ExpectedDiplomaDategrade.ClientID%>").show();
                $("#<%=diplomaverify.ClientID%>").show();
                $("#<%=diplomarelation.ClientID%>").show();
                $("#<%=diplomacontactEmail.ClientID%>").show();
                $("#<%=diplomagrade.ClientID%>").show();
                $("#<%=diplomacontactMobile.ClientID%>").show();

            }
            else if ($("#<%=rbldiplomaNo.ClientID%>").is(":checked")) {
                $("#<%=diplomaCountry.ClientID%>").show();
                $("#<%=diplomastartDate.ClientID%>").show();
                $("#<%=diplomaendDate.ClientID%>").show();
                $("#<%=diplomaschoolName.ClientID%>").show();
                $("#<%=diplomaQualificationtype.ClientID%>").show();
                $("#<%=diplomastudymode.ClientID%>").show();
                $("#<%=diplomalanguage.ClientID%>").show();
                $("#<%=diplomagradetype.ClientID%>").show();
                $("#<%=diplomagradeachieved.ClientID%>").show();
                $("#<%=ExpectedDiplomaDategrade.ClientID%>").show();
                $("#<%=diplomaverify.ClientID%>").hide();
                $("#<%=diplomarelation.ClientID%>").hide();
                $("#<%=diplomacontactEmail.ClientID%>").hide();
                $("#<%=diplomagrade.ClientID%>").hide();
                $("#<%=diplomacontactMobile.ClientID%>").hide();
            }
            else {
                $("#<%=diplomaCountry.ClientID%>").hide();
                $("#<%=diplomastartDate.ClientID%>").hide();
                $("#<%=diplomaendDate.ClientID%>").hide();
                $("#<%=diplomaschoolName.ClientID%>").hide();
                $("#<%=diplomaQualificationtype.ClientID%>").hide();
                $("#<%=diplomastudymode.ClientID%>").hide();
                $("#<%=diplomalanguage.ClientID%>").hide();
                $("#<%=diplomagradetype.ClientID%>").hide();
                $("#<%=diplomagradeachieved.ClientID%>").hide();
                $("#<%=ExpectedDiplomaDategrade.ClientID%>").hide();
                $("#<%=diplomaverify.ClientID%>").hide();
                $("#<%=diplomarelation.ClientID%>").hide();
                $("#<%=diplomacontactEmail.ClientID%>").hide();
                $("#<%=diplomagrade.ClientID%>").hide();
                $("#<%=diplomacontactMobile.ClientID%>").hide();
            }
        }
        function ToggleHigherEducatin() {
            if ($("#<%=rblhigherYes.ClientID%>").is(":checked")) {
                $("#<%=highercourse.ClientID%>").show();
                $("#<%=higherCountry.ClientID%>").show();
                $("#<%=higherstartDate.ClientID%>").show();
                $("#<%=higherendDate.ClientID%>").show();
                $("#<%=higherschoolName.ClientID%>").show();
                $("#<%=higherQualificationtype.ClientID%>").show();
                $("#<%=higherstudymode.ClientID%>").show();
                $("#<%=higherlanguage.ClientID%>").show();
                $("#<%=highergradetype.ClientID%>").show();
                $("#<%=highergradeachieved.ClientID%>").show();
                $("#<%=ExpectedHigherDategrade.ClientID%>").hide();
                $("#<%=higherverify.ClientID%>").show();
                $("#<%=higherrelation.ClientID%>").show();
                $("#<%=highercontactEmail.ClientID%>").show();
                $("#<%=highergrade.ClientID%>").show();
                $("#<%=addanother.ClientID%>").show();
                $("#<%=highercontactMobile.ClientID%>").show();
            }
            else if ($("#<%=rblhigherNot.ClientID%>").is(":checked")) {
                $("#<%=highercourse.ClientID%>").show();
                $("#<%=higherCountry.ClientID%>").show();
                $("#<%=higherstartDate.ClientID%>").show();
                $("#<%=higherendDate.ClientID%>").show();
                $("#<%=higherschoolName.ClientID%>").show();
                $("#<%=higherQualificationtype.ClientID%>").show();
                $("#<%=higherstudymode.ClientID%>").show();
                $("#<%=higherlanguage.ClientID%>").show();
                $("#<%=highergradetype.ClientID%>").show();
                $("#<%=highergradeachieved.ClientID%>").show();
                $("#<%=ExpectedHigherDategrade.ClientID%>").show();
                $("#<%=higherverify.ClientID%>").hide();
                $("#<%=higherrelation.ClientID%>").hide();
                $("#<%=highercontactEmail.ClientID%>").hide();
                $("#<%=highergrade.ClientID%>").hide();
                $("#<%=addanother.ClientID%>").hide();
                $("#<%=highercontactMobile.ClientID%>").hide();
            }
            else {
                $("#<%=highercourse.ClientID%>").hide();
                $("#<%=higherCountry.ClientID%>").hide();
                $("#<%=higherstartDate.ClientID%>").hide();
                $("#<%=higherendDate.ClientID%>").hide();
                $("#<%=higherschoolName.ClientID%>").hide();
                $("#<%=higherQualificationtype.ClientID%>").hide();
                $("#<%=higherstudymode.ClientID%>").hide();
                $("#<%=higherlanguage.ClientID%>").hide();
                $("#<%=highergradetype.ClientID%>").hide();
                $("#<%=highergradeachieved.ClientID%>").hide();
                $("#<%=ExpectedHigherDategrade.ClientID%>").hide();
                $("#<%=higherverify.ClientID%>").hide();
                $("#<%=higherrelation.ClientID%>").hide();
                $("#<%=highercontactEmail.ClientID%>").hide();
                $("#<%=highergrade.ClientID%>").hide();
                $("#<%=addanother.ClientID%>").hide();
                $("#<%=highercontactMobile.ClientID%>").hide();
            }
        }
        function ToggleSecondary() {
            if ($("#<%=rblSecondaryYes.ClientID%>").is(":checked")) {
                $("#<%=SecondaryCountry.ClientID%>").show();
                $("#<%=SecondarystartDate.ClientID%>").show();
                $("#<%=SecondaryendDate.ClientID%>").show();
                $("#<%=Secondarystudymode.ClientID%>").show();
                $("#<%=Secondarylanguage.ClientID%>").show();
                $("#<%=Secondarygradetype.ClientID%>").show();
                $("#<%=Secondarygradeachieved.ClientID%>").show();
                $("#<%=ExpectedSecondaryDategrade.ClientID%>").hide();
                $("#<%=Secondaryverify.ClientID%>").show();
                $("#<%=secondaryschoolrelation.ClientID%>").show();
                $("#<%=SecondaryschoolName.ClientID%>").show();
                $("#<%=SecondaryQualificationtype.ClientID%>").show();
                $("HigherSectionSection").show();
                $("#<%=secondarycontactEmail.ClientID%>").show();
                $("#SecondaryEducation").hide();
                $("#<%=higher.ClientID%>").show();
                $("#<%=secondarygrade.ClientID%>").show();
                $("#<%=secondarycontactMobile.ClientID%>").show();
            }
            else if ($("#<%=rblSecondaryNo.ClientID%>").is(":checked")) {
                $("#<%=SecondaryCountry.ClientID%>").show();
                $("#<%=SecondarystartDate.ClientID%>").show();
                $("#<%=SecondaryendDate.ClientID%>").show();
                $("#<%=Secondarystudymode.ClientID%>").show();
                $("#<%=Secondarylanguage.ClientID%>").show();
                $("#<%=Secondarygradetype.ClientID%>").show();
                $("#<%=Secondarygradeachieved.ClientID%>").show();
                $("#<%=ExpectedSecondaryDategrade.ClientID%>").hide();
                $("#<%=Secondaryverify.ClientID%>").hide();
                $("#<%=secondaryschoolrelation.ClientID%>").hide();
                $("#<%=SecondaryschoolName.ClientID%>").hide();
                $("#<%=secondarycontactEmail.ClientID%>").hide();
                $("#<%=SecondaryQualificationtype.ClientID%>").show();
                $("#<%=secondarygrade.ClientID%>").hide();
                $("#<%=secondarycontactMobile.ClientID%>").hide();
            }
            else {
                $("#<%=SecondaryCountry.ClientID%>").hide();
                $("#<%=SecondarystartDate.ClientID%>").hide();
                $("#<%=SecondaryendDate.ClientID%>").hide();
                $("#<%=Secondarystudymode.ClientID%>").hide();
                $("#<%=Secondarylanguage.ClientID%>").hide();
                $("#<%=Secondarygradetype.ClientID%>").hide();
                $("#<%=Secondarygradeachieved.ClientID%>").hide();
                $("#<%=ExpectedSecondaryDategrade.ClientID%>").hide();
                $("#<%=Secondaryverify.ClientID%>").hide();
                $("#<%=secondaryschoolrelation.ClientID%>").hide();
                $("#<%=SecondaryschoolName.ClientID%>").hide();
                $("#<%=SecondaryQualificationtype.ClientID%>").hide();
                $("#HigherSectionSection").show();
                $("#<%=secondarycontactEmail.ClientID%>").hide();
                $("#SecondaryEducation>").hide();
                $("#<%=secondarygrade.ClientID%>").hide();
                $("#<%=secondarycontactMobile.ClientID%>").hide();
            }
        }
        function ToggleHighSchool() {
            if ($("#<%=rblHighYes.ClientID%>").is(":checked")) {
                $("#<%=highschoolCountry.ClientID%>").show();
                $("#<%=highschoolstartDate.ClientID%>").show();
                $("#<%=highschoolendDate.ClientID%>").show();
                $("#<%=highschoolstudymode.ClientID%>").show();
                $("#<%=highschoollanguage.ClientID%>").show();
                $("#<%=gradetype.ClientID%>").show();
                $("#<%=highschoolgradeachieved.ClientID%>").show();
                $("#<%=ExpectedHighSchoolDategrade.ClientID%>").hide();
                $("#<%=highschoolverify.ClientID%>").show();
                $("#<%=highschoolrelation.ClientID%>").show();
                $("#<%=highschoolcontactEmail.ClientID%>").show();
                $("#highschoolYear").show();
                $("#<%=highschoolName.ClientID%>").show();
                $("#<%=highschoolQualificationtype.ClientID%>").show();
                $("#<%=highshoolgrade.ClientID%>").show();
                $("#<%=highschoolcontactMobile.ClientID%>").show();
                $("#SecondarySection").show();
            }
            else if ($("#<%=rblHighNo.ClientID%>").is(":checked")) {
                $("#<%=highschoolCountry.ClientID%>").show();
                $("#<%=highschoolstartDate.ClientID%>").show();
                $("#<%=highschoolendDate.ClientID%>").show();
                $("#<%=highschoolstudymode.ClientID%>").show();
                $("#<%=highschoollanguage.ClientID%>").show();
                $("#<%=gradetype.ClientID%>").show();
                $("#<%=highschoolgradeachieved.ClientID%>").show();
                $("#<%=ExpectedHighSchoolDategrade.ClientID%>").show();
                $("#<%=highschoolverify.ClientID%>").hide();
                $("#<%=highschoolrelation.ClientID%>").hide();
                $("#<%=highschoolcontactEmail.ClientID%>").hide();
                $("#highschoolYear").show();
                $("#<%=highschoolName.ClientID%>").show();
                $("#<%=highschoolQualificationtype.ClientID%>").show();                
                $("#SecondarySection").hide();
                $("#<%=highshoolgrade.ClientID%>").hide();
                $("#<%=highschoolcontactMobile.ClientID%>").hide();
            }
            else {
                $("#<%=highschoolCountry.ClientID%>").hide();
                $("#<%=highschoolstartDate.ClientID%>").hide();
                $("#<%=highschoolendDate.ClientID%>").hide();
                $("#<%=highschoolstudymode.ClientID%>").hide();
                $("#<%=highschoollanguage.ClientID%>").hide();
                $("#<%=gradetype.ClientID%>").hide();
                $("#<%=highschoolgradeachieved.ClientID%>").hide();
                $("#<%=ExpectedHighSchoolDategrade.ClientID%>").hide();
                $("#<%=highschoolverify.ClientID%>").hide();
                $("#<%=highschoolrelation.ClientID%>").hide();
                $("#<%=highschoolcontactEmail.ClientID%>").hide();
                $("#highschoolYear").hide();
                $("#<%=highschoolName.ClientID%>").hide();
                $("#<%=highschoolQualificationtype.ClientID%>").hide();
                $("#SecondarySection").hide();
                $("#<%=highshoolgrade.ClientID%>").hide();
                $("#<%=highschoolcontactMobile.ClientID%>").hide();

            }
        }        

        function isValidHighSchoolDates() {
            var highStartMonth = parseInt($("#<%=ddlHighSchoolStartDateMonth.ClientID%>").val());
            var highStartYear = parseInt($("#<%=ddlHighSchoolStartDateYear.ClientID%>").val());
            var highEndMonth = parseInt($("#<%=ddlHighSchoolEndDateMonth.ClientID%>").val());
            var highEndYear = parseInt($("#<%=ddlHighSchoolEndDateYear.ClientID%>").val());

            var startDate = new Date(highStartYear, highStartMonth);
            var endDate = new Date(highEndYear, highEndMonth);

            if (startDate > endDate) {
                alert("Please enter valid high school completion date");
                return false;
            }
            else
                return true;
        }

        function isValidSecondarySchoolDates() {
            var secondStartMonth = parseInt($("#<%=ddlSecondaryStartDateMonth.ClientID%>").val());
            var secondStartYear = parseInt($("#<%=ddlSecondaryStartDateYear.ClientID%>").val());
            var secondEndMonth = parseInt($("#<%=ddlSecondaryEndDateMonth.ClientID%>").val());
            var secondEndYear = parseInt($("#<%=ddlSecondaryEndDateYear.ClientID%>").val());

            var startDate = new Date(secondStartYear, secondStartMonth);
            var endDate = new Date(secondEndYear, secondEndMonth);

            new Date()
            if (startDate > endDate) {
                alert("Please enter valid secondary school completion date");
                return false;
            }
            else
                return true;
        }

        function isValidHigherEduDates() {
            var higherStartMonth = parseInt($("#<%=ddlHigherStartDateMonth.ClientID%>").val());
            var higherStartYear = parseInt($("#<%=ddlHigherStartDateYear.ClientID%>").val());
            var higherEndMonth = parseInt($("#<%=ddlHigherEndDateMonth.ClientID%>").val());
            var higherEndYear = parseInt($("#<%=ddlHigherEndDateYear.ClientID%>").val());

            var startDate = new Date(higherStartYear, higherEndMonth);
            var endDate = new Date(higherEndYear, higherEndMonth);

            if (startDate > endDate) {
                alert("Please enter valid higher education completion date");
                return false;
            }
            else
                return true;
        }

        function isValidDiplomaDates() {
            var diplomaStartMonth = parseInt($("#<%=ddlDiplomaStartDateMonth.ClientID%>").val());
            var diplomaStartYear = parseInt($("#<%=ddlDiplomaStartDateYear.ClientID%>").val());
            var diplomaEndMonth = parseInt($("#<%=ddlDiplomaEndDateMonth.ClientID%>").val());
            var diplomaEndYear = parseInt($("#<%=ddlDiplomaEndDateYear.ClientID%>").val());

            var startDate = new Date(diplomaStartYear, diplomaStartMonth);
            var endDate = new Date(diplomaEndYear, diplomaEndMonth);

            if (startDate > endDate) {
                alert("Please enter valid diploma completion date");
                return false;
            }
            else
                return true;
        }

        function validateForm() {
            var emailRegex = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,10}(?:\.[a-z]{10})?)$/i;
            var flag = false;
            if (!($("#<%=studiedYes.ClientID%>").is(":checked") || $("#<%=studiedNo.ClientID%>").is(":checked")))
                alert("Please select option for have you studied in your country before");
            else if ($("#<%=studiedYes.ClientID%>").is(":checked") && (!($("#<%=USINumberYes.ClientID%>").is(":checked") || $("#<%=USINumberNo.ClientID%>").is(":checked") || $("#<%=USINumberNotsure.ClientID%>").is(":checked"))))
                alert("Please slect option for do you have an USI NUmber ");
            else if ($("#<%=studiedYes.ClientID%>").is(":checked") && $("#<%=USINumberYes.ClientID%>").is(":checked") && $("#<%=txtUSINumber.ClientID%>").val() == "")
                alert("Please enter USI Number");
            else if ($("#<%=studiedYes.ClientID%>").is(":checked") && ($("#<%=USINumberNo.ClientID%>").is(":checked") || $("#<%=USINumberNotsure.ClientID%>").is(":checked")) && (!($("#<%=studiedininstitutionNo.ClientID%>").is(":checked") || $("#<%=studiedininstitutionYes.ClientID%>").is(":checked"))))
                alert("Please select option for Have you studied at your institution before");
            else if ($("#<%=studiedYes.ClientID%>").is(":checked") && $("#<%=studiedininstitutionYes.ClientID%>").is(":checked") && $("#<%=txtstudentID.ClientID%>").val() == "")
                alert("Please enter studentent ID from your Institution");
            else if ((!$("#<%=highschool.ClientID%>").is(':hidden')) && !(($("#<%=rblHighYes.ClientID%>").is(":checked")) || ($("#<%=rblHighNo.ClientID%>").is(":checked")) || ($("#<%=rblHighNot.ClientID%>").is(":checked"))))
                alert("Please Select Option to record High School details");            
            else if ((!$("#<%=highschoolCountry.ClientID%>").is(':hidden')) && ($("#<%=ddlCountryHighSchool.ClientID%>").val() == "0"))
                alert("Please select  high school country");
            else if ((!$("#<%=highschoolstartDate.ClientID%>").is(':hidden')) && (($("#<%=ddlHighSchoolStartDateMonth.ClientID%>").val() == "0") || ($("#<%=ddlHighSchoolStartDateYear.ClientID%>").val() == "0")))
                alert("Please select high school start date");
            else if ((!$("#<%=highschoolendDate.ClientID%>").is(':hidden')) && (($("#<%=ddlHighSchoolEndDateMonth.ClientID%>").val() == "0") || ($("#<%=ddlHighSchoolEndDateYear.ClientID%>").val() == "0")))
                alert("Please select high school end date");
            else if ((!$("#<%=highschoolName.ClientID%>").is(':hidden')) && ($("#<%=txthighschoolName.ClientID%>").val() == ""))
                alert("Please enter high school name");
            else if ((!$("#<%=highschoolQualificationtype.ClientID%>").is(':hidden')) && ($("#<%=ddlHighSchoolQualificationType.ClientID%>").val() == "0"))
                alert("Please select high school qualification name");
            else if ((!$("#<%=highschoolstudymode.ClientID%>").is(':hidden')) && ($("#<%=ddlHighSchoolStudyMode.ClientID%>").val() == "0"))
                alert("Please select high school study mode");
            else if ((!$("#<%=highschoollanguage.ClientID%>").is(':hidden')) && ($("#<%=ddlHighschoolMedium.ClientID%>").val() == "0"))
                alert("Please select  high school medium");
            else if ((!$("#<%=gradetype.ClientID%>").is(':hidden')) && ($("#<%=ddlHighSchoolGrade.ClientID%>").val() == "0"))
                alert("Please select  high school grade type");
            else if (!$("#<%=highschoolgradeachieved.ClientID%>").is(':hidden') && !($("#<%=rblYes.ClientID%>").is(':checked') || $("#<%=rblNot.ClientID%>").is(':checked') || $("#<%=rblYetToConduct.ClientID%>").is(':checked')))
                alert("Please select have you achieved high school final grade");
            else if ((!$("#<%=ExpectedHighSchoolDategrade.ClientID%>").is(':hidden')) && ($("#<%=txtExpectedHighSchoolResult.ClientID%>").val() == ""))
                alert("Please enter high school grade declaration date");
            else if ((!$("#<%=highschoolverify.ClientID%>").is(':hidden')) && ($("#<%=txtHighSchoolVerificationName.ClientID%>").val() == ""))
                alert("Please enter high school contact person name");
            else if ((!$("#<%=highschoolrelation.ClientID%>").is(':hidden')) && ($("#<%=ddlHighSchoolVerificationRelationship.ClientID%>").val() == "0"))
                alert("Please select high school relationship with contact");
            else if ((!$("#<%=highschoolcontactEmail.ClientID%>").is(':hidden')) && (($("#<%=txtHighSchoolcontactEmail.ClientID%>").val() == "") && (!emailRegex.test($("#<%=txtHighSchoolcontactEmail.ClientID%>").val()))))
                alert("Please enter a valid  e-mail address");
            else if ((!$("#<%=highschoolcontactMobile.ClientID%>").is(':hidden')) && ($("#<%=txtHighSchoolcontactMobile.ClientID%>").val() == ""))
                alert("Please enter  high school contact mobile no");
            else if ((!$("#<%=Secondary.ClientID%>").is(':hidden')) && $("#<%=rblHighYes.ClientID%>").is(":checked") && !(($("#<%=rblSecondaryYes.ClientID%>").is(":checked")) || ($("#<%=rblSecondaryNo.ClientID%>").is(":checked")) || ($("#<%=rblSecondaryNot.ClientID%>").is(":checked"))))
                alert("Please Select Option to record Secondary details");
            else if ((!$("#<%=SecondaryCountry.ClientID%>").is(':hidden')) && ($("#<%=ddlSecondaryCountry.ClientID%>").val() == "0"))
                alert("Please select  secondary country");
            else if ((!$("#<%=SecondarystartDate.ClientID%>").is(':hidden')) && (($("#<%=ddlSecondaryStartDateMonth.ClientID%>").val() == "0") || ($("#<%=ddlSecondaryStartDateYear.ClientID%>").val() == "0")))
                alert("Please select secondary start date");
            else if ((!$("#<%=SecondaryendDate.ClientID%>").is(':hidden')) && (($("#<%=ddlSecondaryEndDateMonth.ClientID%>").val() == "0") || ($("#<%=ddlSecondaryEndDateYear.ClientID%>").val() == "0")))
                alert("Please select secondary end date");
            else if ((!$("#<%=SecondaryschoolName.ClientID%>").is(':hidden')) && ($("#<%=txtSecondarySchoolName.ClientID%>").val() == ""))
                alert("Please enter secondary school name");
            else if ((!$("#<%=SecondaryQualificationtype.ClientID%>").is(':hidden')) && ($("#<%=ddlSecondaryQualificationType.ClientID%>").val() == "0"))
                alert("Please select secondary qualification name");
            else if ((!$("#<%=Secondarystudymode.ClientID%>").is(':hidden')) && ($("#<%=ddlSecondaryStudyMode.ClientID%>").val() == "0"))
                alert("Please select secondary study mode");
            else if ((!$("#<%=Secondarylanguage.ClientID%>").is(':hidden')) && ($("#<%=ddlSecondaryMedium.ClientID%>").val() == "0"))
                alert("Please select secondary medium");
            else if ((!$("#<%=Secondarygradetype.ClientID%>").is(':hidden')) && ($("#<%=ddlSecondaryGrade.ClientID%>").val() == "0"))
                alert("Please select secondary grade type");
            else if (!$("#<%=Secondarygradeachieved.ClientID%>").is(':hidden') && !($("#<%=rblSecondarygradeachievedYes.ClientID%>").is(':checked') || $("#<%=SecondarygradeachievedYet.ClientID%>").is(':checked') || $("#<%=SecondarygradeachievedYet.ClientID%>").is(':checked')))
                alert("Please select have you achieved secondary final grade");
            else if ((!$("#<%=ExpectedSecondaryDategrade.ClientID%>").is(':hidden')) && ($("#<%=txtExpectedSecondaryResult.ClientID%>").val() == ""))
                alert("Please enter secondary grade declaration date");
            else if ((!$("#<%=Secondaryverify.ClientID%>").is(':hidden')) && ($("#<%=txtSecondaryVerificationName.ClientID%>").val() == ""))
                alert("Please enter secondary contact person name");
            else if ((!$("#<%=secondaryschoolrelation.ClientID%>").is(':hidden')) && ($("#<%=ddlSecondaryVerificationRelationship.ClientID%>").val() == "0"))
                alert("Please select secondary relationship with contact");
            else if ((!$("#<%=secondarycontactEmail.ClientID%>").is(':hidden')) && (($("#<%=txtSecondarycontactEmail.ClientID%>").val() == "") && (!emailRegex.test($("#<%=txtSecondarycontactEmail.ClientID%>").val()))))
                alert("Please enter a valid secondary e-mail address");
            else if ((!$("#<%=secondarycontactMobile.ClientID%>").is(':hidden')) && ($("#<%=txtSecondarycontactMobile.ClientID%>").val() == ""))
                alert("Please enter  secondary contact mobile no");
            else if ((!$("#<%=higher.ClientID%>").is(':hidden')) && !(($("#<%=rblhigherYes.ClientID%>").is(":checked")) || ($("#<%=rblhigherNo.ClientID%>").is(":checked")) || ($("#<%=rblhigherNot.ClientID%>").is(":checked"))))
                alert("Please Select Option to record Higher Education details");
            else if ((!$("#<%=highercourse.ClientID%>").is(':hidden')) && ($("#<%=ddlCourse.ClientID%>").val() === ""))
                alert("Please select  higher education course");
            else if ((!$("#<%=higherCountry.ClientID%>").is(':hidden')) && ($("#<%=ddlHigherCountry.ClientID%>").val() == "0"))
                alert("Please select  higher education country");
            else if ((!$("#<%=higherstartDate.ClientID%>").is(':hidden')) && (($("#<%=ddlHigherStartDateMonth.ClientID%>").val() == "0") || ($("#<%=ddlHigherStartDateYear.ClientID%>").val() == "0")))
                alert("Please select higher education start date");
            else if ((!$("#<%=higherendDate.ClientID%>").is(':hidden')) && (($("#<%=ddlHigherEndDateMonth.ClientID%>").val() == "0") || ($("#<%=ddlHigherEndDateYear.ClientID%>").val() == "0")))
                alert("Please select higher education end date");

            else if ((!$("#<%=higherschoolName.ClientID%>").is(':hidden')) && ($("#<%=txtHigherschoolName.ClientID%>").val() == ""))
                alert("Please enter higher education school name");
            else if ((!$("#<%=higherQualificationtype.ClientID%>").is(':hidden')) && ($("#<%=ddlHigherQualificationType.ClientID%>").val() == "0"))
                alert("Please select higher education qualification name");
            else if ((!$("#<%=higherstudymode.ClientID%>").is(':hidden')) && ($("#<%=ddlHigherStudyMode.ClientID%>").val() == "0"))
                alert("Please select higher education study mode");
            else if ((!$("#<%=higherlanguage.ClientID%>").is(':hidden')) && ($("#<%=ddlHigherMedium.ClientID%>").val() == "0"))
                alert("Please select higher education medium");
            else if ((!$("#<%=highergradetype.ClientID%>").is(':hidden')) && ($("#<%=ddlHigherGrade.ClientID%>").val() == "0"))
                alert("Please select higher education grade type");

            else if (!$("#<%=highergradeachieved.ClientID%>").is(':hidden') && !($("#<%=rblhighergradeachievedYes.ClientID%>").is(':checked') || $("#<%=rblhighergradeachievedYet.ClientID%>").is(':checked') || $("#<%=rblhighergradeachievedNo.ClientID%>").is(':checked')))
                alert("Please select have you achieved higher education grade");
            else if ((!$("#<%=ExpectedHigherDategrade.ClientID%>").is(':hidden')) && ($("#<%=txtExpectedHigherDategrade.ClientID%>").val() == ""))
                alert("Please enter higher education grade declaration date");
            else if ((!$("#<%=higherverify.ClientID%>").is(':hidden')) && ($("#<%=txtHigherVerificationName.ClientID%>").val() == ""))
                alert("Please enter higher education contact person name");
            else if ((!$("#<%=higherrelation.ClientID%>").is(':hidden')) && ($("#<%=ddlHigherVerificationRelationship.ClientID%>").val() == "0"))
                alert("Please select higher education relationship with contact");
            else if ((!$("#<%=highercontactEmail.ClientID%>").is(':hidden')) && (($("#<%=txtHighercontactEmail.ClientID%>").val() == "") && (!emailRegex.test($("#<%=txtHighercontactEmail.ClientID%>").val()))))
                alert("Please enter a valid higher education e-mail address");
            else if ((!$("#<%=highercontactMobile.ClientID%>").is(':hidden')) && ($("#<%=txtHighercontactMobile.ClientID%>").val() == ""))
                alert("Please enter  higher education contact mobile no");
            else if ((!$("#<%=diploma.ClientID%>").is(':hidden')) && !(($("#<%=rbldiplomaYes.ClientID%>").is(":checked")) || ($("#<%=rbldiplomaNo.ClientID%>").is(":checked")) || ($("#<%=rbldiplomaNot.ClientID%>").is(":checked"))))
                alert("Please Select Option to record Diploma details");
            else if ((!$("#<%=diplomaCountry.ClientID%>").is(':hidden')) && ($("#<%=ddlDiplomaCountry.ClientID%>").val() == "0"))
                alert("Please select  diploma country");
            else if ((!$("#<%=diplomastartDate.ClientID%>").is(':hidden')) && (($("#<%=ddlDiplomaStartDateMonth.ClientID%>").val() == "0") || ($("#<%=ddlDiplomaStartDateYear.ClientID%>").val() == "0")))
                alert("Please select diploma start date");
            else if ((!$("#<%=diplomaendDate.ClientID%>").is(':hidden')) && (($("#<%=ddlDiplomaEndDateMonth.ClientID%>").val() == "0") || ($("#<%=ddlDiplomaEndDateYear.ClientID%>").val() == "0")))
                alert("Please select diploma end date");
            else if ((!$("#<%=diplomaschoolName.ClientID%>").is(':hidden')) && ($("#<%=txtDiplomaschoolName.ClientID%>").val() == ""))
                alert("Please enter diploma school name");
            else if ((!$("#<%=diplomaQualificationtype.ClientID%>").is(':hidden')) && ($("#<%=ddlDiplomaQualificationType.ClientID%>").val() == "0"))
                alert("Please select diploma qualification name");

            else if ((!$("#<%=diplomastudymode.ClientID%>").is(':hidden')) && ($("#<%=ddlDiplomaStudyMode.ClientID%>").val() == "0"))
                alert("Please select diploma study mode");
            else if ((!$("#<%=diplomalanguage.ClientID%>").is(':hidden')) && ($("#<%=ddlDiplomaMedium.ClientID%>").val() == "0"))
                alert("Please select diploma medium");
            else if ((!$("#<%=diplomagradetype.ClientID%>").is(':hidden')) && ($("#<%=ddlDiplomaGrade.ClientID%>").val() == "0"))
                alert("Please select diploma grade type");
            else if ((!$("#<%=diplomagradeachieved.ClientID%>").is(':hidden')) && !(($("#<%=rblDiplomaGradeYes.ClientID%>").is(":checked")) || ($("#<%=rblDiplomaGradeYet.ClientID%>").is(":checked")) || ($("#<%=rblDiplomaGradeNot.ClientID%>").is(":checked"))))
                alert("Please select have you achieved diploma final grade");
            else if ((!$("#<%=ExpectedDiplomaDategrade.ClientID%>").is(':hidden')) && ($("#<%=txtExpectedDiplomaResult.ClientID%>").val() == ""))
                alert("Please enter diploma grade declaration date");
            else if ((!$("#<%=diplomaverify.ClientID%>").is(':hidden')) && ($("#<%=txtDiplomaVerificationName.ClientID%>").val() == ""))
                alert("Please enter diploma contact person name");
            else if ((!$("#<%=diplomarelation.ClientID%>").is(':hidden')) && ($("#<%=ddlDiplomaVerificationRelationship.ClientID%>").val() == "0"))
                alert("Please select diploma relationship with contact");
            else if ((!$("#<%=diplomacontactEmail.ClientID%>").is(':hidden')) && (($("#<%=txtDiplomacontactEmail.ClientID%>").val() == "") && (!emailRegex.test($("#<%=txtDiplomacontactEmail.ClientID%>").val()))))
                alert("Please enter a valid diploma e-mail address");
            else if ((!$("#<%=diplomacontactMobile.ClientID%>").is(':hidden')) && ($("#<%=txtDiplomacontactMobile.ClientID%>").val() == ""))
                alert("Please enter  diploma contact mobile no");
            else if ((!$("#<%=highschoolstartDate.ClientID%>").is(':hidden')) && (!$("#<%=highschoolendDate.ClientID%>").is(':hidden')) && !isValidHighSchoolDates()) { }
            else if ((!$("#<%=SecondarystartDate.ClientID%>").is(':hidden')) && (!$("#<%=SecondaryendDate.ClientID%>").is(':hidden')) && !isValidSecondarySchoolDates()) { }
            else if ((!$("#<%=higherstartDate.ClientID%>").is(':hidden')) && (!$("#<%=higherendDate.ClientID%>").is(':hidden')) && !isValidHigherEduDates()) { }
            else if ((!$("#<%=diplomastartDate.ClientID%>").is(':hidden')) && (!$("#<%=diplomaendDate.ClientID%>").is(':hidden')) && !isValidDiplomaDates()) { }
            else
                flag = true;
            if (flag == true)
                flag = customcontrolValidation();
            return flag;

        }
        function customcontrolValidation() {
            var flag = false;
            var Count = '<%=CustomControls.Count%>';
            if (Count == '0')
                flag = true;
             <% for (int k = 0; k < CustomControls.Count; k++)
        {
            TextBox txtDynamic = (TextBox)mainDiv.FindControl("txt" + CustomControls[k].customfieldid);
            var Description = CustomControls[k].labeldescription.ToLower();
                    %>

            if ($("#<%=txtDynamic.ClientID%>").val() == "") {
                alert("Please enter <%= Description%>" + "\n");
                flag = false;
                return false;
            }
            else
                flag = true;
               <% }%>
            return flag;
        }

        $('#<%=txtExpectedHighSchoolResult.ClientID%>').flatpickr({

            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#<%=txtExpectedSecondaryResult.ClientID%>').flatpickr({

            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#<%=txtExpectedHigherDategrade.ClientID%>').flatpickr({

            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $('#<%=txtExpectedDiplomaResult.ClientID%>').flatpickr({

            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#personal_menu_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicanteducation').addClass('active');
        });
         $(document).ready(function () {
            //countryofhighschooledu
            $("#<%=ddlCountryHighSchool.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicanteducation.aspx/GetQualificationDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { countryId: $("#<%=ddlCountryHighSchool.ClientID%>").val() },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlHighSchoolQualificationType.ClientID%>").length >= 1) {
                                $("#<%=ddlHighSchoolQualificationType.ClientID%>").empty();
                                $("#<%=ddlHighSchoolQualificationType.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlHighSchoolQualificationType.ClientID%>").append($("<option></option>").val(result[i].qualificationid).html(result[i].qualificationname));
                            }
                        }
                    }
                });
             });
             $("#<%=ddlHighSchoolQualificationType.ClientID%>").change(function () {
                $("#<%=hidddlHighSchoolQualificationType.ClientID%>").val($("#<%=ddlHighSchoolQualificationType.ClientID%>").val());
            });
             //country of secondary school edu  ddlSecondaryQualificationType
             $("#<%=ddlSecondaryCountry.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicanteducation.aspx/GetQualificationDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { countryId: $("#<%=ddlSecondaryCountry.ClientID%>").val() },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlSecondaryQualificationType.ClientID%>").length >= 1) {
                                $("#<%=ddlSecondaryQualificationType.ClientID%>").empty();
                                $("#<%=ddlSecondaryQualificationType.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlSecondaryQualificationType.ClientID%>").append($("<option></option>").val(result[i].qualificationid).html(result[i].qualificationname));
                            }
                        }
                    }
                });
             });
             $("#<%=ddlSecondaryQualificationType.ClientID%>").change(function () {
                $("#<%=hidddlSecondaryQualificationType.ClientID%>").val($("#<%=ddlSecondaryQualificationType.ClientID%>").val());
            });
             //country of higher edu   
             $("#<%=ddlHigherCountry.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicanteducation.aspx/GetQualificationDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { countryId: $("#<%=ddlHigherCountry.ClientID%>").val() },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlHigherQualificationType.ClientID%>").length >= 1) {
                                $("#<%=ddlHigherQualificationType.ClientID%>").empty();
                                $("#<%=ddlHigherQualificationType.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlHigherQualificationType.ClientID%>").append($("<option></option>").val(result[i].qualificationid).html(result[i].qualificationname));
                            }
                        }
                    }
                });
             });
             $("#<%=ddlHigherQualificationType.ClientID%>").change(function () {
                $("#<%=hidddlHigherQualificationType.ClientID%>").val($("#<%=ddlHigherQualificationType.ClientID%>").val());
             });
             //country of diploma
             $("#<%=ddlDiplomaCountry.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicanteducation.aspx/GetQualificationDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { countryId: $("#<%=ddlDiplomaCountry.ClientID%>").val() },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlDiplomaQualificationType.ClientID%>").length >= 1) {
                                $("#<%=ddlDiplomaQualificationType.ClientID%>").empty();
                                $("#<%=ddlDiplomaQualificationType.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlDiplomaQualificationType.ClientID%>").append($("<option></option>").val(result[i].qualificationid).html(result[i].qualificationname));
                            }
                        }
                    }
                });
             });
             $("#<%=ddlDiplomaQualificationType.ClientID%>").change(function () {
                $("#<%=hidddlDiplomaQualificationType.ClientID%>").val($("#<%=ddlDiplomaQualificationType.ClientID%>").val());
             });

        });
    </script>


</asp:Content>
