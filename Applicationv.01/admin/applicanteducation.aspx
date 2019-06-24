<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicanteducation.aspx.cs" Inherits="admin_applicanteducation" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script>
        $(document).ready(function () {

            $('.fa-question-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });
        });
    </script>
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
                                <span class="helpicon"><i id="ichighschool" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txthighschool" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="ichighschoolCountry" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txthighschoolCountry" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="ichighschoolstartDate" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txthighschoolstartDate" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="ichighschoolendDate" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txthighschoolendDate" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="ichighschoolName" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txthighschoolName" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="ichighschoolQualificationtype" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txthighschoolQualificationtype" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="ichighschoolstudymode" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txthighschoolstudymode" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="ichighschoollanguage" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txthighschoollanguage" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icgradetype" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtgradetype" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="ichighschoolgradeachieved" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txthighschoolgradeachieved" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icExpectedHighSchoolDategrade" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtExpectedHighSchoolDategrade" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="ichighschoolverify" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txthighschoolverify" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="ichighschoolrelation" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txthighschoolrelation" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="ichighschoolcontactEmail" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txthighschoolcontactEmail" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="ichighschoolcontactMobile" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txthighschoolcontactMobile" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="ichigestEducation" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txthigestEducation" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="icSecondary" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtSecondary" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="icSecondaryCountry" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>

                                </div>
                                <div class="col-md-4">
                                    <input id="txtSecondaryCountry" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="icSecondarystartDate" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtSecondarystartDate" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="icSecondaryendDate" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtSecondaryendDate" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="icSecondaryschoolName" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtSecondaryschoolName" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="icSecondaryQualificationtype" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtSecondaryQualificationtype" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="icSecondarystudymode" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtSecondarystudymode" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="icSecondarylanguage" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtSecondarylanguage" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="icSecondarygradetype" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtSecondarygradetype" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="icSecondarygradeachieved" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtSecondarygradeachieved" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="icExpectedSecondaryDategrade" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtExpectedSecondaryDategrade" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="icSecondaryverify" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtSecondaryverify" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="icsecondaryschoolrelation" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtsecondaryschoolrelation" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="icsecondarycontactEmail" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtsecondarycontactEmail" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="icsecondarycontactMobile" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtsecondarycontactMobile" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="ichigher" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txthigher" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <%for (int k = 0; k < HigherEducation.Count; k++)
                        {

                    %>


                    <div class="list-group-item" id="highercourse" runat="server" style="display: none">

                        <div class="form-group m-0" role="group" aria-labelledby="label-highercourse">
                            <div class="form-row">
                                <label id="labelhighercourse" runat="server" for="highercourse" class="col-md-3 col-form-label form-label">Higher Course</label>
                                <div class="col-md-4">

                                    <asp:Label ID="lblhighercourse" runat="server" Text="<%=HigherEducation[k].coursename  %>"></asp:Label>
                                    <span class="helpicon"><i id="ichighercourse" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txthighercourse" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="list-group-item" id="higherCountry" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-higherCountry">
                            <div class="form-row">
                                <label id="labelhigherCountry" runat="server" for="higherCountry" class="col-md-3 col-form-label form-label">Country of Higher Education</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblhigherCountry" runat="server" Text="<%=HigherEducation[k].coursename %>"></asp:Label>
                                    <span class="helpicon"><i id="ichigherCountry" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txthigherCountry" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="ichigherstartDate" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txthigherstartDate" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="ichigherendDate" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txthigherendDate" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="ichigherschoolName" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txthigherschoolName" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="ichigherQualificationtype" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txthigherQualificationtype" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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

                                    <span class="helpicon"><i id="ichigherstudymode" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txthigherstudymode" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="ichigherlanguage" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txthigherlanguage" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="highergradetype" runat="server">
                        <div class="form-group m-0" role="group" aria-labelledby="label-highergradetype">
                            <div class="form-row">
                                <label id="labelhighergradetype" runat="server" for="highergradetype" class="col-md-3 col-form-label form-label">Grade Type</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblhighergradetype" runat="server"></asp:Label>
                                    <span class="helpicon"><i id="ichighergradetype" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txthighergradetype" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="ichighergradeachieved" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txthighergradeachieved" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="icExpectedHigherDategrade" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txtExpectedHigherDategrade" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="ichigherverify" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txthigherverify" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="ichigherrelation" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txthigherrelation" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="ichighercontactEmail" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txthighercontactEmail" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <span class="helpicon"><i id="ichighercontactMobile" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input id="txthighercontactMobile" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <%} %>
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
                                <span class="helpicon"><i id="icdiploma" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtdiploma" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icdiplomaCountry" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtdiplomaCountry" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icdiplomastartDate" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtdiplomastartDate" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icdiplomaendDate" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtdiplomaendDate" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomaschoolName" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomaschoolName">
                        <div class="form-row">
                            <label id="labeldiplomaschoolName" runat="server" for="diplomaschoolName" class="col-md-3 col-form-label form-label">Name of School</label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomaschoolName" runat="server"></asp:Label><span class="helpicon"><i id="icdiplomaschoolName" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtdiplomaschoolName" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icdiplomaQualificationtype" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtdiplomaQualificationtype" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icdiplomastudymode" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtdiplomastudymode" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icdiplomalanguage" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtdiplomalanguage" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icdiplomagradetype" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtdiplomagradetype" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icdiplomagradeachieved" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtdiplomagradeachieved" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icExpectedDiplomaDategrade" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtExpectedDiplomaDategrade" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icdiplomaverify" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtdiplomaverify" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icdiplomarelation" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtdiplomarelation" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icdiplomacontactEmail" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtdiplomacontactEmail" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                <span class="helpicon"><i id="icdiplomacontactMobile" runat="server" class="fa fa-question-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input id="txtdiplomacontactMobile" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                        </div>
                    </div>
                </div>




                <!----Diploma END------>
                <div id="mainDiv" runat="server"></div>
                <div class="list-group-item">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                        <div class="form-row">

                            <asp:Button ID="btn_login" runat="server" Text="Save Changes" CssClass="btn btn-success" />
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
