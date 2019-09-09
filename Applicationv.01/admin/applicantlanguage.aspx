<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantlanguage.aspx.cs" Inherits="admin_applicantlanguage" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item active">Applicant Language details</li>
        </ol>
        <h1 class="h2">Applicant Language details</h1>
        <div class="card">
            <div class="list-group list-group-fit">

                <div class="list-group-item" id="homelanguage" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-homelanguage">
                        <div class="form-row">
                            <label id="labelhomelanguage" runat="server" for="homelanguage" class="col-md-3 col-form-label form-label">What language do you speak at home</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblhomelanguage" runat="server"></asp:Label>
                                <asp:RadioButton ID="rblhomelanguageYes" GroupName="homelanguage" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblhomelanguageNo" GroupName="homelanguage" Text="No" runat="server" />
                                <span class="helpicon"><i id="ichomelanguage" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnhomelanguage" />
                                <input id="txthomelanguage" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="EnglishBackground" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-EnglishBackground">
                        <div class="form-row">
                            <label id="labelEnglishBackground" runat="server" for="EnglishBackground" class="col-md-3 col-form-label form-label">Have you studied an English Language Intensive Course for students from non-English speaking backgrounds</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblEnglishBackground" runat="server"></asp:Label>
                                <asp:RadioButton ID="rblEnglishBackgroundYes" GroupName="EnglishBackground" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblEnglishBackgroundNo" GroupName="EnglishBackground" Text="No" runat="server" />
                                <span class="helpicon"><i id="icEnglishBackground" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnEnglishBackground" />
                                <input id="txtEnglishBackground" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="BackgroundfieldContainer" runat="server" style="display: none;">

                    <div class="list-group-item" id="Language" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-Language">
                            <div class="form-row">
                                <label id="labelLanguage" runat="server" for="Language" class="col-md-3 col-form-label form-label">Country of English Language Intensive Course</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblLanguage" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblLanguageYes" GroupName="Language" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblLanguageNo" GroupName="Language" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icLanguage" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnLanguage" />
                                    <input id="txtLanguage" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="YearCompletion" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-YearCompletion">
                            <div class="form-row">
                                <label id="labelYearCompletion" runat="server" for="YearCompletion" class="col-md-3 col-form-label form-label">Year of Completion/Expected </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblYearCompletion" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblYearCompletionYes" GroupName="YearCompletion" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblYearCompletionNo" GroupName="YearCompletion" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icYearCompletion" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnYearCompletion" />
                                    <input id="txtYearCompletion" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="NameCollege" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-NameCollege">
                            <div class="form-row">
                                <label id="labelNameCollege" runat="server" for="NameCollege" class="col-md-3 col-form-label form-label">Name of College or University</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblNameCollege" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblNameCollegeYes" GroupName="NameCollege" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblNameCollegeNo" GroupName="NameCollege" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icNameCollege" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnNameCollege" />
                                    <input id="txtNameCollege" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="studymode" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-studymode">
                            <div class="form-row">
                                <label id="labelstudymode" runat="server" for="studymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblstudymode" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblstudymodeYes" GroupName="studymode" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblstudymodeNo" GroupName="studymode" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icstudymode" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnstudymode" />
                                    <input id="txtstudymode" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="QualificationType" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-QualificationType">
                            <div class="form-row">
                                <label id="labelQualificationType" runat="server" for="QualificationType" class="col-md-3 col-form-label form-label">Qualification Type</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblQualificationType" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblQualificationTypeYes" GroupName="QualificationType" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblQualificationTypeNo" GroupName="QualificationType" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icQualificationType" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnQualificationType" />
                                    <input id="txtQualificationType" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="QualificationName" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-QualificationName">
                            <div class="form-row">
                                <label id="labelQualificationName" runat="server" for="QualificationName" class="col-md-3 col-form-label form-label">Qualification Name</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblQualificationName" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblQualificationNameYes" GroupName="QualificationName" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblQualificationNameNo" GroupName="QualificationName" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icQualificationName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnQualificationName" />
                                    <input id="txtQualificationName" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
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
                                    <asp:RadioButton ID="rblgradetypeYes" GroupName="gradetype" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblgradetypeNo" GroupName="gradetype" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icgradetype" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btngradetype" />
                                    <input id="txtgradetype" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="gradeachieved" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-gradeachieved">
                            <div class="form-row">
                                <label id="labelgradeachieved" runat="server" for="gradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblgradeachieved" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblgradeachievedYes" GroupName="gradeachieved" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblgradeachievedNo" GroupName="gradeachieved" Text="No" runat="server" />

                                    <span class="helpicon"><i id="icgradeachieved" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btngradeachieved" />
                                    <input id="txtgradeachieved" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="ExpectedDategrade" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedDategrade">
                            <div class="form-row">
                                <label id="labelExpectedDategrade" runat="server" for="EnglishCourse" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblExpectedDategrade" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblExpectedDategradeYes" GroupName="ExpectedDategrade" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblExpectedDategradeNo" GroupName="ExpectedDategrade" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icExpectedDategrade" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnExpectedDategrade" />
                                    <input id="txtExpectedDategrade" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="list-group-item" id="EnglishTest" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-EnglishTest">
                        <div class="form-row">
                            <label id="labelEnglishTest" runat="server" for="EnglishTest" class="col-md-3 col-form-label form-label">Have you sat any one of the following English Language competency tests</label>
                            <div class="col-md-4">
                                <asp:Label ID="lblEnglishTest" runat="server"></asp:Label>
                                <asp:RadioButton ID="rblEnglishTestYes" GroupName="EnglishTest" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblEnglishTestNo" GroupName="EnglishTest" Text="No" runat="server" />
                                <span class="helpicon"><i id="icEnglishTest" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnEnglishTest" />
                                <input id="txtEnglishTest" runat="server" style="display: none" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="list-group-item" id="testName" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-testName">
                            <div class="form-row">
                                <label id="labeltestName" runat="server" for="testName" class="col-md-3 col-form-label form-label">Test Name </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lbltestName" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rbltestNameYes" GroupName="testName" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rbltestNameNo" GroupName="testName" Text="No" runat="server" />
                                    <span class="helpicon"><i id="ictestName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btntestName" />
                                    <input id="txttestName" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                <div id="ieltsfieldContainer" runat="server" visible="false">
                   
                    <div class="list-group-item" id="CandidateID" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-CandidateID">
                            <div class="form-row">
                                <label id="labelCandidateID" runat="server" for="CandidateID" class="col-md-3 col-form-label form-label">Candidate ID </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblCandidateID" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblCandidateIDYes" GroupName="CandidateID" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblCandidateIDNo" GroupName="CandidateID" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icCandidateID" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnCandidateID" />
                                    <input id="txtCandidateID" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="CandidateNo" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-CandidateNo">
                            <div class="form-row">
                                <label id="labelCandidateNo" runat="server" for="CandidateNo" class="col-md-3 col-form-label form-label">Candidate No </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblCandidateNo" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblCandidateNoYes" GroupName="CandidateNo" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblCandidateNoNo" GroupName="CandidateNo" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icCandidateNo" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnCandidateNo" />
                                    <input id="txtCandidateNo" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="ieltsTestDate" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-ieltsTestDate">
                            <div class="form-row">
                                <label id="labelieltsTestDate" runat="server" for="ieltsTestDate" class="col-md-3 col-form-label form-label">Test Date</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblieltsTestDate" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblieltsTestDateYes" GroupName="ieltsTestDate" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblieltsTestDateNo" GroupName="ieltsTestDate" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icieltsTestDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnieltsTestDate" />
                                    <input id="txtieltsTestDate" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="CentreNo" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-CentreNo">
                            <div class="form-row">
                                <label id="labelCentreNo" runat="server" for="testName" class="col-md-3 col-form-label form-label">Test Centre No </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblCentreNo" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblCentreNoYes" GroupName="CentreNo" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblCentreNoNo" GroupName="CentreNo" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icCenterno" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnCentreNo" />
                                    <input id="txtCentreNo" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="list-group-item" id="ReadingScore" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-ReadingScore">
                            <div class="form-row">
                                <label id="labelReadingScore" runat="server" for="ReadingScore" class="col-md-3 col-form-label form-label">Reading Score</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblReadingScore" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblReadingScoreYes" GroupName="ReadingScoreIelt" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblReadingScoreNo" GroupName="ReadingScoreIelt" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icReadingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnReadingScore" />
                                    <input id="txtReadingScore" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="ListeningScore" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-ListeningScore">
                            <div class="form-row">
                                <label id="labelListeningScore" runat="server" for="ListeningScore" class="col-md-3 col-form-label form-label">Listening Score</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblListeningScore" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblListeningScoreYes" GroupName="ListeningScoreIlet" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblListeningScoreNo" GroupName="ListeningScoreIlet" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icListeningScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnListeningScore" />
                                    <input id="txtListeningScore" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="SpeakingScore" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-SpeakingScore">
                            <div class="form-row">
                                <label id="labelSpeakingScore" runat="server" for="SpeakingScore" class="col-md-3 col-form-label form-label">Speaking Score</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSpeakingScore" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblSpeakingScoreYes" GroupName="SpeakingScoreIlet" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblSpeakingScoreNo" GroupName="SpeakingScoreIlet" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icSpeakingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnSpeakingScore" />
                                    <input id="txtSpeakingScore" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="WritingScore" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-WritingScore">
                            <div class="form-row">
                                <label id="labelWritingScore" runat="server" for="WritingScore" class="col-md-3 col-form-label form-label">Writing Score</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblWritingScore" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblWritingScoreYes" GroupName="WritingScoreIlet" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblWritingScoreNo" GroupName="WritingScoreIlet" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icWritingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnWritingScore" />
                                    <input id="txtWritingScore" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="LanguageScore" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-LanguageScore">
                            <div class="form-row">
                                <label id="labelLanguageScore" runat="server" for="LanguageScore" class="col-md-3 col-form-label form-label">Total Score</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblLanguageScore" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblLanguageScoreYes" GroupName="LanguageScore" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblLanguageScoreNo" GroupName="LanguageScore" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icLanguageScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnLanguageScore" />
                                    <input id="txtLanguageScore" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="ptefieldContainer" runat="server" visible="false">
                    <div class="list-group-item" id="ptetesttaker" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-ptetesttaker">
                            <div class="form-row">
                                <label id="labelptetesttaker" runat="server" for="ptetesttaker" class="col-md-3 col-form-label form-label">Test Taker ID</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblptetesttaker" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblptetesttakerYes" GroupName="ptetesttaker" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblptetesttakerNo" GroupName="ptetesttaker" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icpteTesttaker" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnptetesttaker" />
                                    <input id="txtptetesttaker" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="pteregistrationno" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-pteregistrationno">
                            <div class="form-row">
                                <label id="labelpteregistrationno" runat="server" for="pteregistrationno" class="col-md-3 col-form-label form-label">Registration Number </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblpteregistrationno" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblpteregistrationnoYes" GroupName="pteregistrationno" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblpteregistrationnoNo" GroupName="pteregistrationno" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icpteregistrationno" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnpteregistrationno" />
                                    <input id="txtpteregistrationno" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="pteTestDate" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-pteTestDate">
                            <div class="form-row">
                                <label id="labelpteTestDate" runat="server" for="pteTestDate" class="col-md-3 col-form-label form-label">Test Date</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblpteTestDate" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblpteTestDateYes" GroupName="pteTestDate" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblpteTestDateNo" GroupName="pteTestDate" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icpteTestDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnpteTestDate" />
                                    <input id="txtpteTestDate" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="ptecentercountry" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-ptecentercountry">
                            <div class="form-row">
                                <label id="labelptecentercountry" runat="server" for="ptecentercountry" class="col-md-3 col-form-label form-label">Test Center Country</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblptecentercountry" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblptecentercountryYes" GroupName="ptecentercountry" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblptecentercountryNo" GroupName="ptecentercountry" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icptecountryt" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnptecentercountry" />
                                    <input id="txtptecentercountry" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="ptetestcenterNo" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-ptetestcenterNo">
                            <div class="form-row">
                                <label id="labelptetestcenterNo" runat="server" for="ptetestcenterNo" class="col-md-3 col-form-label form-label">Test Centre No </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblptetestcenterNo" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblptetestcenterNoYes" GroupName="ptetestcenterNo" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblptetestcenterNoNo" GroupName="ptetestcenterNo" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icptetestcenterNo" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnptetestcenterNo" />
                                    <input id="txtptetestcenterNo" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="list-group-item" id="pteReadingScore" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-pteReadingScore">
                            <div class="form-row">
                                <label id="labelpteReadingScore" runat="server" for="pteReadingScore" class="col-md-3 col-form-label form-label">Reading Score</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblpteReadingScore" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblpteReadingScoreYes" GroupName="pteReadingScore" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblpteReadingScoreNo" GroupName="pteReadingScore" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icpteReadingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnpteReadingScore" />
                                    <input id="txtpteReadingScore" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="pteListeningScore" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-pteListeningScore">
                            <div class="form-row">
                                <label id="labelpteListeningScore" runat="server" for="pteListeningScore" class="col-md-3 col-form-label form-label">Listening Score</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblpteListeningScore" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblpteListeningScoreYes" GroupName="pteListeningScore" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblpteListeningScoreNo" GroupName="pteListeningScore" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icpteListeningScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnpteListeningScore" />
                                    <input id="txtpteListeningScore" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="pteSpeakingScore" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-pteSpeakingScore">
                            <div class="form-row">
                                <label id="labelpteSpeakingScore" runat="server" for="pteSpeakingScore" class="col-md-3 col-form-label form-label">Speaking Score</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblpteSpeakingScore" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblpteSpeakingScoreYes" GroupName="pteSpeakingScore" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblpteSpeakingScoreNo" GroupName="pteSpeakingScore" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icpteSpeakingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnpteSpeakingScore" />
                                    <input id="txtpteSpeakingScore" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="pteWritingScore" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-pteWritingScore">
                            <div class="form-row">
                                <label id="labelpteWritingScore" runat="server" for="pteWritingScore" class="col-md-3 col-form-label form-label">Writing Score</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblpteWritingScore" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblpteWritingScoreYes" GroupName="pteWritingScore" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblpteWritingScoreNo" GroupName="pteWritingScore" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icpteWritingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnpteWritingScore" />
                                    <input id="txtpteWritingScore" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="pteTotalScore" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-pteTotalScore">
                            <div class="form-row">
                                <label id="labelpteTotalScore" runat="server" for="pteTotalScore" class="col-md-3 col-form-label form-label">Total Score</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblpteTotalScore" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rblpteTotalScoreYes" GroupName="pteTotalScore" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblpteTotalScoreNo" GroupName="pteTotalScore" Text="No" runat="server" />
                                    <span class="helpicon"><i id="icpteTotalScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btnpteTotalScore" />
                                    <input id="txtpteTotalScore" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="tofelfieldContainer" runat="server" visible="false">

                    <div class="list-group-item" id="tofelregistrationno" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-tofelregistrationno">
                            <div class="form-row">
                                <label id="labeltofelregistrationno" runat="server" for="tofelregistrationno" class="col-md-3 col-form-label form-label">Registration Number </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lbltofelregistrationno" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rbltofelregistrationnoYes" GroupName="tofelregistrationno" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rbltofelregistrationnoNo" GroupName="tofelregistrationno" Text="No" runat="server" />
                                    <span class="helpicon"><i id="ictofelregistrationno" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btntofelregistrationno" />
                                    <input id="txttofelregistrationno" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="tofelTestDate" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-tofelTestDate">
                            <div class="form-row">
                                <label id="labeltofelTestDate" runat="server" for="tofelTestDate" class="col-md-3 col-form-label form-label">Test Date</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lbltofelTestDate" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rbltofelTestDateYes" GroupName="tofelTestDate" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rbltofelTestDateNo" GroupName="tofelTestDate" Text="No" runat="server" />
                                    <span class="helpicon"><i id="ictofelTestDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btntofelTestDate" />
                                    <input id="txttofelTestDate" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="tofelcentercountry" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-tofelcentercountry">
                            <div class="form-row">
                                <label id="labeltofelcentercountry" runat="server" for="tofelcentercountry" class="col-md-3 col-form-label form-label">Test Center Country</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lbltofelcentercountry" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rbltofelcentercountryYes" GroupName="tofelcentercountry" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rbltofelcentercountryNo" GroupName="tofelcentercountry" Text="No" runat="server" />
                                    <span class="helpicon"><i id="ictofelcentercountry" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btntofelcentercountry" />
                                    <input id="txttofelcentercountry" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="tofelcenterNo" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-tofelcenterNo">
                            <div class="form-row">
                                <label id="labeltofelcenterNo" runat="server" for="tofelcenterNo" class="col-md-3 col-form-label form-label">Test Centre No </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lbltofelcenterNo" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rbltofelcenterNoYes" GroupName="tofelcenterNo" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rbltofelcenterNo" GroupName="tofelcenterNo" Text="No" runat="server" />
                                    <span class="helpicon"><i id="itofelcenterNo" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btntofelcenterNo" />
                                    <input id="txttofelcenterNo" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="list-group-item" id="tofelReadingScore" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-tofelReadingScore">
                            <div class="form-row">
                                <label id="labeltofelReadingScore" runat="server" for="tofelReadingScore" class="col-md-3 col-form-label form-label">Reading Score</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lbltofelReadingScore" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rbltofelReadingScoreYes" GroupName="countryIssue" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rbltofelReadingScoreNo" GroupName="countryIssue" Text="No" runat="server" />
                                    <span class="helpicon"><i id="ictofelReadingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btntofelReadingScore" />
                                    <input id="txttofelReadingScore" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="tofelListeningScore" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-tofelListeningScore">
                            <div class="form-row">
                                <label id="labeltofelListeningScore" runat="server" for="tofelListeningScore" class="col-md-3 col-form-label form-label">Listening Score</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lbltofelListeningScore" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rbltofelListeningScoreYes" GroupName="tofelListeningScore" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rbltofelListeningScoreNo" GroupName="tofelListeningScore" Text="No" runat="server" />
                                    <span class="helpicon"><i id="ictofelListeningScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btntofelListeningScore" />
                                    <input id="txttofelListeningScore" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="tofelSpeakingScore" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-tofelSpeakingScore">
                            <div class="form-row">
                                <label id="labeltofelSpeakingScore" runat="server" for="tofelSpeakingScore" class="col-md-3 col-form-label form-label">Speaking Score</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lbltofelSpeakingScore" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rbltofelSpeakingScoreYes" GroupName="tofelSpeakingScore" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rbltofelSpeakingScoreNo" GroupName="tofelSpeakingScore" Text="No" runat="server" />
                                    <span class="helpicon"><i id="ictofelSpeakingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btntofelSpeakingScore" />
                                    <input id="txttofelSpeakingScore" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="tofelWritingScore" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-tofelWritingScore">
                            <div class="form-row">
                                <label id="labeltofelWritingScore" runat="server" for="tofelWritingScore" class="col-md-3 col-form-label form-label">Writing Score</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lbltofelWritingScore" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rbltofelWritingScoreYes" GroupName="tofelWritingScore" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rbltofelWritingScoreNo" GroupName="tofelWritingScore" Text="No" runat="server" />
                                    <span class="helpicon"><i id="ictofelWritingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btntofelWritingScore" />
                                    <input id="txttofelWritingScore" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="tofelTotalScore" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-tofelTotalScore">
                            <div class="form-row">
                                <label id="labeltofelTotalScore" runat="server" for="tofelTotalScore" class="col-md-3 col-form-label form-label">Total Score</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lbltofelTotalScore" runat="server"></asp:Label>
                                    <asp:RadioButton ID="rbltofelTotalScoreYes" GroupName="tofelTotalScore" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rbltofelTotalScoreNo" GroupName="tofelTotalScore" Text="No" runat="server" />
                                    <span class="helpicon"><i id="ictofelTotalScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                </div>
                                <div class="col-md-4">
                                    <input type="button" value="Add Remarks" id="btntofelTotalScore" />
                                    <input id="txttofelTotalScore" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="CEFR" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-CEFR">
                        <div class="form-row">
                            <label id="labelCEFR" runat="server" for="CEFR" class="col-md-3 col-form-label form-label">CEFR Level </label>
                            <div class="col-md-4">
                                <asp:Label ID="lblCEFR" runat="server"></asp:Label>
                                <asp:RadioButton ID="rblCEFRYes" GroupName="CEFR" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblCEFRNo" GroupName="CEFR" Text="No" runat="server" />
                                <span class="helpicon"><i id="icCEFR" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btnCEFR" />
                                <input id="txtCEFR" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="list-group-item" id="testRefno" runat="server" style="display: none">
                    <div class="form-group m-0" role="group" aria-labelledby="label-testRefno">
                        <div class="form-row">
                            <label id="labeltestRefno" runat="server" for="testRefno" class="col-md-3 col-form-label form-label">Test Report Reference No </label>
                            <div class="col-md-4">
                                <asp:Label ID="lbltestRefno" runat="server"></asp:Label>
                                <asp:RadioButton ID="rbltestRefnoYes" GroupName="testRefno" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rbltestRefnoNo" GroupName="testRefno" Text="No" runat="server" />
                                <span class="helpicon"><i id="ictestRefno" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                            </div>
                            <div class="col-md-4">
                                <input type="button" value="Add Remarks" id="btntestRefno" />
                                <input id="txttestRefno" style="display: none" runat="server" type="text" class="form-control" placeholder="Admin Comments">
                            </div>
                        </div>
                    </div>
                </div>
                <div id="mainDiv" runat="server"></div>
                <div class="list-group-item" id="employerwebsite">
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
            $("#btnhomelanguage").click(function () {
                ManageRemarks('<%=txthomelanguage.ClientID%>', 'btnhomelanguage');
            });
            $("#<%=rblhomelanguageNo.ClientID%>").click(function () {
                ManageRemarks('<%=txthomelanguage.ClientID%>', 'btnhomelanguage');
            });
            $("#btnEnglishBackground").click(function () {
                ManageRemarks('<%=txtEnglishBackground.ClientID%>', 'btnEnglishBackground');
            });
            $("#<%=rblEnglishBackgroundNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtEnglishBackground.ClientID%>', 'btnEnglishBackground');
            });
            $("#btnLanguage").click(function () {
                ManageRemarks('<%=txtLanguage.ClientID%>', 'btnLanguage');
            });
            $("#<%=rblLanguageNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtLanguage.ClientID%>', 'btnLanguage');
            });

            $("#btnYearCompletion").click(function () {
                ManageRemarks('<%=txtYearCompletion.ClientID%>', 'btnYearCompletion');
            });
            $("#<%=rblYearCompletionNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtYearCompletion.ClientID%>', 'btnYearCompletion');
            });
            $("#btnNameCollege").click(function () {
                ManageRemarks('<%=txtNameCollege.ClientID%>', 'btnNameCollege');
            });
            $("#<%=rblNameCollegeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtNameCollege.ClientID%>', 'btnNameCollege');
            });
            $("#btnstudymode").click(function () {
                ManageRemarks('<%=txtstudymode.ClientID%>', 'btnstudymode');
            });
            $("#<%=rblstudymodeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtstudymode.ClientID%>', 'btnstudymode');
            });
            $("#btnQualificationType").click(function () {
                ManageRemarks('<%=txtQualificationType.ClientID%>', 'btnQualificationType');
            });
            $("#<%=rblQualificationTypeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtQualificationType.ClientID%>', 'btnQualificationType');
            });
            $("#btnQualificationName").click(function () {
                ManageRemarks('<%=txtQualificationName.ClientID%>', 'btnQualificationName');
            });
            $("#<%=rblQualificationNameNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtQualificationName.ClientID%>', 'btnQualificationName');
            });
            $("#btngradetype").click(function () {
                ManageRemarks('<%=txtgradetype.ClientID%>', 'btngradetype');
            });
            $("#<%=rblgradetypeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtgradetype.ClientID%>', 'btngradetype');
            });
            $("#btngradeachieved").click(function () {
                ManageRemarks('<%=txtgradeachieved.ClientID%>', 'btngradeachieved');
            });
            $("#<%=rblgradeachievedNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtgradeachieved.ClientID%>', 'btngradeachieved');
            });
            $("#btnExpectedDategrade").click(function () {
                ManageRemarks('<%=txtExpectedDategrade.ClientID%>', 'btnExpectedDategrade');
            });
            $("#<%=rblExpectedDategradeNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtExpectedDategrade.ClientID%>', 'btnExpectedDategrade');
            });
            $("#btnEnglishTest").click(function () {
                ManageRemarks('<%=txtEnglishTest.ClientID%>', 'btnEnglishTest');
            });
            $("#<%=rblEnglishTestNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtEnglishTest.ClientID%>', 'btnEnglishTest');
            });
            $("#btntestName").click(function () {
                ManageRemarks('<%=txttestName.ClientID%>', 'btntestName');
            });
            $("#<%=rbltestNameNo.ClientID%>").click(function () {
                ManageRemarks('<%=txttestName.ClientID%>', 'btntestName');
            });
            $("#btnCandidateID").click(function () {
                ManageRemarks('<%=txtCandidateID.ClientID%>', 'btnCandidateID');
            });
            $("#<%=rblCandidateIDNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtCandidateID.ClientID%>', 'btnCandidateID');
            });
            $("#btnChineseCode").click(function () {
                ManageRemarks('<%=txtCandidateNo.ClientID%>', 'btnCandidateNo');
            });
            $("#<%=rblCandidateNoNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtCandidateNo.ClientID%>', 'btnCandidateNo');
            });
            $("#btnieltsTestDate").click(function () {
                ManageRemarks('<%=txtieltsTestDate.ClientID%>', 'btnieltsTestDate');
            });
            $("#<%=rblieltsTestDateNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtieltsTestDate.ClientID%>', 'btnieltsTestDate');
            });
            $("#btnCentreNo").click(function () {
                ManageRemarks('<%=txtCentreNo.ClientID%>', 'btnCentreNo');
            });
            $("#<%=rblCentreNoNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtCentreNo.ClientID%>', 'btnCentreNo');
            });


            $("#btnReadingScore").click(function () {
                ManageRemarks('<%=txtReadingScore.ClientID%>', 'btnReadingScore');
            });
            $("#<%=rblReadingScoreNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtReadingScore.ClientID%>', 'btnReadingScore');
            });
            $("#btnWritingScore").click(function () {
                ManageRemarks('<%=txtWritingScore.ClientID%>', 'btnWritingScore');
            });
            $("#<%=rblWritingScoreNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtWritingScore.ClientID%>', 'btnWritingScore');
            });
            $("#btnListeningScore").click(function () {
                ManageRemarks('<%=txtListeningScore.ClientID%>', 'btnListeningScore');
            });
            $("#<%=rblListeningScoreNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtListeningScore.ClientID%>', 'btnListeningScore');
            });
            $("#btnSpeakingScore").click(function () {
                ManageRemarks('<%=txtSpeakingScore.ClientID%>', 'btnSpeakingScore');
            });
            $("#<%=rblSpeakingScoreNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtSpeakingScore.ClientID%>', 'btnSpeakingScore');
            });
            $("#btnLanguageScore").click(function () {
                ManageRemarks('<%=txtLanguageScore.ClientID%>', 'btnLanguageScore');
            });
            $("#<%=rblLanguageScoreNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtLanguageScore.ClientID%>', 'btnLanguageScore');
            });
            $("#btnptetesttaker").click(function () {
                ManageRemarks('<%=txtptetesttaker.ClientID%>', 'btnptetesttaker');
            });
            $("#<%=rblptetesttakerNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtptetesttaker.ClientID%>', 'btnptetesttaker');
            });


            $("#btnpteregistrationno").click(function () {
                ManageRemarks('<%=txtpteregistrationno.ClientID%>', 'btnpteregistrationno');
            });
            $("#<%=rblpteregistrationnoNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtpteregistrationno.ClientID%>', 'btnpteregistrationno');
            });
            $("#btnpteTestDate").click(function () {
                ManageRemarks('<%=txtpteTestDate.ClientID%>', 'btnpteTestDate');
            });
            $("#<%=rblpteTestDateNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtpteTestDate.ClientID%>', 'btnpteTestDate');
            });
            $("#btnptecentercountry").click(function () {
                ManageRemarks('<%=txtptecentercountry.ClientID%>', 'btnptecentercountry');
            });
            $("#<%=rblptecentercountryNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtptecentercountry.ClientID%>', 'btnptecentercountry');
            });

            $("#btnptetestcenterNo").click(function () {
                ManageRemarks('<%=txtptetestcenterNo.ClientID%>', 'btnptetestcenterNo');
            });
            $("#<%=rblptetestcenterNoNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtptetestcenterNo.ClientID%>', 'btnptetestcenterNo');
            });
            $("#btnpteReadingScore").click(function () {
                ManageRemarks('<%=txtpteReadingScore.ClientID%>', 'btnpteReadingScore');
            });
            $("#<%=rblpteReadingScoreNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtpteReadingScore.ClientID%>', 'btnpteReadingScore');
            });
            $("#btnpteListeningScore").click(function () {
                ManageRemarks('<%=txtpteListeningScore.ClientID%>', 'btnpteListeningScore');
            });
            $("#<%=rblpteListeningScoreNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtpteListeningScore.ClientID%>', 'btnpteListeningScore');
            });
            $("#btnpteWritingScore").click(function () {
                ManageRemarks('<%=txtpteWritingScore.ClientID%>', 'btnpteWritingScore');
            });
            $("#<%=rblpteWritingScoreNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtpteWritingScore.ClientID%>', 'btnpteWritingScore');
            });
            $("#btnpteSpeakingScore").click(function () {
                ManageRemarks('<%=txtpteSpeakingScore.ClientID%>', 'btnpteSpeakingScore');
            });
            $("#<%=rblpteSpeakingScoreNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtpteSpeakingScore.ClientID%>', 'btnpteSpeakingScore');
            });
            $("#btnpteTotalScore").click(function () {
                ManageRemarks('<%=txtpteTotalScore.ClientID%>', 'btnpteTotalScore');
            });
            $("#<%=rblpteTotalScoreNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtpteTotalScore.ClientID%>', 'btnpteTotalScore');
            });
            $("#btntofelregistrationno").click(function () {
                ManageRemarks('<%=txttofelregistrationno.ClientID%>', 'btntofelregistrationno');
            });
            $("#<%=rbltofelregistrationnoNo.ClientID%>").click(function () {
                ManageRemarks('<%=txttofelregistrationno.ClientID%>', 'btntofelregistrationno');
            });
            $("#btntofelTestDate").click(function () {
                ManageRemarks('<%=txttofelTestDate.ClientID%>', 'btntofelTestDate');
            });
            $("#<%=rbltofelTestDateNo.ClientID%>").click(function () {
                ManageRemarks('<%=txttofelTestDate.ClientID%>', 'btntofelTestDate');
            });
            $("#btntofelcentercountry").click(function () {
                ManageRemarks('<%=txttofelcentercountry.ClientID%>', 'btntofelcentercountry');
            });
            $("#<%=rbltofelcentercountryNo.ClientID%>").click(function () {
                ManageRemarks('<%=txttofelcentercountry.ClientID%>', 'btntofelcentercountry');
            });
            $("#btntofelcenterNo").click(function () {
                ManageRemarks('<%=txttofelcenterNo.ClientID%>', 'btntofelcenterNo');
            });
            $("#<%=rbltofelcenterNo.ClientID%>").click(function () {
                ManageRemarks('<%=txttofelcenterNo.ClientID%>', 'btntofelcenterNo');
            });
            $("#btntofelReadingScore").click(function () {
                ManageRemarks('<%=txttofelReadingScore.ClientID%>', 'btntofelReadingScore');
            });
            $("#<%=rbltofelReadingScoreNo.ClientID%>").click(function () {
                ManageRemarks('<%=txttofelReadingScore.ClientID%>', 'btntofelReadingScore');
            });
            $("#btntofelListeningScore").click(function () {
                ManageRemarks('<%=txttofelListeningScore.ClientID%>', 'btntofelListeningScore');
            });
            $("#<%=rbltofelListeningScoreNo.ClientID%>").click(function () {
                ManageRemarks('<%=txttofelListeningScore.ClientID%>', 'btntofelListeningScore');
            });
            $("#btntofelSpeakingScore").click(function () {
                ManageRemarks('<%=txttofelSpeakingScore.ClientID%>', 'btntofelSpeakingScore');
            });
            $("#<%=rbltofelSpeakingScoreNo.ClientID%>").click(function () {
                ManageRemarks('<%=txttofelSpeakingScore.ClientID%>', 'btntofelSpeakingScore');
            });
            $("#btntofelWritingScore").click(function () {
                ManageRemarks('<%=txttofelWritingScore.ClientID%>', 'btntofelWritingScore');
            });
            $("#<%=rbltofelWritingScoreNo.ClientID%>").click(function () {
                ManageRemarks('<%=txttofelWritingScore.ClientID%>', 'btntofelWritingScore');
            });

             $("#btntofelTotalScore").click(function () {
                ManageRemarks('<%=txttofelTotalScore.ClientID%>', 'btntofelTotalScore');
            });
            $("#<%=rbltofelTotalScoreNo.ClientID%>").click(function () {
                ManageRemarks('<%=txttofelTotalScore.ClientID%>', 'btntofelTotalScore');
            }); $("#btnCEFR").click(function () {
                ManageRemarks('<%=txtCEFR.ClientID%>', 'btnCEFR');
            });
            $("#<%=rblCEFRNo.ClientID%>").click(function () {
                ManageRemarks('<%=txtCEFR.ClientID%>', 'btnCEFR');
            }); $("#btntestRefno").click(function () {
                ManageRemarks('<%=txttestRefno.ClientID%>', 'btntestRefno');
            });
            $("#<%=rbltestRefnoNo.ClientID%>").click(function () {
                ManageRemarks('<%=txttestRefno.ClientID%>', 'btntestRefno');
            });
            if ($('#<%=rblhomelanguageNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txthomelanguage.ClientID%>', 'btnhomelanguage');
           if ($('#<%=rblEnglishBackgroundNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtEnglishBackground.ClientID%>', 'btnEnglishBackground');
           if ($('#<%=rblLanguageNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtLanguage.ClientID%>', 'btnLanguage');
           if ($('#<%=rblYearCompletionNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtYearCompletion.ClientID%>', 'btnYearCompletion');
           if ($('#<%=rblNameCollegeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtNameCollege.ClientID%>', 'btnNameCollege');
           if ($('#<%=rblstudymodeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtstudymode.ClientID%>', 'btnstudymode');
           if ($('#<%=rblQualificationTypeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtQualificationType.ClientID%>', 'btnQualificationType');
           if ($('#<%=rblQualificationNameNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtQualificationName.ClientID%>', 'btnQualificationName');
           if ($('#<%=rblgradetypeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtgradetype.ClientID%>', 'btngradetype');
           if ($('#<%=rblgradeachievedNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtgradeachieved.ClientID%>', 'btngradeachieved');
           if ($('#<%=rblExpectedDategradeNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtExpectedDategrade.ClientID%>', 'btnExpectedDategrade');
           if ($('#<%=rblEnglishTestNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtEnglishTest.ClientID%>', 'btnEnglishTest');
           if ($('#<%=rbltestNameNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txttestName.ClientID%>', 'btntestName');
           if ($('#<%=rblCandidateIDNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtCandidateID.ClientID%>', 'btnCandidateID');
           if ($('#<%=rblCandidateNoNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtCandidateNo.ClientID%>', 'btnCandidateNo');
           if ($('#<%=rblieltsTestDateNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtieltsTestDate.ClientID%>', 'btnieltsTestDate');
           if ($('#<%=rblCentreNoNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtCentreNo.ClientID%>', 'btnCentreNo');
           if ($('#<%=rblReadingScoreNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtReadingScore.ClientID%>', 'btnReadingScore');
           if ($('#<%=rblWritingScoreNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtWritingScore.ClientID%>', 'btnWritingScore');
           if ($('#<%=rblListeningScoreNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtListeningScore.ClientID%>', 'btnListeningScore');
           if ($('#<%=rblSpeakingScoreNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtSpeakingScore.ClientID%>', 'btnSpeakingScore');
           if ($('#<%=rblLanguageScoreNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtLanguageScore.ClientID%>', 'btnLanguageScore');
           if ($('#<%=rblptetesttakerNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtptetesttaker.ClientID%>', 'btnptetesttaker');
           if ($('#<%=rblpteregistrationnoNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtpteregistrationno.ClientID%>', 'btnpteregistrationno');
           if ($('#<%=rblpteTestDateNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtpteTestDate.ClientID%>', 'btnpteTestDate');
           if ($('#<%=rblptecentercountryNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtptecentercountry.ClientID%>', 'btnptecentercountry');
           if ($('#<%=rblptetestcenterNoNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtptetestcenterNo.ClientID%>', 'btnptetestcenterNo');
           if ($('#<%=rblpteReadingScoreNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtpteReadingScore.ClientID%>', 'btnpteReadingScore');
           if ($('#<%=rblpteListeningScoreNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtpteListeningScore.ClientID%>', 'btnpteListeningScore');
           if ($('#<%=rblpteWritingScoreNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtpteWritingScore.ClientID%>', 'btnpteWritingScore');
           if ($('#<%=rblpteSpeakingScoreNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtpteSpeakingScore.ClientID%>', 'btnpteSpeakingScore');
           if ($('#<%=rblpteTotalScoreNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtpteTotalScore.ClientID%>', 'btnpteTotalScore');
           if ($('#<%=rbltofelregistrationnoNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txttofelregistrationno.ClientID%>', 'btntofelregistrationno');
           if ($('#<%=rbltofelTestDateNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txttofelTestDate.ClientID%>', 'btntofelTestDate');
           if ($('#<%=rbltofelcentercountryNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txttofelcentercountry.ClientID%>', 'btntofelcentercountry');
           if ($('#<%=rbltofelcenterNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txttofelcenterNo.ClientID%>', 'btntofelcenterNo');
           if ($('#<%=rbltofelReadingScoreNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txttofelReadingScore.ClientID%>', 'btntofelReadingScore');
           if ($('#<%=rbltofelListeningScoreNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txttofelListeningScore.ClientID%>', 'btntofelListeningScore');
           if ($('#<%=rbltofelSpeakingScoreNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txttofelSpeakingScore.ClientID%>', 'btntofelSpeakingScore');
           if ($('#<%=rbltofelWritingScoreNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txttofelWritingScore.ClientID%>', 'btntofelWritingScore');
           if ($('#<%=rbltofelTotalScoreNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txttofelTotalScore.ClientID%>', 'btntofelTotalScore');
           if ($('#<%=rblCEFRNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txtCEFR.ClientID%>', 'btnCEFR');
           if ($('#<%=rbltestRefnoNo.ClientID%>').prop('checked') == true)
                ManageRemarksIfNoCheked('<%=txttestRefno.ClientID%>', 'btntestRefno');
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
