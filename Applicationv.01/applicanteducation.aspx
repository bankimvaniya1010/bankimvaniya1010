<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicanteducation.aspx.cs" Inherits="applicanteducation" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Education Details</li>
        </ol>
        <h1 class="h2">Education Details</h1>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">
                        <div class="list-group list-group-fit">
                            <!----High School Start------>
                            <div class="list-group-item" id="highschool" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                                    <div class="form-row">
                                        <label id="labelhighschool" runat="server" for="highschool" class="col-md-3 col-form-label form-label">Have you completed high school?</label>
                                        <div class="col-md-9">
                                            <asp:RadioButton ID="rblHighYes" CssClass="form-control" runat="server" GroupName="highschool" Text="Yes" />
                                            <asp:RadioButton ID="rblHighNo" CssClass="form-control" runat="server" GroupName="highschool" Text="No- I am currently studying for my high school qualification " />
                                            <asp:RadioButton ID="rblHighNot" CssClass="form-control" runat="server" GroupName="highschool" Text="No- I do not have a high school qualification " />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolCountry" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolCountry">
                                    <div class="form-row">
                                        <label id="labelhighschoolCountry" runat="server" for="highschoolCountry" class="col-md-3 col-form-label form-label">Country of High School Education</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCountryHighSchool" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCountryHighSchool_SelectedIndexChanged">
                                               
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolstartDate" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstartDate">
                                    <div class="form-row">
                                        <label id="labelhighschoolstartDate" runat="server" for="highschoolstartDate" class="col-md-3 col-form-label form-label">Start Date </label>
                                        <div class="col-md-6">
                                            <input id="txtStartDate" runat="server" type="text" class="form-control" placeholder="Start Date" data-toggle="flatpickr" value="today">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolendDate" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolendateDate">
                                    <div class="form-row">
                                        <label id="labelhighschoolendDate" runat="server" for="highschoolendDate" class="col-md-3 col-form-label form-label">End Date </label>
                                        <div class="col-md-6">
                                            <input id="txtEndDate" runat="server" type="text" class="form-control" placeholder="End Date" data-toggle="flatpickr" value="today">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolName" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolName">
                                    <div class="form-row">
                                        <label id="labelhighschoolName" runat="server" for="highschoolName" class="col-md-3 col-form-label form-label">Name of School</label>
                                        <div class="col-md-6">
                                            <input id="txthighschoolName" runat="server" type="text" class="form-control" placeholder="Name of School">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolQualificationtype" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolQualificationtype">
                                    <div class="form-row">
                                        <label id="labelhighschoolQualificationtype" runat="server" for="highschoolQualificationtype" class="col-md-3 col-form-label form-label">Qualification Type</label>
                                        <div class="col-md-6">
                                             <asp:DropDownList ID="ddlHighSchoolQualificationType" CssClass="form-control" runat="server">
                                               
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolstudymode" runat="server" style="display:none"> 
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstudymode">
                                    <div class="form-row">
                                        <label id="labelhighschoolstudymode" runat="server" for="highschoolstudymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlHighSchoolStudyMode" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoollanguage" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoollanguage">
                                    <div class="form-row">
                                        <label id="labelhighschoollanguage" runat="server" for="highschoollanguage" class="col-md-3 col-form-label form-label">Language (Medium) of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlHighschoolMedium" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="gradetype" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-gradetype">
                                    <div class="form-row">
                                        <label id="labelgradetype" runat="server" for="EnglishCourse" class="col-md-3 col-form-label form-label">Grade Type</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlHighSchoolGrade" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolgradeachieved" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-gradeachieved">
                                    <div class="form-row">
                                        <label id="labelgradeachieved" runat="server" for="gradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                                        <div class="col-md-9">
                                            <asp:RadioButton ID="rblYes" CssClass="form-control" runat="server" GroupName="HighschoolGrade" Text="Results Declared" />
                                            <asp:RadioButton ID="rblYetToConduct" CssClass="form-control" runat="server" GroupName="HighschoolGrade" Text=" Examination not conducted yet" />
                                            <asp:RadioButton ID="rblNot" runat="server" CssClass="form-control" GroupName="HighschoolGrade" Text="Examination Conducted, but Result not declared" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="ExpectedHighSchoolDategrade" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedHighSchoolDategrade">
                                    <div class="form-row">
                                        <label id="labelExpectedHighSchoolDategrade" runat="server" for="EnglishCourse" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                        <div class="col-md-6">
                                            <input id="txtExpectedHighSchoolResult" runat="server" type="text" class="form-control" placeholder="" data-toggle="flatpickr" value="today">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolverify" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolverify">
                                    <div class="form-row">
                                        <label id="labelhighschoolverify" runat="server" for="highschoolverify" class="col-md-3 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                        <div class="col-md-6">
                                            <input id="txtHighSchoolVerificationName" runat="server" type="text" class="form-control" placeholder="Name of Contact who can verify this qualification">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolrelation" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolrelation">
                                    <div class="form-row">
                                        <label id="labelhighschoolrelation" runat="server" for="highschoolrelation" class="col-md-3 col-form-label form-label">Relationship with the Contact </label>
                                        <div class="col-md-6">
                                            <input id="txtHighSchoolVerificationRelationship" runat="server" type="text" class="form-control" placeholder="Relationship with the Contact">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolcontactEmail" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolcontactEmail">
                                    <div class="form-row">
                                        <label id="labelhighschoolcontactEmail" runat="server" for="highschoolcontactEmail" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                                        <div class="col-md-6">
                                            <input id="txtHighSchoolcontactEmail" runat="server" type="text" class="form-control" placeholder="Email ID of Contact who can verify your employment">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highschoolcontactMobile" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolcontactMobile">
                                    <div class="form-row">
                                        <label id="labelhighschoolcontactMobile" runat="server" for="highschoolcontactMobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number of Contact who can verify your qualification</label>
                                        <div class="col-md-6">
                                            <input id="txtHighSchoolcontactMobile" runat="server" type="text" class="form-control" placeholder="Mobile no of Contact who can verify">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="higestEducation" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-higestEducation">
                                    <div class="form-row">
                                        <label id="labelhigestEducation" runat="server" for="higestEducation" class="col-md-3 col-form-label form-label">Highest Education</label>
                                        <div class="col-md-6">
                                            <input id="txtHigestEducation" runat="server" type="text" placeholder="Highest Education" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="highshoolgrade" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolYear">
                                    <div class="form-row">
                                        <input type="button" runat="server" class="btn btn-success" id="btn10th" value="Add Subject and their Grades" />
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-9">
                                            <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                                <asp:GridView ID="grd10" DataKeyNames="applicantgradeid" runat="server" CssClass="table" AutoGenerateColumns="false" OnDataBound="grd10_DataBound" OnRowDeleted="grd10_RowDeleted" OnRowDeleting="grd10_RowDeleting">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="Course Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbldesignation" runat="server"
                                                                    Text='<%#Eval("courseid")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="Subject">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblorganization" runat="server"
                                                                    Text='<%#Eval("subject")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade Type">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontactpersonwithdetails" runat="server"
                                                                    Text='<%#Eval("gradetype")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade ">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontactpersonwithdetails" runat="server"
                                                                    Text='<%#Eval("studentgrade")%>'></asp:Label>
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

                            <!----High School END------>

                            <!----Secondary Start------>
                            <div id="SecondarySection">
                                <div class="list-group-item" id="Secondary" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Secondary">
                                        <div class="form-row">
                                            <label id="labelSecondary" runat="server" for="Secondary" class="col-md-3 col-form-label form-label">Have you completed Senior Secondary school? (Year 12)?</label>
                                            <div class="col-md-9">
                                                <asp:RadioButton ID="rblSecondaryYes" CssClass="form-control" runat="server" GroupName="Secondary" Text="Yes" />
                                                <asp:RadioButton ID="rblSecondaryNo" CssClass="form-control" runat="server" GroupName="Secondary" Text="No  - I am currently still studying for my Senior Secondary " />
                                                <asp:RadioButton ID="rblSecondaryNot" CssClass="form-control" runat="server" GroupName="Secondary" Text="No - I do not have a Senior Secondary qualification" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="SecondaryCountry" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-SecondaryCountry">
                                        <div class="form-row">
                                            <label id="labelSecondaryCountry" runat="server" for="SecondaryCountry" class="col-md-3 col-form-label form-label">Country of Secondary Education</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSecondaryCountry" CssClass="form-control" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlSecondaryCountry_SelectedIndexChanged">
                                                   
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="SecondarystartDate" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-SecondarystartDate">
                                        <div class="form-row">
                                            <label id="labelSecondarystartDate" runat="server" for="SecondarystartDate" class="col-md-3 col-form-label form-label">Start Date </label>
                                            <div class="col-md-6">
                                                <input id="txtSecondaryStartDate" runat="server" type="text" class="form-control" placeholder="Start Date" data-toggle="flatpickr" value="today">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="SecondaryendDate" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-SecondaryendDate">
                                        <div class="form-row">
                                            <label id="labelSecondaryendDate" runat="server" for="SecondaryendDate" class="col-md-3 col-form-label form-label">End Date </label>
                                            <div class="col-md-6">
                                                <input id="txtSecondaryEndDate" runat="server" type="text" class="form-control" placeholder="End Date" data-toggle="flatpickr" value="today">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="SecondaryschoolName" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-SecondaryschoolName">
                                        <div class="form-row">
                                            <label id="labelSecondaryschoolName" runat="server" for="SecondaryschoolName" class="col-md-3 col-form-label form-label">Name of School</label>
                                            <div class="col-md-6">
                                                <input id="txtSecondarySchoolName" runat="server" type="text" class="form-control" placeholder="Name of School

