<%@ Page Language="C#" AutoEventWireup="true" CodeFile="supervisorapplicantlanguage.aspx.cs" Inherits="admin_supervisorapplicantlanguage" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script>

</script>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblhomelanguageYes" GroupName="homelanguage" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblhomelanguageNo" GroupName="homelanguage" Text="No" runat="server" />
                                <asp:Label ID="lblhomelanguageComments" runat="server"></asp:Label>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblEnglishBackgroundYes" GroupName="EnglishBackground" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblEnglishBackgroundNo" GroupName="EnglishBackground" Text="No" runat="server" />
                                <asp:Label ID="lblEnglishBackgroundComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblLanguageYes" GroupName="Language" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblLanguageNo" GroupName="Language" Text="No" runat="server" />
                                    <asp:Label ID="lblLanguageComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblYearCompletionYes" GroupName="YearCompletion" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblYearCompletionNo" GroupName="YearCompletion" Text="No" runat="server" />
                                    <asp:Label ID="lblYearCompletionComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblNameCollegeYes" GroupName="NameCollege" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblNameCollegeNo" GroupName="NameCollege" Text="No" runat="server" />
                                    <asp:Label ID="lblNameCollegeComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblstudymodeYes" GroupName="studymode" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblstudymodeNo" GroupName="studymode" Text="No" runat="server" />
                                    <asp:Label ID="lblstudymodeComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblQualificationTypeYes" GroupName="QualificationType" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblQualificationTypeNo" GroupName="QualificationType" Text="No" runat="server" />
                                    <asp:Label ID="lblQualificationTypeComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblQualificationNameYes" GroupName="QualificationName" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblQualificationNameNo" GroupName="QualificationName" Text="No" runat="server" />
                                    <asp:Label ID="lblQualificationNameComments" runat="server"></asp:Label>
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
                                    <asp:RadioButton ID="rblgradetypeYes" GroupName="gradetype" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblgradetypeNo" GroupName="gradetype" Text="No" runat="server" />
                                    <asp:Label ID="lblgradetypeComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblgradeachievedYes" GroupName="gradeachieved" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblgradeachievedNo" GroupName="gradeachieved" Text="No" runat="server" />
                                    <asp:Label ID="lblgradeachievedComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblExpectedDategradeYes" GroupName="ExpectedDategrade" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblExpectedDategradeNo" GroupName="ExpectedDategrade" Text="No" runat="server" />
                                    <asp:Label ID="lblExpectedDategradeComments" runat="server"></asp:Label>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblEnglishTestYes" GroupName="EnglishTest" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblEnglishTestNo" GroupName="EnglishTest" Text="No" runat="server" />
                                <asp:Label ID="lblEnglishTestComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>               
                <div id="ieltsfieldContainer" runat="server" visible="false">
                     <div class="list-group-item" id="testName" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-testName">
                            <div class="form-row">
                                <label id="labeltestName" runat="server" for="testName" class="col-md-3 col-form-label form-label">Test Name </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lbltestName" runat="server"></asp:Label>

                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rbltestNameYes" GroupName="testName" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rbltestNameNo" GroupName="testName" Text="No" runat="server" />
                                    <asp:Label ID="lbltestNameComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="CandidateID" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-CandidateID">
                            <div class="form-row">
                                <label id="labelCandidateID" runat="server" for="CandidateID" class="col-md-3 col-form-label form-label">Candidate ID </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblCandidateID" runat="server"></asp:Label>

                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblCandidateIDYes" GroupName="CandidateID" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblCandidateIDNo" GroupName="CandidateID" Text="No" runat="server" />
                                    <asp:Label ID="lblCandidateIDComments" runat="server"></asp:Label>
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

                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblCandidateNoYes" GroupName="CandidateNo" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblCandidateNoNo" GroupName="CandidateNo" Text="No" runat="server" />
                                    <asp:Label ID="lblCandidateNoComments" runat="server"></asp:Label>
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

                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblieltsTestDateYes" GroupName="ieltsTestDate" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblieltsTestDateNo" GroupName="ieltsTestDate" Text="No" runat="server" />
                                    <asp:Label ID="lblieltsTestDateComments" runat="server"></asp:Label>
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

                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblCentreNoYes" GroupName="CentreNo" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblCentreNoNo" GroupName="CentreNo" Text="No" runat="server" />
                                    <asp:Label ID="lblCentreNoComments" runat="server"></asp:Label>
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

                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblReadingScoreYes" GroupName="ReadingScoreIelt" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblReadingScoreNo" GroupName="ReadingScoreIelt" Text="No" runat="server" />
                                    <asp:Label ID="lblReadingScoreComments" runat="server"></asp:Label>
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

                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblListeningScoreYes" GroupName="ListeningScoreIlet" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblListeningScoreNo" GroupName="ListeningScoreIlet" Text="No" runat="server" />
                                    <asp:Label ID="lblListeningScoreComments" runat="server"></asp:Label>
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

                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblSpeakingScoreYes" GroupName="SpeakingScoreIlet" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblSpeakingScoreNo" GroupName="SpeakingScoreIlet" Text="No" runat="server" />
                                    <asp:Label ID="lblSpeakingScoreComments" runat="server"></asp:Label>
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

                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblWritingScoreYes" GroupName="WritingScoreIlet" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblWritingScoreNo" GroupName="WritingScoreIlet" Text="No" runat="server" />
                                    <asp:Label ID="lblWritingScoreComments" runat="server"></asp:Label>
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

                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblLanguageScoreYes" GroupName="LanguageScore" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblLanguageScoreNo" GroupName="LanguageScore" Text="No" runat="server" />
                                    <asp:Label ID="lblLanguageScoreComments" runat="server"></asp:Label>
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

                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblptetesttakerYes" GroupName="ptetesttaker" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblptetesttakerNo" GroupName="ptetesttaker" Text="No" runat="server" />
                                    <asp:Label ID="lblptetesttakerComments" runat="server"></asp:Label>
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

                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblpteregistrationnoYes" GroupName="pteregistrationno" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblpteregistrationnoNo" GroupName="pteregistrationno" Text="No" runat="server" />
                                    <asp:Label ID="lblpteregistrationnoComments" runat="server"></asp:Label>
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

                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblpteTestDateYes" GroupName="pteTestDate" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblpteTestDateNo" GroupName="pteTestDate" Text="No" runat="server" />
                                    <asp:Label ID="lblpteTestDateComments" runat="server"></asp:Label>
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

                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblptecentercountryYes" GroupName="ptecentercountry" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblptecentercountryNo" GroupName="ptecentercountry" Text="No" runat="server" />
                                    <asp:Label ID="lblptecentercountryComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblptetestcenterNoYes" GroupName="ptetestcenterNo" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblptetestcenterNoNo" GroupName="ptetestcenterNo" Text="No" runat="server" />

                                    <asp:Label ID="lblptetestcenterNoComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblpteReadingScoreYes" GroupName="pteReadingScore" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblpteReadingScoreNo" GroupName="pteReadingScore" Text="No" runat="server" />

                                    <asp:Label ID="lblpteReadingScoreComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblpteListeningScoreYes" GroupName="pteListeningScore" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblpteListeningScoreNo" GroupName="pteListeningScore" Text="No" runat="server" />

                                    <asp:Label ID="lblpteListeningScoreComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblpteSpeakingScoreYes" GroupName="pteSpeakingScore" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblpteSpeakingScoreNo" GroupName="pteSpeakingScore" Text="No" runat="server" />

                                    <asp:Label ID="lblpteSpeakingScoreComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblpteWritingScoreYes" GroupName="pteWritingScore" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblpteWritingScoreNo" GroupName="pteWritingScore" Text="No" runat="server" />

                                    <asp:Label ID="lblpteWritingScoreComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rblpteTotalScoreYes" GroupName="pteTotalScore" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rblpteTotalScoreNo" GroupName="pteTotalScore" Text="No" runat="server" />

                                    <asp:Label ID="lblpteTotalScoreComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rbltofelregistrationnoYes" GroupName="tofelregistrationno" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rbltofelregistrationnoNo" GroupName="tofelregistrationno" Text="No" runat="server" />

                                    <asp:Label ID="lbltofelregistrationnoComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rbltofelTestDateYes" GroupName="tofelTestDate" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rbltofelTestDateNo" GroupName="tofelTestDate" Text="No" runat="server" />

                                    <asp:Label ID="lbltofelTestDateComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rbltofelcentercountryYes" GroupName="tofelcentercountry" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rbltofelcentercountryNo" GroupName="tofelcentercountry" Text="No" runat="server" />

                                    <asp:Label ID="lbltofelcentercountryComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rbltofelcenterNoYes" GroupName="tofelcenterNo" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rbltofelcenterNo" GroupName="tofelcenterNo" Text="No" runat="server" />

                                    <asp:Label ID="lbltofelcenterNoComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rbltofelReadingScoreYes" GroupName="countryIssue" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rbltofelReadingScoreNo" GroupName="countryIssue" Text="No" runat="server" />

                                    <asp:Label ID="lbltofelReadingScoreComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rbltofelListeningScoreYes" GroupName="tofelListeningScore" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rbltofelListeningScoreNo" GroupName="tofelListeningScore" Text="No" runat="server" />

                                    <asp:Label ID="lbltofelListeningScoreComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rbltofelSpeakingScoreYes" GroupName="tofelSpeakingScore" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rbltofelSpeakingScoreNo" GroupName="tofelSpeakingScore" Text="No" runat="server" />

                                    <asp:Label ID="lbltofelSpeakingScoreComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rbltofelWritingScoreYes" GroupName="tofelWritingScore" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rbltofelWritingScoreNo" GroupName="tofelWritingScore" Text="No" runat="server" />

                                    <asp:Label ID="lbltofelWritingScoreComments" runat="server"></asp:Label>
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
                                </div>
                                <div class="col-md-4">
                                    <asp:RadioButton ID="rbltofelTotalScoreYes" GroupName="tofelTotalScore" Text="Yes" runat="server" />
                                    <asp:RadioButton ID="rbltofelTotalScoreNo" GroupName="tofelTotalScore" Text="No" runat="server" />

                                    <asp:Label ID="lbltofelTotalScoreComments" runat="server"></asp:Label>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rblCEFRYes" GroupName="CEFR" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rblCEFRNo" GroupName="CEFR" Text="No" runat="server" />
                                <asp:Label ID="lblCEFRComments" runat="server"></asp:Label>
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
                            </div>
                            <div class="col-md-4">
                                <asp:RadioButton ID="rbltestRefnoYes" GroupName="testRefno" Text="Yes" runat="server" />
                                <asp:RadioButton ID="rbltestRefnoNo" GroupName="testRefno" Text="No" runat="server" />
                                <asp:Label ID="lbltestRefnoComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="mainDiv" runat="server"></div>
                <div class="list-group-item">
                    <div class="form-group m-0" role="group" aria-labelledby="label-agentList">
                        <div class="form-row">
                            <label for="agentList" class="col-md-3 col-form-label form-label">Superviosr Action</label>
                            <div class="col-md-4">
                                <input type="radio" id="rbApproved" runat="server" name="supervisorAction">
                                Approved
                                <input type="radio" id="rbDenied" runat="server" name="supervisorAction">Further Review
                            </div>
                            <div class="col-md-4">
                                <asp:TextBox ID="txtComments" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="list-group-item" id="employerwebsite">
                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                        <div class="form-row">
                            <asp:Button ID="btnSave" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnSave_Click" />
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
</asp:Content>
