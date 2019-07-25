<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Supervisoreducationdetails.aspx.cs" Inherits="admin_Supervisoreducationdetails" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>

</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Applicant education details</li>
        </ol>

        <div class="card">
            <div class="list-group list-group-fit">
                <!----High School Start------>
                <div class="list-group-item" id="highschool" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschool">
                        <div class="form-row">
                            <label id="labelhighschool" runat="server" for="highschool" class="col-md-3 col-form-label form-label">Have you completed high school?</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschool" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoolComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolCountry" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolCountry">
                        <div class="form-row">
                            <label id="labelhighschoolCountry" runat="server" for="highschoolCountry" class="col-md-3 col-form-label form-label">Country of High School Education</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoolCountry" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoolCountryComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolstartDate" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstartDate">
                        <div class="form-row">
                            <label id="labelhighschoolstartDate" runat="server" for="highschoolstartDate" class="col-md-3 col-form-label form-label">Start Date </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoolstartDate" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoolstartDateComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolendDate" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolendateDate">
                        <div class="form-row">
                            <label id="labelhighschoolendDate" runat="server" for="highschoolendDate" class="col-md-3 col-form-label form-label">End Date </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoolendDate" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoolendDateComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolName" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolName">
                        <div class="form-row">
                            <label id="labelhighschoolName" runat="server" for="highschoolName" class="col-md-3 col-form-label form-label">Name of School</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoolName" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoolNameComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolQualificationtype" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolQualificationtype">
                        <div class="form-row">
                            <label id="labelhighschoolQualificationtype" runat="server" for="highschoolQualificationtype" class="col-md-3 col-form-label form-label">Qualification Type</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoolQualificationtype" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoolQualificationtypeComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolstudymode" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstudymode">
                        <div class="form-row">
                            <label id="labelhighschoolstudymode" runat="server" for="highschoolstudymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoolstudymode" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoolstudymodeComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoollanguage" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoollanguage">
                        <div class="form-row">
                            <label id="labelhighschoollanguage" runat="server" for="highschoollanguage" class="col-md-3 col-form-label form-label">Language (Medium) of Study</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoollanguage" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoollanguageComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="gradetype" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-gradetype">
                        <div class="form-row">
                            <label id="labelgradetype" runat="server" for="EnglishCourse" class="col-md-3 col-form-label form-label">Grade Type</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblgradetype" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblgradetypeComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolgradeachieved" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-gradeachieved">
                        <div class="form-row">
                            <label id="labelgradeachieved" runat="server" for="gradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblgradeachieved" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblgradeachievedComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="ExpectedHighSchoolDategrade" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedHighSchoolDategrade">
                        <div class="form-row">
                            <label id="labelExpectedHighSchoolDategrade" runat="server" for="EnglishCourse" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblExpectedHighSchoolDategrade" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblExpectedHighSchoolDategradeComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolverify" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolverify">
                        <div class="form-row">
                            <label id="labelhighschoolverify" runat="server" for="highschoolverify" class="col-md-3 col-form-label form-label">Name of Contact who can verify this qualification </label>
                            <div class="col-md-4">

                                <asp:Label ID="lblhighschoolverify" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoolverifyComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolrelation" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolrelation">
                        <div class="form-row">
                            <label id="labelhighschoolrelation" runat="server" for="highschoolrelation" class="col-md-3 col-form-label form-label">Relationship with the Contact </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoolrelation" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoolrelationComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolcontactEmail" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolcontactEmail">
                        <div class="form-row">
                            <label id="labelhighschoolcontactEmail" runat="server" for="highschoolcontactEmail" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoolcontactEmail" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoolcontactEmailComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolcontactMobile" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolcontactMobile">
                        <div class="form-row">
                            <label id="labelhighschoolcontactMobile" runat="server" for="highschoolcontactMobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number of Contact who can verify your qualification</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoolcontactMobile" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighschoolcontactMobileComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="higestEducation" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-higestEducation">
                        <div class="form-row">
                            <label id="labelhigestEducation" runat="server" for="higestEducation" class="col-md-3 col-form-label form-label">Highest Education</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblhigestEducation" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblhigestEducationComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="highshoolgrade" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolYear">

                        <div class="form-row">
                            <div class="col-md-4">
                                <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                    <asp:GridView ID="grd10" DataKeyNames="applicantgradeid" runat="server" CssClass="table" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:BoundField DataField="applicantgradeid" HeaderText="ID" InsertVisible="False"
                                                ReadOnly="True" SortExpression="applicantgradeid" />
                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Course Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcoursename" runat="server"
                                                        Text='<%#Eval("coursename")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Subject">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblsubject" runat="server"
                                                        Text='<%#Eval("subject")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Others ">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblothers" runat="server"
                                                        Text='<%#Eval("othersubject")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGradeType" runat="server"
                                                        Text='<%#Eval("gradetype")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade ">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGrade" runat="server"
                                                        Text='<%#Eval("studentgrade")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
                                        </Columns>
                                    </asp:GridView>

                                </div>

                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblhighshoolgradeComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                <!----High School END------>

                <!----Secondary Start------>
                <div id="SecondarySection">
                    <div class="list-group-item" id="Secondary" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-Secondary">
                            <div class="form-row">
                                <label id="labelSecondary" runat="server" for="Secondary" class="col-md-3 col-form-label form-label">Have you completed Senior Secondary school? (Year 12)?</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondary" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondaryComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="SecondaryCountry" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-SecondaryCountry">
                            <div class="form-row">
                                <label id="labelSecondaryCountry" runat="server" for="SecondaryCountry" class="col-md-3 col-form-label form-label">Country of Secondary Education</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondaryCountry" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondaryCountryComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="SecondarystartDate" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-SecondarystartDate">
                            <div class="form-row">
                                <label id="labelSecondarystartDate" runat="server" for="SecondarystartDate" class="col-md-3 col-form-label form-label">Start Date </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondarystartDate" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondarystartDateComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="SecondaryendDate" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-SecondaryendDate">
                            <div class="form-row">
                                <label id="labelSecondaryendDate" runat="server" for="SecondaryendDate" class="col-md-3 col-form-label form-label">End Date </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondaryendDate" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondaryendDateComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="SecondaryschoolName" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-SecondaryschoolName">
                            <div class="form-row">
                                <label id="labelSecondaryschoolName" runat="server" for="SecondaryschoolName" class="col-md-3 col-form-label form-label">Name of School</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondaryschoolName" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondaryschoolNameComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="SecondaryQualificationtype" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-SecondaryQualificationtype">
                            <div class="form-row">
                                <label id="labelSecondaryQualificationtype" runat="server" for="SecondaryQualificationtype" class="col-md-3 col-form-label form-label">Qualification Type</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondaryQualificationtype" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondaryQualificationtypeComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="Secondarystudymode" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-Secondarystudymode">
                            <div class="form-row">
                                <label id="labelSecondarystudymode" runat="server" for="Secondarystudymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondarystudymode" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondarystudymodeComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="Secondarylanguage" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-Secondarylanguage">
                            <div class="form-row">
                                <label id="labelSecondarylanguage" runat="server" for="Secondarylanguage" class="col-md-3 col-form-label form-label">Language (Medium) of Study</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondarylanguage" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondarylanguageComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="Secondarygradetype" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-Secondarygradetype">
                            <div class="form-row">
                                <label id="labelSecondarygradetype" runat="server" for="Secondarygradetype" class="col-md-3 col-form-label form-label">Grade Type</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondarygradetype" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondarygradetypeComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="Secondarygradeachieved" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-Secondarygradeachieved">
                            <div class="form-row">
                                <label id="labelSecondarygradeachieved" runat="server" for="Secondarygradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondarygradeachieved" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondarygradeachievedComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="ExpectedSecondaryDategrade" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedSecondaryDategrade">
                            <div class="form-row">
                                <label id="labelExpectedSecondaryDategrade" runat="server" for="ExpectedSecondaryDategrade" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblExpectedSecondaryDategrade" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblExpectedSecondaryDategradeComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="Secondaryverify" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-Secondaryverify">
                            <div class="form-row">
                                <label id="labelSecondaryverify" runat="server" for="Secondaryverify" class="col-md-3 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondaryverify" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSecondaryverifyComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="secondaryschoolrelation" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-secondaryschoolrelation">
                            <div class="form-row">
                                <label id="labelsecondaryschoolrelation" runat="server" for="secondaryschoolrelation" class="col-md-3 col-form-label form-label">Relationship with the Contact </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblsecondaryschoolrelation" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblsecondaryschoolrelationComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="secondarycontactEmail" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-secondarycontactEmail">
                            <div class="form-row">
                                <label id="labelsecondarycontactEmail" runat="server" for="secondarycontactEmail" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblsecondarycontactEmail" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblsecondarycontactEmailComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="secondarycontactMobile" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-secondarycontactMobile">
                            <div class="form-row">
                                <label id="labelsecondarycontactMobile" runat="server" for="secondarycontactMobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number of Contact who can verify your qualification </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblsecondarycontactMobile" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblsecondarycontactMobileComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="secondarygrade" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-highschoolYear">

                            <div class="form-row">
                                <div class="col-md-4">
                                    <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                        <asp:GridView ID="grdSecondary" DataKeyNames="applicantgradeid" runat="server" CssClass="table" AutoGenerateColumns="false">
                                            <Columns>
                                                <asp:BoundField DataField="applicantgradeid" HeaderText="ID" InsertVisible="False"
                                                    ReadOnly="True" SortExpression="applicantgradeid" />
                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Course Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblcoursename" runat="server"
                                                            Text='<%#Eval("coursename")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Subject">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblsubject" runat="server"
                                                            Text='<%#Eval("subject")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Others ">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblothers" runat="server"
                                                            Text='<%#Eval("othersubject")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblGradeType" runat="server"
                                                            Text='<%#Eval("gradetype")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade ">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblGrade" runat="server"
                                                            Text='<%#Eval("studentgrade")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
                                            </Columns>
                                        </asp:GridView>

                                    </div>

                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblsecondarygradeComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <!----Secondary END------>
                <!----Higher Education Start------>
                <div id="HigherSectionSection">

                    <div class="list-group-item" id="higher" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-higher">
                            <div class="form-row">
                                <label id="labelhigher" runat="server" for="higher" class="col-md-3 col-form-label form-label">
                                    Have you completed any Higher (Under Graduate, Masters or PhD) degree? 