">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="SecondaryQualificationtype" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-SecondaryQualificationtype">
                                        <div class="form-row">
                                            <label id="labelSecondaryQualificationtype" runat="server" for="SecondaryQualificationtype" class="col-md-3 col-form-label form-label">Qualification Type</label>
                                            <div class="col-md-6">
                                                 <asp:DropDownList ID="ddlSecondaryQualificationType" CssClass="form-control" runat="server">
                                               
                                            </asp:DropDownList>
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="Secondarystudymode" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Secondarystudymode">
                                        <div class="form-row">
                                            <label id="labelSecondarystudymode" runat="server" for="Secondarystudymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSecondaryStudyMode" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="Secondarylanguage" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Secondarylanguage">
                                        <div class="form-row">
                                            <label id="labelSecondarylanguage" runat="server" for="Secondarylanguage" class="col-md-3 col-form-label form-label">Language (Medium) of Study</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSecondaryMedium" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="Secondarygradetype" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Secondarygradetype">
                                        <div class="form-row">
                                            <label id="labelSecondarygradetype" runat="server" for="Secondarygradetype" class="col-md-3 col-form-label form-label">Grade Type</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSecondaryGrade" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="Secondarygradeachieved" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Secondarygradeachieved">
                                        <div class="form-row">
                                            <label id="labelSecondarygradeachieved" runat="server" for="Secondarygradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                                            <div class="col-md-9">
                                                <asp:RadioButton CssClass="form-control" ID="rblSecondarygradeachievedYes" runat="server" GroupName="Secondarygradeachieved" Text="Results Declared" />
                                                <asp:RadioButton CssClass="form-control" ID="SecondarygradeachievedYet" runat="server" GroupName="Secondarygradeachieved" Text=" Examination not conducted yet" />
                                                <asp:RadioButton CssClass="form-control" ID="SecondarygradeachievedNo" runat="server" GroupName="Secondarygradeachieved" Text="Examination Conducted, but Result not declared" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="ExpectedSecondaryDategrade" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedSecondaryDategrade">
                                        <div class="form-row">
                                            <label id="labelExpectedSecondaryDategrade" runat="server"  for="ExpectedSecondaryDategrade" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                            <div class="col-md-6">
                                                <input id="txtExpectedSecondaryResult" runat="server" type="text" class="form-control" placeholder="" data-toggle="flatpickr" value="today">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="Secondaryverify" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Secondaryverify">
                                        <div class="form-row">
                                            <label id="labelSecondaryverify" runat="server" for="Secondaryverify" class="col-md-3 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                            <div class="col-md-6">
                                                <input id="txtSecondaryVerificationName" runat="server" type="text" class="form-control" placeholder="Name of Contact who can verify this qualification">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="secondaryschoolrelation" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-secondaryschoolrelation">
                                        <div class="form-row">
                                            <label id="labelsecondaryschoolrelation" runat="server" for="secondaryschoolrelation" class="col-md-3 col-form-label form-label">Relationship with the Contact </label>
                                            <div class="col-md-6">
                                                <input id="txtSecondaryVerificationRelationship" runat="server" type="text" class="form-control" placeholder="Relationship with the Contact">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="secondarycontactEmail" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-secondarycontactEmail">
                                        <div class="form-row">
                                            <label id="labelsecondarycontactEmail" runat="server" for="secondarycontactEmail" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                                            <div class="col-md-6">
                                                <input id="txtSecondarycontactEmail" runat="server" type="text" class="form-control" placeholder="Email ID of Contact who can verify your employment">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="secondarycontactMobile" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-secondarycontactMobile">
                                        <div class="form-row">
                                            <label id="labelsecondarycontactMobile" runat="server" for="secondarycontactMobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number of Contact who can verify your qualification </label>
                                            <div class="col-md-6">
                                                <input id="txtSecondarycontactMobile" runat="server" type="text" class="form-control" placeholder="Mobile no of Contact who can verify">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="secondarygrade" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolYear">
                                        <div class="form-row">
                                            <input type="button" runat="server" class="btn btn-success" id="btn12th" value="Add Subject and their Grades" />
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-9">
                                                <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                                    <asp:GridView ID="grdSecondary" DataKeyNames="applicantgradeid" runat="server" CssClass="table" AutoGenerateColumns="false" OnDataBound="grdSecondary_DataBound" OnRowDeleted="grdSecondary_RowDeleted" OnRowDeleting="grdSecondary_RowDeleting">
                                                        <Columns>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Course Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbldesignation" runat="server"
                                                                        Text='<%#Eval("courseid")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Subject">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblorganization" runat="server"
                                                                        Text='<%#Eval("subject")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade Type">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblcontactpersonwithdetails" runat="server"
                                                                        Text='<%#Eval("gradetype")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblcontactpersonwithdetails" runat="server"
                                                                        Text='<%#Eval("studentgrade")%>'></asp:Label>
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

                            </div>
                            <!----Secondary END------>
                            <!----Higher Education Start------>
                            <div id="HigherSectionSection">
                                <div class="list-group-item" id="higher" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higher">
                                        <div class="form-row">
                                            <label id="labelhigher" runat="server" for="higher" class="col-md-3 col-form-label form-label">
                                                Have you completed any Higher (Under Graduate, Masters or PhD) degree? 
