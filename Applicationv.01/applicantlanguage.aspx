<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantlanguage.aspx.cs" Inherits="applicantlanguage" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">English Language Competency

            </li>
        </ol>
        <h1 class="h2">ENGLISH LANGUAGE COMPETENCY

        </h1>

    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">
                        <div class="card-body list-group list-group-fit">

                            <div class="list-group-item" id="homelanguage" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-homelanguage">
                                    <div class="form-row">
                                        <label id="labelhomelanguage" runat="server" for="homelanguage" class="col-md-3 col-form-label form-label">WHICH LANGUAGE DO YOU SPEAK AT HOME?</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlhomelanguage" runat="server" CssClass="form-control"></asp:DropDownList>
                                            <span class="helpicon"><i id="ichomelanguage" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="EnglishBackground" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-EnglishBackground">
                                    <div class="form-row">
                                        <label id="labelEnglishBackground" runat="server" for="EnglishBackground" class="col-md-3 col-form-label form-label">HAVE YOU STUDIED AN ELICOS COURSE?</label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblEnglishBackgroundYes" runat="server" GroupName="EnglishBackground" Text="Yes" /> <br />
                                           <div class="clearfix big-rdtxtwrp"> <asp:RadioButton ID="rblEnglishBackgroundNot" runat="server" GroupName="EnglishBackground"  Text="No, I am currently studying an ELICOS course" /></div>
                                            <div class="clearfix big-rdtxtwrp"><asp:RadioButton ID="rblEnglishBackgroundNo" runat="server" GroupName="EnglishBackground" Text="No, I am not studying / have not studied an ELICOS course" /></div>
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
                                                <asp:HiddenField ID="hdfDateFoBrith" runat="server" />
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
                                                <asp:RadioButton ID="rblYetToConduct" CssClass="form-control frm-cntrl-rdo" runat="server" GroupName="HighschoolGrade" Text=" Examination not conducted yet" />
                                                <asp:RadioButton ID="rblNot" runat="server" CssClass="form-control frm-cntrl-rdo" GroupName="HighschoolGrade" Text="Examination Conducted, but Result not declared" />
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
                                        <label id="labelEnglishTest" runat="server" for="EnglishTest" class="col-md-3 col-form-label form-label">HAVE YOU TAKEN ANY ENGLISH LANGUAGE TEST?</label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rbyes" CssClass="form-control" runat="server" GroupName="testgiven" Text="Yes" />
                                            <asp:RadioButton ID="rbno" CssClass="form-control frm-cntrl-rdo" runat="server" GroupName="testgiven" Text="No" />
                                                <br/>
                                            <div id="testnameDiv" runat="server">
                                            <div class="form-check-inline">
                                                <div class="form-check-label">
                                                    <asp:RadioButton ID="rblLanguageielts" runat="server" GroupName="EnglishTest" Text="IELTS" />
                                                </div>
                                            </div>
                                            <div class="form-check-inline">
                                                <div class="form-check-label">
                                                    <asp:RadioButton ID="rblLanguagepte" runat="server" GroupName="EnglishTest" Text="PTE" />
                                                </div>
                                            </div>
                                            <div class="form-check-inline">
                                                <div class="form-check-label">
                                                    <asp:RadioButton ID="rblLanguagtofel" runat="server" GroupName="EnglishTest" Text="TOEFL iBT" />
                                                </div>
                                            </div>                                            
                                                <span class="helpicon"><i id="icEnglishTest" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                             <div id="ieltsfieldContainer" runat="server">
                                <div class="list-group-item" id="testName" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-testName">
                                        <div class="form-row">
                                            <label id="labeltestName" runat="server" for="testName" class="col-md-3 col-form-label form-label">Test Name </label>
                                            <div class="col-md-6">
                                                <input id="txtTestName" runat="server" type="text" placeholder="Enter your test name" value="" class="form-control">
                                                <span class="helpicon"><i id="ictestName" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                              </div>   
                                <div class="list-group-item" id="CandidateID" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-CandidateID">
                                        <div class="form-row">
                                            <label id="labelCandidateID" runat="server" for="CandidateID" class="col-md-3 col-form-label form-label">Candidate ID </label>
                                            <div class="col-md-6">
                                                <input id="txtCandidateID" runat="server" type="text" placeholder="Enter your candidate ID" value="" class="form-control">
                                                <span class="helpicon"><i id="icCandidateID" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="CandidateNo" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-CandidateNo">
                                        <div class="form-row">
                                            <label id="labelCandidateNo" runat="server" for="CandidateNo" class="col-md-3 col-form-label form-label">CANDIDATE NUMBER </label>
                                            <div class="col-md-6">
                                                <input id="txtCandidateNo" runat="server" type="text" placeholder="Enter your candidate number" value="" class="form-control">
                                                <span class="helpicon"><i id="icCandidateNo" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>  
                                <div class="list-group-item" id="ieltsTestDate" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-ieltsTestDate">
                                        <div class="form-row">
                                            <label id="labelieltsTestDate" runat="server" for="ieltsTestDate" class="col-md-3 col-form-label form-label">Test Date</label>
                                            <div class="col-md-6">
                                                <input id="txtieltsTestDate" runat="server" type="text" class="form-control" placeholder="Enter your test date" data-toggle="flatpickr" value="">
                                                <span class="helpicon"><i id="icieltsTestDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="CentreNo" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-CentreNo">
                                        <div class="form-row">
                                            <label id="labelCentreNo" runat="server" for="testName" class="col-md-3 col-form-label form-label">Test Centre No </label>
                                            <div class="col-md-6">
                                                <input id="txtCentreNo" runat="server" type="text" placeholder="Enter your centre number" value="" class="form-control">
                                                <span class="helpicon"><i id="icCenterno" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="list-group-item" id="ReadingScore" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-ReadingScore">
                                        <div class="form-row">
                                            <label id="labelReadingScore" runat="server" for="ReadingScore" class="col-md-3 col-form-label form-label">Reading Score</label>
                                            <div class="col-md-6">
                                                <input id="txtReading" runat="server" type="text" placeholder="Enter your Reading component score" value="" class="form-control">
                                                <span class="helpicon"><i id="icReadingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="ListeningScore" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-ListeningScore">
                                        <div class="form-row">
                                            <label id="labelListeningScore" runat="server" for="ListeningScore" class="col-md-3 col-form-label form-label">Listening Score</label>
                                            <div class="col-md-6">
                                                <input id="txtListening" runat="server" type="text" placeholder="Enter your Listening component score " value="" class="form-control">
                                                <span class="helpicon"><i id="icListeningScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="SpeakingScore" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-SpeakingScore">
                                        <div class="form-row">
                                            <label id="labelSpeakingScore" runat="server" for="SpeakingScore" class="col-md-3 col-form-label form-label">Speaking Score</label>
                                            <div class="col-md-6">
                                                <input id="txtSpeaking" runat="server" type="text" placeholder="Enter your Speaking component score" value="" class="form-control">
                                                <span class="helpicon"><i id="icSpeakingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>                            
                                <div class="list-group-item" id="WritingScore" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-WritingScore">
                                        <div class="form-row">
                                            <label id="labelWritingScore" runat="server" for="WritingScore" class="col-md-3 col-form-label form-label">Writing Score</label>
                                            <div class="col-md-6">
                                                <input id="txtWriting" runat="server" type="text" placeholder="Enter your Writing component score" value="" class="form-control">
                                                <span class="helpicon"><i id="icWritingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                
                                <div class="list-group-item" id="LanguageScore" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-LanguageScore">
                                        <div class="form-row">
                                            <label id="labelLanguageScore" runat="server" for="LanguageScore" class="col-md-3 col-form-label form-label">Total Score</label>
                                            <div class="col-md-6">
                                                <input id="txtLanguageScore" runat="server" type="text" placeholder="Total Score" value="" class="form-control">
                                                <span class="helpicon"><i id="icLanguageScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>                           
                             </div>
                            
                             <div id="ptefieldContainer" runat="server">
                                 <div class="list-group-item" id="ptetesttaker" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-ptetesttaker">
                                        <div class="form-row">
                                            <label id="labelptetesttaker" runat="server" for="ptetesttaker" class="col-md-3 col-form-label form-label">Test Taker ID</label>
                                            <div class="col-md-6">
                                                <input id="txtptetesttaker" runat="server" type="text" placeholder="Enter your test taker ID" value="" class="form-control">
                                                <span class="helpicon"><i id="icpteTesttaker" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                 </div>                           
                                 <div class="list-group-item" id="pteregistrationno" runat="server" style="display: none">  
                                    <div class="form-group m-0" role="group" aria-labelledby="label-pteregistrationno">
                                        <div class="form-row">
                                            <label id="labelpteregistrationno" runat="server" for="pteregistrationno" class="col-md-3 col-form-label form-label">Registration Number </label>
                                            <div class="col-md-6">
                                                <input id="txtpteregistrationNo" runat="server" type="text" placeholder="Enter your registration number" value="" class="form-control" maxlength="9">
                                                <span class="helpicon"><i id="icpteregistrationno" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                                 <div class="list-group-item" id="pteTestDate" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-pteTestDate">
                                        <div class="form-row">
                                            <label id="labelpteTestDate" runat="server" for="pteTestDate" class="col-md-3 col-form-label form-label">Test Date</label>
                                            <div class="col-md-6">
                                                <input id="txtpteTestDate" runat="server" type="text" class="form-control" placeholder="Enter your test date" data-toggle="flatpickr" value="">
                                                <span class="helpicon"><i id="icpteTestDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="list-group-item" id="ptecentercountry" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-ptecentercountry">
                                        <div class="form-row">
                                            <label id="labelptecentercountry" runat="server" for="ptecentercountry" class="col-md-3 col-form-label form-label">Test Center Country</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlptecentercountry" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                                <span class="helpicon"><i id="icptecountryt" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="list-group-item" id="ptetestcenterNo" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-ptetestcenterNo">
                                        <div class="form-row">
                                            <label id="labelptetestcenterNo" runat="server" for="ptetestcenterNo" class="col-md-3 col-form-label form-label">CENTER NUMBER </label>
                                            <div class="col-md-6">
                                                <input id="txtptetestcenterNo" runat="server" type="text" placeholder="Enter your center number" value="" class="form-control">
                                                <span class="helpicon"><i id="icptetestcenterNo" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                 <div class="list-group-item" id="pteReadingScore" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-pteReadingScore">
                                        <div class="form-row">
                                            <label id="labelpteReadingScore" runat="server" for="pteReadingScore" class="col-md-3 col-form-label form-label">COMMUNICATIVE SKILLS READING SCORE</label>
                                            <div class="col-md-6">
                                                <input id="txtpteReadingScore" runat="server" type="text" placeholder="Enter your Reading score" value="" class="form-control">
                                                <span class="helpicon"><i id="icpteReadingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="list-group-item" id="pteListeningScore" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-pteListeningScore">
                                        <div class="form-row">
                                            <label id="labelpteListeningScore" runat="server" for="pteListeningScore" class="col-md-3 col-form-label form-label">Listening Score</label>
                                            <div class="col-md-6">
                                                <input id="txtpteListeningScore" runat="server" type="text" placeholder="Enter your Listening score" value="" class="form-control">
                                                <span class="helpicon"><i id="icpteListeningScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="list-group-item" id="pteSpeakingScore" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-pteSpeakingScore">
                                        <div class="form-row">
                                            <label id="labelpteSpeakingScore" runat="server" for="pteSpeakingScore" class="col-md-3 col-form-label form-label">Speaking Score</label>
                                            <div class="col-md-6">
                                                <input id="txtpteSpeakingScore" runat="server" type="text" placeholder="Enter your Speaking score" value="" class="form-control">
                                                <span class="helpicon"><i id="icpteSpeakingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>                            
                                 <div class="list-group-item" id="pteWritingScore" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-pteWritingScore">
                                        <div class="form-row">
                                            <label id="labelpteWritingScore" runat="server" for="pteWritingScore" class="col-md-3 col-form-label form-label">Writing Score</label>
                                            <div class="col-md-6">
                                                <input id="txtpteWritingScore" runat="server" type="text" placeholder="Enter your Writing score" value="" class="form-control">
                                                <span class="helpicon"><i id="icpteWritingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                
                                 <div class="list-group-item" id="pteTotalScore" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-pteTotalScore">
                                        <div class="form-row">
                                            <label id="labelpteTotalScore" runat="server" for="pteTotalScore" class="col-md-3 col-form-label form-label">Total Score</label>
                                            <div class="col-md-6">
                                                <input id="txtpteTotalScore" runat="server" type="text" placeholder="Enter your total score" value="" class="form-control">
                                                <span class="helpicon"><i id="icpteTotalScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>   
                             </div>                             
                            
                             <div id="tofelfieldContainer" runat="server">

                                 <div class="list-group-item" id="tofelregistrationno" runat="server" style="display: none">  
                                    <div class="form-group m-0" role="group" aria-labelledby="label-tofelregistrationno">
                                        <div class="form-row">
                                            <label id="labeltofelregistrationno" runat="server" for="tofelregistrationno" class="col-md-3 col-form-label form-label">Registration Number </label>
                                            <div class="col-md-6">
                                                <input id="txttofelregistrationno" runat="server" type="text" placeholder="Enter your registration number" value="" class="form-control" maxlength="16">
                                                <span class="helpicon"><i id="ictofelregistrationno" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                                 <div class="list-group-item" id="tofelTestDate" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-tofelTestDate">
                                        <div class="form-row">
                                            <label id="labeltofelTestDate" runat="server" for="tofelTestDate" class="col-md-3 col-form-label form-label">Test Date</label>
                                            <div class="col-md-6">
                                                <input id="txttofelTestDate" runat="server" type="text" class="form-control" placeholder="Enter your test date" data-toggle="flatpickr" value="">
                                                <span class="helpicon"><i id="ictofelTestDate" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="list-group-item" id="tofelcentercountry" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-tofelcentercountry">
                                        <div class="form-row">
                                            <label id="labeltofelcentercountry" runat="server" for="tofelcentercountry" class="col-md-3 col-form-label form-label">Test Center Country</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddltofelcentercountry" runat="server" CssClass="form-control">
                                                </asp:DropDownList>
                                                <span class="helpicon"><i id="ictofelcentercountry" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="list-group-item" id="tofelcenterNo" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-tofelcenterNo">
                                        <div class="form-row">
                                            <label id="labeltofelcenterNo" runat="server" for="tofelcenterNo" class="col-md-3 col-form-label form-label">Centre Number </label>
                                            <div class="col-md-6">
                                                <input id="txttofelcenterNo" runat="server" type="text" placeholder="Enter your centre number" value="" class="form-control">
                                                <span class="helpicon"><i id="itofelcenterNo" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                 <div class="list-group-item" id="tofelReadingScore" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-tofelReadingScore">
                                        <div class="form-row">
                                            <label id="labeltofelReadingScore" runat="server" for="tofelReadingScore" class="col-md-3 col-form-label form-label">Reading Score</label>
                                            <div class="col-md-6">
                                                <input id="txttofelReadingScore" runat="server" type="text" placeholder="Enter your Reading score" value="" class="form-control">
                                                <span class="helpicon"><i id="ictofelReadingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="list-group-item" id="tofelListeningScore" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-tofelListeningScore">
                                        <div class="form-row">
                                            <label id="labeltofelListeningScore" runat="server" for="tofelListeningScore" class="col-md-3 col-form-label form-label">Listening Score</label>
                                            <div class="col-md-6">
                                                <input id="txttofelListeningScore" runat="server" type="text" placeholder="Enter your Listening Score " value="" class="form-control">
                                                <span class="helpicon"><i id="ictofelListeningScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                 <div class="list-group-item" id="tofelSpeakingScore" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-tofelSpeakingScore">
                                        <div class="form-row">
                                            <label id="labeltofelSpeakingScore" runat="server" for="tofelSpeakingScore" class="col-md-3 col-form-label form-label">Speaking Score</label>
                                            <div class="col-md-6">
                                                <input id="txttofelSpeakingScore" runat="server" type="text" placeholder="Enter your Speaking Score" value="" class="form-control">
                                                <span class="helpicon"><i id="ictofelSpeakingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>                            
                                 <div class="list-group-item" id="tofelWritingScore" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-tofelWritingScore">
                                        <div class="form-row">
                                            <label id="labeltofelWritingScore" runat="server" for="tofelWritingScore" class="col-md-3 col-form-label form-label">Writing Score</label>
                                            <div class="col-md-6">
                                                <input id="txttofelWritingScore" runat="server" type="text" placeholder="Enter your Writing Score " value="" class="form-control">
                                                <span class="helpicon"><i id="ictofelWritingScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>                                
                                 <div class="list-group-item" id="tofelTotalScore" runat="server" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-tofelTotalScore">
                                        <div class="form-row">
                                            <label id="labeltofelTotalScore" runat="server" for="tofelTotalScore" class="col-md-3 col-form-label form-label">Total Score</label>
                                            <div class="col-md-6">
                                                <input id="txttofelTotalScore" runat="server" type="text" placeholder="Enter your Total Score" value="" class="form-control">
                                                <span class="helpicon"><i id="ictofelTotalScore" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>   
                             </div>   

                            <div runat="server" id="cefr_referenceDiv">
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
                                        <label id="labeltestRefno" runat="server" for="testRefno" class="col-md-3 col-form-label form-label">TEST REPORT REFERENCE NUMBER </label>
                                        <div class="col-md-6">
                                            <input id="txttestRefno" runat="server" type="text" placeholder="Enter your test report reference number" value="" class="form-control">
                                            <span class="helpicon"><i id="ictestRefno" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            </div>

                            <div id="mainDiv" runat="server"></div>
                            <div class="list-group-item" id="employerwebsite" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row justify-content-between">
                                        <asp:Button ID="btnlanguagecompetency" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnlanguagecompetency_Click" OnClientClick="return validateForm()"/>
                                        <asp:Button ID="gotoNextPage" runat="server" Text="Go To Work Experience" CssClass="btn btn-success" OnClick="gotoNextPage_Click" OnClientClick="return validateForm()"/>                                       
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
                    <div class="col-md-4">
                     <div class="banImg-wrp">
                        <img src="/assets/images/Banner1.jpg" class="img-fluid">
                    </div>

                    <div class="card faq-qwrp" id="questions" runat="server">
                            <div class="card-body">
                            <%  if (allQuestions.Count > 0)
                                { %>
                            <div id="question" runat="server">
                                    <h5>Frequently Asked Questions (FAQs)</h5>
                                    <div class="">
                                    <%for (int q = 0; q < allQuestions.Count; q++)
                                        {%>  <div class="star-list">                                                             
                                                <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer.Replace(Environment.NewLine, "<br />") %>')">  <%=allQuestions[q].question%> </label>
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
        function validateForm() {
            
            var checkuptoThirty = /^(0?[1-9]|[12][0-9]|3[0])$/;
            var checkuptoHundred = /^([0-9]|([1-9][0-9])|100)$/;
            var checkninedigit = /^\d{9}$/;
            var checktesterId = /PTE[0-9]{9}\b/;
            var checksixteendigit = /^\d{16}$/;
            var checOnlykNum = /^[0-9]*$/;
            var flag = false;
            if (!$("#<%=homelanguage.ClientID%>").is(':hidden') && ($("#<%=ddlhomelanguage.ClientID%>").val() == "0"))
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

                    if (!$("#<%=EnglishTest.ClientID%>").is(':hidden') && !($("#<%=rbyes.ClientID%>").is(':checked') || $("#<%=rbno.ClientID%>").is(':checked'))) {
                        alert("Please Select Option If You Have you given any English Language competency tests ");
                        return false;
                    }                   
                    if ($("#<%=rbyes.ClientID%>").is(':checked'))
                    {
                        if (!$("#<%=EnglishTest.ClientID%>").is(':hidden') && !($("#<%=rblLanguageielts.ClientID%>").is(':checked') || $("#<%=rblLanguagepte.ClientID%>").is(':checked') || $("#<%=rblLanguagtofel.ClientID%>").is(':checked'))) {
                            alert("Please Select Option English Language competency tests ");
                            return false;
                        }

                        if ($("#<%=rblLanguagtofel.ClientID%>").is(':checked')) {
                            if ((!$("#<%=tofelregistrationno.ClientID%>").is(':hidden') && $("#<%=txttofelregistrationno.ClientID%>").val() == "") || !checksixteendigit.test($("#<%=txttofelregistrationno.ClientID%>").val())) {
                                alert("Please Enter valid Registration number");
                                return false;
                            }
                            else if (!$("#<%=tofelTestDate.ClientID%>").is(':hidden') && $("#<%=txttofelTestDate.ClientID%>").val() == "") {
                                alert("Please Select Test Date");
                                return false;
                            }
                            else if (!$("#<%=tofelcenterNo.ClientID%>").is(':hidden') && $("#<%=txttofelcenterNo.ClientID%>").val() == "") {
                                alert("Please Enter Center Number");
                                return false;
                            }
                            else if (!$("#<%=tofelcentercountry.ClientID%>").is(':hidden') && $("#<%=ddltofelcentercountry.ClientID%>").val() == "0") {
                                alert("Please Select Test Country");
                                return false;
                            }
                            else if ((!$("#<%=tofelReadingScore.ClientID%>").is(':hidden') && $("#<%=txttofelReadingScore.ClientID%>").val() == "") || !checkuptoThirty.test($("#<%=txttofelReadingScore.ClientID%>").val())) {
                                alert("Please Enter valid Reading Score");
                                return false;
                            }
                            else if ((!$("#<%=tofelListeningScore.ClientID%>").is(':hidden') && $("#<%=txttofelListeningScore.ClientID%>").val() == "") || !checkuptoThirty.test($("#<%=txttofelListeningScore.ClientID%>").val())) {
                                alert("Please Enter valid Listening Score ");
                                return false;
                            }
                            else if ((!$("#<%=tofelSpeakingScore.ClientID%>").is(':hidden') && $("#<%=txttofelSpeakingScore.ClientID%>").val() == "") || !checkuptoThirty.test($("#<%=txttofelSpeakingScore.ClientID%>").val())) {
                                alert("Please Enter valid Speaking Score ");
                                return false;
                            }
                            else if ((!$("#<%=tofelWritingScore.ClientID%>").is(':hidden') && $("#<%=txttofelWritingScore.ClientID%>").val() == "") || !checkuptoThirty.test($("#<%=txttofelWritingScore.ClientID%>").val())) {
                                alert("Please Enter valid Writing Score ");
                                return false;
                            }
                            else if ((!$("#<%=tofelTotalScore.ClientID%>").is(':hidden') && (parseInt($("#<%=txttofelTotalScore.ClientID%>").val()) < 0 || parseInt($("#<%=txttofelTotalScore.ClientID%>").val()) > 120)) || $("#<%=txttofelTotalScore.ClientID%>").val() == "" || !checOnlykNum.test($("#<%=txttofelTotalScore.ClientID%>").val())) {
                                alert("Please Enter valid Total Score");
                                return false;
                            }
                            else
                                flag = true;
                        }
                        else if ($("#<%=rblLanguagepte.ClientID%>").is(':checked')) {
                            if ((!$("#<%=ptetesttaker.ClientID%>").is(':hidden') && $("#<%=txtptetesttaker.ClientID%>").val() == "") || !checktesterId.test($("#<%=txtptetesttaker.ClientID%>").val())) {
                                alert("Please Enter valid Test Taker ID");
                                return false;
                            }
                            else if ((!$("#<%=pteregistrationno.ClientID%>").is(':hidden') && $("#<%=txtpteregistrationNo.ClientID%>").val() == "") || !checkninedigit.test($("#<%=txtpteregistrationNo.ClientID%>").val())) {
                                alert("Please Enter valid Registration number");
                                return false;
                            }
                            else if (!$("#<%=pteTestDate.ClientID%>").is(':hidden') && $("#<%=txtpteTestDate.ClientID%>").val() == "") {
                                alert("Please Select Test Date");
                                return false;
                            }
                            else if (!$("#<%=ptetestcenterNo.ClientID%>").is(':hidden') && $("#<%=txtptetestcenterNo.ClientID%>").val() == "") {
                                alert("Please Enter Center Number");
                                return false;
                            }
                            else if (!$("#<%=ptecentercountry.ClientID%>").is(':hidden') && $("#<%=ddlptecentercountry.ClientID%>").val() == "0") {
                                alert("Please Select Test Country");
                                return false;
                            }
                            else if ((!$("#<%=pteReadingScore.ClientID%>").is(':hidden') && $("#<%=txtpteReadingScore.ClientID%>").val() == "") || !checkuptoHundred.test($("#<%=txtpteReadingScore.ClientID%>").val())) {
                                alert("Please Enter valid Reading Score");
                                return false;
                            }
                            else if ((!$("#<%=pteListeningScore.ClientID%>").is(':hidden') && $("#<%=txtpteListeningScore.ClientID%>").val() == "") || !checkuptoHundred.test($("#<%=txtpteListeningScore.ClientID%>").val())) {
                                alert("Please Enter valid Listening Score");
                                return false;
                            }
                            else if ((!$("#<%=pteSpeakingScore.ClientID%>").is(':hidden') && $("#<%=txtpteSpeakingScore.ClientID%>").val() == "") || !checkuptoHundred.test($("#<%=txtpteSpeakingScore.ClientID%>").val())) {
                                alert("Please Enter valid Speaking Score");
                                return false;
                            }
                            else if ((!$("#<%=pteWritingScore.ClientID%>").is(':hidden') && $("#<%=txtpteWritingScore.ClientID%>").val() == "") || !checkuptoHundred.test($("#<%=txtpteWritingScore.ClientID%>").val())) {
                                alert("Please Enter valid Writing Score");
                                return false;
                            }
                            else if ((!$("#<%=pteTotalScore.ClientID%>").is(':hidden') && $("#<%=txtpteTotalScore.ClientID%>").val() == "") || !checkuptoHundred.test($("#<%=txtpteTotalScore.ClientID%>").val())) {
                                alert("Please Enter valid Total Score");
                                return false;
                            }
                            else
                                flag = true;
                        }
                        else if ($("#<%=rblLanguageielts.ClientID%>").is(':checked')) {
                            if (!$("#<%=testName.ClientID%>").is(':hidden') && $("#<%=txtTestName.ClientID%>").val() == "") {
                                alert("Please Enter Test Name");
                                return false;
                            }
                            else if (!$("#<%=CandidateID.ClientID%>").is(':hidden') && $("#<%=txtCandidateID.ClientID%>").val() == "") {
                                alert("Please Enter Candidate ID");
                                return false;
                            }
                            else if (!$("#<%=CandidateNo.ClientID%>").is(':hidden') && $("#<%=txtCandidateNo.ClientID%>").val() == "") {
                                alert("Please Enter Candidate Number");
                                return false;
                            }
                            else if (!$("#<%=ieltsTestDate.ClientID%>").is(':hidden') && $("#<%=txtieltsTestDate.ClientID%>").val() == "") {
                                alert("Please Select Test Date");
                                return false;
                            }
                            else if (!$("#<%=CentreNo.ClientID%>").is(':hidden') && $("#<%=txtCentreNo.ClientID%>").val() == "") {
                                alert("Please Enter Center Number");
                                return false;
                            }
                            else if (!$("#<%=ReadingScore.ClientID%>").is(':hidden') && $("#<%=txtReading.ClientID%>").val() == "") {
                                alert("Please Enter Reading Score");
                                return false;
                            }
                            else if (!$("#<%=ListeningScore.ClientID%>").is(':hidden') && $("#<%=txtListening.ClientID%>").val() == "") {
                                alert("Please Enter Listening Score");
                                return false;
                            }
                            else if (!$("#<%=SpeakingScore.ClientID%>").is(':hidden') && $("#<%=txtSpeaking.ClientID%>").val() == "") {
                                alert("Please Enter Speaking Score");
                                return false;
                            }
                            else if (!$("#<%=WritingScore.ClientID%>").is(':hidden') && $("#<%=txtWriting.ClientID%>").val() == "") {
                                alert("Please Enter Writing Score");
                                return false;
                            }
                            else if (!$("#<%=LanguageScore.ClientID%>").is(':hidden') && $("#<%=txtLanguageScore.ClientID%>").val() == "") {
                                alert("Please Enter OverAll Score");
                                return false;
                            }
                            else
                                flag = true;
                        }
                        else
                            flag = true;
                    }
                    else if ($("#<%=rbno.ClientID%>").is(':checked')) {
                        if (!$("#<%=CEFR.ClientID%>").is(':hidden') && $("#<%=ddlCEFR.ClientID%>").val() === "0") {
                            alert("Please Select CEFR Test");
                            return false;
                        }
                        else if (!$("#<%=testRefno.ClientID%>").is(':hidden') && $("#<%=txttestRefno.ClientID%>").val() == "") {
                            alert("Please Enter Test Refference Number");
                            return false;
                        }
                        else
                            flag = true;
                    }
                    else
                    flag = true;
                }                
                else
                    flag = true;
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

            $("#<%=txtCandidateID.ClientID%>").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            }); $("#<%=txtCandidateNo.ClientID%>").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            }); $("#<%=txtCentreNo.ClientID%>").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            }); $("#<%=txtReading.ClientID%>").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });
            $("#<%=txtListening.ClientID%>").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });
            $("#<%=txtSpeaking.ClientID%>").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            }); $("#<%=txtWriting.ClientID%>").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });
            $("#<%=txtLanguageScore.ClientID%>").keypress(function (e) {
                if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                    return false;
                }
            });
            $("#<%=txtYearCompletion.ClientID%>").change(function () {
                
                const d = new Date($("#<%=hdfDateFoBrith.ClientID%>").val());
                const txtYearCompletion = new Date($("#<%=txtYearCompletion.ClientID%>").val());
                if (txtYearCompletion.getFullYear() <= d.getFullYear()) {
                    alert("Please select YEAR OF COMPLETION/EXPECTED greater than DATE OF BIRTHDAY YEAR.");
                    $("#<%=txtYearCompletion.ClientID%>").val('');
                }
            });

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

            //test IELTS
            if ($("#<%=rblLanguageielts.ClientID%>").is(":checked")) 
                $("#<%=ieltsfieldContainer.ClientID%>").show();
            else
                $("#<%=ieltsfieldContainer.ClientID%>").hide();
                         
           
            //test PTE
            if ($("#<%=rblLanguagepte.ClientID%>").is(":checked")) 
                $("#<%=ptefieldContainer.ClientID%>").show();
            else 
                $("#<%=ptefieldContainer.ClientID%>").hide();
                  
            //test TOFEL
            if ($("#<%=rblLanguagtofel.ClientID%>").is(":checked")) 
                $("#<%=tofelfieldContainer.ClientID%>").show();
            else 
                $("#<%=tofelfieldContainer.ClientID%>").hide();

            if ($("#<%=rbyes.ClientID%>").is(":checked")) {
                $("#<%= testnameDiv.ClientID%>").show();
                $("#<%= cefr_referenceDiv.ClientID%>").hide();
            }
            else {
                $("input[name='ctl00$ContentPlaceHolder1$EnglishTest']").prop('checked', false);
                $("#<%= testnameDiv.ClientID%>").hide();
                $("#<%=ieltsfieldContainer.ClientID%>").hide();
                $("#<%=ptefieldContainer.ClientID%>").hide();
                $("#<%=tofelfieldContainer.ClientID%>").hide();
                $("#<%= cefr_referenceDiv.ClientID%>").show();
            }
        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$testgiven']").click(function () {
                if ($("#<%=rbyes.ClientID%>").is(":checked")) {
                    $("#<%= testnameDiv.ClientID%>").show();
                    $("#<%= cefr_referenceDiv.ClientID%>").hide();
                }
                else {
                    $("input[name='ctl00$ContentPlaceHolder1$EnglishTest']").prop('checked', false);
                    $("#<%= testnameDiv.ClientID%>").hide();
                    $("#<%=ieltsfieldContainer.ClientID%>").hide();
                    $("#<%=ptefieldContainer.ClientID%>").hide();
                    $("#<%=tofelfieldContainer.ClientID%>").hide();
                    $("#<%= cefr_referenceDiv.ClientID%>").show();
                }
            });
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
                if ($("#<%=rblLanguagtofel.ClientID%>").is(":checked")) 
                    $("#<%=tofelfieldContainer.ClientID%>").show();
                else 
                    $("#<%=tofelfieldContainer.ClientID%>").hide();
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$EnglishTest']").click(function () {
                if ($("#<%=rblLanguageielts.ClientID%>").is(":checked")) 
                    $("#<%=ieltsfieldContainer.ClientID%>").show();
                else
                    $("#<%=ieltsfieldContainer.ClientID%>").hide();
                     
            });
        });
         $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$EnglishTest']").click(function () {
                if ($("#<%=rblLanguagepte.ClientID%>").is(":checked")) 
                    $("#<%=ptefieldContainer.ClientID%>").show();
                else 
                    $("#<%=ptefieldContainer.ClientID%>").hide();
            });
        });

        $('#ContentPlaceHolder1_txtieltsTestDate').flatpickr({

            dateFormat: 'Y-m-d', defaultDate: "",maxDate:"today"
        });
        
        $('#ContentPlaceHolder1_txtpteTestDate').flatpickr({

            dateFormat: 'Y-m-d', defaultDate: "",maxDate:"today"
        });

        $('#ContentPlaceHolder1_txttofelTestDate').flatpickr({

            dateFormat: 'Y-m-d', defaultDate: "",maxDate:"today"
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
