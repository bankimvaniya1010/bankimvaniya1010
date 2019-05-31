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
                                            <input id="txthomelanguage" runat="server" type="text" placeholder="What language do you speak at home
"
                                                value="" class="form-control">
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="Language" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Language">
                                    <div class="form-row">
                                        <label id="labelLanguage" runat="server" for="Language" class="col-md-3 col-form-label form-label">Country of English Language Intensive Course</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="form-control">                                               
                                            </asp:DropDownList>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="YearCompletion" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-YearCompletion">
                                    <div class="form-row">
                                        <label id="labelYearCompletion" runat="server" for="YearCompletion" class="col-md-3 col-form-label form-label">Year of Completion/Expected </label>
                                        <div class="col-md-6">

                                            <input id="txtYearCompletion" runat="server" type="text" class="form-control" placeholder="DOB" data-toggle="flatpickr" value="today">
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="QualificationType" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-QualificationType">
                                    <div class="form-row">
                                        <label id="labelQualificationType" runat="server" for="QualificationType" class="col-md-3 col-form-label form-label">Qualification Type</label>
                                        <div class="col-md-6">
                                            <input id="txtQualificationType" runat="server" type="text" placeholder="Qualification Type" value="" class="form-control">
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="ExpectedDategrade" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-ExpectedDategrade">
                                    <div class="form-row">
                                        <label id="labelExpectedDategrade" runat="server" for="EnglishCourse" class="col-md-3 col-form-label form-label">Expected dates when results will be declared </label>
                                        <div class="col-md-6">
                                            <input id="txtExpectedDategrade" runat="server" type="text" class="form-control" placeholder="Test Date" data-toggle="flatpickr" value="today">
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="testName" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-testName">
                                    <div class="form-row">
                                        <label id="labeltestName" runat="server" for="testName" class="col-md-3 col-form-label form-label">Test Name </label>
                                        <div class="col-md-6">
                                            <input id="txtTestName" runat="server" type="text" placeholder="Test Score" value="" class="form-control">
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="LanguageTestDate" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-LanguageTestDate">
                                    <div class="form-row">
                                        <label id="labelLanguageTestDate" runat="server" for="LanguageTestDate" class="col-md-3 col-form-label form-label">Test Date</label>
                                        <div class="col-md-6">
                                            <input id="txtLanguageTestDate" runat="server" type="text" class="form-control" placeholder="Test Date" data-toggle="flatpickr" value="today">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="LanguageScore" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-LanguageScore">
                                    <div class="form-row">
                                        <label id="labelLanguageScore" runat="server" for="LanguageScore" class="col-md-3 col-form-label form-label">Overall Score </label>
                                        <div class="col-md-6">
                                            <input id="txtLanguageScore" runat="server" type="text" placeholder="Test Score" value="" class="form-control">
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                        <a href="applicantworkexperience.aspx" class="btn btn-success" style="margin-right: 10px;">Work Experience</a>
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
    <script> $(document).ready(function () {
            $(".form-control")
                .mouseover(function () {
                    var controlId = $(this).attr('id');
                    var title = $(this).attr('title');
                    $("#tooltip").text(title);
                });
            var highschool = $("input[type=radio][name='ctl00$ContentPlaceHolder1$EnglishBackground']:checked").val()
            if (highschool == 'rblEnglishBackgroundYes') {
                $("#<%=Language.ClientID%>").show();
                $("#<%=YearCompletion.ClientID%>").show();
                $("#<%=NameCollege.ClientID%>").show();
                $("#<%=studymode.ClientID%>").show();
                $("#<%=QualificationType.ClientID%>").show();
                $("#<%=gradetype.ClientID%>").show();
                $("#<%=ExpectedDategrade.ClientID%>").hide();
                $("#<%=gradeachieved.ClientID%>").show();


            }
            else if (highschool == 'rblEnglishBackgroundNot') {
                $("#<%=Language.ClientID%>").show();
                $("#<%=YearCompletion.ClientID%>").show();
                $("#<%=NameCollege.ClientID%>").show();
                $("#<%=studymode.ClientID%>").show();
                $("#<%=QualificationType.ClientID%>").show();
                $("#<%=gradetype.ClientID%>").show();
                $("#<%=ExpectedDategrade.ClientID%>").show();
                $("#<%=gradeachieved.ClientID%>").hide();
            }
            else {
                $("#<%=Language.ClientID%>").hide();
                $("#<%=YearCompletion.ClientID%>").hide();
                $("#<%=NameCollege.ClientID%>").hide();
                $("#<%=studymode.ClientID%>").hide();
                $("#<%=QualificationType.ClientID%>").hide();
                $("#<%=gradetype.ClientID%>").hide();
                $("#<%=ExpectedDategrade.ClientID%>").hide();
                $("#<%=gradeachieved.ClientID%>").hide();
            }
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$EnglishBackground']").click(function () {
                if ($("#<%=rblEnglishBackgroundNo.ClientID%>").is(":checked")) {
                    $("#<%=Language.ClientID%>").hide();
                    $("#<%=YearCompletion.ClientID%>").hide();
                    $("#<%=NameCollege.ClientID%>").hide();
                    $("#<%=studymode.ClientID%>").hide();
                    $("#<%=QualificationType.ClientID%>").hide();
                    $("#<%=gradetype.ClientID%>").hide();
                    $("#<%=ExpectedDategrade.ClientID%>").hide();
                    $("#<%=gradeachieved.ClientID%>").hide();

                } else if ($("#<%=rblEnglishBackgroundNot.ClientID%>").is(":checked")) {
                    $("#<%=Language.ClientID%>").show();
                    $("#<%=YearCompletion.ClientID%>").show();
                    $("#<%=NameCollege.ClientID%>").show();
                    $("#<%=studymode.ClientID%>").show();
                    $("#<%=QualificationType.ClientID%>").show();
                    $("#<%=gradetype.ClientID%>").show();
                    $("#<%=ExpectedDategrade.ClientID%>").show();
                    $("#<%=gradeachieved.ClientID%>").hide();
                }
                else {
                    $("#<%=Language.ClientID%>").show();
                    $("#<%=YearCompletion.ClientID%>").show();
                    $("#<%=NameCollege.ClientID%>").show();
                    $("#<%=studymode.ClientID%>").show();
                    $("#<%=QualificationType.ClientID%>").show();
                    $("#<%=gradetype.ClientID%>").show();
                    $("#<%=ExpectedDategrade.ClientID%>").hide();
                    $("#<%=gradeachieved.ClientID%>").show();
                }
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$EnglishTest']").click(function () {
                if ($("#<%=rblEnglishBackgroundYes.ClientID%>").is(":checked")) {
                    $("#<%=LanguageScore.ClientID%>").show();
                    $("#<%=LanguageTestDate.ClientID%>").show();

                } else {
                    $("#<%=LanguageScore.ClientID%>").show();
                    $("#<%=LanguageTestDate.ClientID%>").show();

                }
            });
        });
        $('#ContentPlaceHolder1_txtLanguageTestDate').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtYearCompletion').flatpickr({

            dateFormat: 'Y-m-d'
        });
        $('#ContentPlaceHolder1_txtExpectedDategrade').flatpickr({

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



    </script>


</asp:Content>