?</label>
                                            <div class="col-md-9">
                                                <asp:RadioButton CssClass="form-control" ID="rblhigherYes" runat="server" GroupName="higher" Text="Yes" />
                                                <asp:RadioButton CssClass="form-control" ID="rblhigherNot" runat="server" GroupName="higher" Text=" I am currently studying for my higher qualification" />
                                                <asp:RadioButton CssClass="form-control" ID="rblhigherNo" runat="server" GroupName="higher" Text="No- I do not have a higher qualification " />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="highercourse" runat="server" style="display:none">
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
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="higherCountry" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherCountry">
                                        <div class="form-row">
                                            <label id="labelhigherCountry" runat="server" for="higherCountry" class="col-md-3 col-form-label form-label">Country of Higher Education</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlHigherCountry" AutoPostBack="true" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlHigherCountry_SelectedIndexChanged">
                                                   
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="higherstartDate" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstartDate">
                                        <div class="form-row">
                                            <label id="labelhigherstartDate" runat="server" for="highschoolstartDate" class="col-md-3 col-form-label form-label">Start Date </label>
                                            <div class="col-md-6">
                                                <input id="txtHigherStartDate" runat="server" type="text" class="form-control" placeholder="" data-toggle="flatpickr" value="today">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="higherendDate" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherendDate">
                                        <div class="form-row">
                                            <label id="labelhigherendDate" runat="server" for="higherendDate" class="col-md-3 col-form-label form-label">End Date </label>
                                            <div class="col-md-6">
                                                <input id="txtHigherEndDate" runat="server" type="text" class="form-control" placeholder="" data-toggle="flatpickr" value="today">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="higherschoolName" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherschoolName">
                                        <div class="form-row">
                                            <label id="labelhigherschoolName" runat="server" for="higherschoolName" class="col-md-3 col-form-label form-label">Name of School</label>
                                            <div class="col-md-6">
                                                <input id="txtHigherschoolName" runat="server" type="text" class="form-control" placeholder="Name of School

