<%@ Page Language="C#" AutoEventWireup="true" CodeFile="personaldetails.aspx.cs" Inherits="personaldetails" MasterPageFile="~/student.master" EnableEventValidation="false" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Personal Details</li>
        </ol>
        <h1 class="h2">PERSONAL DETAILS</h1>

    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">                
                  <div class="col-md-8">
                    <div class="card">
                        <div class="card-body list-group list-group-fit">
                            <div class="list-group-item" id="title" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-title">
                                    <div class="form-row">
                                        <label runat="server" id="labeltitle" for="title" class="col-md-3 col-form-label form-label">* Title</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlTitle" CssClass="form-control" runat="server">
                                            </asp:DropDownList> <span class="helpicon"><i id="icTitle" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            <input style="display: none" id="txtTitle" runat="server" type="text" placeholder="Title" value="" class="form-control"> <span class="helpicon"><i id="icOtherTitle" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="firstname" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-firstname">
                                    <div class="form-row">
                                        <label id="labelfirstname" runat="server" for="firstname" class="col-md-3 col-form-label form-label">First Name *</label>
                                        <div class="col-md-6">
                                            <input id="txtFirstName" runat="server" type="text" placeholder="Enter your legal first name" value="" class="form-control" required=""> <span class="helpicon"><i id="icfirstname" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            
                                        </div>
                                    </div>
                                    <asp:CheckBox ID="passportFirstName" runat="server" /><span class="form-label">PLEASE CONFIRM THAT YOUR FIRST NAME GIVEN ABOVE IS THE SAME ON YOUR PASSPORT</span>
                                </div>
                            </div>
                            <div class="list-group-item" id="middlename" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-middlename">
                                    <div class="form-row">
                                        <label id="labelmiddlename" runat="server" for="middlename" class="col-md-3 col-form-label form-label">Middle Name(s)</label>
                                        <div class="col-md-6">
                                            <input id="txtMiddleName" runat="server" type="text" placeholder="Enter your legal middle name(s)" value="" class="form-control"> <span class="helpicon"><i id="icmiddlename" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                    <asp:CheckBox ID="passportMiddleName" runat="server" /><span class="form-label">PLEASE CONFIRM THAT YOUR MIDDLE NAME(S) GIVEN ABOVE IS THE SAME ON YOUR PASSPORT</span>
                                </div>
                            </div>
                            <div class="list-group-item" id="lastname" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-lastname">
                                    <div class="form-row">
                                        <label id="labellastname" runat="server" for="lastname" class="col-md-3 col-form-label form-label">Family Name *</label>
                                        <div class="col-md-6">
                                            <input id="txtLastName" runat="server" type="text" class="form-control" placeholder="Enter your legal family name / surname" required=""> <span class="helpicon"><i id="iclastname" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                          
                                    </div>
                                    </div>
                                    <asp:CheckBox ID="passportLastName" runat="server" /><span class="form-label">PLEASE CONFIRM THAT YOUR FAMILY NAME GIVEN ABOVE IS THE SAME ON YOUR PASSPORT</span>
                                </div>
                            </div>
                            <div class="list-group-item" id="preferedname" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-preferreName">
                                    <div class="form-row">
                                        <label id="labelpreferreName" runat="server" for="preferreName" class="col-md-3 col-form-label form-label">Preferred Name</label>
                                        <div class="col-md-9">
                                            <input id="txtPreferedName" runat="server" type="text" class="form-control" placeholder="How would you like us to address you"> <span class="helpicon"><i id="icPreferredname" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="list-group-item" id="dob" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dob">
                                    <div class="form-row">
                                        <label id="labeldob" runat="server" for="dob" class="col-md-3 col-form-label form-label">Date of birth *</label>
                                        <div class="col-md-6"> 
                                            <asp:DropDownList ID="ddlYear" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0" Selected="True">Select Year</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlMonth" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0" Selected="True">Select Month</asp:ListItem>
                                            </asp:DropDownList>                                            
                                            <asp:DropDownList ID="ddlDay" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="">Select Day</asp:ListItem>
                                            </asp:DropDownList> <span class="helpicon"><i id="icDoB" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            <asp:HiddenField runat="server" ID="hidDOBDate"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="gender" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-gender">
                                    <div class="form-row">
                                        <label id="labelgender" runat="server" for="gender" class="col-md-3 col-form-label form-label">Gender *</label>
                                        <div class="col-md-9">
                                            <input type="radio" id="rbtnMale" runat="server" name="gender" required>Male</input>
                                            <input type="radio" id="rbtnFemale" runat="server" name="gender" required>Female</input>
                                            <input type="radio" id="rbtnOther" runat="server" name="gender" required>Other</input>
                                            <input type="radio" id="rbtnPreferNot" runat="server" name="gender" required>Prefer not to say</input>
                                             <span class="helpicon"><i id="icGender" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="nationality" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Nationality">
                                    <div class="form-row">
                                        <label id="labelNationality" runat="server" for="Nationality" class="col-md-3 col-form-label form-label">Citizenship</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlNationality" CssClass="form-control" runat="server">
                                            </asp:DropDownList>
                                             <span class="helpicon"><i id="icNationality" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group m-0" id="chineseCode" runat="server" role="group" aria-labelledby="label-chineseCommercialCode" style="display: none">
                                    <div class="form-row">
                                        <label id="labelChineseCode" runat="server" for="chineseCommercialCode" class="col-md-3 col-form-label form-label">Do you ever use a Chinese Commercial Code Number for your names?</label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblChineseCodeYes" runat="server" CssClass="form-control" GroupName="chineseCommercialCode" Text="Yes" />
                                            <asp:RadioButton ID="rblChineseCodeNo" runat="server" CssClass="form-control" GroupName="chineseCommercialCode" Text="No" />
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group m-0" role="group" runat="server" id="textChineseCodeDiv" style="display: none" aria-labelledby="label-chineseCodeNumber">
                                    <div class="form-row">
                                        <label id="lblChineseCodeNumber" runat="server" for="chineseCodeNumber" class="col-md-3 col-form-label form-label">Chinese Commercial Code Number</label>
                                        <div class="col-md-6">
                                            <input id="txtChineseCodeNumber" runat="server" type="text" class="form-control" placeholder="Chinese Commercial Code Number" />
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group m-0" id="russianName" runat="server" role="group" aria-labelledby="label-russianPatronymicName" style="display: none">
                                    <div class="form-row">
                                        <label id="labelRussianName" runat="server" for="russianPatronymicName" class="col-md-3 col-form-label form-label">In English, provide your patronymic name</label>
                                        <div class="col-md-6">
                                            <input id="txtPatronymicName" runat="server" type="text" class="form-control" placeholder="Patronymic name in English" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="dualNationality" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dualNationality">
                                    <div class="form-row">
                                        <label id="labelDualNationality" runat="server" for="dualNationality" class="col-md-3 col-form-label form-label">Do you have dual Citizenship?</label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblNationalityYes" runat="server" CssClass="form-control" GroupName="dualnationality" Text="Yes" />
                                            <asp:RadioButton ID="rblNationalityNo" runat="server" CssClass="form-control" GroupName="dualnationality" Text="No" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="secondNation" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-SecondNationality">
                                    <div class="form-row">
                                        <label id="labelSecondNation" runat="server" for="SecondNationality" class="col-md-3 col-form-label form-label">Citizenship</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlOtherNation" CssClass="form-control" runat="server">
                                            </asp:DropDownList>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="birthcountry" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-birthcountry">
                                    <div class="form-row">
                                        <label id="labelbirthcountry" runat="server" for="birthcountry" class="col-md-3 col-form-label form-label">Country of birth</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlBirthCountry" runat="server" CssClass="form-control">
                                            </asp:DropDownList> <span class="helpicon"><i id="icBirthCountry" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="marital" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Marital">
                                    <div class="form-row">
                                        <label id="labelMarital" runat="server" for="Marital" class="col-md-3 col-form-label form-label">Marital Status</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMarital" runat="server" CssClass="form-control"> 
                                            </asp:DropDownList> <span class="helpicon"><i id="icMarital" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                                <div id="statusMarried" runat="server" role="group" style="display: none">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-spouseName">
                                        <div class="form-row">
                                            <label id="lblSpouseName" runat="server" for="spouseName" class="col-md-3 col-form-label form-label">Spouse Name</label>
                                            <div class="col-md-6">
                                                <input id="txtSpouseName" runat="server" type="text" placeholder="Spouse Name" value="" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group m-0" role="group" aria-labelledby="label-NationalitySpouse">
                                        <div class="form-row">
                                            <label id="lblSpouseNatinality" runat="server" for="NationalitySpouse" class="col-md-3 col-form-label form-label">Nationality of Spouse</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSpouseNationality" CssClass="form-control" runat="server">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group m-0" role="group" aria-labelledby="label-spousedob">
                                        <div class="form-row">
                                            <label id="lblSpouseDOB" runat="server" for="spousedob" class="col-md-3 col-form-label form-label">Spouse Date of birth</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlSpouseDOBYear" CssClass="form-control" runat="server">
                                                    <asp:ListItem Value="0" Selected="True">Select Year</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="ddlSpouseDOBMonth" CssClass="form-control" runat="server">
                                                    <asp:ListItem Value="0" Selected="True">Select Month</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="ddlSpouseDOBDate" CssClass="form-control" runat="server">
                                                    <asp:ListItem Value="">Select Day</asp:ListItem>
                                                </asp:DropDownList>
                                                 <asp:HiddenField ID="hidSpouseDOBDateField" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group m-0" role="group" aria-labelledby="label-marriagedate">
                                        <div class="form-row">
                                            <label id="lblMarriageDate" runat="server" for="marriagedate" class="col-md-3 col-form-label form-label">Date of Marriage</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlMarriageYear" CssClass="form-control" runat="server">
                                                    <asp:ListItem Value="0" Selected="True">Select Year</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="ddlMarriageMonth" CssClass="form-control" runat="server">
                                                    <asp:ListItem Value="0" Selected="True">Select Month</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:DropDownList ID="ddlMarriageDate" CssClass="form-control" runat="server">
                                                    <asp:ListItem Value="">Select Day</asp:ListItem>
                                                </asp:DropDownList>
                                                  <asp:HiddenField ID="hidMarriageDateField" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="list-group-item" id="higheststudy" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-higheststudy">
                                    <div class="form-row">
                                        <label id="lblhigheststudy" runat="server" for="higheststudy" class="col-md-3 col-form-label form-label">HIGHEST LEVEL OF STUDY SUCCESSFULLY COMPLETED</label>
                                        <div class="col-md-6">
                                        <asp:DropDownList runat="server" ID="ddlhigheststudy"  CssClass="form-control">
                                        </asp:DropDownList>    
                                         </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="fieldstudy" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-fieldstudy">
                                    <div class="form-row">
                                        <label id="lblfieldstudy" runat="server" for="fieldstudy" class="col-md-3 col-form-label form-label">HIGHEST FIELD OF STUDY SUCCESSFULLY COMPLETED</label>
                                        <div class="col-md-6">
                                        <asp:DropDownList runat="server" ID="ddlfieldstudy" CssClass="form-control">
                                        </asp:DropDownList>    
                                         </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="highestQualificationCountry" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highestQualificationCountry">
                                    <div class="form-row">
                                        <label id="labelhighestQualificationCountry" runat="server" for="highestQualificationCountry" class="col-md-3 col-form-label form-label">Country of Highest Qualificatiion Achieved</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlHighestQualificationCountry" runat="server" CssClass="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item frm-rdbtn" id="highQualificationCompleteDate" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-highQualificationCompleteDate">
                                    <div class="form-row">
                                        <label id="lblhighQualificationCompleteDate" runat="server" for="highQualificationCompleteDate" class="col-md-3 col-form-label form-label">Completion Date </label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlHighQualificationCompletedYear" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0" Selected="True">Select Year</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlHighQualificationCompletedMonth" CssClass="form-control" runat="server">
                                                <asp:ListItem Value="0" Selected="True">Select Month</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="disability" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-disability">
                                    <div class="form-row">
                                        <label id="labeldisability" runat="server" for="disability" class="col-md-3 col-form-label form-label">DO YOU HAVE ANY DISABILITY, IMPAIRMENT OR LONG-TERM CONDITION? </label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblDisabilityYes" runat="server" CssClass="form-control" GroupName="disability" Text="Yes" />
                                            <asp:RadioButton ID="rblDisabilityNo" runat="server" CssClass="form-control" GroupName="disability" Text="No" /> <span class="helpicon"><i id="icdisability" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="disabilitydesc" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-disabilitydesc">
                                    <div class="form-row">
                                        <label id="labeldisabilitydesc" runat="server" for="disabilitydesc" class="col-md-3 col-form-label form-label">Disability Description</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlDisability" runat="server" CssClass="form-control"></asp:DropDownList><span class="helpicon"><i id="icdisabilitydescription" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="agent" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-agent">
                                    <div class="form-row">
                                        <label id="labelagent" runat="server" for="agent" class="col-md-3 col-form-label form-label">ARE YOU REFERRED BY AN AGENT?</label>
                                        <div class="col-md-6">
                                            <asp:RadioButton ID="rblAgentYes" runat="server" CssClass="form-control" GroupName="agent" Text="Yes" />
                                            <asp:RadioButton ID="rblAgentNo" runat="server" CssClass="form-control" GroupName="agent" Text="No" /><span class="helpicon"><i id="icAgent" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="agentList" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-agentList">
                                    <div class="form-row">
                                        <label id="labelagentList" runat="server" for="agentList" class="col-md-3 col-form-label form-label">Agent Name</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlAgent" runat="server" CssClass="form-control"></asp:DropDownList><span class="helpicon"><i id="icAgentList" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="addnewagent" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-addnewagent">
                                    <div class="form-row">
                                        <label id="labeladdnewagent" runat="server" for="addnewagent" class="col-md-3 col-form-label form-label">IF YOU DIDN’T FIND YOUR AGENT NAME IN THE LIST, ADD YOUR AGENT’S EMAILL ID TO SEND THEM A REGISTRATION LINK</label>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="txtAgentname" runat="server" CssClass="form-control"></asp:TextBox><span class="helpicon"><i id="icNewAgent" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            &nbsp;
                                              <div class="col-md-6">
                                                  <asp:Button ID="btnNewAgent" runat="server" Text="Ask Agent to Register" CssClass="btn btn-success" OnClick="btnNewAgent_Click" />
                                              </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                               <div id="mainDiv" runat="server"></div>
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row justify-content-between">                                        
                                        <asp:Button ID="btn_login" OnClientClick="return validateForm();" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btn_login_Click" />
                                        <asp:Button ID="gotoNextPage" runat="server" Text="Go to Contact Details section" CssClass="btn btn-success" OnClick="gotoNextPage_Click" OnClientClick="return validateForm()"/>                                                                               
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
                                                <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer.Replace(Environment.NewLine, "<br />") %>')" >  <%=allQuestions[q].question%> </label>
                                            </div>                                                  
                                    <%} %>
                                </div>
                            </div>      
                                <%} %>  
                                     
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


        <div class="container page__container">
            <div class="footer">
            </div>

        </div>
    </div>
      <script type="text/javascript">

          function getDaysInMonth(month, year)
          {  
                 return new Date(year, month, 0).getDate();
          };
          //DOB
         $("#<%=ddlMonth.ClientID%>").change(function() {         
            $("#<%=ddlDay.ClientID%>").empty();
            var daysInSelectedMonth = getDaysInMonth($("#<%=ddlMonth.ClientID%>").val(), $("#<%=ddlYear.ClientID%>").val());             
            $("#<%=ddlDay.ClientID%>").append($("<option></option>").attr("value", "0").text("Select Day"));
            for (var i = 1; i <= daysInSelectedMonth; i++) {    
                $("#<%=ddlDay.ClientID%>").append($("<option></option>").attr("value", i).text(i));
            }
            
          });
          //spouse DOB
          $("#<%=ddlSpouseDOBMonth.ClientID%>").change(function() {         
              $("#<%=ddlSpouseDOBDate.ClientID%>").empty();
              var daysInSelectedMonth = getDaysInMonth($("#<%=ddlSpouseDOBMonth.ClientID%>").val(), $("#<%=ddlSpouseDOBYear.ClientID%>").val());             
              $("#<%=ddlSpouseDOBDate.ClientID%>").append($("<option></option>").attr("value", "0").text("Select Day"));
                for (var i = 1; i <= daysInSelectedMonth; i++) {
                    $("#<%=ddlSpouseDOBDate.ClientID%>").append($("<option></option>").attr("value", i).text(i));
                }            
          });
           $("#<%=ddlSpouseDOBDate.ClientID%>").change(function () {
                $("#<%=hidSpouseDOBDateField.ClientID%>").val($("#<%=ddlSpouseDOBDate.ClientID%>").val());
            });

          // Marriage DOB
          $("#<%=ddlMarriageMonth.ClientID%>").change(function() {         
                $("#<%=ddlMarriageDate.ClientID%>").empty();
                var daysInSelectedMonth = getDaysInMonth($("#<%=ddlMarriageMonth.ClientID%>").val(), $("#<%=ddlMarriageYear.ClientID%>").val());             
                $("#<%=ddlMarriageDate.ClientID%>").append($("<option></option>").attr("value", "0").text("Select Day"));
                for (var i = 1; i <= daysInSelectedMonth; i++) {
                    $("#<%=ddlMarriageDate.ClientID%>").append($("<option></option>").attr("value", i).text(i));
                }
            
          });
           $("#<%=ddlMarriageDate.ClientID%>").change(function () {
                $("#<%=hidMarriageDateField.ClientID%>").val($("#<%=ddlMarriageDate.ClientID%>").val());
            });

            function getAge(DOB) {
            var today = new Date();
            var birthDate = new Date(DOB);
            var age = today.getFullYear() - birthDate.getFullYear();
            var m = today.getMonth() - birthDate.getMonth();
            if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
                age = age - 1;
            }

            return age;
        }

        function isValidUniversityAcceptAgeRange() {
            var dob = $("#<%=ddlMonth.ClientID%>").val() + "/" + $("#<%=ddlDay.ClientID%>").val() + "/" + $("#<%=ddlYear.ClientID%>").val();
            var age = getAge(dob);
            var maxAge = <%=GlobalVariables.universityMaxAge%>;
            var minAge = <%=GlobalVariables.universityMinAge%>;

            if (age < minAge || age > maxAge) {
                alert("Age should be between " + minAge + " & " + maxAge + " years");
                return false;
            }
            return true;
        }

        function isValidMaritalDetails() {
            var flag = false;
            var personDOB = new Date($("#<%=ddlMonth.ClientID%>").val() + "/" + $("#<%=ddlDay.ClientID%>").val() + "/" + $("#<%=ddlYear.ClientID%>").val());
            var marriageDate = new Date($("#<%=ddlMarriageMonth.ClientID%>").val() + "/" + $("#<%=ddlMarriageDate.ClientID%>").val() + "/" + $("#<%=ddlMarriageYear.ClientID%>").val());
            var currentDate = new Date().getTime();
            if ($("#<%=txtSpouseName.ClientID%>").val() == '')
                alert("Please enter spouse name");
            else if ($("#<%=ddlSpouseNationality.ClientID%>").val() === "0")
                alert("Please enter nationality of Spouse");
            else if (($("#<%=hidSpouseDOBDateField.ClientID%>").val() == "") || ($("#<%=ddlSpouseDOBMonth.ClientID%>").val() == "0") || ($("#<%=ddlSpouseDOBYear.ClientID%>").val() == "0"))
                alert("Please valid date of birth of spouse");
            else if (($("#<%=hidMarriageDateField.ClientID%>").val() == "") || ($("#<%=ddlMarriageMonth.ClientID%>").val() == "0") || ($("#<%=ddlMarriageYear.ClientID%>").val() == "0"))
                alert("Please valid date of marriage");
            else if (personDOB >= marriageDate)
                alert("Please enter marriage date after date of birth");
            else if (personDOB.getTime() === currentDate || marriageDate.getTime() === currentDate)
                alert("Please enter dob or marriage dates prior to today's date");
            else
                flag = true;

            return flag;
        }

        function isValidEnteredDates() {
            var dobYear = parseInt($("#<%=ddlYear.ClientID%>").val());
            var dobMonth = parseInt($("#<%=ddlMonth.ClientID%>").val());
            var qualificationMonth = parseInt($("#<%=ddlHighQualificationCompletedMonth.ClientID%>").val());
            var qualificationYear = parseInt($("#<%=ddlHighQualificationCompletedYear.ClientID%>").val());

            var dob = new Date(dobYear, dobMonth);
            var qualificationDate = new Date(qualificationYear, qualificationMonth);

            if (dob > qualificationDate) {
                alert("Please check Date of Birth/Qualification completion date");
                return false;
            }
            else
                return true;
        }
        function validateForm() {

            var flag = false;
            if (!$("#<%=title.ClientID%>").is(':hidden') && $("#<%=ddlTitle.ClientID%>").val() == "0")
                alert("Please select valid title name");
            else if ((!$("#<%=title.ClientID%>").is(':hidden')) && ($("#<%=ddlTitle.ClientID%> option:selected").text() == "Others" && $("#<%=txtTitle.ClientID%>").val() == ""))
                alert("Please enter other title");
            else if (!$("#<%=firstname.ClientID%>").is(':hidden') && $("#<%=txtFirstName.ClientID%>").val() == "")
                alert("Please enter first name");
            else if (!$("#<%=passportFirstName.ClientID%>").prop('checked'))
                alert("Kindly confirm first name is same as passport name");
            else if (!$("#<%=lastname.ClientID%>").is(':hidden') && $("#<%=txtLastName.ClientID%>").val() == "")
                alert("Please enter family name");
            else if (!$("#<%=passportLastName.ClientID%>").prop('checked'))
                alert("Kindly confirm family name is same as passport name");
          <%--  else if (!$("#<%=preferedname.ClientID%>").is(':hidden') && $("#<%=txtPreferedName.ClientID%>").val() == "")
                alert("Please enter prefered name");
            else if (!$("#<%=middlename.ClientID%>").is(':hidden') && $("#<%=txtMiddleName.ClientID%>").val() == "")
                alert("Please enter middle name");
            else if (!$("#<%=passportMiddleName.ClientID%>").prop('checked'))
                alert("Kindly confirm middle name is same as passport name");--%>
            else if (!$("#<%=gender.ClientID%>").is(':hidden') && !($("#<%=rbtnFemale.ClientID%>").is(':checked') || $("#<%=rbtnMale.ClientID%>").is(':checked') || $("#<%=rbtnOther.ClientID%>").is(':checked') || $("#<%=rbtnPreferNot.ClientID%>").is(':checked')))
                alert("Please Select Option to record Gender");
            else if (!$("#<%=dob.ClientID%>").is(':hidden') && (($("#<%=ddlDay.ClientID%>").val() == "0") || ($("#<%=ddlMonth.ClientID%>").val() == "0") || ($("#<%=ddlYear.ClientID%>").val() == "0") || ($("#<%=hidDOBDate.ClientID%>").val() == "")))
                alert("Please Select valid date of birth");
            else if (!$("#<%=dob.ClientID%>").is(':hidden') && !isValidUniversityAcceptAgeRange()) { }
            else if (!$("#<%=nationality.ClientID%>").is(':hidden') && $("#<%=ddlNationality.ClientID%>").val().split("_")[0] === "0")
                alert("Please select valid nationality");
            else if (!$("#<%=nationality.ClientID%>").is(':hidden') && !$("#<%=rblNationalityYes.ClientID%>").is(':checked') && !$("#<%=secondNation.ClientID%>").is(':hidden') && $("#<%=ddlOtherNation.ClientID%>").val() === "0")
                alert("Please select valid second nationality");
            else if (!$("#<%=birthcountry.ClientID%>").is(':hidden') && $("#<%=ddlBirthCountry.ClientID%>").val() === "0")
                alert("Please select valid birth country");
            else if (!$("#<%=marital.ClientID%>").is(':hidden') && $("#<%=ddlMarital.ClientID%>").val() === "0")
                alert("Please select valid marital status");
            else if ($("#<%=ddlMarital.ClientID%> option:selected").text() === "Married" && !isValidMaritalDetails()) { }
            else if (!$("#<%=higheststudy.ClientID%>").is(':hidden') && $("#<%=ddlhigheststudy.ClientID%>").val() == "0")
                alert("Please select Highest study level successfully completed");
            else if (!$("#<%=fieldstudy.ClientID%>").is(':hidden') && $("#<%=ddlfieldstudy.ClientID%>").val() == "0")
                alert("Please select field of highest study successfully completed");
            else if (!$("#<%=highestQualificationCountry.ClientID%>").is(':hidden') && $("#<%=ddlHighestQualificationCountry.ClientID%>").val() === "0")
                alert("Please select valid Highest Qualification Country");
            else if ((!$("#<%=highQualificationCompleteDate.ClientID%>").is(':hidden')) && (($("#<%=ddlHighQualificationCompletedMonth.ClientID%>").val() == "0") || ($("#<%=ddlHighQualificationCompletedYear.ClientID%>").val() == "0")))
                alert("Please select highest qualification completion month and year");
            else if (!$("#<%=disability.ClientID%>").is(':hidden') && !($("#<%=rblDisabilityYes.ClientID%>").is(':checked') || $("#<%=rblDisabilityNo.ClientID%>").is(':checked')))
                alert("Please Select Option to record disability");
            else if (!$("#<%=disabilitydesc.ClientID%>").is(':hidden') && $("#<%=ddlDisability.ClientID%>").val() === "0")
                alert("Please select select valid disability");
            else if (!$("#<%=agent.ClientID%>").is(':hidden') && !($("#<%=rblAgentYes.ClientID%>").is(':checked') || $("#<%=rblAgentNo.ClientID%>").is(':checked')))
                alert("Please Select Option to record reffrerd by agent");
            else if (!$("#<%=agentList.ClientID%>").is(':hidden') && ($("#<%=ddlAgent.ClientID%>").val() === "0"))
                alert("Please Select valid agent details");
            else if ($("#<%=rblChineseCodeYes.ClientID%>").is(':checked') && ($("#<%=txtChineseCodeNumber.ClientID%>").val() === ""))
                alert("Please enter chinese commercial code number");
            else if ((!$("#<%=dob.ClientID%>").is(':hidden')) && (!$("#<%=highQualificationCompleteDate.ClientID%>").is(':hidden')) && !isValidEnteredDates()) { }
            else
                flag = true;
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
            if (!$("#<%=title.ClientID%>").is(':hidden')) {
                $('#<%=ddlTitle.ClientID%>').change(function () {
                    if ($("#<%=ddlTitle.ClientID%> option:selected").text() == "Others") {
                        $('#<%=txtTitle.ClientID%>').css({ 'display': 'block' });
                    }
                    else { $('#<%=txtTitle.ClientID%>').css({ 'display': 'none' }); }

                });
                if ($("#<%=ddlTitle.ClientID%> option:selected").text() == "Others") {
                    $('#<%=txtTitle.ClientID%>').css({ 'display': 'block' });
                }
                else { $('#<%=txtTitle.ClientID%>').css({ 'display': 'none' }); }


            }
            if (!$("#<%=disability.ClientID%>").is(':hidden')) {

                if ($("#<%=rblDisabilityYes.ClientID%>").is(':checked')) {
                    $("#<%=disabilitydesc.ClientID%>").show();
                } else { $("#<%=disabilitydesc.ClientID%>").hide(); }
            }
            if (!$("#<%=agent.ClientID%>").is(':hidden')) {

                if ($("#<%=rblAgentYes.ClientID%>").is(':checked')) {
                    $("#<%=agentList.ClientID%>").show(); $("#<%=addnewagent.ClientID%>").show();
                } else { $("#<%=agentList.ClientID%>").hide(); $("#<%=addnewagent.ClientID%>").hide(); }
            }

            if ($("#<%=chineseCode.ClientID%>").is(':hidden')) {
                $("#<%=chineseCode.ClientID %> input[type='radio']").prop('checked', false);
                $("#<%=txtChineseCodeNumber.ClientID %>").val('');
            }

            $("#<%=rblNationalityYes.ClientID%>").click(function () {
                $("#<%=secondNation.ClientID%>").show();
            });

            $("#<%=rblNationalityNo.ClientID%>").click(function () {
                $("#<%=secondNation.ClientID%>").hide();
            });

            $("#<%=rblChineseCodeYes.ClientID%>").click(function () {
                $("#<%=textChineseCodeDiv.ClientID%>").show();
            });

            $("#<%=rblChineseCodeNo.ClientID%>").click(function () {
                $("#<%=textChineseCodeDiv.ClientID%>").hide();
                $("#<%=txtChineseCodeNumber.ClientID%>").val('');
            });

            var genderSelected = false;
            $("#<%=ddlTitle.ClientID%>").change(function () {
                if (!genderSelected) {
                    titleText = $("#<%=ddlTitle.ClientID%> option:selected").text();
                    if (titleText == "Ms" || titleText == "Mrs" || titleText == "Miss")
                        $("#<%=rbtnFemale.ClientID%>").prop('checked', true);
                    else if (titleText == "Dr" || titleText == "Mr")
                        $("#<%=rbtnMale.ClientID%>").prop('checked', true);
                }
            });

            $("#<%=rbtnMale.ClientID%>").click(function () {
                genderSelected = true;
            });

            $("#<%=rbtnFemale.ClientID%>").click(function () {
                genderSelected = true;
            });

            var maritalStatus = $("#<%=ddlMarital.ClientID%> option:selected").text();
            $("#<%=ddlMarital.ClientID%>").change(function () {
                maritalStatus = $("#<%=ddlMarital.ClientID%> option:selected").text();
                if (maritalStatus == "Married")
                    $("#<%=statusMarried.ClientID%>").show();
                else {
                    $("#<%=statusMarried.ClientID%>").hide();
                    $("#<%=txtSpouseName.ClientID%>").val('');
                    $("#<%=ddlSpouseNationality.ClientID%>").prop('selectedIndex', 0);
                    $("#<%=ddlSpouseDOBYear.ClientID%>").prop('selectedIndex', 0);
                    $("#<%=ddlSpouseDOBMonth.ClientID%>").prop('selectedIndex', 0);
                    $("#<%=ddlSpouseDOBDate.ClientID%>").prop('selectedIndex', 0);
                    $("#<%=ddlMarriageYear.ClientID%>").prop('selectedIndex', 0);
                    $("#<%=ddlMarriageMonth.ClientID%>").prop('selectedIndex', 0);
                    $("#<%=ddlMarriageDate.ClientID%>").prop('selectedIndex', 0);
                    $("#<%=ddlSpouseNationality.ClientID%>").prop('selectedIndex', 0);
                }
            });
            
            if (maritalStatus == "Married") {
                $("#<%=statusMarried.ClientID%>").show();
            }

            $("#<%=ddlDay.ClientID%>").change(function () {
                $("#<%=hidDOBDate.ClientID%>").val($("#<%=ddlDay.ClientID%>").val());
            });

            $("#<%=ddlNationality.ClientID%>").change(function () {
                countryVal = $("#<%=ddlNationality.ClientID%>").val().split("_");
                dualcitizenship = (countryVal[1] == "True");
                countryName = $("#<%=ddlNationality.ClientID%> option:selected").text().toUpperCase();

                if (dualcitizenship) {
                    $("#<%=dualNationality.ClientID%>").show();
                }
                else {
                    $("#<%=dualNationality.ClientID%>").hide();
                    $("#<%=dualNationality.ClientID %> input[type='radio']").prop('checked', false);
                    $("#<%=ddlOtherNation.ClientID %>")[0].selectedIndex = 0;
                }

                if (!$("#<%=chineseCode.ClientID%>").is(':hidden')) {
                    $("#<%=chineseCode.ClientID%>").hide();
                    $("#<%=chineseCode.ClientID %> input[type='radio']").prop('checked', false);
                    $("#<%=txtChineseCodeNumber.ClientID %>").val('');
                }
                else if (!$("#<%=russianName.ClientID%>").is(':hidden')) {
                    $("#<%=russianName.ClientID%>").hide();
                    $("#<%=txtPatronymicName.ClientID %>").val('');
                }

                if (countryName == "<%=GlobalVariables.GetChinaCountryName %>") {
                    $("#<%=chineseCode.ClientID%>").show();
                }
                else if (countryName == "<%=GlobalVariables.GetRussiaCountryName %>") {
                    $("#<%=russianName.ClientID%>").show();
                }
            });

            // to handle Tool tips
            var i = 0;
             $('.fa-info-circle').tipso({
				position: 'right',
				background: 'rgba(0,0,0,0.8)',
				useTitle: false,
			});


        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$disability']").click(function () {
                if ($("#<%=rblDisabilityYes.ClientID%>").is(":checked")) {
                    $("#<%=disabilitydesc.ClientID%>").show();

                } else {
                    $("#<%=disabilitydesc.ClientID%>").hide();

                }
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$agent']").click(function () {
                if ($("#<%=rblAgentYes.ClientID%>").is(":checked")) {
                    $("#<%=agentList.ClientID%>").show(); $("#<%=addnewagent.ClientID%>").show();
                } else { $("#<%=agentList.ClientID%>").hide(); $("#<%=addnewagent.ClientID%>").hide(); }
            });
          });
          
              
              
          
          $(document).ready(function () {
              $('.sidebar-menu-item').removeClass('open');
              $('#personal_menu_list').addClass('open');
              $('.sidebar-menu-item').removeClass('active');
              $('#personaldetails').addClass('active');
          });

    </script>


</asp:Content>

