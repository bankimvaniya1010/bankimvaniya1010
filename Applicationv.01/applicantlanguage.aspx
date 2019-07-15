<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantlanguage.aspx.cs" Inherits="applicantlanguage" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">English Language Competency

            </li>
        </ol>
        <h1 class="h2">English Language Competency

        </h1>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">
                        <div class="list-group list-group-fit">

                            <div class="list-group-item" id="homelanguage" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-homelanguage">
                                    <div class="form-row">
                                        <label id="labelhomelanguage" runat="server" for="homelanguage" class="col-md-3 col-form-label form-label">What language do you speak at home</label>
                                        <div class="col-md-6">
                                            <input id="txthomelanguage" runat="server" type="text" placeholder="What language do you speak at home" value="" class="form-control">
                                            <span class="helpicon"><i id="ichomelanguage" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="EnglishBackground" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-EnglishBackground">
                                    <div class="form-row">
                                        <label id="labelEnglishBackground" runat="server" for="EnglishBackground" class="col-md-3 col-form-label form-label">Have you studied an English Language Intensive Course for students from non-English speaking backgrounds</label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblEnglishBackgroundYes" runat="server" GroupName="EnglishBackground" Text="Yes" />
                                            <asp:RadioButton ID="rblEnglishBackgroundNot" runat="server" GroupName="EnglishBackground" Text="No  - I am currently still studying for my English Language Course" />
                                            <asp:RadioButton ID="rblEnglishBackgroundNo" runat="server" GroupName="EnglishBackground" Text="No - I have not studied an English Language Intensive Course for people from non-English speaking backgrounds" />
                                            <span class="helpicon"><i id="icEnglishBackground" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="BackgroundfieldContainer" runat="server" style="display: none;">

                                <div class="list-group-item" id="Language" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Language">
                                        <div class="form-row">
                                            <label id="labelLanguage" runat="server" for="Language" class="col-md-3 col-form-label form-label">Country of English Language Intensive Course</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                                <span class="helpicon"><i id="icLanguage" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="YearCompletion" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-YearCompletion">
                                        <div class="form-row">
                                            <label id="labelYearCompletion" runat="server" for="YearCompletion" class="col-md-3 col-form-label form-label">Year of Completion/Expected </label>
                                            <div class="col-md-6">
                                                <input id="txtYearCompletion" runat="server" type="text" class="form-control" placeholder="Completion Year" data-toggle="flatpickr" value="">
                                                <span class="helpicon"><i id="icYearCompletion" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="NameCollege" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-NameCollege">
                                        <div class="form-row">
                                            <label id="labelNameCollege" runat="server" for="NameCollege" class="col-md-3 col-form-label form-label">Name of College or University</label>
                                            <div class="col-md-6">
                                                <input id="txtNameCollege" runat="server" type="text" placeholder="Name of College or University" value="" class="form-control">
                                                <span class="helpicon"><i id="icNameCollege" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="studymode" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-studymode">
                                        <div class="form-row">
                                            <label id="labelstudymode" runat="server" for="studymode" class="col-md-3 col-form-label form-label">Mode of study</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlStudyMode" runat="server" CssClass="form-control"></asp:DropDownList>
                                                <span class="helpicon"><i id="icstudymode" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="QualificationType" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-QualificationType">
                                        <div class="form-row">
                                            <label id="labelQualificationType" runat="server" for="QualificationType" class="col-md-3 col-form-label form-label">Qualification Type</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlQualificationType" runat="server" CssClass="form-control"></asp:DropDownList>
                                                <span class="helpicon"><i id="icQualificationType" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="QualificationName" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-QualificationName">
                                        <div class="form-row">
                                            <label id="labelQualificationName" runat="server" for="QualificationName" class="col-md-3 col-form-label form-label">Qualification Name</label>
                                            <div class="col-md-6">
                                                <input id="txtQualificationName" runat="server" type="text" placeholder="Qualification Name" value="" class="form-control">
                                                <span class="helpicon"><i id="icQualificationName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="gradetype" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-gradetype">
                                        <div class="form-row">
                                            <label id="labelgradetype" runat="server" for="EnglishCourse" class="col-md-3 col-form-label form-label">Grade Type</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlGrade" runat="server" CssClass="form-control"></asp:DropDownList>
                                                <span class="helpicon"><i id="icgradetype" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 </div>
                                <div class="list-group-item" id="gradeachieved" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-gradeachieved">
                                        <div class="form-row">
                                            <label id="labelgradeachieved" runat="server" for="gradeachieved" class="col-md-3 col-form-label form-label">Final Grade Achieved </label>
                                            <div class="col-md-9">
                                                <asp:RadioButton ID="rblYes" CssClass="form-control" runat="server" GroupName="HighschoolGrade" Text="Results Declared" />
                                                <asp:RadioButton ID="rblYetToConduct" CssClass="form-control" runat="server" GroupName="HighschoolGrade" Text=" Examination not conducted yet" />
                                                <asp:RadioButton ID="rblNot" runat="server" CssClass="form-control" GroupName="HighschoolGrade" Text="Examination Conducted, but Result not declared" />
                                                <span class="helpicon"><i id="icgradeachieved" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="ExpectedDategrade" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedDategrade">
                                        <div class="form-row">
                                            <label id="labelExpectedDategrade" runat="server" for="EnglishCourse" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                            <div class="col-md-6">
                                                <input id="txtExpectedDategrade" runat="server" type="text" class="form-control" placeholder="Expected Date" data-toggle="flatpickr" value="">
                                                <span class="helpicon"><i id="icExpectedDategrade" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                           

                            <div class="list-group-item" id="EnglishTest" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-EnglishTest">
                                    <div class="form-row">
                                        <label id="labelEnglishTest" runat="server" for="EnglishTest" class="col-md-3 col-form-label form-label">Have you sat any one of the following English Language competency tests</label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblLanguageielts" runat="server" GroupName="EnglishTest" Text="IELTS" />
                                            <asp:RadioButton ID="rblLanguagepearsons" runat="server" GroupName="EnglishTest" Text="Pearsons" />
                                            <asp:RadioButton ID="rblLanguagtofel" runat="server" GroupName="EnglishTest" Text="TOEFL" />
                                            <span class="helpicon"><i id="icEnglishTest" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="TestfieldContainer" runat="server" style="display: none;">

                                <div class="list-group-item" id="testName" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-testName">
                                        <div class="form-row">
                                            <label id="labeltestName" runat="server" for="testName" class="col-md-3 col-form-label form-label">Test Name </label>
                                            <div class="col-md-6">
                                                <input id="txtTestName" runat="server" type="text" placeholder="Test Name" value="" class="form-control">
                                                <span class="helpicon"><i id="ictestName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="CentreNo" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-CentreNo">
                                        <div class="form-row">
                                            <label id="labelCentreNo" runat="server" for="testName" class="col-md-3 col-form-label form-label">Centre No </label>
                                            <div class="col-md-6">
                                                <input id="txtCentreNo" runat="server" type="text" placeholder="Centre No" value="" class="form-control">
                                                <span class="helpicon"><i id="icCentreNo" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="CandidateNo" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-CandidateNo">
                                        <div class="form-row">
                                            <label id="labelCandidateNo" runat="server" for="CandidateNo" class="col-md-3 col-form-label form-label">Candidate No </label>
                                            <div class="col-md-6">
                                                <input id="txtCandidateNo" runat="server" type="text" placeholder="Candidate No" value="" class="form-control">
                                                <span class="helpicon"><i id="icCandidateNo" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="CandidateID" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-CandidateID">
                                        <div class="form-row">
                                            <label id="labelCandidateID" runat="server" for="CandidateID" class="col-md-3 col-form-label form-label">Candidate ID </label>
                                            <div class="col-md-6">
                                                <input id="txtCandidateID" runat="server" type="text" placeholder="Candidate ID" value="" class="form-control">
                                                <span class="helpicon"><i id="icCandidateID" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="LanguageTestDate" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-LanguageTestDate">
                                        <div class="form-row">
                                            <label id="labelLanguageTestDate" runat="server" for="LanguageTestDate" class="col-md-3 col-form-label form-label">Test Date</label>
                                            <div class="col-md-6">
                                                <input id="txtLanguageTestDate" runat="server" type="text" class="form-control" placeholder="Test Date" data-toggle="flatpickr" value="">
                                                <span class="helpicon"><i id="icLanguageTestDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="LanguageScore" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-LanguageScore">
                                        <div class="form-row">
                                            <label id="labelLanguageScore" runat="server" for="LanguageScore" class="col-md-3 col-form-label form-label">Overall Score </label>
                                            <div class="col-md-6">
                                                <input id="txtLanguageScore" runat="server" type="text" placeholder="OverAll Score" value="" class="form-control">
                                                <span class="helpicon"><i id="icLanguageScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="SpeakingScore" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-SpeakingScore">
                                        <div class="form-row">
                                            <label id="labelSpeakingScore" runat="server" for="SpeakingScore" class="col-md-3 col-form-label form-label">Speaking Score </label>
                                            <div class="col-md-6">
                                                <input id="txtSpeaking" runat="server" type="text" placeholder="Speaking Score" value="" class="form-control">
                                                <span class="helpicon"><i id="icSpeakingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="ListeningScore" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-ListeningScore">
                                        <div class="form-row">
                                            <label id="labelListeningScore" runat="server" for="ListeningScore" class="col-md-3 col-form-label form-label">Listening Score </label>
                                            <div class="col-md-6">
                                                <input id="txtListening" runat="server" type="text" placeholder="Listening Score " value="" class="form-control">
                                                <span class="helpicon"><i id="icListeningScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="ReadingScore" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-ReadingScore">
                                        <div class="form-row">
                                            <label id="labelReadingScore" runat="server" for="ReadingScore" class="col-md-3 col-form-label form-label">Reading Score </label>
                                            <div class="col-md-6">
                                                <input id="txtReading" runat="server" type="text" placeholder="Reading Score" value="" class="form-control">
                                                <span class="helpicon"><i id="icReadingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="WritingScore" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-WritingScore">
                                        <div class="form-row">
                                            <label id="labelWritingScore" runat="server" for="ListeningScore" class="col-md-3 col-form-label form-label">Writing Score </label>
                                            <div class="col-md-6">
                                                <input id="txtWriting" runat="server" type="text" placeholder="Writing Score " value="" class="form-control">
                                                <span class="helpicon"><i id="icWritingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="CEFR" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-CEFR">
                                    <div class="form-row">
                                        <label id="labelCEFR" runat="server" for="CEFR" class="col-md-3 col-form-label form-label">CEFR Level </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCEFR" runat="server" CssClass="form-control">
                                            </asp:DropDownList>
                                            <span class="helpicon"><i id="icCEFR" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="testRefno" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-testRefno">
                                    <div class="form-row">
                                        <label id="labeltestRefno" runat="server" for="testRefno" class="col-md-3 col-form-label form-label">Test Report Reference No </label>
                                        <div class="col-md-6">
                                            <input id="txttestRefno" runat="server" type="text" placeholder="Writing Score " value="" class="form-control">
                                            <span class="helpicon"><i id="ictestRefno" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="mainDiv" runat="server"></div>
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                        <a href="applicantworkexperience.aspx" class="btn btn-success" style="margin-right: 10px;">Work Experience</a>
                                        <asp:Button ID="btnlanguagecompetency" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnlanguagecompetency_Click" OnClientClick="return validateForm()"/>
                                        <div class="col-md-6">
                                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="lblSaveTime" runat="server" Visible="false"></asp:Label>
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
        function validateForm() {

            var flag = false;
            if (!$("#<%=homelanguage.ClientID%>").is(':hidden') && $("#<%=txthomelanguage.ClientID%>").val() == "")
                alert("Please Mention Language You Speak At Home");

            else if (!$("#<%=EnglishBackground.ClientID%>").is(':hidden') && !($("#<%=rblEnglishBackgroundYes.ClientID%>").is(':checked') || $("#<%=rblEnglishBackgroundNot.ClientID%>").is(':checked') || $("#<%=rblEnglishBackgroundNo.ClientID%>").is(':checked')))
                alert("Please Select Have you studied an English Language Intensive Course");

            else {
                var flag1 = true;
                if (!$("#<%=EnglishBackground.ClientID%>").is(':hidden') && ($("#<%=rblEnglishBackgroundYes.ClientID%>").is(':checked') || $("#<%=rblEnglishBackgroundNot.ClientID%>").is(':checked')))
                {
                    if (!$("#<%=Language.ClientID%>").is(':hidden') && $("#<%=ddlLanguage.ClientID%>").val() === "0") {
                        alert("Please Select Country");
                        flag1 = false;
                    }
                    else if (!$("#<%=YearCompletion.ClientID%>").is(':hidden') && $("#<%=txtYearCompletion.ClientID%>").val() == "") {

                        alert("Please Enter Year Of Completion");
                        flag1 = false;
                    }
                    else if (!$("#<%=NameCollege.ClientID%>").is(':hidden') && $("#<%=txtNameCollege.ClientID%>").val() == "") {
                        alert("Please Enter Name Of College");
                        flag1 = false;
                    }

                    else if (!$("#<%=studymode.ClientID%>").is(':hidden') && $("#<%=ddlStudyMode.ClientID%>").val() === "0") {
                        alert("Please Select Study Mode");
                        flag1 = false;
                    }

                    else if (!$("#<%=QualificationType.ClientID%>").is(':hidden') && $("#<%=ddlQualificationType.ClientID%>").val() === "0") {
                        alert("Please Select Qualification Type");
                        flag1 = false;
                    }

                    else if (!$("#<%=QualificationName.ClientID%>").is(':hidden') && $("#<%=txtQualificationName.ClientID%>").val() == "") {
                        alert("Please Enter Qualification Name");
                        flag1 = false;
                    }

                    else if (!$("#<%=gradetype.ClientID%>").is(':hidden') && $("#<%=ddlGrade.ClientID%>").val() === "0") {
                        alert("Please Select Grade Type");
                        flag1 = false;
                    }
                    else if ($("#<%=rblEnglishBackgroundYes.ClientID%>").is(':checked') && !$("#<%=gradeachieved.ClientID%>").is(':hidden') && !($("#<%=rblYes.ClientID%>").is(':checked') || $("#<%=rblYetToConduct.ClientID%>").is(':checked') || $("#<%=rblNot.ClientID%>").is(':checked'))) {
                        alert("Please Select Final Grade Achieved");
                        flag1 = false;
                    }

                    else if ($("#<%=rblEnglishBackgroundNot.ClientID%>").is(':checked') && !$("#<%=ExpectedDategrade.ClientID%>").is(':hidden') && $("#<%=txtExpectedDategrade.ClientID%>").val() == "") {
                        alert("Please Enter Expected Date When Result Will Be Declared");
                        flag1 = false;
                    }
                     
                }

                if (flag1) {

                    if (!$("#<%=EnglishTest.ClientID%>").is(':hidden') && !($("#<%=rblLanguageielts.ClientID%>").is(':checked') || $("#<%=rblLanguagepearsons.ClientID%>").is(':checked') || $("#<%=rblLanguagtofel.ClientID%>").is(':checked')))
                        alert("Please Select Option If You Have you sat any one English Language competency tests ");
                    else {
                        var flag2 = true;
                        if ($("#<%=rblLanguageielts.ClientID%>").is(':checked') || $("#<%=rblLanguagepearsons.ClientID%>").is(':checked') || $("#<%=rblLanguagtofel.ClientID%>").is(':checked')) {
                            if (!$("#<%=testName.ClientID%>").is(':hidden') && $("#<%=txtTestName.ClientID%>").val() == "") {
                                alert("Please Enter Test Name");
                                flag2 = false;
                            }
                            else if (!$("#<%=CentreNo.ClientID%>").is(':hidden') && $("#<%=txtCentreNo.ClientID%>").val() == "") {
                                alert("Please Enter Center Number");
                                flag2 = false;
                            }
                            else if (!$("#<%=CandidateNo.ClientID%>").is(':hidden') && $("#<%=txtCandidateNo.ClientID%>").val() == "") {
                                alert("Please Enter Candidate Number");
                                flag2 = false;
                            }
                            else if (!$("#<%=CandidateID.ClientID%>").is(':hidden') && $("#<%=txtCandidateID.ClientID%>").val() == "") {
                                alert("Please Enter Candidate ID");
                                flag2 = false;
                            }
                            else if (!$("#<%=LanguageTestDate.ClientID%>").is(':hidden') && $("#<%=txtLanguageTestDate.ClientID%>").val() == "") {
                                alert("Please Select Test Date");
                                flag2 = false;
                            }
                            else if (!$("#<%=LanguageScore.ClientID%>").is(':hidden') && $("#<%=txtLanguageScore.ClientID%>").val() == "") {
                                alert("Please Enter OverAll Score");
                                flag2 = false;
                            }
                            else if (!$("#<%=SpeakingScore.ClientID%>").is(':hidden') && $("#<%=txtSpeaking.ClientID%>").val() == "") {
                                alert("Please Enter Speaking Score");
                                flag2 = false;
                            }
                            else if (!$("#<%=ListeningScore.ClientID%>").is(':hidden') && $("#<%=txtListening.ClientID%>").val() == "") {
                                alert("Please Enter Listening Score");
                                flag2 = false;
                            }
                            else if (!$("#<%=ReadingScore.ClientID%>").is(':hidden') && $("#<%=txtReading.ClientID%>").val() == "") {
                                alert("Please Enter Reading Score");
                                flag2 = false;
                            }
                            else if (!$("#<%=WritingScore.ClientID%>").is(':hidden') && $("#<%=txtWriting.ClientID%>").val() == "") {
                                alert("Please Enter Writing Score");
                                flag2 = false;
                            }
                        }
                        if (flag2) {
                            if (!$("#<%=CEFR.ClientID%>").is(':hidden') && $("#<%=ddlCEFR.ClientID%>").val() === "0")
                                alert("Please Select CEFR Test");
                            else if (!$("#<%=testRefno.ClientID%>").is(':hidden') && $("#<%=txttestRefno.ClientID%>").val() == "")
                                alert("Please Enter Test Refference Number");
                            else
                                flag = true;
                        }
                    }
                 }
            }
           
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


        $(document).ready(function () {
            $('.fa-info-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });

            
           
            if ($("#<%=rblEnglishBackgroundNot.ClientID%>").is(":checked")) {
                $("#<%=BackgroundfieldContainer.ClientID%>").show();
                $("#<%=ExpectedDategrade.ClientID%>").show();
            }
            else                 
                $("#<%=ExpectedDategrade.ClientID%>").hide();

            
            if ($("#<%=rblEnglishBackgroundYes.ClientID%>").is(":checked")) {
                $("#<%=BackgroundfieldContainer.ClientID%>").show();
                $("#<%=gradeachieved.ClientID%>").show();
            }
            else 
                $("#<%=gradeachieved.ClientID%>").hide();
            

             if ($("#<%=rblEnglishBackgroundNo.ClientID%>").is(":checked")) {
                    $("#<%=BackgroundfieldContainer.ClientID%>").hide();
                    $("#<%=ExpectedDategrade.ClientID%>").hide();
                    $("#<%=gradeachieved.ClientID%>").hide();
            }

            if ($("#<%=rblLanguageielts.ClientID%>").is(":checked") || $("#<%=rblLanguagepearsons.ClientID%>").is(":checked") || $("#<%=rblLanguagtofel.ClientID%>").is(":checked"))
                $("#<%=TestfieldContainer.ClientID%>").show();
            else
                $("#<%=TestfieldContainer.ClientID%>").hide();
        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$EnglishBackground']").click(function () {
               if ($("#<%=rblEnglishBackgroundNot.ClientID%>").is(":checked")) {
                $("#<%=BackgroundfieldContainer.ClientID%>").show();
                $("#<%=ExpectedDategrade.ClientID%>").show();
            }
            else                
                $("#<%=ExpectedDategrade.ClientID%>").hide();
            
            });
        });

         $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$EnglishBackground']").click(function () {
               if ($("#<%=rblEnglishBackgroundYes.ClientID%>").is(":checked")) {
                $("#<%=BackgroundfieldContainer.ClientID%>").show();
                $("#<%=gradeachieved.ClientID%>").show();
            }
            else              
                $("#<%=gradeachieved.ClientID%>").hide();
            
            });
        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$EnglishBackground']").click(function () {
                if ($("#<%=rblEnglishBackgroundNo.ClientID%>").is(":checked")) {
                    $("#<%=BackgroundfieldContainer.ClientID%>").hide();
                    $("#<%=ExpectedDategrade.ClientID%>").hide();
                    $("#<%=gradeachieved.ClientID%>").hide();
                }
            });
        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$EnglishTest']").click(function () {
                if ($("#<%=rblLanguageielts.ClientID%>").is(":checked") || $("#<%=rblLanguagepearsons.ClientID%>").is(":checked") || $("#<%=rblLanguagtofel.ClientID%>").is(":checked"))
                    $("#<%=TestfieldContainer.ClientID%>").show();
                else
                    $("#<%=TestfieldContainer.ClientID%>").hide();

            });
        });

        $('#ContentPlaceHolder1_txtLanguageTestDate').flatpickr({

            dateFormat: 'Y-m-d', defaultDate: ""
        });

        $('#ContentPlaceHolder1_txtYearCompletion').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });

        $('#ContentPlaceHolder1_txtExpectedDategrade').flatpickr({
            dateFormat: 'Y-m-d', defaultDate: ""
        });
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#personal_menu_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantlanguage').addClass('active');
        });
    </script>
</asp:Content>
