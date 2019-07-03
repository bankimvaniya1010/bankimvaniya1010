<%@ Page Language="C#" AutoEventWireup="true" CodeFile="supervisorapplicantlanguage.aspx.cs" Inherits="admin_supervisorapplicantlanguage" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script>
       
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
                            </div>
                            <div class="col-md-4"> <asp:Label ID="lblhomelanguageComments" runat="server"></asp:Label>
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
                            <div class="col-md-4"> <asp:Label ID="lblEnglishBackgroundComments" runat="server"></asp:Label>
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
                                <div class="col-md-4"> <asp:Label ID="lblLanguageComments" runat="server"></asp:Label>
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
                                <div class="col-md-4"> <asp:Label ID="lblYearCompletionComments" runat="server"></asp:Label>
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
                                <div class="col-md-4"> <asp:Label ID="lblNameCollegeComments" runat="server"></asp:Label>
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
                                <div class="col-md-4"> <asp:Label ID="lblstudymodeComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="QualificationType" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-QualificationType">
                            <div class="form-row">
                                <label id="labelQualificationType" runat="server" for="QualificationType" class="col-md-3 col-form-label form-label">Qualification Type</label>
                                <div class="col-md-4"><asp:Label ID="lblQualificationType" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4"> <asp:Label ID="lblQualificationTypeComments" runat="server"></asp:Label>
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
                                <div class="col-md-4"> <asp:Label ID="lblQualificationNameComments" runat="server"></asp:Label>
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
                                <div class="col-md-4"> <asp:Label ID="lblgradetypeComments" runat="server"></asp:Label>
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
                                <div class="col-md-4"> <asp:Label ID="lblgradeachievedComments" runat="server"></asp:Label>
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
                                <div class="col-md-4"> <asp:Label ID="lblExpectedDategradeComments" runat="server"></asp:Label>
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
                            <div class="col-md-4"> <asp:Label ID="lblEnglishTestComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="TestfieldContainer" runat="server" style="display: none;">

                    <div class="list-group-item" id="testName" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-testName">
                            <div class="form-row">
                                <label id="labeltestName" runat="server" for="testName" class="col-md-3 col-form-label form-label">Test Name </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lbltestName" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4"> <asp:Label ID="lbltestNameComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="CentreNo" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-CentreNo">
                            <div class="form-row">
                                <label id="labelCentreNo" runat="server" for="testName" class="col-md-3 col-form-label form-label">Centre No </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblCentreNo" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4"> <asp:Label ID="lblCentreNoComments" runat="server"></asp:Label>
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
                                <div class="col-md-4"> <asp:Label ID="lblCandidateNoComments" runat="server"></asp:Label>
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
                                <div class="col-md-4"> <asp:Label ID="lblCandidateIDComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="LanguageTestDate" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-LanguageTestDate">
                            <div class="form-row">
                                <label id="labelLanguageTestDate" runat="server" for="LanguageTestDate" class="col-md-3 col-form-label form-label">Test Date</label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblLanguageTestDate" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4"> <asp:Label ID="lblLanguageTestDateComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="LanguageScore" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-LanguageScore">
                            <div class="form-row">
                                <label id="labelLanguageScore" runat="server" for="LanguageScore" class="col-md-3 col-form-label form-label">Overall Score </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblLanguageScore" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4"> <asp:Label ID="lblLanguageScoreComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="SpeakingScore" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-SpeakingScore">
                            <div class="form-row">
                                <label id="labelSpeakingScore" runat="server" for="SpeakingScore" class="col-md-3 col-form-label form-label">Speaking Score </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblSpeakingScore" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4"> <asp:Label ID="lblSpeakingScoreComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="ListeningScore" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-ListeningScore">
                            <div class="form-row">
                                <label id="labelListeningScore" runat="server" for="ListeningScore" class="col-md-3 col-form-label form-label">Listening Score </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblListeningScore" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4"> <asp:Label ID="lblListeningScoreComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="ReadingScore" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-ReadingScore">
                            <div class="form-row">
                                <label id="labelReadingScore" runat="server" for="ReadingScore" class="col-md-3 col-form-label form-label">Reading Score </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblReadingScore" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4"> <asp:Label ID="lblReadingScoreComments" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="list-group-item" id="WritingScore" runat="server" style="display: none">
                        <div class="form-group m-0" role="group" aria-labelledby="label-WritingScore">
                            <div class="form-row">
                                <label id="labelWritingScore" runat="server" for="ListeningScore" class="col-md-3 col-form-label form-label">Writing Score </label>
                                <div class="col-md-4">
                                    <asp:Label ID="lblWritingScore" runat="server"></asp:Label>
                                </div>
                                <div class="col-md-4"> <asp:Label ID="lblWritingScoreComments" runat="server"></asp:Label>
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
                            <div class="col-md-4"> <asp:Label ID="lblCEFRComments" runat="server"></asp:Label>
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
                            <div class="col-md-4"> <asp:Label ID="lbltestRefnoComments" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div> <div id="mainDiv" runat="server"></div>
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