?</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblhigher" runat="server"> </asp:Label>
                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblhigherComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="UG" runat="server" visible="false">
                        <div class="list-group-item" id="highercourse" style="display: none" runat="server">

                            <div class="form-group m-0" role="group" aria-labelledby="label-highercourse">
                                <div class="form-row">
                                    <label id="labelhighercourse" runat="server" for="highercourse" class="col-md-3 col-form-label form-label">Higher Course</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercourse" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercourseComments" runat="server"></asp:Label>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherCountry" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherCountry">
                                <div class="form-row">
                                    <label id="labelhigherCountry" runat="server" for="higherCountry" class="col-md-3 col-form-label form-label">Country of Higher Education</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherCountry" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherCountryComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherstartDate" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstartDate">
                                <div class="form-row">
                                    <label id="labelhigherstartDate" runat="server" for="highschoolstartDate" class="col-md-3 col-form-label form-label">Start Date </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherschoolstartDate" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherschoolstartDateComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherendDate" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherendDate">
                                <div class="form-row">
                                    <label id="labelhigherendDate" runat="server" for="higherendDate" class="col-md-3 col-form-label form-label">End Date </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherendDate" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherendDateComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherschoolName" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherschoolName">
                                <div class="form-row">
                                    <label id="labelhigherschoolName" runat="server" for="higherschoolName" class="col-md-3 col-form-label form-label">Name of School</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherschoolName" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherschoolNameComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherQualificationtype" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherQualificationtype">
                                <div class="form-row">
                                    <label id="labelhigherQualificationtype" runat="server" for="higherQualificationtype" class="col-md-3 col-form-label form-label">Qualification Type</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherQualificationtype" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherQualificationtypeComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherstudymode" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherstudymode">
                                <div class="form-row">
                                    <label id="labelhigherstudymode" runat="server" for="higherstudymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherstudymode" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherstudymodeComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherlanguage" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherlanguage">
                                <div class="form-row">
                                    <label id="labelhigherlanguage" runat="server" for="higherlanguage" class="col-md-3 col-form-label form-label">Language (Medium) of Study</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherlanguage" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherlanguageComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highergradetype" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highergradetype">
                                <div class="form-row">
                                    <label id="labelhighergradetype" runat="server" for="highergradetype" class="col-md-3 col-form-label form-label">Grade Type</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighergradetype" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighergradetypeComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highergradeachieved" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highergradeachieved">
                                <div class="form-row">
                                    <label id="labelhighergradeachieved" runat="server" for="highergradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighergradeachieved" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighergradeachievedComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="ExpectedHigherDategrade" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedHigherDategrade">
                                <div class="form-row">
                                    <label id="labelExpectedHigherDategrade" runat="server" for="ExpectedHigherDategrade" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblExpectedHigherDategrade" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblExpectedHigherDategradeComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherverify" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherverify">
                                <div class="form-row">
                                    <label id="labelhigherverify" runat="server" for="higherverify" class="col-md-3 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherverify" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherverifyComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherrelation" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherrelation">
                                <div class="form-row">
                                    <label id="labelhigherrelation" runat="server" for="highschoolrelation" class="col-md-3 col-form-label form-label">Relationship with the Contact </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherschoolrelation" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherschoolrelationComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highercontactEmail" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highercontactEmail">
                                <div class="form-row">
                                    <label id="labelhighercontactEmail" runat="server" for="highercontactEmail" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercontactEmail" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercontactEmailComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highercontactMobile" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highercontactMobile">
                                <div class="form-row">
                                    <label id="labelhighercontactMobile" runat="server" for="highercontactMobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number who can verify this qualification </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercontactMobile" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercontactMobileComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="PG" runat="server" visible="false">
                        <div class="list-group-item" id="highercoursePG" runat="server" style="display: none">

                            <div class="form-group m-0" role="group" aria-labelledby="label-highercourse">
                                <div class="form-row">
                                    <label id="labelhighercoursePG" runat="server" for="highercourse" class="col-md-3 col-form-label form-label">Higher Course</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercoursePG" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercoursePGComments" runat="server"></asp:Label>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherCountryPG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherCountry">
                                <div class="form-row">
                                    <label id="labelhigherCountryPG" runat="server" for="higherCountry" class="col-md-3 col-form-label form-label">Country of Higher Education</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherCountryPG" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherCountryPGComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherstartDatePG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstartDate">
                                <div class="form-row">
                                    <label id="labelhigherstartDatePG" runat="server" for="highschoolstartDate" class="col-md-3 col-form-label form-label">Start Date </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherstartDatePG" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherstartDatePGComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherendDatePG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherendDate">
                                <div class="form-row">
                                    <label id="labelhigherendDatePG" runat="server" for="higherendDate" class="col-md-3 col-form-label form-label">End Date </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherendDatePG" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherendDatePGComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherschoolNamePG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherschoolName">
                                <div class="form-row">
                                    <label id="labelhigherschoolNamePG" runat="server" for="higherschoolName" class="col-md-3 col-form-label form-label">Name of School</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherschoolNamePG" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherschoolNamePGComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherQualificationtypePG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherQualificationtype">
                                <div class="form-row">
                                    <label id="labelhigherQualificationtypePG" runat="server" for="higherQualificationtype" class="col-md-3 col-form-label form-label">Qualification Type</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherQualificationtypePG" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherQualificationtypePGComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherstudymodePG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherstudymode">
                                <div class="form-row">
                                    <label id="labelhigherstudymodePG" runat="server" for="higherstudymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherstudymodePG" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherstudymodePGComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherlanguagePG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherlanguage">
                                <div class="form-row">
                                    <label id="labelhigherlanguagePG" runat="server" for="higherlanguage" class="col-md-3 col-form-label form-label">Language (Medium) of Study</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherlanguagePG" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherlanguagePGComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highergradetypePG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highergradetype">
                                <div class="form-row">
                                    <label id="labelhighergradetypePG" runat="server" for="highergradetype" class="col-md-3 col-form-label form-label">Grade Type</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighergradetypePG" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighergradetypePGComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highergradeachievedPG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highergradeachieved">
                                <div class="form-row">
                                    <label id="labelhighergradeachievedPG" runat="server" for="highergradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighergradeachievedPG" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighergradeachievedPGComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="ExpectedHigherDategradePG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedHigherDategrade">
                                <div class="form-row">
                                    <label id="labelExpectedHigherDategradePG" runat="server" for="ExpectedHigherDategrade" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblExpectedHigherDategradePG" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblExpectedHigherDategradePGComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherverifyPG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherverify">
                                <div class="form-row">
                                    <label id="labelhigherverifyPG" runat="server" for="higherverify" class="col-md-3 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherverifyPG" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherverifyPGComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherrelationPG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherrelation">
                                <div class="form-row">
                                    <label id="labelhigherrelationPG" runat="server" for="highschoolrelation" class="col-md-3 col-form-label form-label">Relationship with the Contact </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherrelationPG" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherrelationPGComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highercontactEmailPG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highercontactEmail">
                                <div class="form-row">
                                    <label id="labelhighercontactEmailPG" runat="server" for="highercontactEmail" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercontactEmailPG" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercontactEmailPGComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highercontactMobilePG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highercontactMobile">
                                <div class="form-row">
                                    <label id="labelhighercontactMobilePG" runat="server" for="highercontactMobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number who can verify this qualification </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercontactMobilePG" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercontactMobilePGComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="Phd" runat="server" visible="false">
                        <div class="list-group-item" id="highercoursePhd" runat="server" style="display: none">

                            <div class="form-group m-0" role="group" aria-labelledby="label-highercourse">
                                <div class="form-row">
                                    <label id="labelhighercoursePhd" runat="server" for="highercourse" class="col-md-3 col-form-label form-label">Higher Course</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercoursePhd" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercoursePhdComments" runat="server"></asp:Label>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherCountryPhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherCountry">
                                <div class="form-row">
                                    <label id="labelhigherCountryPhd" runat="server" for="higherCountry" class="col-md-3 col-form-label form-label">Country of Higher Education</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherCountryPhd" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherCountryPhdComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherstartDatePhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstartDate">
                                <div class="form-row">
                                    <label id="labelhigherstartDatePhd" runat="server" for="highschoolstartDate" class="col-md-3 col-form-label form-label">Start Date </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherstartDatePhd" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherstartDatePhdComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherendDatePhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherendDate">
                                <div class="form-row">
                                    <label id="labelhigherendDatePhd" runat="server" for="higherendDate" class="col-md-3 col-form-label form-label">End Date </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherendDatePhd" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherendDatePhdComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherschoolNamePhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherschoolName">
                                <div class="form-row">
                                    <label id="labelhigherschoolNamePhd" runat="server" for="higherschoolName" class="col-md-3 col-form-label form-label">Name of School</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherschoolNamePhd" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherschoolNamePhdComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherQualificationtypePhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherQualificationtype">
                                <div class="form-row">
                                    <label id="labelhigherQualificationtypePhd" runat="server" for="higherQualificationtype" class="col-md-3 col-form-label form-label">Qualification Type</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherQualificationtypePhd" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherQualificationtypePhdComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherstudymodePhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherstudymode">
                                <div class="form-row">
                                    <label id="labelhigherstudymodePhd" runat="server" for="higherstudymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherstudymodePhd" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherstudymodePhdComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherlanguagePhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherlanguage">
                                <div class="form-row">
                                    <label id="labelhigherlanguagePhd" runat="server" for="higherlanguage" class="col-md-3 col-form-label form-label">Language (Medium) of Study</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherlanguagePhd" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherlanguagePhdComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highergradetypePhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highergradetype">
                                <div class="form-row">
                                    <label id="labelhighergradetypePhd" runat="server" for="highergradetype" class="col-md-3 col-form-label form-label">Grade Type</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighergradetypePhd" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighergradetypePhdComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highergradeachievedPhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highergradeachieved">
                                <div class="form-row">
                                    <label id="labelhighergradeachievedPhd" runat="server" for="highergradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighergradeachievedPhd" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighergradeachievedPhdComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="ExpectedHigherDategradePhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedHigherDategrade">
                                <div class="form-row">
                                    <label id="labelExpectedHigherDategradePhd" runat="server" for="ExpectedHigherDategrade" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblExpectedHigherDategradePhd" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblExpectedHigherDategradePhdComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherverifyPhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherverify">
                                <div class="form-row">
                                    <label id="labelhigherverifyPhd" runat="server" for="higherverify" class="col-md-3 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherverifyPhd" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherverifyPhdComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherrelationPhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherrelation">
                                <div class="form-row">
                                    <label id="labelhigherrelationPhd" runat="server" for="highschoolrelation" class="col-md-3 col-form-label form-label">Relationship with the Contact </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherrelationPhd" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherrelationPhdComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highercontactEmailPhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highercontactEmail">
                                <div class="form-row">
                                    <label id="labelhighercontactEmailPhd" runat="server" for="highercontactEmail" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercontactEmailPhd" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercontactEmailPhdComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highercontactMobilePhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highercontactMobile">
                                <div class="form-row">
                                    <label id="labelhighercontactMobilePhd" runat="server" for="highercontactMobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number who can verify this qualification </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercontactMobilePhd" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercontactMobilePhdComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="OtherHigherCourse" runat="server" visible="false">
                        <div class="list-group-item" id="highercourseOther" style="display: none" runat="server">

                            <div class="form-group m-0" role="group" aria-labelledby="label-highercourse">
                                <div class="form-row">
                                    <label id="labelhighercourseOther" runat="server" for="highercourse" class="col-md-3 col-form-label form-label">Higher Course</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercourseOther" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercourseOtherComments" runat="server"></asp:Label>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherCountryOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherCountry">
                                <div class="form-row">
                                    <label id="labelhigherCountryOther" runat="server" for="higherCountry" class="col-md-3 col-form-label form-label">Country of Higher Education</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherCountryOther" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherCountryOtherComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherstartDateOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstartDate">
                                <div class="form-row">
                                    <label id="labelhigherstartDateOther" runat="server" for="highschoolstartDate" class="col-md-3 col-form-label form-label">Start Date </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherstartDateOther" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherstartDateOtherComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherendDateOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherendDate">
                                <div class="form-row">
                                    <label id="labelhigherendDateOther" runat="server" for="higherendDate" class="col-md-3 col-form-label form-label">End Date </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherendDateOther" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherendDateOtherComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherschoolNameOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherschoolName">
                                <div class="form-row">
                                    <label id="labelhigherschoolNameOther" runat="server" for="higherschoolName" class="col-md-3 col-form-label form-label">Name of School</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherschoolNameOther" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherschoolNameOtherComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherQualificationtypeOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherQualificationtype">
                                <div class="form-row">
                                    <label id="labelhigherQualificationtypeOther" runat="server" for="higherQualificationtype" class="col-md-3 col-form-label form-label">Qualification Type</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherQualificationtypeOther" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherQualificationtypeOtherComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherstudymodeOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherstudymode">
                                <div class="form-row">
                                    <label id="labelhigherstudymodeOther" runat="server" for="higherstudymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherstudymodeOther" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherstudymodeOtherComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherlanguageOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherlanguage">
                                <div class="form-row">
                                    <label id="labelhigherlanguageOther" runat="server" for="higherlanguage" class="col-md-3 col-form-label form-label">Language (Medium) of Study</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherlanguageOther" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherlanguageOtherComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highergradetypeOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highergradetype">
                                <div class="form-row">
                                    <label id="labelhighergradetypeOther" runat="server" for="highergradetype" class="col-md-3 col-form-label form-label">Grade Type</label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighergradetypeOther" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighergradetypeOtherComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highergradeachievedOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highergradeachieved">
                                <div class="form-row">
                                    <label id="labelhighergradeachievedOther" runat="server" for="highergradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighergradeachievedOther" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighergradeachievedOtherComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="ExpectedHigherDategradeOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedHigherDategrade">
                                <div class="form-row">
                                    <label id="labelExpectedHigherDategradeOther" runat="server" for="ExpectedHigherDategrade" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblExpectedHigherDategradeOther" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblExpectedHigherDategradeOtherComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherverifyOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherverify">
                                <div class="form-row">
                                    <label id="labelhigherverifyOther" runat="server" for="higherverify" class="col-md-3 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherverifyOther" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherverifyOtherComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherrelationOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherrelation">
                                <div class="form-row">
                                    <label id="labelhigherrelationOther" runat="server" for="highschoolrelation" class="col-md-3 col-form-label form-label">Relationship with the Contact </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherrelationOther" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhigherrelationOtherComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highercontactEmailOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highercontactEmail">
                                <div class="form-row">
                                    <label id="labelhighercontactEmailOther" runat="server" for="highercontactEmail" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercontactEmailOther" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercontactEmailOtherComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highercontactMobileOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highercontactMobile">
                                <div class="form-row">
                                    <label id="labelhighercontactMobileOther" runat="server" for="highercontactMobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number who can verify this qualification </label>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercontactMobileOther" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-md-4">
                                        <asp:Label ID="lblhighercontactMobileOtherComments" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="highergrade" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-highschoolYear">

                            <div class="form-row">
                                <div class="col-md-4">
                                    <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                        <asp:GridView ID="grdHigher" DataKeyNames="applicantgradeid" runat="server" CssClass="table" AutoGenerateColumns="false">
                                            <Columns>
                                                <asp:BoundField DataField="applicantgradeid" HeaderText="ID" InsertVisible="False"
                                                    ReadOnly="True" SortExpression="applicantgradeid" />
                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Course Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblcoursename" runat="server"
                                                            Text='<%#Eval("coursename")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Subject">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblsubject" runat="server"
                                                            Text='<%#Eval("subject")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Others ">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblothers" runat="server"
                                                            Text='<%#Eval("othersubject")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade Type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblGradeType" runat="server"
                                                            Text='<%#Eval("gradetype")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade ">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblGrade" runat="server"
                                                            Text='<%#Eval("studentgrade")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
                                            </Columns>
                                        </asp:GridView>

                                    </div>

                                </div>
                                <div class="col-md-4">
                                    <asp:Label ID="lblhighergradeComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>


                    </div>

                </div>
                <!----Higher Education END------>
                <!----Diploma Start------>
                <div class="list-group-item" id="diploma" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diploma">
                        <div class="form-row">
                            <label id="labeldiploma" runat="server" for="diploma" class="col-md-3 col-form-label form-label">Have you completed any Diploma or Certificate Programs ?</label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiploma" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomaComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomaCountry" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomaCountry">
                        <div class="form-row">
                            <label id="labeldiplomaCountry" runat="server" for="diplomaCountry" class="col-md-3 col-form-label form-label">Country of Diploma or Certificate Programs</label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomaCountry" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomaCountryComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomastartDate" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomastartDate">
                        <div class="form-row">
                            <label id="labeldiplomastartDate" runat="server" for="diplomastartDate" class="col-md-3 col-form-label form-label">Start Date </label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomastartDate" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomastartDateComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomaendDate" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomaendDate">
                        <div class="form-row">
                            <label id="labeldiplomaendDate" runat="server" for="diplomaendDate" class="col-md-3 col-form-label form-label">End Date </label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomaendDate" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomaendDateComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomaschoolName" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomaschoolName">
                        <div class="form-row">
                            <label id="labeldiplomaschoolName" runat="server" for="diplomaschoolName" class="col-md-3 col-form-label form-label">Name of School</label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomaschoolName" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomaschoolNameComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomaQualificationtype" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomaQualificationtype">
                        <div class="form-row">
                            <label id="labeldiplomaQualificationtype" runat="server" for="diplomaQualificationtype" class="col-md-3 col-form-label form-label">Qualification Type</label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomaQualificationtype" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomaQualificationtypeComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomastudymode" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomastudymode">
                        <div class="form-row">
                            <label id="labeldiplomastudymode" runat="server" for="diplomastudymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomastudymode" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomastudymodeComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomalanguage" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomalanguage">
                        <div class="form-row">
                            <label id="labeldiplomalanguage" runat="server" for="diplomalanguage" class="col-md-3 col-form-label form-label">Language (Medium) of Study</label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomalanguage" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomalanguageComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomagradetype" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomagradetype">
                        <div class="form-row">
                            <label id="labeldiplomagradetype" runat="server" for="diplomagradetype" class="col-md-3 col-form-label form-label">Grade Type</label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomagradetype" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomagradetypeComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomagradeachieved" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomagradeachieved">
                        <div class="form-row">
                            <label id="labeldiplomagradeachieved" runat="server" for="diplomagradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomagradeachieved" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomagradeachievedComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="ExpectedDiplomaDategrade" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedDiplomaDategrade">
                        <div class="form-row">
                            <label id="labelExpectedDiplomaDategrade" runat="server" for="ExpectedDiplomaDategrade" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblExpectedDiplomaDategrade" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lblExpectedDiplomaDategradeComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomaverify" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomaverify">
                        <div class="form-row">
                            <label id="labeldiplomaverify" runat="server" for="diplomaverify" class="col-md-3 col-form-label form-label">Name of Contact who can verify this qualification </label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomaverify" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomaverifyComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomarelation" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomarelation">
                        <div class="form-row">
                            <label id="labeldiplomarelation" runat="server" for="diplomarelation" class="col-md-3 col-form-label form-label">Relationship with the Contact </label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomarelation" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomarelationComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomacontactEmail" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomacontactEmail">
                        <div class="form-row">
                            <label id="labeldiplomacontactEmail" runat="server" for="diplomacontactEmail" class="col-md-3 col-form-label form-label">Email ID of Contact who can verify your employment  </label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomacontactEmail" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomacontactEmailComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomacontactMobile" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomacontactMobile">
                        <div class="form-row">
                            <label id="labeldiplomacontactMobile" runat="server" for="diplomacontactMobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number who can verify this qualification </label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomacontactMobile" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomacontactMobileComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomagrade" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolYear">

                        <div class="form-row">
                            <div class="col-md-4">
                                <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                    <asp:GridView ID="grdDiploma" runat="server" DataKeyNames="applicantgradeid" CssClass="table" AutoGenerateColumns="false">
                                        <Columns>
                                            <asp:BoundField DataField="applicantgradeid" HeaderText="ID" InsertVisible="False"
                                                ReadOnly="True" SortExpression="applicantgradeid" />
                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Course Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcoursename" runat="server"
                                                        Text='<%#Eval("coursename")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Subject">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblsubject" runat="server"
                                                        Text='<%#Eval("subject")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Others ">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblothers" runat="server"
                                                        Text='<%#Eval("othersubject")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade Type">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGradeType" runat="server"
                                                        Text='<%#Eval("gradetype")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Grade ">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblGrade" runat="server"
                                                        Text='<%#Eval("studentgrade")%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
                                        </Columns>
                                    </asp:GridView>

                                </div>

                            </div>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomagradeComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>  <div id="mainDiv" runat="server"></div>
                 <div class="list-group-item">
                    <div class="form-group m-0" role="group" aria-labelledby="label-agentList">
                        <div class="form-row">
                            <label for="agentList" class="col-md-3 col-form-label form-label">Superviosr Action</label>
                            <div class="col-md-4">
                                <input type="radio" id="rbApproved" runat="server" name="supervisorAction"> Approved
                                <input type="radio" id="rbDenied" runat="server" name="supervisorAction">Further Review
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtComments" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>



                <!----Diploma END------>
              
                <div class="list-group-item">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                        <div class="form-row">

                            <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnSave_Click" />
                            <div class="col-md-4">
                                <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                <asp:Label ID="lblSaveTime" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>


    </div>
</asp:Content>