">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="higherQualificationtype" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherQualificationtype">
                                        <div class="form-row">
                                            <label id="labelhigherQualificationtype" runat="server" for="higherQualificationtype" class="col-md-3 col-form-label form-label">Qualification Type</label>
                                            <div class="col-md-6">
                                                 <asp:DropDownList ID="ddlHigherQualificationType" CssClass="form-control" runat="server">
                                               
                                            </asp:DropDownList>
                                               
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="higherstudymode" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherstudymode">
                                        <div class="form-row">
                                            <label id="labelhigherstudymode" runat="server" for="higherstudymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlHigherStudyMode" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="higherlanguage" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherlanguage">
                                        <div class="form-row">
                                            <label id="labelhigherlanguage" runat="server" for="higherlanguage" class="col-md-3 col-form-label form-label">Language (Medium) of Study</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlHigherMedium" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="highergradetype" runat="server">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highergradetype">
                                        <div class="form-row">
                                            <label id="labelhighergradetype" runat="server" for="highergradetype" class="col-md-3 col-form-label form-label">Grade Type</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlHigherGrade" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="highergradeachieved" runat="server" style="display:none" >
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highergradeachieved">
                                        <div class="form-row">
                                            <label id="labelhighergradeachieved" runat="server" for="highergradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                                            <div class="col-md-9">
                                                <asp:RadioButton CssClass="form-control" ID="rblhighergradeachievedYes" runat="server" GroupName="highergradeachieved" Text="Results Declared" />
                                                <asp:RadioButton CssClass="form-control" ID="rblhighergradeachievedYet" runat="server" GroupName="highergradeachieved" Text=" Examination not conducted yet" />
                                                <asp:RadioButton CssClass="form-control" ID="rblhighergradeachievedNo" runat="server" GroupName="highergradeachieved" Text="Examination Conducted, but Result not declared" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="ExpectedHigherDategrade" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedHigherDategrade">
                                        <div class="form-row">
                                            <label id="labelExpectedHigherDategrade" runat="server" for="ExpectedHigherDategrade" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                            <div class="col-md-6">
                                                <input id="txtExpectedHigherDategrade" runat="server" type="text" class="form-control" placeholder="Test Date" data-toggle="flatpickr" value="today">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="higherverify" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherverify">
                                        <div class="form-row">
                                            <label id="labelhigherverify" runat="server" for="higherverify" class="col-md-3 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                            <div class="col-md-6">
                                                <input id="txtHigherVerificationName" runat="server" type="text" class="form-control" placeholder="Name of Contact who can verify this qualification">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="higherrelation" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-higherrelation">
                                        <div class="form-row">
                                            <label id="labelhigherrelation" runat="server" for="highschoolrelation" class="col-md-3 col-form-label form-label">Relationship with the Contact </label>
                                            <div class="col-md-6">
                                                <input id="txtHigherVerificationRelationship" runat="server" type="text" class="form-control" placeholder="Relationship with the Contact">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="highercontactEmail" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highercontactEmail">
                                        <div class="form-row">
                                            <label id="labelhighercontactEmail" runat="server" for="highercontactEmail" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                                            <div class="col-md-6">
                                                <input id="txtHighercontactEmail" runat="server" type="text" class="form-control" placeholder="Email ID of Contact who can verify your employment">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="highercontactMobile" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highercontactMobile">
                                        <div class="form-row">
                                            <label id="labelhighercontactMobile" runat="server" for="highercontactMobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number who can verify this qualification </label>
                                            <div class="col-md-6">
                                                <input id="txtHighercontactMobile" runat="server" type="text" class="form-control" placeholder="Mobile/Cellular Number who can verify this qualification ">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="highergrade" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolYear">
                                        <div class="form-row">
                                            <input type="button" runat="server" class="btn btn-success" id="btnhigher" value="Add Subject and their Grades" />
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-9">
                                                <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                                    <asp:GridView ID="grdHigher" DataKeyNames="applicantgradeid" runat="server" CssClass="table" AutoGenerateColumns="false" OnDataBound="grdHigher_DataBound" OnRowDeleted="grdHigher_RowDeleted" OnRowDeleting="grdHigher_RowDeleting">
                                                        <Columns>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Course Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lbldesignation" runat="server"
                                                                        Text='<%#Eval("courseid")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Subject">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblorganization" runat="server"
                                                                        Text='<%#Eval("subject")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade Type">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblcontactpersonwithdetails" runat="server"
                                                                        Text='<%#Eval("gradetype")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade ">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblcontactpersonwithdetails" runat="server"
                                                                        Text='<%#Eval("studentgrade")%>'></asp:Label>
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
                                <div class="list-group-item" id="addanother" runat="server" style="display:none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highergrade">
                                        <div class="form-row">

                                            <div class="col-md-6">

                                                <asp:Button ID="btnAddanother" runat="server" Text="Add Another Higher Qualification" CssClass="btn btn-success" OnClick="btnAddanother_Click" />
                                            </div>
                                        </div>
                                        <div class="form-row">
                                            <div class="col-md-9">
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
                            </div>
                            <!----Higher Education END------>
                            <!----Diploma Start------>
                            <div class="list-group-item" id="diploma" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diploma">
                                    <div class="form-row">
                                        <label id="labeldiploma" runat="server" for="diploma" class="col-md-3 col-form-label form-label">Have you completed any Diploma or Certificate Programs ?</label>
                                        <div class="col-md-9">
                                            <asp:RadioButton CssClass="form-control" ID="rbldiplomaYes" runat="server" GroupName="diploma" Text="Yes" />
                                            <asp:RadioButton CssClass="form-control" ID="rbldiplomaNo" runat="server" GroupName="diploma" Text="I am currently studying for my Diploma/Certificate" />
                                            <asp:RadioButton CssClass="form-control" ID="rbldiplomaNot" runat="server" GroupName="diploma" Text="No - I do not have a Diploma/Certificate qualification" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomaCountry" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomaCountry">
                                    <div class="form-row">
                                        <label id="labeldiplomaCountry" runat="server" for="diplomaCountry" class="col-md-3 col-form-label form-label">Country of Diploma or Certificate Programs</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlDiplomaCountry" AutoPostBack="true" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlDiplomaCountry_SelectedIndexChanged">
                                               
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomastartDate" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomastartDate">
                                    <div class="form-row">
                                        <label id="labeldiplomastartDate" runat="server" for="diplomastartDate" class="col-md-3 col-form-label form-label">Start Date </label>
                                        <div class="col-md-6">
                                            <input id="txtDiplomaStartDate" runat="server" type="text" class="form-control" placeholder="Start Date" data-toggle="flatpickr" value="today">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomaendDate" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomaendDate">
                                    <div class="form-row">
                                        <label id="labeldiplomaendDate" runat="server" for="diplomaendDate" class="col-md-3 col-form-label form-label">End Date </label>
                                        <div class="col-md-6">
                                            <input id="txtDiplomaEndDate" runat="server" type="text" class="form-control" placeholder="End Date" data-toggle="flatpickr" value="today">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomaschoolName" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomaschoolName">
                                    <div class="form-row">
                                        <label id="labeldiplomaschoolName" runat="server" for="diplomaschoolName" class="col-md-3 col-form-label form-label">Name of School</label>
                                        <div class="col-md-6">
                                            <input id="txtDiplomaschoolName" runat="server" type="text" class="form-control" placeholder="Name of School

