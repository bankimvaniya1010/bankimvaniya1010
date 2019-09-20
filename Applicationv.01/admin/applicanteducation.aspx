<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicanteducation.aspx.cs" Inherits="admin_applicanteducation" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script>
        $(document).ready(function () {

            $('.fa-info-circle').tipso({
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
                            <label id="labelhighschool" runat="server" for="highschool" class="col-md-2 col-form-label form-label">Have you completed high school?</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblhighschool" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblhighschoolYes" GroupName="highschool" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblhighschoolNo" GroupName="highschool" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="ichighschool" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnhighschool" />
                                <input id="txthighschool" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolCountry" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolCountry">
                        <div class="form-row">
                            <label id="labelhighschoolCountry" runat="server" for="highschoolCountry" class="col-md-2 col-form-label form-label">Country of High School Education</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblhighschoolCountry" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblhighschoolCountryYes" GroupName="highschoolCountry" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblhighschoolCountryNo" GroupName="highschoolCountry" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="ichighschoolCountry" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnhighschoolCountry" />
                                <input id="txthighschoolCountry" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolstartDate" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstartDate">
                        <div class="form-row">
                            <label id="labelhighschoolstartDate" runat="server" for="highschoolstartDate" class="col-md-2 col-form-label form-label">Start Date </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblhighschoolstartDate" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblhighschoolstartDateYes" GroupName="highschoolstartDate" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblhighschoolstartDateNo" GroupName="highschoolstartDate" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="ichighschoolstartDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnhighschoolstartDate" />
                                <input id="txthighschoolstartDate" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolendDate" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolendateDate">
                        <div class="form-row">
                            <label id="labelhighschoolendDate" runat="server" for="highschoolendDate" class="col-md-2 col-form-label form-label">End Date </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblhighschoolendDate" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblhighschoolendDateYes" GroupName="highschoolendDate" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblhighschoolendDateNo" GroupName="highschoolendDate" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="ichighschoolendDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnhighschoolendDate" />
                                <input id="txthighschoolendDate" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolName" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolName">
                        <div class="form-row">
                            <label id="labelhighschoolName" runat="server" for="highschoolName" class="col-md-2 col-form-label form-label">Name of School</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblhighschoolName" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblhighschoolNameYes" GroupName="highschoolName" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblhighschoolNameNo" GroupName="highschoolName" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="ichighschoolName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnhighschoolName" />
                                <input id="txthighschoolName" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolQualificationtype" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolQualificationtype">
                        <div class="form-row">
                            <label id="labelhighschoolQualificationtype" runat="server" for="highschoolQualificationtype" class="col-md-2 col-form-label form-label">Qualification Type</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblhighschoolQualificationtype" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblhighschoolQualificationtypeYes" GroupName="highschoolQualificationtype" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblhighschoolQualificationtypeNo" GroupName="highschoolQualificationtype" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="ichighschoolQualificationtype" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnhighschoolQualificationtype" />
                                <input id="txthighschoolQualificationtype" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolstudymode" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstudymode">
                        <div class="form-row">
                            <label id="labelhighschoolstudymode" runat="server" for="highschoolstudymode" class="col-md-2 col-form-label form-label">Mode of study</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblhighschoolstudymode" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblhighschoolstudymodeYes" GroupName="highschoolstudymode" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblhighschoolstudymodeNo" GroupName="highschoolstudymode" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="ichighschoolstudymode" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnhighschoolstudymode" />
                                <input id="txthighschoolstudymode" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoollanguage" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoollanguage">
                        <div class="form-row">
                            <label id="labelhighschoollanguage" runat="server" for="highschoollanguage" class="col-md-2 col-form-label form-label">Language (Medium) of Study</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblhighschoollanguage" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblhighschoollanguageYes" GroupName="highschoollanguage" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblhighschoollanguageNo" GroupName="highschoollanguage" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="ichighschoollanguage" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnhighschoollanguage" />
                                <input id="txthighschoollanguage" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="gradetype" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-gradetype">
                        <div class="form-row">
                            <label id="labelgradetype" runat="server" for="EnglishCourse" class="col-md-2 col-form-label form-label">Grade Type</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblgradetype" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblgradetypeYes" GroupName="gradetype" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblgradetypeNo" GroupName="gradetype" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icgradetype" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btngradetype" />
                                <input id="txtgradetype" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolgradeachieved" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-gradeachieved">
                        <div class="form-row">
                            <label id="labelgradeachieved" runat="server" for="gradeachieved" class="col-md-2 col-form-label form-label">Final Grade Achieved </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblgradeachieved" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblhighschoolgradeachievedYes" GroupName="highschoolgradeachieved" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblhighschoolgradeachievedNo" GroupName="highschoolgradeachieved" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="ichighschoolgradeachieved" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnhighschoolgradeachieved" />
                                <input id="txthighschoolgradeachieved" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="ExpectedHighSchoolDategrade" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedHighSchoolDategrade">
                        <div class="form-row">
                            <label id="labelExpectedHighSchoolDategrade" runat="server" for="EnglishCourse" class="col-md-2 col-form-label form-label">Expected dates when results will be declared </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblExpectedHighSchoolDategrade" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblExpectedHighSchoolDategradeYes" GroupName="ExpectedHighSchoolDategrade" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblExpectedHighSchoolDategradeNo" GroupName="ExpectedHighSchoolDategrade" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="icExpectedHighSchoolDategrade" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnExpectedHighSchoolDategrade" />
                                <input id="txtExpectedHighSchoolDategrade" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolverify" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolverify">
                        <div class="form-row">
                            <label id="labelhighschoolverify" runat="server" for="highschoolverify" class="col-md-2 col-form-label form-label">Name of Contact who can verify this qualification </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblhighschoolverify" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblhighschoolverifyYes" GroupName="highschoolverify" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblhighschoolverifyNo" GroupName="highschoolverify" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="ichighschoolverify" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnhighschoolverify" />
                                <input id="txthighschoolverify" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolrelation" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolrelation">
                        <div class="form-row">
                            <label id="labelhighschoolrelation" runat="server" for="highschoolrelation" class="col-md-2 col-form-label form-label">Relationship with the Contact </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblhighschoolrelation" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblhighschoolrelationYes" GroupName="highschoolrelation" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblhighschoolrelationNo" GroupName="highschoolrelation" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="ichighschoolrelation" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnhighschoolrelation" />
                                <input id="txthighschoolrelation" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolcontactEmail" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolcontactEmail">
                        <div class="form-row">
                            <label id="labelhighschoolcontactEmail" runat="server" for="highschoolcontactEmail" class="col-md-2 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblhighschoolcontactEmail" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblhighschoolcontactEmailYes" GroupName="highschoolcontactEmail" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblhighschoolcontactEmailNo" GroupName="highschoolcontactEmail" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="ichighschoolcontactEmail" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnhighschoolcontactEmail" />
                                <input id="txthighschoolcontactEmail" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="highschoolcontactMobile" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolcontactMobile">
                        <div class="form-row">
                            <label id="labelhighschoolcontactMobile" runat="server" for="highschoolcontactMobile" class="col-md-2 col-form-label form-label">Mobile/Cellular Number of Contact who can verify your qualification</label>
                            <div class="col-md-6">
                                <div class="prdtl-ans">
                                    <asp:Label ID="lblhighschoolcontactMobile" runat="server"></asp:Label>
                                </div>
                                <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblhighschoolcontactMobileYes" GroupName="highschoolcontactMobile" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblhighschoolcontactMobileNo" GroupName="highschoolcontactMobile" Text="No" runat="server" />
                                </div>
                                <span class="helpicon"><i id="ichighschoolcontactMobile" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-3">
                                <input type="button" value="Add Remarks" id="btnhighschoolcontactMobile" />
                                <input id="txthighschoolcontactMobile" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <asp:RadioButton ID="rblhighshoolgradeYes" GroupName="highshoolgrade" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblhighshoolgradeNo" GroupName="highshoolgrade" Text="No" runat="server" />
                                </div>

                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnhighshoolgrade" />
                                <input id="txthighschoolgrade" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <label id="labelSecondary" runat="server" for="Secondary" class="col-md-2 col-form-label form-label">Have you completed Senior Secondary school? (Year 12)?</label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">
                                        <asp:Label ID="lblSecondary" runat="server"></asp:Label>
                                    </div>
                                    <div class="prdtl-vrfy">
                                        <asp:RadioButton ID="rblSecondaryYes" GroupName="Secondary" Text="Yes" runat="server" />
                                        <asp:RadioButton ID="rblSecondaryNo" GroupName="Secondary" Text="No" runat="server" />
                                    </div>
                                    <span class="helpicon"><i id="icSecondary" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="btnSecondary" />
                                    <input id="txtSecondary" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="SecondaryCountry" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-SecondaryCountry">
                            <div class="form-row">
                                <label id="labelSecondaryCountry" runat="server" for="SecondaryCountry" class="col-md-2 col-form-label form-label">Country of Secondary Education</label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">
                                        <asp:Label ID="lblSecondaryCountry" runat="server"></asp:Label>
                                    </div>
                                    <div class="prdtl-vrfy">
                                        <asp:RadioButton ID="rblSecondaryCountryYes" GroupName="SecondaryCountry" Text="Yes" runat="server" />
                                        <asp:RadioButton ID="rblSecondaryCountryNo" GroupName="SecondaryCountry" Text="No" runat="server" />
                                    </div>
                                    <span class="helpicon"><i id="icSecondaryCountry" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>

                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="btnSecondaryCountry" />
                                    <input id="txtSecondaryCountry" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="SecondarystartDate" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-SecondarystartDate">
                            <div class="form-row">
                                <label id="labelSecondarystartDate" runat="server" for="SecondarystartDate" class="col-md-2 col-form-label form-label">Start Date </label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">
                                        <asp:Label ID="lblSecondarystartDate" runat="server"></asp:Label>
                                    </div>
                                    <div class="prdtl-vrfy">
                                        <asp:RadioButton ID="rblSecondarystartDateYes" GroupName="SecondarystartDate" Text="Yes" runat="server" />
                                        <asp:RadioButton ID="rblSecondarystartDateNo" GroupName="SecondarystartDate" Text="No" runat="server" />
                                    </div>
                                    <span class="helpicon"><i id="icSecondarystartDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="btnSecondarystartDate" />
                                    <input id="txtSecondarystartDate" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="SecondaryendDate" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-SecondaryendDate">
                            <div class="form-row">
                                <label id="labelSecondaryendDate" runat="server" for="SecondaryendDate" class="col-md-2 col-form-label form-label">End Date </label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">
                                        <asp:Label ID="lblSecondaryendDate" runat="server"></asp:Label>
                                    </div>
                                    <div class="prdtl-vrfy">
                                        <asp:RadioButton ID="rblSecondaryendDateYes" GroupName="SecondaryendDate" Text="Yes" runat="server" />
                                        <asp:RadioButton ID="rblSecondaryendDateNo" GroupName="SecondaryendDate" Text="No" runat="server" />
                                    </div>
                                    <span class="helpicon"><i id="icSecondaryendDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="btnSecondaryendDate" />
                                    <input id="txtSecondaryendDate" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="SecondaryschoolName" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-SecondaryschoolName">
                            <div class="form-row">
                                <label id="labelSecondaryschoolName" runat="server" for="SecondaryschoolName" class="col-md-2 col-form-label form-label">Name of School</label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">
                                        <asp:Label ID="lblSecondaryschoolName" runat="server"></asp:Label>
                                      </div>
                                    <div class="prdtl-vrfy">
                                    <asp:RadioButton ID="rblSecondaryschoolNameYes" GroupName="SecondaryschoolName" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblSecondaryschoolNameNo" GroupName="SecondaryschoolName" Text="No" runat="server" />
                                    </div>
                                    <span class="helpicon"><i id="icSecondaryschoolName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="btnSecondaryschoolName" />
                                    <input id="txtSecondaryschoolName" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="SecondaryQualificationtype" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-SecondaryQualificationtype">
                            <div class="form-row">
                                <label id="labelSecondaryQualificationtype" runat="server" for="SecondaryQualificationtype" class="col-md-2 col-form-label form-label">Qualification Type</label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">
                                        <asp:Label ID="lblSecondaryQualificationtype" runat="server"></asp:Label>
                                    </div>
                                    <div class="prdtl-vrfy">
                                        <asp:RadioButton ID="rblSecondaryQualificationtypeYes" GroupName="SecondaryQualificationtype" Text="Yes" runat="server" />
                                        <asp:RadioButton ID="rblSecondaryQualificationtypeNo" GroupName="SecondaryQualificationtype" Text="No" runat="server" />
                                    </div>
                                    <span class="helpicon"><i id="icSecondaryQualificationtype" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="btnSecondaryQualificationtype" />
                                    <input id="txtSecondaryQualificationtype" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="Secondarystudymode" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-Secondarystudymode">
                            <div class="form-row">
                                <label id="labelSecondarystudymode" runat="server" for="Secondarystudymode" class="col-md-2 col-form-label form-label">Mode of study</label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">
                                        <asp:Label ID="lblSecondarystudymode" runat="server"></asp:Label>
                                    </div>
                                    <div class="prdtl-vrfy">
                                        <asp:RadioButton ID="rblSecondarystudymodeYes" GroupName="Secondarystudymode" Text="Yes" runat="server" />
                                        <asp:RadioButton ID="rblSecondarystudymodeNo" GroupName="Secondarystudymode" Text="No" runat="server" />
                                    </div>
                                    <span class="helpicon"><i id="icSecondarystudymode" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="btnSecondarystudymode" />
                                    <input id="txtSecondarystudymode" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="Secondarylanguage" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-Secondarylanguage">
                            <div class="form-row">
                                <label id="labelSecondarylanguage" runat="server" for="Secondarylanguage" class="col-md-2 col-form-label form-label">Language (Medium) of Study</label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">
                                        <asp:Label ID="lblSecondarylanguage" runat="server"></asp:Label>
                                    </div>
                                    <div class="prdtl-vrfy">
                                        <asp:RadioButton ID="rblSecondarylanguageYes" GroupName="Secondarylanguage" Text="Yes" runat="server" />
                                        <asp:RadioButton ID="rblSecondarylanguageNo" GroupName="Secondarylanguage" Text="No" runat="server" />
                                    </div>
                                    <span class="helpicon"><i id="icSecondarylanguage" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="btnSecondarylanguage" />
                                    <input id="txtSecondarylanguage" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="Secondarygradetype" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-Secondarygradetype">
                            <div class="form-row">
                                <label id="labelSecondarygradetype" runat="server" for="Secondarygradetype" class="col-md-2 col-form-label form-label">Grade Type</label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">
                                        <asp:Label ID="lblSecondarygradetype" runat="server"></asp:Label>
                                    </div>
                                    <div class="prdtl-vrfy">
                                        <asp:RadioButton ID="rblSecondarygradetypeYes" GroupName="Secondarygradetype" Text="Yes" runat="server" />
                                        <asp:RadioButton ID="rblSecondarygradetypeNo" GroupName="Secondarygradetype" Text="No" runat="server" />
                                    </div>
                                    <span class="helpicon"><i id="icSecondarygradetype" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="btnSecondarygradetype" />
                                    <input id="txtSecondarygradetype" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="Secondarygradeachieved" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-Secondarygradeachieved">
                            <div class="form-row">
                                <label id="labelSecondarygradeachieved" runat="server" for="Secondarygradeachieved" class="col-md-2 col-form-label form-label">Final Grade Achieved </label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">
                                        <asp:Label ID="lblSecondarygradeachieved" runat="server"></asp:Label>
                                    </div>
                                    <div class="prdtl-vrfy">
                                        <asp:RadioButton ID="rblSecondarygradeachievedYes" GroupName="Secondarygradeachieved" Text="Yes" runat="server" />
                                        <asp:RadioButton ID="rblSecondarygradeachievedNo" GroupName="Secondarygradeachieved" Text="No" runat="server" />
                                    </div>
                                    <span class="helpicon"><i id="icSecondarygradeachieved" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="btnSecondarygradeachieved" />
                                    <input id="txtSecondarygradeachieved" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="ExpectedSecondaryDategrade" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedSecondaryDategrade">
                            <div class="form-row">
                                <label id="labelExpectedSecondaryDategrade" runat="server" for="ExpectedSecondaryDategrade" class="col-md-2 col-form-label form-label">Expected dates when results will be declared </label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">
                                        <asp:Label ID="lblExpectedSecondaryDategrade" runat="server"></asp:Label>
                                    </div>
                                    <div class="prdtl-vrfy">
                                        <asp:RadioButton ID="rblExpectedSecondaryDategradeYes" GroupName="ExpectedSecondaryDategrade" Text="Yes" runat="server" />
                                        <asp:RadioButton ID="rblExpectedSecondaryDategradeNo" GroupName="ExpectedSecondaryDategrade" Text="No" runat="server" />
                                    </div>
                                    <span class="helpicon"><i id="icExpectedSecondaryDategrade" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="btnExpectedSecondaryDategrade" />
                                    <input id="txtExpectedSecondaryDategrade" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="Secondaryverify" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-Secondaryverify">
                            <div class="form-row">
                                <label id="labelSecondaryverify" runat="server" for="Secondaryverify" class="col-md-2 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">
                                        <asp:Label ID="lblSecondaryverify" runat="server"></asp:Label>
                                    </div>
                                    <div class="prdtl-vrfy">
                                        <asp:RadioButton ID="rblSecondaryverifyYes" GroupName="Secondaryverify" Text="Yes" runat="server" />
                                        <asp:RadioButton ID="rblSecondaryverifyNo" GroupName="Secondaryverify" Text="No" runat="server" />
                                    </div>
                                    <span class="helpicon"><i id="icSecondaryverify" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="btnSecondaryverify" />
                                    <input id="txtSecondaryverify" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="secondaryschoolrelation" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-secondaryschoolrelation">
                            <div class="form-row">
                                <label id="labelsecondaryschoolrelation" runat="server" for="secondaryschoolrelation" class="col-md-2 col-form-label form-label">Relationship with the Contact </label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">
                                        <asp:Label ID="lblsecondaryschoolrelation" runat="server"></asp:Label>
                                    </div>
                                    <div class="prdtl-vrfy">
                                        <asp:RadioButton ID="rblsecondaryschoolrelationYes" GroupName="secondaryschoolrelation" Text="Yes" runat="server" />
                                        <asp:RadioButton ID="rblsecondaryschoolrelationNo" GroupName="secondaryschoolrelation" Text="No" runat="server" />
                                    </div>
                                    <span class="helpicon"><i id="icsecondaryschoolrelation" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="btnsecondaryschoolrelation" />
                                    <input id="txtsecondaryschoolrelation" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="secondarycontactEmail" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-secondarycontactEmail">
                            <div class="form-row">
                                <label id="labelsecondarycontactEmail" runat="server" for="secondarycontactEmail" class="col-md-2 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">
                                        <asp:Label ID="lblsecondarycontactEmail" runat="server"></asp:Label>
                                    </div>
                                    <div class="prdtl-vrfy">
                                        <asp:RadioButton ID="rblsecondarycontactEmailYes" GroupName="secondarycontactEmail" Text="Yes" runat="server" />
                                        <asp:RadioButton ID="rblsecondarycontactEmailNo" GroupName="secondarycontactEmail" Text="No" runat="server" />
                                    </div>
                                    <span class="helpicon"><i id="icsecondarycontactEmail" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="btnsecondarycontactEmail" />
                                    <input id="txtsecondarycontactEmail" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="secondarycontactMobile" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-secondarycontactMobile">
                            <div class="form-row">
                                <label id="labelsecondarycontactMobile" runat="server" for="secondarycontactMobile" class="col-md-2 col-form-label form-label">Mobile/Cellular Number of Contact who can verify your qualification </label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">
                                        <asp:Label ID="lblsecondarycontactMobile" runat="server"></asp:Label>
                                    </div>
                                     <div class="prdtl-vrfy">
                                        <asp:RadioButton ID="rblsecondarycontactMobileYes" GroupName="secondarycontactMobile" Text="Yes" runat="server" />
                                        <asp:RadioButton ID="rblsecondarycontactMobileNo" GroupName="secondarycontactMobile" Text="No" runat="server" />
                                    </div>
                                    <span class="helpicon"><i id="icsecondarycontactMobile" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="btnsecondarycontactMobile" />
                                    <input id="txtsecondarycontactMobile" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                        <asp:RadioButton ID="rblsecondarygradeYes" GroupName="secondarygrade" Text="Yes" runat="server" />
                                        <asp:RadioButton ID="rblsecondarygradeNo" GroupName="secondarygrade" Text="No" runat="server" />
                                    </div>

                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnsecondarygrade" />
                                    <input id="txtSecondaryGrade" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <label id="labelhigher" runat="server" for="higher" class="col-md-2 col-form-label form-label">
                                    Have you completed any Higher (Under Graduate, Masters or PhD) degree? 
?</label>
                                <div class="col-md-6">
                                    <div class="prdtl-ans">
                                        <asp:Label ID="lblhigher" runat="server"> </asp:Label>
                                    </div>
                                    <div class="prdtl-vrfy">
                                        <asp:RadioButton ID="rblhigherYes" GroupName="higher" Text="Yes" runat="server" />
                                        <asp:RadioButton ID="rblhigherNo" GroupName="higher" Text="No" runat="server" />
                                    </div>
                                    <span class="helpicon"><i id="ichigher" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-3">
                                    <input type="button" value="Add Remarks" id="btnhigher" />
                                    <input id="txthigher" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="UG" runat="server" visible="false">
                        <div class="list-group-item" id="highercourse" style="display: none" runat="server">

                            <div class="form-group m-0" role="group" aria-labelledby="label-highercourse">
                                <div class="form-row">
                                    <label id="labelhighercourse" runat="server" for="highercourse" class="col-md-2 col-form-label form-label">Higher Course</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhighercourse" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhighercourseYes" GroupName="highercourse" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhighercourseNo" GroupName="highercourse" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichighercourse" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhighercourse" />
                                        <input id="txthighercourse" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherCountry" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherCountry">
                                <div class="form-row">
                                    <label id="labelhigherCountry" runat="server" for="higherCountry" class="col-md-2 col-form-label form-label">Country of Higher Education</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherCountry" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherCountryYes" GroupName="higherCountry" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherCountryNo" GroupName="higherCountry" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherCountry" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherCountry" />
                                        <input id="txthigherCountry" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherstartDate" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstartDate">
                                <div class="form-row">
                                    <label id="labelhigherstartDate" runat="server" for="highschoolstartDate" class="col-md-2 col-form-label form-label">Start Date </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherschoolstartDate" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherstartDateYes" GroupName="higherstartDate" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherstartDateNo" GroupName="higherstartDate" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherstartDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherstartDate" />
                                        <input id="txthigherstartDate" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherendDate" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherendDate">
                                <div class="form-row">
                                    <label id="labelhigherendDate" runat="server" for="higherendDate" class="col-md-2 col-form-label form-label">End Date </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherendDate" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherendDateYes" GroupName="higherendDate" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherendDateNo" GroupName="higherendDate" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherendDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherendDate" />
                                        <input id="txthigherendDate" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherschoolName" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherschoolName">
                                <div class="form-row">
                                    <label id="labelhigherschoolName" runat="server" for="higherschoolName" class="col-md-2 col-form-label form-label">Name of School</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherschoolName" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherschoolNameYes" GroupName="higherschoolName" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherschoolNameNo" GroupName="higherschoolName" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherschoolName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherschoolName" />
                                        <input id="txthigherschoolName" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherQualificationtype" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherQualificationtype">
                                <div class="form-row">
                                    <label id="labelhigherQualificationtype" runat="server" for="higherQualificationtype" class="col-md-2 col-form-label form-label">Qualification Type</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherQualificationtype" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherQualificationtypeYes" GroupName="higherQualificationtype" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherQualificationtypeNo" GroupName="higherQualificationtype" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherQualificationtype" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherQualificationtype" />
                                        <input id="txthigherQualificationtype" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherstudymode" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherstudymode">
                                <div class="form-row">
                                    <label id="labelhigherstudymode" runat="server" for="higherstudymode" class="col-md-2 col-form-label form-label">Mode of study</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherstudymode" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherstudymodeYes" GroupName="higherstudymode" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherstudymodeNo" GroupName="higherstudymode" Text="No" runat="server" />
                                        </div>

                                        <span class="helpicon"><i id="ichigherstudymode" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherstudymode" />
                                        <input id="txthigherstudymode" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherlanguage" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherlanguage">
                                <div class="form-row">
                                    <label id="labelhigherlanguage" runat="server" for="higherlanguage" class="col-md-2 col-form-label form-label">Language (Medium) of Study</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherlanguage" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherlanguageYes" GroupName="higherlanguage" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherlanguageNo" GroupName="higherlanguage" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherlanguage" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherlanguage" />
                                        <input id="txthigherlanguage" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highergradetype" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highergradetype">
                                <div class="form-row">
                                    <label id="labelhighergradetype" runat="server" for="highergradetype" class="col-md-2 col-form-label form-label">Grade Type</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhighergradetype" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhighergradetypeYes" GroupName="highergradetype" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhighergradetypeNo" GroupName="highergradetype" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichighergradetype" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhighergradetype" />
                                        <input id="txthighergradetype" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highergradeachieved" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highergradeachieved">
                                <div class="form-row">
                                    <label id="labelhighergradeachieved" runat="server" for="highergradeachieved" class="col-md-2 col-form-label form-label">Final Grade Achieved </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhighergradeachieved" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhighergradeachievedYes" GroupName="highergradeachieved" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhighergradeachievedNo" GroupName="highergradeachieved" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichighergradeachieved" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhighergradeachieved" />
                                        <input id="txthighergradeachieved" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="ExpectedHigherDategrade" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedHigherDategrade">
                                <div class="form-row">
                                    <label id="labelExpectedHigherDategrade" runat="server" for="ExpectedHigherDategrade" class="col-md-2 col-form-label form-label">Expected dates when results will be declared </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblExpectedHigherDategrade" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblExpectedHigherDategradeYes" GroupName="ExpectedHigherDategrade" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblExpectedHigherDategradeNo" GroupName="ExpectedHigherDategrade" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="icExpectedHigherDategrade" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnExpectedHigherDategrade" />
                                        <input id="txtExpectedHigherDategrade" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherverify" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherverify">
                                <div class="form-row">
                                    <label id="labelhigherverify" runat="server" for="higherverify" class="col-md-2 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherverify" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherverifyYes" GroupName="higherverify" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherverifyNo" GroupName="higherverify" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherverify" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherverify" />
                                        <input id="txthigherverify" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherrelation" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherrelation">
                                <div class="form-row">
                                    <label id="labelhigherrelation" runat="server" for="highschoolrelation" class="col-md-2 col-form-label form-label">Relationship with the Contact </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherschoolrelation" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherrelationYes" GroupName="higherrelation" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherrelationNo" GroupName="higherrelation" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherrelation" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherrelation" />
                                        <input id="txthigherrelation" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highercontactEmail" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highercontactEmail">
                                <div class="form-row">
                                    <label id="labelhighercontactEmail" runat="server" for="highercontactEmail" class="col-md-2 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhighercontactEmail" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhighercontactEmailYes" GroupName="highercontactEmail" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhighercontactEmailNo" GroupName="highercontactEmail" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichighercontactEmail" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhighercontactEmail" />
                                        <input id="txthighercontactEmail" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highercontactMobile" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highercontactMobile">
                                <div class="form-row">
                                    <label id="labelhighercontactMobile" runat="server" for="highercontactMobile" class="col-md-2 col-form-label form-label">Mobile/Cellular Number who can verify this qualification </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhighercontactMobile" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhighercontactMobileYes" GroupName="highercontactMobile" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhighercontactMobileNo" GroupName="highercontactMobile" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichighercontactMobile" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhighercontactMobile" />
                                        <input id="txthighercontactMobile" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="PG" runat="server" visible="false">
                        <div class="list-group-item" id="highercoursePG" runat="server" style="display: none">

                            <div class="form-group m-0" role="group" aria-labelledby="label-highercourse">
                                <div class="form-row">
                                    <label id="labelhighercoursePG" runat="server" for="highercourse" class="col-md-2 col-form-label form-label">Higher Course</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhighercoursePG" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhighercoursePGYes" GroupName="highercoursePG" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhighercoursePGNo" GroupName="highercoursePG" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichighercoursePG" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhighercoursePG" />
                                        <input id="txthighercoursePG" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherCountryPG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherCountry">
                                <div class="form-row">
                                    <label id="labelhigherCountryPG" runat="server" for="higherCountry" class="col-md-2 col-form-label form-label">Country of Higher Education</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherCountryPG" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherCountryPGYes" GroupName="higherCountryPG" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherCountryPGNo" GroupName="higherCountryPG" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="iclabelhigherCountryPG" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherCountryPG" />
                                        <input id="txthigherCountryPG" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherstartDatePG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstartDate">
                                <div class="form-row">
                                    <label id="labelhigherstartDatePG" runat="server" for="highschoolstartDate" class="col-md-2 col-form-label form-label">Start Date </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherstartDatePG" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherstartDatePGYes" GroupName="higherstartDatePG" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherstartDatePGNo" GroupName="higherstartDatePG" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherstartDatePG" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherstartDatePG" />
                                        <input id="txthigherstartDatePG" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherendDatePG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherendDate">
                                <div class="form-row">
                                    <label id="labelhigherendDatePG" runat="server" for="higherendDate" class="col-md-2 col-form-label form-label">End Date </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherendDatePG" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherendDatePGYes" GroupName="higherendDatePG" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherendDatePGNo" GroupName="higherendDatePG" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherendDatePG" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherendDatePG" />
                                        <input id="txthigherendDatePG" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherschoolNamePG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherschoolName">
                                <div class="form-row">
                                    <label id="labelhigherschoolNamePG" runat="server" for="higherschoolName" class="col-md-2 col-form-label form-label">Name of School</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherschoolNamePG" runat="server"></asp:Label>
                                        </div>
                                         <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherschoolNamePGYes" GroupName="higherschoolNamePG" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherschoolNamePGNo" GroupName="higherschoolNamePG" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherschoolNamePG" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherschoolNamePG" />
                                        <input id="txthigherschoolNamePG" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherQualificationtypePG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherQualificationtype">
                                <div class="form-row">
                                    <label id="labelhigherQualificationtypePG" runat="server" for="higherQualificationtype" class="col-md-2 col-form-label form-label">Qualification Type</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherQualificationtypePG" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherQualificationtypePGYes" GroupName="higherQualificationtypePG" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherQualificationtypePGNo" GroupName="higherQualificationtypePG" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherQualificationtypePG" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherQualificationtypePG" />
                                        <input id="txthigherQualificationtypePG" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherstudymodePG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherstudymode">
                                <div class="form-row">
                                    <label id="labelhigherstudymodePG" runat="server" for="higherstudymode" class="col-md-2 col-form-label form-label">Mode of study</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherstudymodePG" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherstudymodePGYes" GroupName="higherstudymodePG" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherstudymodePGNo" GroupName="higherstudymodePG" Text="No" runat="server" />
                                        </div>

                                        <span class="helpicon"><i id="ichigherstudymodePG" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherstudymodePG" />
                                        <input id="txthigherstudymodePG" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherlanguagePG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherlanguage">
                                <div class="form-row">
                                    <label id="labelhigherlanguagePG" runat="server" for="higherlanguage" class="col-md-2 col-form-label form-label">Language (Medium) of Study</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherlanguagePG" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherlanguagePGYes" GroupName="higherlanguagePG" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherlanguagePGNo" GroupName="higherlanguagePG" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherlanguagePG" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherlanguagePG" />
                                        <input id="txthigherlanguagePG" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highergradetypePG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highergradetype">
                                <div class="form-row">
                                    <label id="labelhighergradetypePG" runat="server" for="highergradetype" class="col-md-2 col-form-label form-label">Grade Type</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhighergradetypePG" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhighergradetypePGYes" GroupName="highergradetypePG" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhighergradetypePGNo" GroupName="highergradetypePG" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichighergradetypePG" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhighergradetypePG" />
                                        <input id="txthighergradetypePG" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highergradeachievedPG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highergradeachieved">
                                <div class="form-row">
                                    <label id="labelhighergradeachievedPG" runat="server" for="highergradeachieved" class="col-md-2 col-form-label form-label">Final Grade Achieved </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhighergradeachievedPG" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhighergradeachievedPGYes" GroupName="highergradeachievedPG" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhighergradeachievedPGNo" GroupName="highergradeachievedPG" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichighergradeachievedPG" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhighergradeachievedPG" />
                                        <input id="txthighergradeachievedPG" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="ExpectedHigherDategradePG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedHigherDategrade">
                                <div class="form-row">
                                    <label id="labelExpectedHigherDategradePG" runat="server" for="ExpectedHigherDategrade" class="col-md-2 col-form-label form-label">Expected dates when results will be declared </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblExpectedHigherDategradePG" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblExpectedHigherDategradePGYes" GroupName="ExpectedHigherDategradePG" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblExpectedHigherDategradePGNo" GroupName="ExpectedHigherDategradePG" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="icExpectedHigherDategradePG" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnExpectedHigherDategradePG" />
                                        <input id="txtExpectedHigherDategradePG" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherverifyPG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherverify">
                                <div class="form-row">
                                    <label id="labelhigherverifyPG" runat="server" for="higherverify" class="col-md-2 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherverifyPG" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherverifyPGYes" GroupName="higherverifyPG" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherverifyPGNo" GroupName="higherverifyPG" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherverifyPG" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherverifyPG" />
                                        <input id="txthigherverifyPG" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherrelationPG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherrelation">
                                <div class="form-row">
                                    <label id="labelhigherrelationPG" runat="server" for="highschoolrelation" class="col-md-2 col-form-label form-label">Relationship with the Contact </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherrelationPG" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherrelationPGYes" GroupName="higherrelationPG" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherrelationPGNo" GroupName="higherrelationPG" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherrelationPG" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherrelationPG" />
                                        <input id="txthigherrelationPG" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highercontactEmailPG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highercontactEmail">
                                <div class="form-row">
                                    <label id="labelhighercontactEmailPG" runat="server" for="highercontactEmail" class="col-md-2 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhighercontactEmailPG" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhighercontactEmailPGYes" GroupName="highercontactEmailPG" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhighercontactEmailPGNo" GroupName="highercontactEmailPG" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichighercontactEmailPG" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhighercontactEmailPG" />
                                        <input id="txthighercontactEmailPG" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highercontactMobilePG" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highercontactMobile">
                                <div class="form-row">
                                    <label id="labelhighercontactMobilePG" runat="server" for="highercontactMobile" class="col-md-2 col-form-label form-label">Mobile/Cellular Number who can verify this qualification </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhighercontactMobilePG" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhighercontactMobilePGYes" GroupName="highercontactMobilePG" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhighercontactMobilePGNo" GroupName="highercontactMobilePG" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichighercontactMobilePG" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhighercontactMobilePG" />
                                        <input id="txthighercontactMobilePG" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="Phd" runat="server" visible="false">
                        <div class="list-group-item" id="highercoursePhd" runat="server" style="display: none">

                            <div class="form-group m-0" role="group" aria-labelledby="label-highercourse">
                                <div class="form-row">
                                    <label id="labelhighercoursePhd" runat="server" for="highercourse" class="col-md-2 col-form-label form-label">Higher Course</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhighercoursePhd" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhighercoursePhdYes" GroupName="highercoursePhd" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhighercoursePhdNo" GroupName="highercoursePhd" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichighercoursePhd" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhighercoursePhd" />
                                        <input id="txthighercoursePhd" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherCountryPhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherCountry">
                                <div class="form-row">
                                    <label id="labelhigherCountryPhd" runat="server" for="higherCountry" class="col-md-2 col-form-label form-label">Country of Higher Education</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherCountryPhd" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherCountryPhdYes" GroupName="higherCountryPhd" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherCountryPhdNo" GroupName="higherCountryPhd" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="iclabelhigherCountryPhd" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherCountryPhd" />
                                        <input id="txthigherCountryPhd" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherstartDatePhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstartDate">
                                <div class="form-row">
                                    <label id="labelhigherstartDatePhd" runat="server" for="highschoolstartDate" class="col-md-2 col-form-label form-label">Start Date </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherstartDatePhd" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherstartDatePhdYes" GroupName="higherstartDatePhd" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherstartDatePhdNo" GroupName="higherstartDatePhd" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherstartDatePhd" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherstartDatePhd" />
                                        <input id="txthigherstartDatePhd" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherendDatePhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherendDate">
                                <div class="form-row">
                                    <label id="labelhigherendDatePhd" runat="server" for="higherendDate" class="col-md-2 col-form-label form-label">End Date </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherendDatePhd" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherendDatePhdYes" GroupName="higherendDatePhd" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherendDatePhdNo" GroupName="higherendDatePhd" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherendDatePhd" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherendDatePhd" />
                                        <input id="txthigherendDatePhd" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherschoolNamePhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherschoolName">
                                <div class="form-row">
                                    <label id="labelhigherschoolNamePhd" runat="server" for="higherschoolName" class="col-md-2 col-form-label form-label">Name of School</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherschoolNamePhd" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherschoolNamePhdYes" GroupName="higherschoolNamePhd" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherschoolNamePhdNo" GroupName="higherschoolNamePhd" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherschoolNamePhd" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherschoolNamePhd" />
                                        <input id="txthigherschoolNamePhd" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherQualificationtypePhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherQualificationtype">
                                <div class="form-row">
                                    <label id="labelhigherQualificationtypePhd" runat="server" for="higherQualificationtype" class="col-md-2 col-form-label form-label">Qualification Type</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherQualificationtypePhd" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherQualificationtypePhdYes" GroupName="higherQualificationtypePhd" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherQualificationtypePhdNo" GroupName="higherQualificationtypePhd" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherQualificationtypePhd" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherQualificationtypePhd" />
                                        <input id="txthigherQualificationtypePhd" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherstudymodePhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherstudymode">
                                <div class="form-row">
                                    <label id="labelhigherstudymodePhd" runat="server" for="higherstudymode" class="col-md-2 col-form-label form-label">Mode of study</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherstudymodePhd" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherstudymodePhdYes" GroupName="higherstudymodePhd" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherstudymodePhdNo" GroupName="higherstudymodePhd" Text="No" runat="server" />
                                        </div>

                                        <span class="helpicon"><i id="ichigherstudymodePhd" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherstudymodePhd" />
                                        <input id="txthigherstudymodePhd" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherlanguagePhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherlanguage">
                                <div class="form-row">
                                    <label id="labelhigherlanguagePhd" runat="server" for="higherlanguage" class="col-md-2 col-form-label form-label">Language (Medium) of Study</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherlanguagePhd" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherlanguagePhdYes" GroupName="higherlanguagePhd" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherlanguagePhdNo" GroupName="higherlanguagePhd" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherlanguagePhd" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherlanguagePhd" />
                                        <input id="txthigherlanguagePhd" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highergradetypePhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highergradetype">
                                <div class="form-row">
                                    <label id="labelhighergradetypePhd" runat="server" for="highergradetype" class="col-md-2 col-form-label form-label">Grade Type</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhighergradetypePhd" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhighergradetypePhdYes" GroupName="highergradetypePhd" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhighergradetypePhdNo" GroupName="highergradetypePhd" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichighergradetypePhd" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhighergradetypePhd" />
                                        <input id="txthighergradetypePhd" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highergradeachievedPhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highergradeachieved">
                                <div class="form-row">
                                    <label id="labelhighergradeachievedPhd" runat="server" for="highergradeachieved" class="col-md-2 col-form-label form-label">Final Grade Achieved </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhighergradeachievedPhd" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhighergradeachievedPhdYes" GroupName="highergradeachievedPhd" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhighergradeachievedPhdNo" GroupName="highergradeachievedPhd" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichighergradeachievedPhd" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhighergradeachievedPhd" />
                                        <input id="txthighergradeachievedPhd" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="ExpectedHigherDategradePhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedHigherDategrade">
                                <div class="form-row">
                                    <label id="labelExpectedHigherDategradePhd" runat="server" for="ExpectedHigherDategrade" class="col-md-2 col-form-label form-label">Expected dates when results will be declared </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblExpectedHigherDategradePhd" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblExpectedHigherDategradePhdYes" GroupName="ExpectedHigherDategradePhd" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblExpectedHigherDategradePhdNo" GroupName="ExpectedHigherDategradePhd" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="icExpectedHigherDategradePhd" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnExpectedHigherDategradePhd" />
                                        <input id="txtExpectedHigherDategradePhd" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherverifyPhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherverify">
                                <div class="form-row">
                                    <label id="labelhigherverifyPhd" runat="server" for="higherverify" class="col-md-2 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherverifyPhd" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherverifyPhdYes" GroupName="higherverifyPhd" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherverifyPhdNo" GroupName="higherverifyPhd" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherverifyPhd" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherverifyPhd" />
                                        <input id="txthigherverifyPhd" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherrelationPhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherrelation">
                                <div class="form-row">
                                    <label id="labelhigherrelationPhd" runat="server" for="highschoolrelation" class="col-md-2 col-form-label form-label">Relationship with the Contact </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherrelationPhd" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherrelationPhdYes" GroupName="higherrelationPhd" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherrelationPhdNo" GroupName="higherrelationPhd" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherrelationPhd" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherrelationPhd" />
                                        <input id="txthigherrelationPhd" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highercontactEmailPhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highercontactEmail">
                                <div class="form-row">
                                    <label id="labelhighercontactEmailPhd" runat="server" for="highercontactEmail" class="col-md-2 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhighercontactEmailPhd" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhighercontactEmailPhdYes" GroupName="highercontactEmailPhd" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhighercontactEmailPhdNo" GroupName="highercontactEmailPhd" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichighercontactEmailPhd" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhighercontactEmailPhd" />
                                        <input id="txthighercontactEmailPhd" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highercontactMobilePhd" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highercontactMobile">
                                <div class="form-row">
                                    <label id="labelhighercontactMobilePhd" runat="server" for="highercontactMobile" class="col-md-2 col-form-label form-label">Mobile/Cellular Number who can verify this qualification </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhighercontactMobilePhd" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhighercontactMobilePhdYes" GroupName="highercontactMobilePhd" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhighercontactMobilePhdNo" GroupName="highercontactMobilePhd" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichighercontactMobilePhd" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhighercontactMobilePhd" />
                                        <input id="txthighercontactMobilePhd" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="OtherHigherCourse" runat="server" visible="false">
                        <div class="list-group-item" id="highercourseOther" style="display: none" runat="server">

                            <div class="form-group m-0" role="group" aria-labelledby="label-highercourse">
                                <div class="form-row">
                                    <label id="labelhighercourseOther" runat="server" for="highercourse" class="col-md-2 col-form-label form-label">Higher Course</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhighercourseOther" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblOtherHigherCourseYes" GroupName="OtherHigherCourse" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblOtherHigherCourseNo" GroupName="OtherHigherCourse" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichighercourseOther" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnOtherHigherCourse" />
                                        <input id="txthighercourseOther" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherCountryOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherCountry">
                                <div class="form-row">
                                    <label id="labelhigherCountryOther" runat="server" for="higherCountry" class="col-md-2 col-form-label form-label">Country of Higher Education</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherCountryOther" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherCountryOtherYes" GroupName="higherCountryOther" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherCountryOtherNo" GroupName="higherCountryOther" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="iclabelhigherCountryOther" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherCountryOther" />
                                        <input id="txthigherCountryOther" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherstartDateOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highschoolstartDate">
                                <div class="form-row">
                                    <label id="labelhigherstartDateOther" runat="server" for="highschoolstartDate" class="col-md-2 col-form-label form-label">Start Date </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherstartDateOther" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherstartDateOtherYes" GroupName="higherstartDateOther" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherstartDateOtherNo" GroupName="higherstartDateOther" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherstartDateOther" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherstartDateOther" />
                                        <input id="txthigherstartDateOther" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherendDateOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherendDate">
                                <div class="form-row">
                                    <label id="labelhigherendDateOther" runat="server" for="higherendDate" class="col-md-2 col-form-label form-label">End Date </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherendDateOther" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherendDateOtherYes" GroupName="higherendDateOther" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherendDateOtherNo" GroupName="higherendDateOther" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherendDateOther" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherendDateOther" />
                                        <input id="txthigherendDateOther" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherschoolNameOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherschoolName">
                                <div class="form-row">
                                    <label id="labelhigherschoolNameOther" runat="server" for="higherschoolName" class="col-md-2 col-form-label form-label">Name of School</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherschoolNameOther" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherschoolNameOtherYes" GroupName="higherschoolNameOther" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherschoolNameOtherNo" GroupName="higherschoolNameOther" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherschoolNameOther" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherschoolNameOther" />
                                        <input id="txthigherschoolNameOther" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherQualificationtypeOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherQualificationtype">
                                <div class="form-row">
                                    <label id="labelhigherQualificationtypeOther" runat="server" for="higherQualificationtype" class="col-md-2 col-form-label form-label">Qualification Type</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherQualificationtypeOther" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherQualificationtypeOtherYes" GroupName="higherQualificationtypeOther" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherQualificationtypeOtherNo" GroupName="higherQualificationtypeOther" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherQualificationtypeOther" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherQualificationtypeOther" />
                                        <input id="txthigherQualificationtypeOther" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherstudymodeOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherstudymode">
                                <div class="form-row">
                                    <label id="labelhigherstudymodeOther" runat="server" for="higherstudymode" class="col-md-2 col-form-label form-label">Mode of study</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherstudymodeOther" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherstudymodeOtherYes" GroupName="higherstudymodeOther" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherstudymodeOtherNo" GroupName="higherstudymodeOther" Text="No" runat="server" />
                                        </div>

                                        <span class="helpicon"><i id="ichigherstudymodeOther" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherstudymodeOther" />
                                        <input id="txthigherstudymodeOther" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherlanguageOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherlanguage">
                                <div class="form-row">
                                    <label id="labelhigherlanguageOther" runat="server" for="higherlanguage" class="col-md-2 col-form-label form-label">Language (Medium) of Study</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherlanguageOther" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherlanguageOtherYes" GroupName="higherlanguageOther" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherlanguageOtherNo" GroupName="higherlanguageOther" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherlanguageOther" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherlanguageOther" />
                                        <input id="txthigherlanguageOther" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highergradetypeOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highergradetype">
                                <div class="form-row">
                                    <label id="labelhighergradetypeOther" runat="server" for="highergradetype" class="col-md-2 col-form-label form-label">Grade Type</label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhighergradetypeOther" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhighergradetypeOtherYes" GroupName="highergradetypeOther" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhighergradetypeOtherNo" GroupName="highergradetypeOther" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichighergradetypeOther" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhighergradetypeOther" />
                                        <input id="txthighergradetypeOther" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highergradeachievedOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highergradeachieved">
                                <div class="form-row">
                                    <label id="labelhighergradeachievedOther" runat="server" for="highergradeachieved" class="col-md-2 col-form-label form-label">Final Grade Achieved </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhighergradeachievedOther" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhighergradeachievedOtherYes" GroupName="highergradeachievedOther" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhighergradeachievedOtherNo" GroupName="highergradeachievedOther" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichighergradeachievedOther" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhighergradeachievedOther" />
                                        <input id="txthighergradeachievedOther" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="ExpectedHigherDategradeOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedHigherDategrade">
                                <div class="form-row">
                                    <label id="labelExpectedHigherDategradeOther" runat="server" for="ExpectedHigherDategrade" class="col-md-2 col-form-label form-label">Expected dates when results will be declared </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblExpectedHigherDategradeOther" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblExpectedHigherDategradeOtherYes" GroupName="ExpectedHigherDategradeOther" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblExpectedHigherDategradeOtherNo" GroupName="ExpectedHigherDategradeOther" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="icExpectedHigherDategradeOther" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnExpectedHigherDategradeOther" />
                                        <input id="txtExpectedHigherDategradeOther" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherverifyOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherverify">
                                <div class="form-row">
                                    <label id="labelhigherverifyOther" runat="server" for="higherverify" class="col-md-2 col-form-label form-label">Name of Contact who can verify this qualification </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherverifyOther" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherverifyOtherYes" GroupName="higherverifyOther" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherverifyOtherNo" GroupName="higherverifyOther" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherverifyOther" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherverifyOther" />
                                        <input id="txthigherverifyOther" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="higherrelationOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-higherrelation">
                                <div class="form-row">
                                    <label id="labelhigherrelationOther" runat="server" for="highschoolrelation" class="col-md-2 col-form-label form-label">Relationship with the Contact </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhigherrelationOther" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhigherrelationOtherYes" GroupName="higherrelationOther" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhigherrelationOtherNo" GroupName="higherrelationOther" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichigherrelationOther" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhigherrelationOther" />
                                        <input id="txthigherrelationOther" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highercontactEmailOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highercontactEmail">
                                <div class="form-row">
                                    <label id="labelhighercontactEmailOther" runat="server" for="highercontactEmail" class="col-md-2 col-form-label form-label">Email ID of Contact who can verify your qualification  </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhighercontactEmailOther" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhighercontactEmailOtherYes" GroupName="highercontactEmailOther" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhighercontactEmailOtherNo" GroupName="highercontactEmailOther" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichighercontactEmailOther" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhighercontactEmailOther" />
                                        <input id="txthighercontactEmailOther" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="highercontactMobileOther" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-highercontactMobile">
                                <div class="form-row">
                                    <label id="labelhighercontactMobileOther" runat="server" for="highercontactMobile" class="col-md-2 col-form-label form-label">Mobile/Cellular Number who can verify this qualification </label>
                                    <div class="col-md-6">
                                        <div class="prdtl-ans">
                                            <asp:Label ID="lblhighercontactMobileOther" runat="server"></asp:Label>
                                        </div>
                                        <div class="prdtl-vrfy">
                                            <asp:RadioButton ID="rblhighercontactMobileOtherYes" GroupName="highercontactMobileOther" Text="Yes" runat="server" />
                                            <asp:RadioButton ID="rblhighercontactMobileOtherNo" GroupName="highercontactMobileOther" Text="No" runat="server" />
                                        </div>
                                        <span class="helpicon"><i id="ichighercontactMobileOther" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="button" value="Add Remarks" id="btnhighercontactMobileOther" />
                                        <input id="txthighercontactMobileOther" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <asp:RadioButton ID="rblhighergradeYes" GroupName="highergrade" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblhighergradeNO" GroupName="highergrade" Text="No" runat="server" />
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnhighergrade" />
                                    <input id="txtHigherGrade" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                            <label id="labeldiploma" runat="server" for="diploma" class="col-md-2 col-form-label form-label">Have you completed any Diploma or Certificate Programs ?</label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiploma" runat="server"></asp:Label>
                                <asp:RadioButton ID="rbldiplomaYes" GroupName="diploma" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rbldiplomaNo" GroupName="diploma" Text="No" runat="server" />
                                <span class="helpicon"><i id="icdiploma" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btndiploma" />
                                <input id="txtdiploma" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomaCountry" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomaCountry">
                        <div class="form-row">
                            <label id="labeldiplomaCountry" runat="server" for="diplomaCountry" class="col-md-2 col-form-label form-label">Country of Diploma or Certificate Programs</label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomaCountry" runat="server"></asp:Label>
                                <asp:RadioButton ID="rbldiplomaCountryYes" GroupName="diplomaCountry" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rbldiplomaCountryNo" GroupName="diplomaCountry" Text="No" runat="server" />
                                <span class="helpicon"><i id="icdiplomaCountry" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btndiplomaCountry" />
                                <input id="txtdiplomaCountry" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomastartDate" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomastartDate">
                        <div class="form-row">
                            <label id="labeldiplomastartDate" runat="server" for="diplomastartDate" class="col-md-2 col-form-label form-label">Start Date </label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomastartDate" runat="server"></asp:Label>
                                <asp:RadioButton ID="rbldiplomastartDateYes" GroupName="diplomastartDate" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rbldiplomastartDateNo" GroupName="diplomastartDate" Text="No" runat="server" />
                                <span class="helpicon"><i id="icdiplomastartDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btndiplomastartDate" />
                                <input id="txtdiplomastartDate" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomaendDate" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomaendDate">
                        <div class="form-row">
                            <label id="labeldiplomaendDate" runat="server" for="diplomaendDate" class="col-md-2 col-form-label form-label">End Date </label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomaendDate" runat="server"></asp:Label>
                                <asp:RadioButton ID="rbldiplomaendDateYes" GroupName="diplomaendDate" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rbldiplomaendDateNo" GroupName="diplomaendDate" Text="No" runat="server" />
                                <span class="helpicon"><i id="icdiplomaendDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btndiplomaendDate" />
                                <input id="txtdiplomaendDate" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomaschoolName" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomaschoolName">
                        <div class="form-row">
                            <label id="labeldiplomaschoolName" runat="server" for="diplomaschoolName" class="col-md-2 col-form-label form-label">Name of School</label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomaschoolName" runat="server"></asp:Label>
                                <asp:RadioButton ID="rbldiplomaschoolNameYes" GroupName="diplomaschoolName" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rbldiplomaschoolNameNo" GroupName="diplomaschoolName" Text="No" runat="server" />
                                <span class="helpicon"><i id="icdiplomaschoolName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btndiplomaschoolName" />
                                <input id="txtdiplomaschoolName" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomaQualificationtype" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomaQualificationtype">
                        <div class="form-row">
                            <label id="labeldiplomaQualificationtype" runat="server" for="diplomaQualificationtype" class="col-md-2 col-form-label form-label">Qualification Type</label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomaQualificationtype" runat="server"></asp:Label>
                                <asp:RadioButton ID="rbldiplomaQualificationtypeYes" GroupName="diplomaQualificationtype" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rbldiplomaQualificationtypeNo" GroupName="diplomaQualificationtype" Text="No" runat="server" />
                                <span class="helpicon"><i id="icdiplomaQualificationtype" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btndiplomaQualificationtype" />
                                <input id="txtdiplomaQualificationtype" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomastudymode" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomastudymode">
                        <div class="form-row">
                            <label id="labeldiplomastudymode" runat="server" for="diplomastudymode" class="col-md-2 col-form-label form-label">Mode of study</label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomastudymode" runat="server"></asp:Label>
                                <asp:RadioButton ID="rbldiplomastudymodeYes" GroupName="diplomastudymode" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rbldiplomastudymodeNo" GroupName="diplomastudymode" Text="No" runat="server" />
                                <span class="helpicon"><i id="icdiplomastudymode" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btndiplomastudymode" />
                                <input id="txtdiplomastudymode" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomalanguage" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomalanguage">
                        <div class="form-row">
                            <label id="labeldiplomalanguage" runat="server" for="diplomalanguage" class="col-md-2 col-form-label form-label">Language (Medium) of Study</label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomalanguage" runat="server"></asp:Label>
                                <asp:RadioButton ID="rbldiplomalanguageYes" GroupName="diplomalanguage" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rbldiplomalanguageNo" GroupName="diplomalanguage" Text="No" runat="server" />
                                <span class="helpicon"><i id="icdiplomalanguage" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btndiplomalanguage" />
                                <input id="txtdiplomalanguage" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomagradetype" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomagradetype">
                        <div class="form-row">
                            <label id="labeldiplomagradetype" runat="server" for="diplomagradetype" class="col-md-2 col-form-label form-label">Grade Type</label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomagradetype" runat="server"></asp:Label>
                                <asp:RadioButton ID="rbldiplomagradetypeYes" GroupName="diplomagradetype" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rbldiplomagradetypeNo" GroupName="diplomagradetype" Text="No" runat="server" />
                                <span class="helpicon"><i id="icdiplomagradetype" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btndiplomagradetype" />
                                <input id="txtdiplomagradetype" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomagradeachieved" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomagradeachieved">
                        <div class="form-row">
                            <label id="labeldiplomagradeachieved" runat="server" for="diplomagradeachieved" class="col-md-2 col-form-label form-label">Final Grade Achieved </label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomagradeachieved" runat="server"></asp:Label>
                                <asp:RadioButton ID="rbldiplomagradeachievedYes" GroupName="diplomagradeachieved" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rbldiplomagradeachievedNo" GroupName="diplomagradeachieved" Text="No" runat="server" />
                                <span class="helpicon"><i id="icdiplomagradeachieved" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btndiplomagradeachieved" />
                                <input id="txtdiplomagradeachieved" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="ExpectedDiplomaDategrade" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedDiplomaDategrade">
                        <div class="form-row">
                            <label id="labelExpectedDiplomaDategrade" runat="server" for="ExpectedDiplomaDategrade" class="col-md-2 col-form-label form-label">Expected dates when results will be declared </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblExpectedDiplomaDategrade" runat="server"></asp:Label>
                                <asp:RadioButton ID="rblExpectedDiplomaDategradeYes" GroupName="ExpectedDiplomaDategrade" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblExpectedDiplomaDategradeNo" GroupName="ExpectedDiplomaDategrade" Text="No" runat="server" />
                                <span class="helpicon"><i id="icExpectedDiplomaDategrade" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnExpectedDiplomaDategrade" />
                                <input id="txtExpectedDiplomaDategrade" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomaverify" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomaverify">
                        <div class="form-row">
                            <label id="labeldiplomaverify" runat="server" for="diplomaverify" class="col-md-2 col-form-label form-label">Name of Contact who can verify this qualification </label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomaverify" runat="server"></asp:Label>
                                <asp:RadioButton ID="rbldiplomaverifyYes" GroupName="diplomaverify" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rbldiplomaverifyNo" GroupName="diplomaverify" Text="No" runat="server" />
                                <span class="helpicon"><i id="icdiplomaverify" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btndiplomaverify" />
                                <input id="txtdiplomaverify" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomarelation" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomarelation">
                        <div class="form-row">
                            <label id="labeldiplomarelation" runat="server" for="diplomarelation" class="col-md-2 col-form-label form-label">Relationship with the Contact </label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomarelation" runat="server"></asp:Label>
                                <asp:RadioButton ID="rbldiplomarelationYes" GroupName="diplomarelation" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rbldiplomarelationNo" GroupName="diplomarelation" Text="No" runat="server" />
                                <span class="helpicon"><i id="icdiplomarelation" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btndiplomarelation" />
                                <input id="txtdiplomarelation" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomacontactEmail" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomacontactEmail">
                        <div class="form-row">
                            <label id="labeldiplomacontactEmail" runat="server" for="diplomacontactEmail" class="col-md-2 col-form-label form-label">Email ID of Contact who can verify your employment  </label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomacontactEmail" runat="server"></asp:Label>
                                <asp:RadioButton ID="rbldiplomacontactEmailYes" GroupName="diplomacontactEmail" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rbldiplomacontactEmailNo" GroupName="diplomacontactEmail" Text="No" runat="server" />
                                <span class="helpicon"><i id="icdiplomacontactEmail" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btndiplomacontactEmail" />
                                <input id="txtdiplomacontactEmail" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="diplomacontactMobile" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-diplomacontactMobile">
                        <div class="form-row">
                            <label id="labeldiplomacontactMobile" runat="server" for="diplomacontactMobile" class="col-md-2 col-form-label form-label">Mobile/Cellular Number who can verify this qualification </label>
                            <div class="col-md-4">
                                <asp:Label ID="lbldiplomacontactMobile" runat="server"></asp:Label>
                                <asp:RadioButton ID="rbldiplomacontactMobileYes" GroupName="diplomacontactMobile" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rbldiplomacontactMobileNo" GroupName="diplomacontactMobile" Text="No" runat="server" />
                                <span class="helpicon"><i id="icdiplomacontactMobile" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btndiplomacontactMobile" />
                                <input id="txtdiplomacontactMobile" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
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
                                <asp:RadioButton ID="rbldiplomagradeYes" GroupName="diplomagrade" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rbldiplomagradeNo" GroupName="diplomagrade" Text="No" runat="server" />
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btndiplomagrade" />
                                <input id="txtDiplomaGrade" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>




                <!----Diploma END------>
                <div id="mainDiv" runat="server"></div>
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

    <script type="text/javascript">
        $(document).ready(function () {
            // High School
            $("#btnhighschool").click(function () {
                ManageRemarks('<%=txthighschool.ClientID%>', 'btnhighschool');
            });
            $("#<%=rblhighschoolNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighschool.ClientID%>', 'btnhighschool');
            });
            $("#btnhighschoolCountry").click(function () {
                ManageRemarks('<%=txthighschoolCountry.ClientID%>', 'btnhighschoolCountry');
            });
            $("#<%=rblhighschoolCountryNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighschoolCountry.ClientID%>', 'btnhighschoolCountry');
            });
            $("#btnhighschoolstartDate").click(function () {
                ManageRemarks('<%=txthighschoolstartDate.ClientID%>', 'btnhighschoolstartDate');
            });
            $("#<%=rblhighschoolstartDateNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighschoolstartDate.ClientID%>', 'btnhighschoolstartDate');
            });
            $("#btnhighschoolendDate").click(function () {
                ManageRemarks('<%=txthighschoolendDate.ClientID%>', 'btnhighschoolendDate');
            });
            $("#<%=rblhighschoolendDateNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighschoolendDate.ClientID%>', 'btnhighschoolendDate');

            });
            $("#btnhighschoolName").click(function () {
                ManageRemarks('<%=txthighschoolName.ClientID%>', 'btnhighschoolName');
            });
            $("#<%=rblhighschoolNameNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighschoolName.ClientID%>', 'btnhighschoolName');
            });
            $("#btnhighschoolQualificationtype").click(function () {
                ManageRemarks('<%=txthighschoolQualificationtype.ClientID%>', 'btnhighschoolQualificationtype');
            });
            $("#<%=rblhighschoolQualificationtypeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighschoolQualificationtype.ClientID%>', 'btnhighschoolQualificationtype');
            });

            $("#btnhighschoolstudymode").click(function () {
                ManageRemarks('<%=txthighschoolstudymode.ClientID%>', 'btnhighschoolstudymode');
            });
            $("#<%=rblhighschoolstudymodeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighschoolstudymode.ClientID%>', 'btnhighschoolstudymode');
            });
            $("#btnhighschoollanguage").click(function () {
                ManageRemarks('<%=txthighschoollanguage.ClientID%>', 'btnhighschoollanguage');
            });
            $("#<%=rblhighschoollanguageNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighschoollanguage.ClientID%>', 'btnhighschoollanguage');
            });
            $("#btngradetype").click(function () {
                ManageRemarks('<%=txtgradetype.ClientID%>', 'btngradetype');
            });
            $("#<%=rblhighschoollanguageNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtgradetype.ClientID%>', 'btngradetype');
            });
            $("#btnhighschoolgradeachieved").click(function () {
                ManageRemarks('<%=txthighschoolgradeachieved.ClientID%>', 'btnhighschoolgradeachieved');
            });
            $("#<%=rblhighschoolgradeachievedNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighschoolgradeachieved.ClientID%>', 'btnhighschoolgradeachieved');
            });
            $("#btnExpectedHighSchoolDategrade").click(function () {
                ManageRemarks('<%=txtExpectedHighSchoolDategrade.ClientID%>', 'btnExpectedHighSchoolDategrade');
            });
            $("#<%=rblExpectedHighSchoolDategradeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtExpectedHighSchoolDategrade.ClientID%>', 'btnExpectedHighSchoolDategrade');
            });
            $("#btnhighschoolverify").click(function () {
                ManageRemarks('<%=txthighschoolverify.ClientID%>', 'btnhighschoolverify');
            });
            $("#<%=rblhighschoolverifyNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighschoolverify.ClientID%>', 'btnhighschoolverify');
            });
            $("#btnhighschoolrelation").click(function () {
                ManageRemarks('<%=txthighschoolrelation.ClientID%>', 'btnhighschoolrelation');
            });
            $("#<%=rblhighschoolrelationNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighschoolrelation.ClientID%>', 'btnhighschoolrelation');
            });

            $("#btnhighschoolcontactEmail").click(function () {
                ManageRemarks('<%=txthighschoolcontactEmail.ClientID%>', 'btnhighschoolcontactEmail');
            });
            $("#<%=rblhighschoolcontactEmailNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighschoolcontactEmail.ClientID%>', 'btnhighschoolcontactEmail');
            });

            $("#btnhighschoolcontactMobile").click(function () {
                ManageRemarks('<%=txthighschoolcontactMobile.ClientID%>', 'btnhighschoolcontactMobile');
            });
            $("#<%=rblhighschoolcontactMobileNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighschoolcontactMobile.ClientID%>', 'btnhighschoolcontactMobile');
            });
            
            $("#btnhighshoolgrade").click(function () {
                ManageRemarks('<%=txthighschoolgrade.ClientID%>', 'btnhighshoolgrade');
            });
            $("#<%=rblhighshoolgradeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighschoolgrade.ClientID%>', 'btnhighshoolgrade');
            });
            /// Secondary
            $("#btnSecondary").click(function () {
                ManageRemarks('<%=txtSecondary.ClientID%>', 'btnSecondary');
            });
            $("#<%=rblSecondaryNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtSecondary.ClientID%>', 'btnSecondary');
            });
            $("#btnSecondaryCountry").click(function () {
                ManageRemarks('<%=txtSecondaryCountry.ClientID%>', 'btnSecondaryCountry');
            });
            $("#<%=rblSecondaryCountryNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtSecondaryCountry.ClientID%>', 'btnSecondaryCountry');
            });
            $("#btnSecondarystartDate").click(function () {
                ManageRemarks('<%=txtSecondarystartDate.ClientID%>', 'btnSecondarystartDate');
            });
            $("#<%=rblSecondarystartDateNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtSecondarystartDate.ClientID%>', 'btnSecondarystartDate');
            });
            $("#btnSecondaryendDate").click(function () {
                ManageRemarks('<%=txtSecondaryendDate.ClientID%>', 'btnSecondaryendDate');
            });
            $("#<%=rblSecondaryendDateNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtSecondaryendDate.ClientID%>', 'btnSecondaryendDate');

            }); $("#btnSecondaryschoolName").click(function () {
                ManageRemarks('<%=txtSecondaryschoolName.ClientID%>', 'btnSecondaryschoolName');
            });
            $("#<%=rblSecondaryschoolNameNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtSecondaryschoolName.ClientID%>', 'btnSecondaryschoolName');
            });
            $("#btnSecondaryQualificationtype").click(function () {
                ManageRemarks('<%=txtSecondaryQualificationtype.ClientID%>', 'btnSecondaryQualificationtype');
            });
            $("#<%=rblSecondaryQualificationtypeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtSecondaryQualificationtype.ClientID%>', 'btnSecondaryQualificationtype');
            });

            $("#btnSecondarystudymode").click(function () {
                ManageRemarks('<%=txtSecondarystudymode.ClientID%>', 'btnSecondarystudymode');
            });
            $("#<%=rblSecondarystudymodeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtSecondarystudymode.ClientID%>', 'btnSecondarystudymode');
            });
            $("#btnSecondarylanguage").click(function () {
                ManageRemarks('<%=txtSecondarylanguage.ClientID%>', 'btnSecondarylanguage');
            });
            $("#<%=rblSecondarylanguageNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtSecondarylanguage.ClientID%>', 'btnSecondarylanguage');
            });
            $("#btnSecondarygradetype").click(function () {
                ManageRemarks('<%=txtSecondarygradetype.ClientID%>', 'btnSecondarygradetype');
            });
            $("#<%=rblSecondarygradetypeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtSecondarygradetype.ClientID%>', 'btnSecondarygradetype');
            });
            $("#btnSecondarygradeachieved").click(function () {
                ManageRemarks('<%=txtSecondarygradeachieved.ClientID%>', 'btnSecondarygradeachieved');
            });
            $("#<%=rblSecondarygradeachievedNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtSecondarygradeachieved.ClientID%>', 'btnSecondarygradeachieved');
            });
            $("#btnExpectedSecondaryDategrade").click(function () {
                ManageRemarks('<%=txtExpectedSecondaryDategrade.ClientID%>', 'btnExpectedSecondaryDategrade');
            });
            $("#<%=rblSecondarygradeachievedNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtExpectedSecondaryDategrade.ClientID%>', 'btnExpectedSecondaryDategrade');
            });
            $("#btnSecondaryverify").click(function () {
                ManageRemarks('<%=txtSecondaryverify.ClientID%>', 'btnSecondaryverify');
            });
            $("#<%=rblSecondaryverifyNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtSecondaryverify.ClientID%>', 'btnSecondaryverify');
            });
            $("#btnsecondaryschoolrelation").click(function () {
                ManageRemarks('<%=txtsecondaryschoolrelation.ClientID%>', 'btnsecondaryschoolrelation');
            });
            $("#<%=rblsecondaryschoolrelationNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtsecondaryschoolrelation.ClientID%>', 'btnsecondaryschoolrelation');
            });

            $("#btnsecondarycontactEmail").click(function () {
                ManageRemarks('<%=txtsecondarycontactEmail.ClientID%>', 'btnsecondarycontactEmail');
            });
            $("#<%=rblsecondarycontactEmailNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtsecondarycontactEmail.ClientID%>', 'btnsecondarycontactEmail');
            });

            $("#btnsecondarycontactMobile").click(function () {
                ManageRemarks('<%=txtsecondarycontactMobile.ClientID%>', 'btnsecondarycontactMobile');
            });
            $("#<%=rblsecondarycontactMobileNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtsecondarycontactMobile.ClientID%>', 'btnsecondarycontactMobile');
            });
            $("#btnsecondarygrade").click(function () {
                ManageRemarks('<%=txtSecondaryGrade.ClientID%>', 'btnsecondarygrade');
            });
            $("#<%=rblsecondarygradeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtSecondaryGrade.ClientID%>', 'btnsecondarygrade');
            });
            /// Diploma

             $("#btndiploma").click(function () {
                ManageRemarks('<%=txtdiploma.ClientID%>', 'btndiploma');
            });
            $("#<%=rbldiplomaNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtdiploma.ClientID%>', 'btndiploma');
            });
            $("#btndiplomaCountry").click(function () {
                ManageRemarks('<%=txtdiplomaCountry.ClientID%>', 'btndiplomaCountry');
            });
            $("#<%=rbldiplomaCountryNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtdiplomaCountry.ClientID%>', 'btndiplomaCountry');
            });
            $("#btndiplomastartDate").click(function () {
                ManageRemarks('<%=txtdiplomastartDate.ClientID%>', 'btndiplomastartDate');
            });
            $("#<%=rbldiplomastartDateNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtdiplomastartDate.ClientID%>', 'btndiplomastartDate');
            });
            $("#btndiplomaendDate").click(function () {
                ManageRemarks('<%=txtdiplomaendDate.ClientID%>', 'btndiplomaendDate');
            });
            $("#<%=rbldiplomaendDateNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtdiplomaendDate.ClientID%>', 'btndiplomaendDate');

            }); $("#btndiplomaschoolName").click(function () {
                ManageRemarks('<%=txtdiplomaschoolName.ClientID%>', 'btndiplomaschoolName');
            });
            $("#<%=rbldiplomaschoolNameNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtdiplomaschoolName.ClientID%>', 'btndiplomaschoolName');
            });
            $("#btndiplomaQualificationtype").click(function () {
                ManageRemarks('<%=txtdiplomaQualificationtype.ClientID%>', 'btndiplomaQualificationtype');
            });
            $("#<%=rbldiplomaQualificationtypeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtdiplomaQualificationtype.ClientID%>', 'btndiplomaQualificationtype');
            });

            $("#btndiplomastudymode").click(function () {
                ManageRemarks('<%=txtdiplomastudymode.ClientID%>', 'btndiplomastudymode');
            });
            $("#<%=rbldiplomastudymodeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtdiplomastudymode.ClientID%>', 'btndiplomastudymode');
            });
            $("#btndiplomalanguage").click(function () {
                ManageRemarks('<%=txtdiplomalanguage.ClientID%>', 'btndiplomalanguage');
            });
            $("#<%=rbldiplomalanguageNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtdiplomalanguage.ClientID%>', 'btndiplomalanguage');
            });
            $("#btndiplomagradetype").click(function () {
                ManageRemarks('<%=txtdiplomagradetype.ClientID%>', 'btndiplomagradetype');
            });
            $("#<%=rbldiplomagradetypeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtdiplomagradetype.ClientID%>', 'btndiplomagradetype');
            });
            $("#btndiplomagradeachieved").click(function () {
                ManageRemarks('<%=txtdiplomagradeachieved.ClientID%>', 'btndiplomagradeachieved');
            });
            $("#<%=rbldiplomagradeachievedNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtdiplomagradeachieved.ClientID%>', 'btndiplomagradeachieved');
            });
            $("#btnExpecteddiplomaDategrade").click(function () {
                ManageRemarks('<%=txtExpectedDiplomaDategrade.ClientID%>', 'btnExpecteddiplomaDategrade');
            });
            $("#<%=rbldiplomagradeachievedNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtExpectedDiplomaDategrade.ClientID%>', 'btnExpecteddiplomaDategrade');
            });
            $("#btndiplomaverify").click(function () {
                ManageRemarks('<%=txtdiplomaverify.ClientID%>', 'btndiplomaverify');
            });
            $("#<%=rbldiplomaverifyNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtdiplomaverify.ClientID%>', 'btndiplomaverify');
            });
            $("#btndiplomarelation").click(function () {
                ManageRemarks('<%=txtdiplomarelation.ClientID%>', 'btndiplomarelation');
            });
            $("#<%=rbldiplomarelationNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtdiplomarelation.ClientID%>', 'btndiplomarelation');
            });

            $("#btndiplomacontactEmail").click(function () {
                ManageRemarks('<%=txtdiplomacontactEmail.ClientID%>', 'btndiplomacontactEmail');
            });
            $("#<%=rbldiplomacontactEmailNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtdiplomacontactEmail.ClientID%>', 'btndiplomacontactEmail');
            });

            $("#btndiplomacontactMobile").click(function () {
                ManageRemarks('<%=txtdiplomacontactMobile.ClientID%>', 'btndiplomacontactMobile');
            });
            $("#<%=rbldiplomacontactMobileNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtdiplomacontactMobile.ClientID%>', 'btndiplomacontactMobile');
            });
            $("#btndiplomagrade").click(function () {
                ManageRemarks('<%=txtDiplomaGrade.ClientID%>', 'btndiplomagrade');
            });
            $("#<%=rbldiplomagradeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtDiplomaGrade.ClientID%>', 'btndiplomagrade');
            });
            /// UG
              $("#btnhigher").click(function () {
                ManageRemarks('<%=txthigher.ClientID%>', 'btnhigher');
            });
            $("#<%=rblhigherNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigher.ClientID%>', 'btnhigher');
            });
            $("#btnhigherCountry").click(function () {
                ManageRemarks('<%=txthigherCountry.ClientID%>', 'btnhigherCountry');
            });
            $("#<%=rblhigherCountryNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherCountry.ClientID%>', 'btnhigherCountry');
            });
            $("#btnhigherstartDate").click(function () {
                ManageRemarks('<%=txthigherstartDate.ClientID%>', 'btnhigherstartDate');
            });
            $("#<%=rblhigherstartDateNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherstartDate.ClientID%>', 'btnhigherstartDate');
            });
            $("#btnhigherendDate").click(function () {
                ManageRemarks('<%=txthigherendDate.ClientID%>', 'btnhigherendDate');
            });
            $("#<%=rblhigherendDateNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherendDate.ClientID%>', 'btnhigherendDate');

            }); $("#btnhigherschoolName").click(function () {
                ManageRemarks('<%=txthigherschoolName.ClientID%>', 'btnhigherschoolName');
            });
            $("#<%=rblhigherschoolNameNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherschoolName.ClientID%>', 'btnhigherschoolName');
            });
            $("#btnhigherQualificationtype").click(function () {
                ManageRemarks('<%=txthigherQualificationtype.ClientID%>', 'btnhigherQualificationtype');
            });
            $("#<%=rblhigherQualificationtypeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherQualificationtype.ClientID%>', 'btnhigherQualificationtype');
            });

            $("#btnhigherstudymode").click(function () {
                ManageRemarks('<%=txthigherstudymode.ClientID%>', 'btnhigherstudymode');
            });
            $("#<%=rblhigherstudymodeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherstudymode.ClientID%>', 'btnhigherstudymode');
            });
            $("#btnhigherlanguage").click(function () {
                ManageRemarks('<%=txthigherlanguage.ClientID%>', 'btnhigherlanguage');
            });
            $("#<%=rblhigherlanguageNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherlanguage.ClientID%>', 'btnhigherlanguage');
            });
            $("#btnhighergradetype").click(function () {
                ManageRemarks('<%=txthighergradetype.ClientID%>', 'btnhighergradetype');
            });
            $("#<%=rblhighergradetypeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighergradetype.ClientID%>', 'btnhighergradetype');
            });
            $("#btnhighergradeachieved").click(function () {
                ManageRemarks('<%=txthighergradeachieved.ClientID%>', 'btnhighergradeachieved');
            });
            $("#<%=rblhighergradeachievedNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighergradeachieved.ClientID%>', 'btnhighergradeachieved');
            });
            $("#btnExpectedhigherDategrade").click(function () {
                ManageRemarks('<%=txtExpectedHigherDategrade.ClientID%>', 'btnExpectedhigherDategrade');
            });
            $("#<%=rblhighergradeachievedNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtExpectedHigherDategrade.ClientID%>', 'btnExpectedhigherDategrade');
            });
            $("#btnhigherverify").click(function () {
                ManageRemarks('<%=txthigherverify.ClientID%>', 'btnhigherverify');
            });
            $("#<%=rblhigherverifyNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherverify.ClientID%>', 'btnhigherverify');
            });
            $("#btnhigherrelation").click(function () {
                ManageRemarks('<%=txthigherrelation.ClientID%>', 'btnhigherrelation');
            });
            $("#<%=rblhigherrelationNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherrelation.ClientID%>', 'btnhigherrelation');
            });

            $("#btnhighercontactEmail").click(function () {
                ManageRemarks('<%=txthighercontactEmail.ClientID%>', 'btnhighercontactEmail');
            });
            $("#<%=rblhighercontactEmailNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighercontactEmail.ClientID%>', 'btnhighercontactEmail');
            });

            $("#btnhighercontactMobile").click(function () {
                ManageRemarks('<%=txthighercontactMobile.ClientID%>', 'btnhighercontactMobile');
            });
            $("#<%=rblhighercontactMobileNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighercontactMobile.ClientID%>', 'btnhighercontactMobile');
            });
            $("#btnhighergrade").click(function () {
                ManageRemarks('<%=txtHigherGrade.ClientID%>', 'btnhighergrade');
            });
            $("#<%=rblhighergradeNO.ClientID%>").click(function () {
                ManageRemarks('<%=txtHigherGrade.ClientID%>', 'btnhighergrade');
            });
            /// Pg
           
            $("#btnhigherCountryPG").click(function () {
                ManageRemarks('<%=txthigherCountryPG.ClientID%>', 'btnhigherCountryPG');
            });
            $("#<%=rblhigherCountryPGNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherCountryPG.ClientID%>', 'btnhigherCountryPG');
            });
            $("#btnhigherstartDatePG").click(function () {
                ManageRemarks('<%=txthigherstartDatePG.ClientID%>', 'btnhigherstartDatePG');
            });
            $("#<%=rblhigherstartDatePGNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherstartDatePG.ClientID%>', 'btnhigherstartDatePG');
            });
            $("#btnhigherendDatePG").click(function () {
                ManageRemarks('<%=txthigherendDatePG.ClientID%>', 'btnhigherendDatePG');
            });
            $("#<%=rblhigherendDatePGNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherendDatePG.ClientID%>', 'btnhigherendDatePG');

            }); $("#btnhigherschoolNamePG").click(function () {
                ManageRemarks('<%=txthigherschoolNamePG.ClientID%>', 'btnhigherschoolNamePG');
            });
            $("#<%=rblhigherschoolNamePGNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherschoolNamePG.ClientID%>', 'btnhigherschoolNamePG');
            });
            $("#btnhigherQualificationtypePG").click(function () {
                ManageRemarks('<%=txthigherQualificationtypePG.ClientID%>', 'btnhigherQualificationtypePG');
            });
            $("#<%=rblhigherQualificationtypePGNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherQualificationtypePG.ClientID%>', 'btnhigherQualificationtypePG');
            });

            $("#btnhigherstudymodePG").click(function () {
                ManageRemarks('<%=txthigherstudymodePG.ClientID%>', 'btnhigherstudymodePG');
            });
            $("#<%=rblhigherstudymodePGNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherstudymodePG.ClientID%>', 'btnhigherstudymodePG');
            });
            $("#btnhigherlanguagePG").click(function () {
                ManageRemarks('<%=txthigherlanguagePG.ClientID%>', 'btnhigherlanguagePG');
            });
            $("#<%=rblhigherlanguagePGNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherlanguagePG.ClientID%>', 'btnhigherlanguagePG');
            });
            $("#btnhighergradetypePG").click(function () {
                ManageRemarks('<%=txthighergradetypePG.ClientID%>', 'btnhighergradetypePG');
            });
            $("#<%=rblhighergradetypePGNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighergradetypePG.ClientID%>', 'btnhighergradetypePG');
            });
            $("#btnhighergradeachievedPG").click(function () {
                ManageRemarks('<%=txthighergradeachievedPG.ClientID%>', 'btnhighergradeachievedPG');
            });
            $("#<%=rblhighergradeachievedPGNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighergradeachievedPG.ClientID%>', 'btnhighergradeachievedPG');
            });
            $("#btnExpectedhigherDategradePG").click(function () {
                ManageRemarks('<%=txtExpectedHigherDategradePG.ClientID%>', 'btnExpectedhigherDategradePG');
            });
            $("#<%=rblhighergradeachievedPGNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtExpectedHigherDategradePG.ClientID%>', 'btnExpectedhigherDategradePG');
            });
            $("#btnhigherverifyPG").click(function () {
                ManageRemarks('<%=txthigherverifyPG.ClientID%>', 'btnhigherverifyPG');
            });
            $("#<%=rblhigherverifyPGNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherverifyPG.ClientID%>', 'btnhigherverifyPG');
            });
            $("#btnhigherrelationPG").click(function () {
                ManageRemarks('<%=txthigherrelationPG.ClientID%>', 'btnhigherrelationPG');
            });
            $("#<%=rblhigherrelationPGNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherrelationPG.ClientID%>', 'btnhigherrelationPG');
            });

            $("#btnhighercontactEmailPG").click(function () {
                ManageRemarks('<%=txthighercontactEmailPG.ClientID%>', 'btnhighercontactEmailPG');
            });
            $("#<%=rblhighercontactEmailPGNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighercontactEmailPG.ClientID%>', 'btnhighercontactEmailPG');
            });

            $("#btnhighercontactMobilePG").click(function () {
                ManageRemarks('<%=txthighercontactMobilePG.ClientID%>', 'btnhighercontactMobilePG');
            });
            $("#<%=rblhighercontactMobilePGNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighercontactMobilePG.ClientID%>', 'btnhighercontactMobilePG');
            });
           /// PHD
                    $("#btnhigherCountryPhd").click(function () {
                ManageRemarks('<%=txthigherCountryPhd.ClientID%>', 'btnhigherCountryPhd');
            });
            $("#<%=rblhigherCountryPhdNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherCountryPhd.ClientID%>', 'btnhigherCountryPhd');
            });
            $("#btnhigherstartDatePhd").click(function () {
                ManageRemarks('<%=txthigherstartDatePhd.ClientID%>', 'btnhigherstartDatePhd');
            });
            $("#<%=rblhigherstartDatePhdNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherstartDatePhd.ClientID%>', 'btnhigherstartDatePhd');
            });
            $("#btnhigherendDatePhd").click(function () {
                ManageRemarks('<%=txthigherendDatePhd.ClientID%>', 'btnhigherendDatePhd');
            });
            $("#<%=rblhigherendDatePhdNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherendDatePhd.ClientID%>', 'btnhigherendDatePhd');

            }); $("#btnhigherschoolNamePhd").click(function () {
                ManageRemarks('<%=txthigherschoolNamePhd.ClientID%>', 'btnhigherschoolNamePhd');
            });
            $("#<%=rblhigherschoolNamePhdNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherschoolNamePhd.ClientID%>', 'btnhigherschoolNamePhd');
            });
            $("#btnhigherQualificationtypePhd").click(function () {
                ManageRemarks('<%=txthigherQualificationtypePhd.ClientID%>', 'btnhigherQualificationtypePhd');
            });
            $("#<%=rblhigherQualificationtypePhdNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherQualificationtypePhd.ClientID%>', 'btnhigherQualificationtypePhd');
            });

            $("#btnhigherstudymodePhd").click(function () {
                ManageRemarks('<%=txthigherstudymodePhd.ClientID%>', 'btnhigherstudymodePhd');
            });
            $("#<%=rblhigherstudymodePhdNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherstudymodePhd.ClientID%>', 'btnhigherstudymodePhd');
            });
            $("#btnhigherlanguagePhd").click(function () {
                ManageRemarks('<%=txthigherlanguagePhd.ClientID%>', 'btnhigherlanguagePhd');
            });
            $("#<%=rblhigherlanguagePhdNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherlanguagePhd.ClientID%>', 'btnhigherlanguagePhd');
            });
            $("#btnhighergradetypePhd").click(function () {
                ManageRemarks('<%=txthighergradetypePhd.ClientID%>', 'btnhighergradetypePhd');
            });
            $("#<%=rblhighergradetypePhdNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighergradetypePhd.ClientID%>', 'btnhighergradetypePhd');
            });
            $("#btnhighergradeachievedPhd").click(function () {
                ManageRemarks('<%=txthighergradeachievedPhd.ClientID%>', 'btnhighergradeachievedPhd');
            });
            $("#<%=rblhighergradeachievedPhdNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighergradeachievedPhd.ClientID%>', 'btnhighergradeachievedPhd');
            });
            $("#btnExpectedhigherDategradePhd").click(function () {
                ManageRemarks('<%=txtExpectedHigherDategradePhd.ClientID%>', 'btnExpectedhigherDategradePhd');
            });
            $("#<%=rblExpectedHigherDategradePhdNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtExpectedHigherDategradePhd.ClientID%>', 'btnExpectedhigherDategradePhd');
            });
            $("#btnhigherverifyPhd").click(function () {
                ManageRemarks('<%=txthigherverifyPhd.ClientID%>', 'btnhigherverifyPhd');
            });
            $("#<%=rblhigherverifyPhdNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherverifyPhd.ClientID%>', 'btnhigherverifyPhd');
            });
            $("#btnhigherrelationPhd").click(function () {
                ManageRemarks('<%=txthigherrelationPhd.ClientID%>', 'btnhigherrelationPhd');
            });
            $("#<%=rblhigherrelationPhdNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherrelationPhd.ClientID%>', 'btnhigherrelationPhd');
            });

            $("#btnhighercontactEmailPhd").click(function () {
                ManageRemarks('<%=txthighercontactEmailPhd.ClientID%>', 'btnhighercontactEmailPhd');
            });
            $("#<%=rblhighercontactEmailPhdNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighercontactEmailPhd.ClientID%>', 'btnhighercontactEmailPhd');
            });

            $("#btnhighercontactMobilePhd").click(function () {
                ManageRemarks('<%=txthighercontactMobilePhd.ClientID%>', 'btnhighercontactMobilePhd');
            });
            $("#<%=rblhighercontactMobilePhdNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighercontactMobilePhd.ClientID%>', 'btnhighercontactMobilePhd');
            });
             // Other
                    $("#btnhigherCountryOther").click(function () {
                ManageRemarks('<%=txthigherCountryOther.ClientID%>', 'btnhigherCountryOther');
            });
            $("#<%=rblhigherCountryOtherNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherCountryOther.ClientID%>', 'btnhigherCountryOther');
            });
            $("#btnhigherstartDateOther").click(function () {
                ManageRemarks('<%=txthigherstartDateOther.ClientID%>', 'btnhigherstartDateOther');
            });
            $("#<%=rblhigherstartDateOtherNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherstartDateOther.ClientID%>', 'btnhigherstartDateOther');
            });
            $("#btnhigherendDateOther").click(function () {
                ManageRemarks('<%=txthigherendDateOther.ClientID%>', 'btnhigherendDateOther');
            });
            $("#<%=rblhigherendDateOtherNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherendDateOther.ClientID%>', 'btnhigherendDateOther');

            }); $("#btnhigherschoolNameOther").click(function () {
                ManageRemarks('<%=txthigherschoolNameOther.ClientID%>', 'btnhigherschoolNameOther');
            });
            $("#<%=rblhigherschoolNameOtherNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherschoolNameOther.ClientID%>', 'btnhigherschoolNameOther');
            });
            $("#btnhigherQualificationtypeOther").click(function () {
                ManageRemarks('<%=txthigherQualificationtypeOther.ClientID%>', 'btnhigherQualificationtypeOther');
            });
            $("#<%=rblhigherQualificationtypeOtherNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherQualificationtypeOther.ClientID%>', 'btnhigherQualificationtypeOther');
            });

            $("#btnhigherstudymodeOther").click(function () {
                ManageRemarks('<%=txthigherstudymodeOther.ClientID%>', 'btnhigherstudymodeOther');
            });
            $("#<%=rblhigherstudymodeOtherNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherstudymodeOther.ClientID%>', 'btnhigherstudymodeOther');
            });
            $("#btnhigherlanguageOther").click(function () {
                ManageRemarks('<%=txthigherlanguageOther.ClientID%>', 'btnhigherlanguageOther');
            });
            $("#<%=rblhigherlanguageOtherNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherlanguageOther.ClientID%>', 'btnhigherlanguageOther');
            });
            $("#btnhighergradetypeOther").click(function () {
                ManageRemarks('<%=txthighergradetypeOther.ClientID%>', 'btnhighergradetypeOther');
            });
            $("#<%=rblhighergradetypeOtherNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighergradetypeOther.ClientID%>', 'btnhighergradetypeOther');
            });
            $("#btnhighergradeachievedOther").click(function () {
                ManageRemarks('<%=txthighergradeachievedOther.ClientID%>', 'btnhighergradeachievedOther');
            });
            $("#<%=rblhighergradeachievedOtherNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighergradeachievedOther.ClientID%>', 'btnhighergradeachievedOther');
            });
            $("#btnExpectedhigherDategradeOther").click(function () {
                ManageRemarks('<%=txtExpectedHigherDategradeOther.ClientID%>', 'btnExpectedhigherDategradeOther');
            });
            $("#<%=rblExpectedHigherDategradeOtherNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtExpectedHigherDategradeOther.ClientID%>', 'btnExpectedhigherDategradeOther');
            });
            $("#btnhigherverifyOther").click(function () {
                ManageRemarks('<%=txthigherverifyOther.ClientID%>', 'btnhigherverifyOther');
            });
            $("#<%=rblhigherverifyOtherNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherverifyOther.ClientID%>', 'btnhigherverifyOther');
            });
            $("#btnhigherrelationOther").click(function () {
                ManageRemarks('<%=txthigherrelationOther.ClientID%>', 'btnhigherrelationOther');
            });
            $("#<%=rblhigherrelationOtherNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthigherrelationOther.ClientID%>', 'btnhigherrelationOther');
            });

            $("#btnhighercontactEmailOther").click(function () {
                ManageRemarks('<%=txthighercontactEmailOther.ClientID%>', 'btnhighercontactEmailOther');
            });
            $("#<%=rblhighercontactEmailOtherNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighercontactEmailOther.ClientID%>', 'btnhighercontactEmailOther');
            });

            $("#btnhighercontactMobileOther").click(function () {
                ManageRemarks('<%=txthighercontactMobileOther.ClientID%>', 'btnhighercontactMobileOther');
            });
            $("#<%=rblhighercontactMobileOtherNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthighercontactMobileOther.ClientID%>', 'btnhighercontactMobileOther');
            });

            if ($('#<%=rblhighschoolNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighschool.ClientID%>', 'btnhighschool');
           if ($('#<%=rblhighschoolCountryNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighschoolCountry.ClientID%>', 'btnhighschoolCountry');
           if ($('#<%=rblhighschoolstartDateNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighschoolstartDate.ClientID%>', 'btnhighschoolstartDate');
           if ($('#<%=rblhighschoolendDateNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighschoolendDate.ClientID%>', 'btnhighschoolendDate');
           if ($('#<%=rblhighschoolNameNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighschoolName.ClientID%>', 'btnhighschoolName');
           if ($('#<%=rblhighschoolQualificationtypeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighschoolQualificationtype.ClientID%>', 'btnhighschoolQualificationtype');
           if ($('#<%=rblhighschoolstudymodeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighschoolstudymode.ClientID%>', 'btnhighschoolstudymode');
           if ($('#<%=rblhighschoollanguageNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighschoollanguage.ClientID%>', 'btnhighschoollanguage');
           if ($('#<%=rblhighschoollanguageNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtgradetype.ClientID%>', 'btngradetype');
           if ($('#<%=rblhighschoolgradeachievedNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighschoolgradeachieved.ClientID%>', 'btnhighschoolgradeachieved');
           if ($('#<%=rblExpectedHighSchoolDategradeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtExpectedHighSchoolDategrade.ClientID%>', 'btnExpectedHighSchoolDategrade');
           if ($('#<%=rblhighschoolverifyNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighschoolverify.ClientID%>', 'btnhighschoolverify');
           if ($('#<%=rblhighschoolrelationNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighschoolrelation.ClientID%>', 'btnhighschoolrelation');
           if ($('#<%=rblhighschoolcontactEmailNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighschoolcontactEmail.ClientID%>', 'btnhighschoolcontactEmail');
           if ($('#<%=rblhighschoolcontactMobileNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighschoolcontactMobile.ClientID%>', 'btnhighschoolcontactMobile');
         
           if ($('#<%=rblhighshoolgradeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighschoolgrade.ClientID%>', 'btnhighshoolgrade');
           if ($('#<%=rblSecondaryNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtSecondary.ClientID%>', 'btnSecondary');
           if ($('#<%=rblSecondaryCountryNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtSecondaryCountry.ClientID%>', 'btnSecondaryCountry');
           if ($('#<%=rblSecondarystartDateNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtSecondarystartDate.ClientID%>', 'btnSecondarystartDate');
           if ($('#<%=rblSecondaryendDateNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtSecondaryendDate.ClientID%>', 'btnSecondaryendDate');
           if ($('#<%=rblSecondaryschoolNameNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtSecondaryschoolName.ClientID%>', 'btnSecondaryschoolName');
           if ($('#<%=rblSecondaryQualificationtypeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtSecondaryQualificationtype.ClientID%>', 'btnSecondaryQualificationtype');
           if ($('#<%=rblSecondarystudymodeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtSecondarystudymode.ClientID%>', 'btnSecondarystudymode');
           if ($('#<%=rblSecondarylanguageNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtSecondarylanguage.ClientID%>', 'btnSecondarylanguage');
           if ($('#<%=rblSecondarygradetypeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtSecondarygradetype.ClientID%>', 'btnSecondarygradetype');
           if ($('#<%=rblSecondarygradeachievedNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtSecondarygradeachieved.ClientID%>', 'btnSecondarygradeachieved');
           if ($('#<%=rblExpectedSecondaryDategradeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtExpectedSecondaryDategrade.ClientID%>', 'btnExpectedSecondaryDategrade');
           if ($('#<%=rblSecondaryverifyNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtSecondaryverify.ClientID%>', 'btnSecondaryverify');
           if ($('#<%=rblsecondaryschoolrelationNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtsecondaryschoolrelation.ClientID%>', 'btnsecondaryschoolrelation');
           if ($('#<%=rblsecondarycontactEmailNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtsecondarycontactEmail.ClientID%>', 'btnsecondarycontactEmail');
           if ($('#<%=rblsecondarycontactMobileNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtsecondarycontactMobile.ClientID%>', 'btnsecondarycontactMobile');
           if ($('#<%=rblsecondarygradeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtSecondaryGrade.ClientID%>', 'btnsecondarygrade');
           if ($('#<%=rbldiplomaNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtdiploma.ClientID%>', 'btndiploma');
           if ($('#<%=rbldiplomaCountryNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtdiplomaCountry.ClientID%>', 'btndiplomaCountry');
           if ($('#<%=rbldiplomastartDateNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtdiplomastartDate.ClientID%>', 'btndiplomastartDate');
           if ($('#<%=rbldiplomaendDateNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtdiplomaendDate.ClientID%>', 'btndiplomaendDate');
           if ($('#<%=rbldiplomaschoolNameNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtdiplomaschoolName.ClientID%>', 'btndiplomaschoolName');
           if ($('#<%=rbldiplomaQualificationtypeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtdiplomaQualificationtype.ClientID%>', 'btndiplomaQualificationtype');
           if ($('#<%=rbldiplomastudymodeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtdiplomastudymode.ClientID%>', 'btndiplomastudymode');
           if ($('#<%=rbldiplomalanguageNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtdiplomalanguage.ClientID%>', 'btndiplomalanguage');
           if ($('#<%=rbldiplomagradetypeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtdiplomagradetype.ClientID%>', 'btndiplomagradetype');
           if ($('#<%=rbldiplomagradeachievedNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtdiplomagradeachieved.ClientID%>', 'btndiplomagradeachieved');
           if ($('#<%=rblExpectedDiplomaDategradeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtExpectedDiplomaDategrade.ClientID%>', 'btnExpecteddiplomaDategrade');
           if ($('#<%=rbldiplomaverifyNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtdiplomaverify.ClientID%>', 'btndiplomaverify');
           if ($('#<%=rbldiplomarelationNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtdiplomarelation.ClientID%>', 'btndiplomarelation');
           if ($('#<%=rbldiplomacontactEmailNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtdiplomacontactEmail.ClientID%>', 'btndiplomacontactEmail');
           if ($('#<%=rbldiplomacontactMobileNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtdiplomacontactMobile.ClientID%>', 'btndiplomacontactMobile');
           if ($('#<%=rbldiplomagradeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtDiplomaGrade.ClientID%>', 'btndiplomagrade');
           if ($('#<%=rblhigherNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigher.ClientID%>', 'btnhigher');
           if ($('#<%=rblhigherCountryNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherCountry.ClientID%>', 'btnhigherCountry');
           if ($('#<%=rblhigherstartDateNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherstartDate.ClientID%>', 'btnhigherstartDate');
           if ($('#<%=rblhigherendDateNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherendDate.ClientID%>', 'btnhigherendDate');
           if ($('#<%=rblhigherschoolNameNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherschoolName.ClientID%>', 'btnhigherschoolName');
           if ($('#<%=rblhigherQualificationtypeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherQualificationtype.ClientID%>', 'btnhigherQualificationtype');
           if ($('#<%=rblhigherstudymodeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherstudymode.ClientID%>', 'btnhigherstudymode');
           if ($('#<%=rblhigherlanguageNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherlanguage.ClientID%>', 'btnhigherlanguage');
           if ($('#<%=rblhighergradetypeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighergradetype.ClientID%>', 'btnhighergradetype');
           if ($('#<%=rblhighergradeachievedNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighergradeachieved.ClientID%>', 'btnhighergradeachieved');
           if ($('#<%=rblExpectedHigherDategradeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtExpectedHigherDategrade.ClientID%>', 'btnExpectedhigherDategrade');
           if ($('#<%=rblhigherverifyNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherverify.ClientID%>', 'btnhigherverify');
           if ($('#<%=rblhigherrelationNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherrelation.ClientID%>', 'btnhigherrelation');
           if ($('#<%=rblhighercontactEmailNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighercontactEmail.ClientID%>', 'btnhighercontactEmail');
           if ($('#<%=rblhighercontactMobileNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighercontactMobile.ClientID%>', 'btnhighercontactMobile');
           if ($('#<%=rblhighergradeNO.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtHigherGrade.ClientID%>', 'btnhighergrade');
           if ($('#<%=rblhigherCountryPGNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherCountryPG.ClientID%>', 'btnhigherCountryPG');
           if ($('#<%=rblhigherstartDatePGNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherstartDatePG.ClientID%>', 'btnhigherstartDatePG');
           if ($('#<%=rblhigherendDatePGNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherendDatePG.ClientID%>', 'btnhigherendDatePG');
           if ($('#<%=rblhigherschoolNamePGNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherschoolNamePG.ClientID%>', 'btnhigherschoolNamePG');
           if ($('#<%=rblhigherQualificationtypePGNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherQualificationtypePG.ClientID%>', 'btnhigherQualificationtypePG');
           if ($('#<%=rblhigherstudymodePGNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherstudymodePG.ClientID%>', 'btnhigherstudymodePG');
           if ($('#<%=rblhigherlanguagePGNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherlanguagePG.ClientID%>', 'btnhigherlanguagePG');
           if ($('#<%=rblhighergradetypePGNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighergradetypePG.ClientID%>', 'btnhighergradetypePG');
           if ($('#<%=rblhighergradeachievedPGNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighergradeachievedPG.ClientID%>', 'btnhighergradeachievedPG');
           if ($('#<%=rblExpectedHigherDategradePGNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtExpectedHigherDategradePG.ClientID%>', 'btnExpectedhigherDategradePG');
           if ($('#<%=rblhigherverifyPGNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherverifyPG.ClientID%>', 'btnhigherverifyPG');
           if ($('#<%=rblhigherrelationPGNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherrelationPG.ClientID%>', 'btnhigherrelationPG');
           if ($('#<%=rblhighercontactEmailPGNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighercontactEmailPG.ClientID%>', 'btnhighercontactEmailPG');
           if ($('#<%=rblhighercontactMobilePGNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighercontactMobilePG.ClientID%>', 'btnhighercontactMobilePG');
           if ($('#<%=rblhigherCountryPhdNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherCountryPhd.ClientID%>', 'btnhigherCountryPhd');
           if ($('#<%=rblhigherstartDatePhdNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherstartDatePhd.ClientID%>', 'btnhigherstartDatePhd');
           if ($('#<%=rblhigherendDatePhdNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherendDatePhd.ClientID%>', 'btnhigherendDatePhd');
           if ($('#<%=rblhigherschoolNamePhdNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherschoolNamePhd.ClientID%>', 'btnhigherschoolNamePhd');
           if ($('#<%=rblhigherQualificationtypePhdNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherQualificationtypePhd.ClientID%>', 'btnhigherQualificationtypePhd');
           if ($('#<%=rblhigherstudymodePhdNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherstudymodePhd.ClientID%>', 'btnhigherstudymodePhd');
           if ($('#<%=rblhigherlanguagePhdNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherlanguagePhd.ClientID%>', 'btnhigherlanguagePhd');
           if ($('#<%=rblhighergradetypePhdNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighergradetypePhd.ClientID%>', 'btnhighergradetypePhd');
           if ($('#<%=rblhighergradeachievedPhdNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighergradeachievedPhd.ClientID%>', 'btnhighergradeachievedPhd');
           if ($('#<%=rblExpectedHigherDategradePhdNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtExpectedHigherDategradePhd.ClientID%>', 'btnExpectedhigherDategradePhd');
           if ($('#<%=rblhigherverifyPhdNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherverifyPhd.ClientID%>', 'btnhigherverifyPhd');
           if ($('#<%=rblhigherrelationPhdNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherrelationPhd.ClientID%>', 'btnhigherrelationPhd');
           if ($('#<%=rblhighercontactEmailPhdNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighercontactEmailPhd.ClientID%>', 'btnhighercontactEmailPhd');
           if ($('#<%=rblhighercontactMobilePhdNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighercontactMobilePhd.ClientID%>', 'btnhighercontactMobilePhd');
           if ($('#<%=rblhigherCountryOtherNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherCountryOther.ClientID%>', 'btnhigherCountryOther');
           if ($('#<%=rblhigherstartDateOtherNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherstartDateOther.ClientID%>', 'btnhigherstartDateOther');
           if ($('#<%=rblhigherendDateOtherNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherendDateOther.ClientID%>', 'btnhigherendDateOther');
           if ($('#<%=rblhigherschoolNameOtherNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherschoolNameOther.ClientID%>', 'btnhigherschoolNameOther');
           if ($('#<%=rblhigherQualificationtypeOtherNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherQualificationtypeOther.ClientID%>', 'btnhigherQualificationtypeOther');
           if ($('#<%=rblhigherstudymodeOtherNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherstudymodeOther.ClientID%>', 'btnhigherstudymodeOther');
           if ($('#<%=rblhigherlanguageOtherNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherlanguageOther.ClientID%>', 'btnhigherlanguageOther');
           if ($('#<%=rblhighergradetypeOtherNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighergradetypeOther.ClientID%>', 'btnhighergradetypeOther');
           if ($('#<%=rblhighergradeachievedOtherNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighergradeachievedOther.ClientID%>', 'btnhighergradeachievedOther');
           if ($('#<%=rblExpectedHigherDategradeOtherNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtExpectedHigherDategradeOther.ClientID%>', 'btnExpectedhigherDategradeOther');
           if ($('#<%=rblhigherverifyOtherNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherverifyOther.ClientID%>', 'btnhigherverifyOther');
           if ($('#<%=rblhigherrelationOtherNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthigherrelationOther.ClientID%>', 'btnhigherrelationOther');
           if ($('#<%=rblhighercontactEmailOtherNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighercontactEmailOther.ClientID%>', 'btnhighercontactEmailOther');
           if ($('#<%=rblhighercontactMobileOtherNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthighercontactMobileOther.ClientID%>', 'btnhighercontactMobileOther');

             <%    for (int n = 0; n < CustomControls.Count; n++)
        {
            string btnName = "ContentPlaceHolder1_btn" + CustomControls[n].customfieldid.ToString();
            string txtName = "ContentPlaceHolder1_txt" + CustomControls[n].customfieldid.ToString();
            string rblName = "ContentPlaceHolder1_rblNo" + CustomControls[n].customfieldid.ToString();
        %>

            $("#<%=btnName%>").click(function () {
                ManageRemarks('<%=txtName%>', '<%=btnName%>');
            });
            $("#<%=rblName%>").click(function () {
                ManageRemarks('<%=txtName%>', '<%=btnName%>');
            });
            if ($('#<%=rblName%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtName%>', '<%=btnName%>');

         <%  }%>
            function ManageRemarks(cntrol1, control2) {
                if ($("#" + cntrol1 + "").is(':hidden')) {
                    $("#" + cntrol1 + "").css('display', 'block');
                    $("#" + control2 + "").prop('value', 'Hide Comments');
                    // $("#btnTwitter").html("Hide Comments");
                }
                else {
                    $("#" + cntrol1 + "").css('display', 'none');
                    // $("#btnTwitter").html("Add Comments")
                    $("#" + control2 + "").prop('value', 'Add Comments');
                }
            }
 function ManageRemarksIfNoCheked(cntrol, control2) {
                $("#" + cntrol + "").css('display', 'block');
                $("#" + control2 + "").prop('value', 'Hide Comments');
            }
        });</script>
</asp:Content>