">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomaQualificationtype" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomaQualificationtype">
                                    <div class="form-row">
                                        <label id="labeldiplomaQualificationtype" runat="server" for="diplomaQualificationtype" class="col-md-3 col-form-label form-label">Qualification Type</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlDiplomaQualificationType" CssClass="form-control" runat="server">
                                               
                                            </asp:DropDownList>
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomastudymode" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomastudymode">
                                    <div class="form-row">
                                        <label id="labeldiplomastudymode" runat="server" for="diplomastudymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlDiplomaStudyMode" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomalanguage" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomalanguage">
                                    <div class="form-row">
                                        <label id="labeldiplomalanguage" runat="server" for="diplomalanguage" class="col-md-3 col-form-label form-label">Language (Medium) of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlDiplomaMedium" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomagradetype" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomagradetype">
                                    <div class="form-row">
                                        <label id="labeldiplomagradetype" runat="server" for="diplomagradetype" class="col-md-3 col-form-label form-label">Grade Type</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlDiplomaGrade" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomagradeachieved" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomagradeachieved">
                                    <div class="form-row">
                                        <label id="labeldiplomagradeachieved" runat="server" for="diplomagradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                                        <div class="col-md-9">
                                            <asp:RadioButton CssClass="form-control" ID="rblDiplomaGradeYes" runat="server" GroupName="DiplomaGrade" Text="Results Declared" />
                                            <asp:RadioButton CssClass="form-control" ID="rblDiplomaGradeYet" runat="server" GroupName="DiplomaGrade" Text=" Examination not conducted yet" />
                                            <asp:RadioButton CssClass="form-control" ID="rblDiplomaGradeNot" runat="server" GroupName="DiplomaGrade" Text="Examination Conducted, but Result not declared" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="ExpectedDiplomaDategrade" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedDiplomaDategrade">
                                    <div class="form-row">
                                        <label id="labelExpectedDiplomaDategrade" runat="server" for="ExpectedDiplomaDategrade" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                        <div class="col-md-6">
                                            <input id="txtExpectedDiplomaResult" runat="server" type="text" class="form-control" placeholder="Test Date" data-toggle="flatpickr" value="today">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomaverify" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomaverify">
                                    <div class="form-row">
                                        <label id="labeldiplomaverify" runat="server" for="diplomaverify" class="col-md-3 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                        <div class="col-md-6">
                                            <input id="txtDiplomaVerificationName" runat="server" type="text" class="form-control" placeholder="Name of Contact who can verify this qualification">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomarelation" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomarelation">
                                    <div class="form-row">
                                        <label id="labeldiplomarelation" runat="server" for="diplomarelation" class="col-md-3 col-form-label form-label">Relationship with the Contact </label>
                                        <div class="col-md-6">
                                            <input id="txtDiplomaVerificationRelationship" runat="server" type="text" class="form-control" placeholder="Relationship with the Contact">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomacontactEmail" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomacontactEmail">
                                    <div class="form-row">
                                        <label id="labeldiplomacontactEmail" runat="server" for="diplomacontactEmail" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your employment  </label>
                                        <div class="col-md-6">
                                            <input id="txtDiplomacontactEmail" runat="server" type="text" class="form-control" placeholder="Email ID of Contact who can verify your employment">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomacontactMobile" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-diplomacontactMobile">
                                    <div class="form-row">
                                        <label id="labeldiplomacontactMobile" runat="server" for="diplomacontactMobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number who can verify this qualification </label>
                                        <div class="col-md-6">
                                            <input id="txtDiplomacontactMobile" runat="server" type="text" class="form-control" placeholder="Mobile/Cellular Number who can verify this qualification ">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="diplomagrade" runat="server" style="display:none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highschoolYear">
                                    <div class="form-row">
                                        <input type="button" runat="server" class="btn btn-success" id="btndiploma" value="Add Subject and their Grades" />
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-9">
                                            <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                                <asp:GridView ID="grdDiploma" runat="server" DataKeyNames="applicantgradeid" CssClass="table" AutoGenerateColumns="false" OnDataBound="grdDiploma_DataBound" OnRowDeleted="grdDiploma_RowDeleted" OnRowDeleting="grdDiploma_RowDeleting">
                                                    <Columns>
                                                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="Course Name">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbldesignation" runat="server"
                                                                    Text='<%#Eval("courseid")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="Subject">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblorganization" runat="server"
                                                                    Text='<%#Eval("subject")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade Type">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontactpersonwithdetails" runat="server"
                                                                    Text='<%#Eval("gradetype")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade ">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblcontactpersonwithdetails" runat="server"
                                                                    Text='<%#Eval("studentgrade")%>'></asp:Label>
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




                            <!----Diploma END------>
                            <div class="list-group-item">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                         <a href="applicantlanguage.aspx" class="btn btn-success" style="margin-right: 10px;">English Language Competency</a>
                                        <asp:Button ID="btn_login" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_login_Click" />
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
             $(".form-control")
                .mouseover(function () {
                    var controlId = $(this).attr('id');
                    var title = $(this).attr('title');
                    $("#tooltip").text(title);
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
            $("#<%=higestEducation.ClientID%>").hide()
            // Attach Button click event listener 
            $("#<%=btn10th.ClientID%>").click(function () {
                var grade = $("#<%=ddlHighSchoolGrade.ClientID%>").val();
                var course = "tenth"
                var w = window.open("/addgrade.aspx?g=" + grade + "&c=" + course, 'popupWindow', 'width = 600, height = 400, scrollbars = yes');

            });
            $("#<%=btn12th.ClientID%>").click(function () {
                var grade = $("#<%=ddlSecondaryGrade.ClientID%>").val();
                var course = "twelth"
                var w = window.open("/addgrade.aspx?g=" + grade + "&c=" + course, 'popupWindow', 'width = 600, height = 400, scrollbars = yes');

            });
            $("#<%=btnhigher.ClientID%>").click(function () {
                var grade = $("#<%=ddlHigherGrade.ClientID%>").val();
                var course = $("#<%=ddlCourse.ClientID%>").val()
                var w = window.open("/addgrade.aspx?g=" + grade + "&c=" + course, 'popupWindow', 'width = 600, height = 400, scrollbars = yes');

            });
            $("#<%=btndiploma.ClientID%>").click(function () {
                var grade = $("#<%=ddlDiplomaGrade.ClientID%>").val();
                var course = "diploma"
                var w = window.open("/addgrade.aspx?g=" + grade + "&c=" + course, 'popupWindow', 'width = 600, height = 400, scrollbars = yes');

            });
            var highschool = $("input[type=radio][name='ctl00$ContentPlaceHolder1$highschool']:checked").val()
            if (highschool == 'rblHighYes') {
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
                $("#<%=higestEducation.ClientID%>").hide();
                $("#<%=highshoolgrade.ClientID%>").show();
                $("#SecondarySection").show();
                $("#<%=highschoolcontactMobile.ClientID%>").show();

                var HighschoolGrade = $("input[type=radio][name='ctl00$ContentPlaceHolder1$HighschoolGrade']:checked").val();
                if (HighschoolGrade == "rblYes.ClientID%>") {
                    $("#<%=ExpectedHighSchoolDategrade.ClientID%>").hide();
                }
                else
                    $("#<%=ExpectedHighSchoolDategrade.ClientID%>").show();
            }
            else if (highschool == 'rblHighNot') {
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
                $("#<%=highschoolcontactMobile.ClientID%>").hide();
                $("#highschoolYear").show();
                $("#<%=highschoolName.ClientID%>").show();
                $("#<%=highschoolQualificationtype.ClientID%>").show();
                $("#<%=higestEducation.ClientID%>").hide();
                $("#SecondarySection").hide();
                $("#<%=highshoolgrade.ClientID%>").hide();

            }
            else {
                $("#<%=highschoolCountry.ClientID%>").hide();
                $("#<%=highschoolstartDate.ClientID%>").hide();
                $("#<%=highschoolendDate.ClientID%>").hide();
                $("#<%=highschoolstudymode.ClientID%>").hide();
                $("#<%=highschoollanguage.ClientID%>").hide();
                $("#<%=gradetype.ClientID%>").hide();
                $("#<%=highschoolcontactMobile.ClientID%>").hide();
                $("#<%=highschoolgradeachieved.ClientID%>").hide();
                $("#<%=ExpectedHighSchoolDategrade.ClientID%>").hide();
                $("#<%=highschoolverify.ClientID%>").hide();
                $("#<%=highschoolrelation.ClientID%>").hide();
                $("#<%=highschoolcontactEmail.ClientID%>").hide();
                $("#highschoolYear").hide();
                $("#<%=highschoolName.ClientID%>").hide();
                $("#<%=highschoolQualificationtype.ClientID%>").hide();
                $("#<%=higestEducation.ClientID%>").hide();
                $("#SecondarySection").hide();
                $("#<%=highshoolgrade.ClientID%>").hide();
                $("#<%=highshoolgrade.ClientID%>").hide();
            }


            var Secondary = $("input[type=radio][name='ctl00$ContentPlaceHolder1$Secondary']:checked").val();
            if (Secondary == 'rblSecondaryYes') {
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
                $("#<%=secondarygrade.ClientID%>").show();
                $("#<%=SecondaryschoolName.ClientID%>").show();
                $("#<%=SecondaryQualificationtype.ClientID%>").show();
                $("#HigherSectionSection").show();
                $("#<%=secondarycontactEmail.ClientID%>").show();
                $("#<%=higher.ClientID%>").show();
                $("#<%=secondarygrade.ClientID%>").show();
                $("#<%=secondarycontactMobile.ClientID%>").show();

            }
            else if (Secondary == 'rblSecondaryNot') {
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
                $("#<%=secondarygrade.ClientID%>").show();
                $("#<%=SecondaryschoolName.ClientID%>").show();
                $("#<%=SecondaryQualificationtype.ClientID%>").show();
                $("#<%=secondarygrade.ClientID%>").hide();
                $("#<%=secondarycontactEmail.ClientID%>").hide();
                $("#<%=secondarycontactMobile.ClientID%>").hide();
            }
            else {
                $("#<%=higher.ClientID%>").hide();
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
                $("#<%=secondarygrade.ClientID%>").hide();
                $("#<%=SecondaryschoolName.ClientID%>").hide();
                $("#<%=SecondaryQualificationtype.ClientID%>").hide();
                $("#HigherSectionSection").show();
                $("#<%=secondarycontactEmail.ClientID%>").hide();
                $("#SecondaryEducation").hide();
                $("#<%=secondarygrade.ClientID%>").hide();
                $("#<%=secondarycontactMobile.ClientID%>").hide();
            }

            var Higher = $("input[type=radio][name='ctl00$ContentPlaceHolder1$higher']:checked").val();
            if (Higher == 'rblhigherYes') {
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
            else if (Higher == 'rblhigherNot') {
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
                $("#<%=higherverify.ClientID%>").show();
                $("#<%=higherrelation.ClientID%>").show();
                $("#<%=highercontactEmail.ClientID%>").show();
                $("#<%=highergrade.ClientID%>").hide();
                $("#<%=addanother.ClientID%>").hide();
                $("#<%=highercontactMobile.ClientID%>").show();
                var HigherGrade = $("input[type=radio][name='ctl00$ContentPlaceHolder1$highergradeachieved']:checked").val();
                if (HigherGrade == "rblhighergradeachievedYes") {
                    $("#<%=ExpectedHigherDategrade.ClientID%>").hide();
                }
                else {
                    $("#<%=ExpectedHigherDategrade.ClientID%>").show();
                }
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
            var Diploma = $("input[type=radio][name='ctl00$ContentPlaceHolder1$diploma']:checked").val();
            if (Diploma == "rbldiplomaYes") {

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
            else if (Diploma == "higherNot") {
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
                $("#<%=diplomagrade.ClientID%>").hide();
                $("#<%=diplomacontactMobile.ClientID%>").hide();
                var DiplomaGrade = $("input[type=radio][name='ctl00$ContentPlaceHolder1$DiplomaGrade']:checked").val();
                if (DiplomaGrade == "rblDiplomaGradeYes.ClientID%>") {
                    $("#<%=ExpectedDiplomaDategrade.ClientID%>").hide();
                }
                else
                    $("#<%=ExpectedDiplomaDategrade.ClientID%>").show();
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

            //var SecondaryGrade = $("input[type=radio][name='ctl00$ContentPlaceHolder1$Secondarygradeachieved']:checked.ClientID%>").val();
            //if (SecondaryGrade == "rblSecondarygradeachievedYes.ClientID%>") {
            //    $("#<%=ExpectedSecondaryDategrade.ClientID%>").hide();
            //}
            //else
            //    $("#<%=ExpectedSecondaryDategrade.ClientID%>").show();



        });

        

        //Handle High School
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$highschool']").click(function () {
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
                    $("#<%=higestEducation.ClientID%>").hide();
                    $("#<%=highshoolgrade.ClientID%>").show();
                    $("#<%=highschoolcontactMobile.ClientID%>").show();
                    $("#SecondarySection").show();
                }
                else if ($("#<%=rblHighNot.ClientID%>").is(":checked")) {
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
                    $("#<%=higestEducation.ClientID%>").show();
                    $("#SecondarySection").hide();
                    $("#<%=highshoolgrade.ClientID%>").hide();
                    $("#<%=highschoolcontactMobile.ClientID%>").hide();
                }
                else {
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
                    $("#<%=higestEducation.ClientID%>").hide();
                    $("#SecondarySection").hide();
                    $("#<%=highshoolgrade.ClientID%>").hide();
                    $("#<%=highschoolcontactMobile.ClientID%>").hide();
                }
            });
        });
        //handle higher secondary
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$Secondary']").click(function () {
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
                    $("#<%=secondarygrade.ClientID%>").show();
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
                    $("#<%=secondarygrade.ClientID%>").show();
                    $("#<%=SecondaryschoolName.ClientID%>").show();
                    $("#<%=SecondaryQualificationtype.ClientID%>").show();
                    $("#<%=secondarygrade.ClientID%>").hide();
                    $("#<%=secondarycontactMobile.ClientID%>").hide();
                }
                else {
                    $("#<%=secondarycontactEmail.ClientID%>").hide();
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
                    $("#<%=secondarygrade.ClientID%>").hide();
                    $("#<%=SecondaryschoolName.ClientID%>").hide();
                    $("#<%=SecondaryQualificationtype.ClientID%>").hide();
                    $("#HigherSectionSection").show();
                    $("#<%=secondarycontactEmail.ClientID%>").hide();
                    $("#SecondaryEducation>").hide();
                    $("#<%=secondarygrade.ClientID%>").hide();
                    $("#<%=secondarycontactMobile.ClientID%>").hide();
                }
            });
        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$higher']").click(function () {
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
                    $("#<%=higherverify.ClientID%>").show();
                    $("#<%=higherrelation.ClientID%>").show();
                    $("#<%=highercontactEmail.ClientID%>").show();
                    $("#<%=highergrade.ClientID%>").hide();
                    $("#<%=addanother.ClientID%>").hide();
                    $("#<%=highercontactMobile.ClientID%>").show();
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
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$diploma']").click(function () {
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
                    $("#<%=diplomaverify.ClientID%>").show();
                    $("#<%=diplomarelation.ClientID%>").show();
                    $("#<%=diplomacontactEmail.ClientID%>").show();
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
        $('#ContentPlaceHolder1_txtStartDate').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtEndDate').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtExpectedHighSchoolResult').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtDiplomaStartDate').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtDiplomaEndDate').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtExpectedDiplomaResult').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtSecondaryStartDate').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtSecondaryEndDate').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtExpectedSecondaryResult').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtHigherStartDate').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtHigherEndDate').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtExpectedHigherDategrade').flatpickr({

            dateFormat: 'Y-m-d'
        });
        //document.getElementById("ContentPlaceHolder1_dob.ClientID%>").flatpickr({
        //    wrap: true,
        //    weekNumbers: true,
        //    enableTime: true, // enables timepicker default is false    
        //    time_24hr: true, // set to false for AM PM default is false
        //    onChange: function (selectedDates, dateStr, instance) {
        //        console.log("changed.ClientID%>");
        //    }
        //});

        function ConfirmOnDelete(item) {
            if (confirm("Are you sure to delete: " + item + "?.ClientID%>") == true)
                return true;
            else
                return false;
        }

    </script>


</asp:Content>
