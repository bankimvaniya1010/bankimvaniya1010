<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantcourse.aspx.cs" Inherits="applicantcourse" MasterPageFile="~/student.master" EnableEventValidation="false" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">YOUR APPLICATION</li>
        </ol>
        <h1 class="h2">YOUR APPLICATION</h1>

    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-8">

                    <div class="card">
                      <div class="card-body">
                        <!--- First Preference-->
                        <div class="list-group list-group-fit">
                            <div class="list-group-item">
                                <div class="form-group m-0" role="firstpref" aria-labelledby="label-firstpref">
                                    <div class="form-row">
                                        <label id="label-firstpref" for="firstpref" class="col-md-3 col-form-label form-label">
                                            1st Preference
                                        </label>
                                        <div class="col-md-6">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" runat="server">
                            <div class="form-group m-0" role="group" aria-labelledby="label-college1">
                                <div class="form-row">
                                    <label id="label-college1" for="college1" class="col-md-3 col-form-label form-label">University College Name</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlCollege1" CssClass="form-control" AutoPostBack="false" runat="server" >
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="list-group-item" id="location1" runat="server">
                            <div class="form-group m-0" role="group" aria-labelledby="label-location1">
                                <div class="form-row">
                                    <label id="label-location1" for="location1" class="col-md-3 col-form-label form-label">Select Location of Study</label>
                                    <div class="col-md-6" runat="server">
                                        <asp:DropDownList ID="ddlCampus1" runat="server" CssClass="form-control">    
                                            <asp:ListItem value="">Select Campus</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:HiddenField ID="hidCampusField1" runat="server" />
                                        <asp:DropDownList ID="ddlCity1" runat="server" CssClass="form-control"> 
                                            <asp:ListItem value="">Select City</asp:ListItem>                                            
                                        </asp:DropDownList>
                                        <asp:HiddenField ID="hidCityField1" runat="server" />
                                        <asp:DropDownList ID="ddlCountry1" runat="server" CssClass="form-control">
                                            <asp:ListItem value="">Select Country</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:HiddenField ID="hidCountryField1" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                          <div class="list-group-item" id="coursetype1" runat="server">
                            <div class="form-group m-0" role="group" aria-labelledby="label-coursetype1">
                                <div class="form-row">
                                    <label id="label-coursetype1" for="course1" class="col-md-3 col-form-label form-label">Select Course Type</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlCourseType1" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="mode1" runat="server">
                            <div class="form-group m-0" role="group" aria-labelledby="label-mode1">
                                <div class="form-row">
                                    <label id="label-mode1" for="mode1" class="col-md-3 col-form-label form-label">Select Mode of Study</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlmode1" runat="server" CssClass="form-control">
                                            <asp:ListItem value="">Select Study Mode</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:HiddenField ID="hidModeField1" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="major1" runat="server">
                            <div class="form-group m-0" role="group" aria-labelledby="label-major1">
                                <div class="form-row">
                                    <label id="label-major1" for="major1" class="col-md-3 col-form-label form-label">Select Major or Discipline</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlMajor1" AutoPostBack="false" runat="server" CssClass="form-control">
                                             <asp:ListItem value="">Select Discipline</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:HiddenField ID="HidMajorField1" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                      
                        <div class="list-group-item" id="course1" runat="server">
                            <div class="form-group m-0" role="group" aria-labelledby="label-course1">
                                <div class="form-row">
                                    <label id="label-course1" for="course1" class="col-md-3 col-form-label form-label">Select Course</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlCourse1" runat="server" CssClass="form-control">
                                            <asp:ListItem value="">Select Course</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:HiddenField ID="hidCourseField1" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="courseeligibility" runat="server" style="display: none">
                            <div class="form-group m-0" role="group" aria-labelledby="label-courseeligibility">
                                <div class="form-row">
                                    <label id="label-courseeligibility" for="course1" class="col-md-3 col-form-label form-label">Course Eligibility</label>
                                    <div class="col-md-9">
                                        <asp:Label id="lblcourseeligibility" runat="server" class="form-control frm-cntrl-rdo"></asp:Label> 
                                        <div class="form-check-inline">
                                            <asp:RadioButton runat="server" ID="eligibilityYes" Text="I comply to this" class="form-check-label" GroupName="eligibilityresponse"/>
                                          </div>
                                        <div class="form-check-inline">
                                            <asp:RadioButton runat="server" ID="eligibilityNo" Text="I don't comply to this" class="form-check-label" GroupName="eligibilityresponse"/> 
                                        </div>
                                        <asp:HiddenField runat="server" ID="Hidcourseeligibility"/>
                                    </div>
                                    <br/>
                                    <div class="col-md-6">
                                      
                                    </div>
                                </div>
                            </div>
                        </div>                       
                        <div class="list-group-item" id="commencementmonth1" runat="server">
                            <div class="form-group m-0" role="group" aria-labelledby="label-commencementmonth1">
                                <div class="form-row">
                                    <label id="label-commencementmonth1" for="commencementmonth1" class="col-md-3 col-form-label form-label">Select Commencement Date</label>
                                    <div class="col-md-6">
                                        <%--<input id="txtCommencementdate1" runat="server" type="text" class="form-control" placeholder="Commencement Date" data-toggle="flatpickr" value="">--%>
                                        <asp:DropDownList runat="server" ID="ddlCommencementdate" CssClass="form-control">
                                            <asp:ListItem Value="0">Please Select </asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:HiddenField ID="hidCommencementDate1" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>                       
                        <!--- End First Preference-->

                        <!---  Second Preference-->
                        <a class="btn btn-success appcnt-add" onclick="toggleDivVisibility('second');">+ Add Second Preference
                        </a>
                        <div id="second" runat="server">
                            <div class="list-group list-group-fit" id="secondpref">
                                <div class="list-group-item">
                                    <div class="form-group m-0" role="secondpref" aria-labelledby="label-secondpref">
                                        <div class="form-row">
                                            <label id="label-secondpref" for="secondpref" class="col-md-3 col-form-label form-label">
                                                2nd Preference
                                            </label>
                                            <div class="col-md-6">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="college2" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-college2">
                                    <div class="form-row">
                                        <label id="label-college2" for="college2" class="col-md-3 col-form-label form-label">University College Name</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCollege2" AutoPostBack="false" runat="server" CssClass="form-control">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="location2" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-location2">
                                    <div class="form-row">
                                        <label id="label-location2" for="location2" class="col-md-3 col-form-label form-label">Select Location of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCampus2" runat="server" CssClass="form-control">
                                                <asp:ListItem value="">Select Campus</asp:ListItem>
                                            </asp:DropDownList>
                                              <asp:HiddenField ID="hidCampusField2" runat="server" />
                                            <asp:DropDownList ID="ddlCity2" runat="server" CssClass="form-control">
                                                <asp:ListItem value="">Select City</asp:ListItem>
                                            </asp:DropDownList>
                                              <asp:HiddenField ID="hidCityField2" runat="server" />
                                            <asp:DropDownList ID="ddlCountry2" runat="server" CssClass="form-control">
                                                <asp:ListItem value="">Select Country</asp:ListItem>
                                            </asp:DropDownList>
                                              <asp:HiddenField ID="hidCountryField2" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="coursetype2" runat="server">
                            <div class="form-group m-0" role="group" aria-labelledby="label-coursetype1">
                                <div class="form-row">
                                    <label id="label-coursetype2" for="course1" class="col-md-3 col-form-label form-label">Select Course Type</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlcoursetype2" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                            <div class="list-group-item" id="mode2" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-mode2">
                                    <div class="form-row">
                                        <label id="label-mode2" for="mode2" class="col-md-3 col-form-label form-label">Select Mode of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMode2" CssClass="form-control" runat="server">
                                                 <asp:ListItem value="">Select Study Mode</asp:ListItem>
                                            </asp:DropDownList>
                                              <asp:HiddenField ID="hidModeField2" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="major2" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-major2">
                                    <div class="form-row">
                                        <label id="label-major2" for="major2" class="col-md-3 col-form-label form-label">Select Major or Discipline</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMajor2" CssClass="form-control" runat="server" AutoPostBack="false">
                                                 <asp:ListItem value="">Select Discipline</asp:ListItem>
                                            </asp:DropDownList>
                                              <asp:HiddenField ID="hidMajorField2" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="course2" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-course2">
                                    <div class="form-row">
                                        <label id="label-course2" for="course2" class="col-md-3 col-form-label form-label">Select Course</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCourse2" CssClass="form-control" runat="server">
                                                 <asp:ListItem value="">Select Course</asp:ListItem>
                                            </asp:DropDownList>
                                              <asp:HiddenField ID="hidCourseField2" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="courseeligibility2" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-courseeligibility">
                                    <div class="form-row">
                                        <label id="label-courseeligibility2" for="course1" class="col-md-3 col-form-label form-label">Course Eligibility</label>
                                        <div class="col-md-6">
                                            <asp:Label id="lblcourseeligibility2" runat="server" class="form-control frm-cntrl-rdo cours-elig-lbl"></asp:Label> 
                                            <div class="form-check-inline">
                                                <asp:RadioButton runat="server" ID="eligibilityYes2" Text="Yes" class="form-check-label" GroupName="eligibilityresponse"/>
                                              </div>
                                            <div class="form-check-inline">
                                                <asp:RadioButton runat="server" ID="eligibilityNo2" Text="No" class="form-check-label" GroupName="eligibilityresponse"/> 
                                            </div>
                                            <asp:HiddenField runat="server" ID="Hidcourseeligibility2"/>
                                        </div>
                                        <br/>
                                        <div class="col-md-6">
          
                                        </div>
                                    </div>
                                </div>
                            </div>  
                            <div class="list-group-item" id="commencementmonth2" runat="server">
                            <div class="form-group m-0" role="group" aria-labelledby="label-commencementmonth1">
                                <div class="form-row">
                                    <label id="label-commencementmonth2" for="commencementmonth1" class="col-md-3 col-form-label form-label">Select Commencement Date</label>
                                    <div class="col-md-6">
                                         <%--<input id="txtCommencementdate2" runat="server" type="text" class="form-control" placeholder="Commencement Date" data-toggle="flatpickr" value="">--%>
                                        <asp:DropDownList runat="server" ID="ddlCommencementdate2" CssClass="form-control">
                                            <asp:ListItem Value="0">Please Select </asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:HiddenField ID="hidCommencementDate2" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div> 
                            </div> 
                        <!--- End Second Preference-->

                        <!---  Third Preference-->
                        <a class="btn btn-success appcnt-add" onclick="toggleDivVisibility('third')">+ Add Third Preference
                        </a>
                        <div id="third" runat="server">
                            <div class="list-group list-group-fit" id="thirdpref">
                                <div class="list-group-item">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-thirdpref">
                                        <div class="form-row">
                                            <label id="label-thirdpref" for="thirdpref" class="col-md-3 col-form-label form-label">
                                                3rd Preference
                                            </label>
                                            <div class="col-md-6">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="college3" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-college3">
                                    <div class="form-row">
                                        <label id="label-college3" for="college3" class="col-md-3 col-form-label form-label">University College Name</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCollege3" CssClass="form-control" runat="server" AutoPostBack="false">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="location3">
                                <div class="form-group m-0" role="group" aria-labelledby="label-location3">
                                    <div class="form-row">
                                        <label id="label-location3" for="location3" class="col-md-3 col-form-label form-label">Select Location of Study</label>
                                        <div class="col-md-6" runat="server">
                                            <asp:DropDownList ID="ddlCampus3" runat="server" CssClass="form-control">
                                                <asp:ListItem value="">Select Campus</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hidCampusField3" runat="server" />
                                            <asp:DropDownList ID="ddlCity3" runat="server" CssClass="form-control">
                                                <asp:ListItem value="">Select City</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hidCityField3" runat="server" />
                                            <asp:DropDownList ID="ddlCountry3" runat="server" CssClass="form-control">
                                                <asp:ListItem value="">Select Country</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hidCountryField3" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="list-group-item" id="coursetype3" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-coursetype1">
                                    <div class="form-row">
                                        <label id="label-coursetype3" for="course1" class="col-md-3 col-form-label form-label">Select Course Type</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlcoursetype3" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="mode3" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-mode3">
                                    <div class="form-row">
                                        <label id="label-mode3" for="mode3" class="col-md-3 col-form-label form-label">Select Mode of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMode3" CssClass="form-control" runat="server">
                                                 <asp:ListItem value="">Select Study Mode</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hidModeField3" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="major3" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-major3">
                                    <div class="form-row">
                                        <label id="label-major3" for="major3" class="col-md-3 col-form-label form-label">Select Major or Discipline</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMajor3" CssClass="form-control" runat="server" AutoPostBack="false">
                                                 <asp:ListItem value="">Select Discipline</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hidMajorField3" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="course3" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-course3">
                                    <div class="form-row">
                                        <label id="label-course3" for="course3" class="col-md-3 col-form-label form-label">Select Course</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCourse3" CssClass="form-control" runat="server">
                                                 <asp:ListItem value="">Select Course</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hidCourseField3" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="courseeligibility3" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-courseeligibility">
                                    <div class="form-row">
                                        <label id="label-courseeligibility3" for="courseeligibility3" class="col-md-3 col-form-label form-label">Course Eligibility</label>
                                        <div class="col-md-6">
                                            <asp:Label id="lblcourseeligibility3" runat="server" class="form-control frm-cntrl-rdo cours-elig-lbl"></asp:Label> 
                                            <div class="form-check-inline">
                                                <asp:RadioButton runat="server" ID="eligibilityYes3" Text="Yes" class="form-check-label" GroupName="eligibilityresponse"/>
                                              </div>
                                            <div class="form-check-inline">
                                                <asp:RadioButton runat="server" ID="eligibilityNo3" Text="No" class="form-check-label" GroupName="eligibilityresponse"/> 
                                            </div>
                                                <asp:HiddenField runat="server" ID="Hidcourseeligibility3"/>
                                         </div>                                                                                       
                                    </div>
                                </div>
                            </div>
                           <div class="list-group-item" id="commencementmonth3" runat="server">
                            <div class="form-group m-0" role="group" aria-labelledby="label-commencementmonth1">
                                <div class="form-row">
                                    <label id="label-commencementmonth3" for="commencementmonth1" class="col-md-3 col-form-label form-label">Select Commencement Date</label>
                                    <div class="col-md-6">
                                        <%--<input id="txtCommencementdate3" runat="server" type="text" class="form-control" placeholder="Commencement Date" data-toggle="flatpickr" value="">--%>
                                        <asp:DropDownList runat="server" ID="ddlCommencementdate3" CssClass="form-control">
                                            <asp:ListItem Value="0">Please Select </asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:HiddenField ID="hidCommencementDate3" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div> 
                        </div>
                        <!--- End Third Preference-->
                        <!---  Fourth Preference-->
                        <a class="btn btn-success appcnt-add" onclick="toggleDivVisibility('four')">+ Add Fourth Preference
                        </a>
                        <div id="four" runat="server">
                            <div class="list-group list-group-fit" id="fourthPref">
                                <div class="list-group-item">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-fourthPref">
                                        <div class="form-row">
                                            <label id="label-fourthPref" for="fourthPref" class="col-md-3 col-form-label form-label">
                                                4th Preference
                                            </label>
                                            <div class="col-md-6">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="college4" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-college4">
                                    <div class="form-row">
                                        <label id="label-college4" for="college4" class="col-md-3 col-form-label form-label">University College Name</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCollege4" CssClass="form-control" runat="server" AutoPostBack="false">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="location4">
                                <div class="form-group m-0" role="group" aria-labelledby="label-location4">
                                    <div class="form-row">
                                        <label id="label-location4" for="location4" class="col-md-3 col-form-label form-label">Select Location of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCampus4" CssClass="form-control" runat="server">
                                                <asp:ListItem value="">Select Campus</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hidCampusField4" runat="server" />
                                            <asp:DropDownList ID="ddlCity4" CssClass="form-control" runat="server">
                                                <asp:ListItem value="">Select City</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hidCityField4" runat="server" />
                                            <asp:DropDownList ID="ddlCountry4" CssClass="form-control" runat="server">
                                                <asp:ListItem value="">Select Country</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hidCountryField4" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="coursetype4" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-coursetype1">
                                    <div class="form-row">
                                        <label id="label-coursetype4" for="course1" class="col-md-3 col-form-label form-label">Select Course Type</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlcoursetype4" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="mode4" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-mode4">
                                    <div class="form-row">
                                        <label id="label-mode4" for="mode4" class="col-md-3 col-form-label form-label">Select Mode of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMode4" CssClass="form-control" runat="server">
                                                 <asp:ListItem value="">Select Study Mode</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hidModeField4" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="major4" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-major4">
                                    <div class="form-row">
                                        <label id="label-major4" for="major4" class="col-md-3 col-form-label form-label">Select Major or Discipline</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMajor4" CssClass="form-control" runat="server" AutoPostBack="false">
                                                 <asp:ListItem value="">Select Discipline</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hidMajorField4" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="course4" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-course4">
                                    <div class="form-row">
                                        <label id="label-course4" for="course4" class="col-md-3 col-form-label form-label">Select Course</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCourse4" CssClass="form-control" runat="server">
                                                 <asp:ListItem value="">Select Course</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hidCourseField4" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                           <div class="list-group-item" id="courseeligibility4" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-courseeligibility4">
                                    <div class="form-row">
                                        <label id="label-courseeligibility4" for="courseeligibility4" class="col-md-3 col-form-label form-label">Course Eligibility</label>
                                        <div class="col-md-6">
                                            <asp:Label id="lblcourseeligibility4" runat="server" class="form-control frm-cntrl-rdo cours-elig-lbl"></asp:Label> 
                                            <div class="form-check-inline">
                                                <asp:RadioButton runat="server" ID="eligibilityYes4" Text="Yes" class="form-check-label" GroupName="eligibilityresponse"/>
                                              </div>
                                            <div class="form-check-inline">
                                                <asp:RadioButton runat="server" ID="eligibilityNo4" Text="No" class="form-check-label" GroupName="eligibilityresponse"/> 
                                            </div>
                                                <asp:HiddenField runat="server" ID="Hidcourseeligibility4"/>
                                         </div>                                                                                       
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="commencementmonth4" runat="server">
                            <div class="form-group m-0" role="group" aria-labelledby="label-commencementmonth1">
                                <div class="form-row">
                                    <label id="label-commencementmonth4" for="commencementmonth1" class="col-md-3 col-form-label form-label">Select Commencement Date</label>
                                    <div class="col-md-6">
                                        <%--<input id="txtCommencementdate4" runat="server" type="text" class="form-control" placeholder="Commencement Date" data-toggle="flatpickr" value="">--%>
                                        <asp:DropDownList runat="server" ID="ddlCommencementdate4" CssClass="form-control">
                                            <asp:ListItem Value="0">Please Select </asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:HiddenField ID="hidCommencementDate4" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div> 
                        </div>
                        <!--- End Fourth Preference-->

                        <!---  Fifth Preference-->
                        <a class="btn btn-success appcnt-add" onclick="toggleDivVisibility('five')">+ Add Fifth Preference
                        </a>
                        <div id="five" runat="server">
                            <div class="list-group list-group-fit" id="fifthpref">
                                <div class="list-group-item">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-fifthpref">
                                        <div class="form-row">
                                            <label id="label-fifthpref" for="fifthpref" class="col-md-3 col-form-label form-label">
                                                5th Preference
                                            </label>
                                            <div class="col-md-6">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="college5" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-college5">
                                    <div class="form-row">
                                        <label id="label-college5" for="college5" class="col-md-3 col-form-label form-label">University College Name</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCollege5" CssClass="form-control" runat="server" AutoPostBack="false">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="list-group-item" id="location5">
                                <div class="form-group m-0" role="group" aria-labelledby="label-location5">
                                    <div class="form-row">
                                        <label id="label-location5" for="location5" class="col-md-3 col-form-label form-label">Select Location of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCampus5" CssClass="form-control" runat="server">
                                                <asp:ListItem value="">Select Campus</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hidCampusField5" runat="server" />
                                            <asp:DropDownList ID="ddlCity5" CssClass="form-control" runat="server">
                                                <asp:ListItem value="">Select City</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hidCityField5" runat="server" />
                                            <asp:DropDownList ID="ddlCountry5" CssClass="form-control" runat="server">
                                                <asp:ListItem value="">Select Country</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hidCountryField5" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="coursetype5" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-coursetype1">
                                    <div class="form-row">
                                        <label id="label-coursetype5" for="course1" class="col-md-3 col-form-label form-label">Select Course Type</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlcoursetype5" runat="server" CssClass="form-control"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="mode5" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-mode5">
                                    <div class="form-row">
                                        <label id="label-mode5" for="mode5" class="col-md-3 col-form-label form-label">Select Mode of Study</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMode5" CssClass="form-control" runat="server">
                                                 <asp:ListItem value="">Select Study Mode</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hidModeField5" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="major5" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-major2">
                                    <div class="form-row">
                                        <label id="label-major5" for="major5" class="col-md-3 col-form-label form-label">Select Major or Discipline</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMajor5" CssClass="form-control" runat="server" AutoPostBack="false">
                                                 <asp:ListItem value="">Select Discipline</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hidMajorField5" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="course5" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-course5">
                                    <div class="form-row">
                                        <label id="label-course5" for="course5" class="col-md-3 col-form-label form-label">Select Course</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlCourse5" CssClass="form-control" runat="server">
                                                 <asp:ListItem value="">Select Course</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hidCourseField5" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="courseeligibility5" runat="server" style="display: none">
                                <div class="form-group m-0" role="group" aria-labelledby="label-courseeligibility5">
                                    <div class="form-row">
                                        <label id="label-courseeligibility5" for="courseeligibility5" class="col-md-3 col-form-label form-label">Course Eligibility</label>
                                        <div class="col-md-6">
                                            <asp:Label id="lblcourseeligibility5" runat="server" class="form-control frm-cntrl-rdo cours-elig-lbl"></asp:Label> 
                                            <div class="form-check-inline">
                                                <asp:RadioButton runat="server" ID="eligibilityYes5" Text="Yes" class="form-check-label" GroupName="eligibilityresponse"/>
                                              </div>
                                            <div class="form-check-inline">
                                                <asp:RadioButton runat="server" ID="eligibilityNo5" Text="No" class="form-check-label" GroupName="eligibilityresponse"/> 
                                            </div>
                                                <asp:HiddenField runat="server" ID="Hidcourseeligibility5"/>
                                         </div>                                                                                       
                                    </div>
                                </div>
                            </div>
                           <div class="list-group-item" id="commencementmonth5" runat="server">
                            <div class="form-group m-0" role="group" aria-labelledby="label-commencementmonth1">
                                <div class="form-row">
                                    <label id="label-commencementmonth5" for="commencementmonth1" class="col-md-3 col-form-label form-label">Select Commencement Date</label>
                                    <div class="col-md-6">
                                        <%--<input id="txtCommencementdate5" runat="server" type="text" class="form-control" placeholder="Commencement Date" data-toggle="flatpickr" value="">--%>
                                        <asp:DropDownList runat="server" ID="ddlCommencementdate5" CssClass="form-control">
                                            <asp:ListItem Value="0">Please Select </asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:HiddenField ID="hidCommencementDate5" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div> 
                        </div>
                        <!--- End Fifth Preference-->

                        <div class="list-group-item">
                            <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                <div class="form-row">
                                    <asp:Button ID="btn_coursedetail" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_coursedetail_Click"  OnClientClick="return validateForm()"/>
                                    <div class="col-md-6">
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
                                    <h5>FAQ's</h5>
                                    <div class="">
                                    <%for (int q = 0; q < allQuestions.Count; q++)
                                        {%>  <div>                                                             
                                               <label onclick="showFaqQuestion('<%=allQuestions[q].question%>','<%=allQuestions[q].answer%>')"> * <%=allQuestions[q].question%> </label>
                                            </div>                                                  
                                    <%} %>
                                </div>
                            </div>      
                                <%} %>  
                                     
                            </div>
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
        function validFirstPreference() {
            var flag = false;
            if ($("#<%=ddlCollege1.ClientID%>").val() == "0")
                alert("Please Select University College Name");
            else if ($("#<%=ddlCampus1.ClientID%>").val() == "0" || $("#<%=hidCampusField1.ClientID%>").val() == "")
                alert("Please Select Campus");
            else if ($("#<%=ddlCity1.ClientID%>").val() == "0" || $("#<%=hidCityField1.ClientID%>").val() == "")
                alert("Please Select City");
            else if ($("#<%=ddlCountry1.ClientID%>").val() == "0" || $("#<%=hidCountryField1.ClientID%>").val() == "")
                alert("Please Select Country");
            else if ($("#<%=ddlCourseType1.ClientID%>").val() == "0")
                alert("Please Select Course Type");
            else if ($("#<%=ddlmode1.ClientID%>").val() == "0" || $("#<%=hidModeField1.ClientID%>").val() == "")
                alert("Please Select Mode Of Study");
            else if ($("#<%=ddlMajor1.ClientID%>").val() == "0" || $("#<%=HidMajorField1.ClientID%>").val() == "")
                alert("Please Select Major Or Discipline");
            else if ($("#<%=ddlCourse1.ClientID%>").val() == "0" || $("#<%=hidCourseField1.ClientID%>").val() == "")
                alert("Please Select Course");
            else if ($("#<%=ddlCommencementdate.ClientID%>").val() == "0" || $("#<%=hidCommencementDate1.ClientID%>").val() == "")
                alert("Please Select Commencement Date");
            else
                flag = true;
            
            return flag;
        }
        function validSecondPreference() {
            var flag = false;
            if (!$("#<%=second.ClientID%>").is(':hidden') || !($("#<%=ddlCollege2.ClientID%>").val() == "0")) {               
                if ($("#<%=ddlCampus2.ClientID%>").val() == "0" || $("#<%=hidCampusField2.ClientID%>").val() == "")
                    alert("Please Select Campus");
                else if ($("#<%=ddlCity2.ClientID%>").val() == "0" || $("#<%=hidCityField2.ClientID%>").val() == "")
                    alert("Please Select City");
                else if ($("#<%=ddlCountry2.ClientID%>").val() == "0" || $("#<%=hidCountryField2.ClientID%>").val() == "")
                    alert("Please Select Country");
                else if ($("#<%=ddlcoursetype2.ClientID%>").val() == "0")
                    alert("Please Select Course Type");
                else if ($("#<%=ddlMode2.ClientID%>").val() == "0" || $("#<%=hidModeField2.ClientID%>").val() == "")
                    alert("Please Select Mode Of Study");
                else if ($("#<%=ddlMajor2.ClientID%>").val() == "0" || $("#<%=hidMajorField2.ClientID%>").val() == "")
                    alert("Please Select Major Or Discipline");
                else if ($("#<%=ddlCourse2.ClientID%>").val() == "0" || $("#<%=hidCourseField2.ClientID%>").val() == "")
                    alert("Please Select Course");
                else if ($("#<%=ddlCommencementdate2.ClientID%>").val() == "0" || $("#<%=hidCommencementDate2.ClientID%>").val() == "")
                    alert("Please Select Commencement Date");
                else
                    flag = true;
            }
            else
                flag = true;
            return flag;
        }
        function validThirdPreference() {
            var flag = false;
            if (!$("#<%=third.ClientID%>").is(':hidden') && !($("#<%=ddlCollege3.ClientID%>").val() == "0")) {
                    if ($("#<%=ddlCampus3.ClientID%>").val() == "0" || $("#<%=hidCampusField3.ClientID%>").val() == "")
                        alert("Please Select Campus");
                    else if ($("#<%=ddlCity3.ClientID%>").val() == "0" || $("#<%=hidCityField3.ClientID%>").val() == "")
                        alert("Please Select City");
                    else if ($("#<%=ddlCountry3.ClientID%>").val() == "0" || $("#<%=hidCountryField3.ClientID%>").val() == "")
                        alert("Please Select Country");
                    else if ($("#<%=ddlcoursetype3.ClientID%>").val() == "0")
                        alert("Please Select Course Type");
                    else if ($("#<%=ddlMode3.ClientID%>").val() == "0" || $("#<%=hidModeField3.ClientID%>").val() == "")
                        alert("Please Select Mode Of Study");
                    else if ($("#<%=ddlMajor3.ClientID%>").val() == "0" || $("#<%=hidMajorField3.ClientID%>").val() == "")
                        alert("Please Select Major Or Discipline");
                    else if ($("#<%=ddlCourse3.ClientID%>").val() == "0" || $("#<%=hidCourseField3.ClientID%>").val() == "")
                        alert("Please Select Course");
                    else if ($("#<%=ddlCommencementdate3.ClientID%>").val() == "0" || $("#<%=hidCommencementDate3.ClientID%>").val() == "")
                    alert("Please Select Commencement Date");
                else
                    flag = true;
            }
            else
                flag = true;
            return flag;
        }
        function validFourPreference() {
            var flag = false;
            if (!$("#<%=four.ClientID%>").is(':hidden') && !($("#<%=ddlCollege4.ClientID%>").val() == "0")) {
                    if ($("#<%=ddlCampus4.ClientID%>").val() == "0" || $("#<%=hidCampusField4.ClientID%>").val() == "")
                        alert("Please Select Campus");
                    else if ($("#<%=ddlCity4.ClientID%>").val() == "0" || $("#<%=hidCityField4.ClientID%>").val() == "")
                        alert("Please Select City");
                    else if ($("#<%=ddlCountry4.ClientID%>").val() == "0" || $("#<%=hidCountryField4.ClientID%>").val() == "")
                        alert("Please Select Country");
                    else if ($("#<%=ddlcoursetype4.ClientID%>").val() == "0")
                        alert("Please Select Course Type");
                    else if ($("#<%=ddlMode4.ClientID%>").val() == "0" || $("#<%=hidModeField4.ClientID%>").val() == "")
                        alert("Please Select Mode Of Study");
                    else if ($("#<%=ddlMajor4.ClientID%>").val() == "0" || $("#<%=hidMajorField4.ClientID%>").val() == "")
                        alert("Please Select Major Or Discipline");
                    else if ($("#<%=ddlCourse4.ClientID%>").val() == "0" || $("#<%=hidCourseField4.ClientID%>").val() == "")
                        alert("Please Select Course");
                    else if ($("#<%=ddlCommencementdate4.ClientID%>").val() == "0" || $("#<%=hidCommencementDate4.ClientID%>").val() == "")
                    alert("Please Select Commencement Date");
                else
                    flag = true;
            }
            else
                flag = true;
            return flag;
        }
        function validFifthPreference() {
            var flag = false;
            if (!$("#<%=five.ClientID%>").is(':hidden') && !($("#<%=ddlCollege5.ClientID%>").val() == "0")) {
                    if ($("#<%=ddlCampus5.ClientID%>").val() == "0" || $("#<%=hidCampusField5.ClientID%>").val() == "")
                        alert("Please Select Campus");
                    else if ($("#<%=ddlCity5.ClientID%>").val() == "0" || $("#<%=hidCityField5.ClientID%>").val() == "")
                        alert("Please Select City");
                    else if ($("#<%=ddlCountry5.ClientID%>").val() == "0" || $("#<%=hidCountryField5.ClientID%>").val() == "")
                        alert("Please Select Country");
                    else if ($("#<%=ddlcoursetype5.ClientID%>").val() == "0")
                        alert("Please Select Course Type");
                    else if ($("#<%=ddlMode5.ClientID%>").val() == "0" || $("#<%=hidModeField5.ClientID%>").val() == "")
                        alert("Please Select Mode Of Study");
                    else if ($("#<%=ddlMajor5.ClientID%>").val() == "0" || $("#<%=hidMajorField5.ClientID%>").val() == "")
                        alert("Please Select Major Or Discipline");
                    else if ($("#<%=ddlCourse5.ClientID%>").val() == "0" || $("#<%=hidCourseField5.ClientID%>").val() == "")
                        alert("Please Select Course");
                    else if ($("#<%=ddlCommencementdate5.ClientID%>").val() == "0" || $("#<%=hidCommencementDate5.ClientID%>").val() == "")
                    alert("Please Select Commencement Date");
                else
                    flag = true;
            }
            else
                flag = true;
            return flag;
        }
        function validateForm() {
            return validFirstPreference() &&  validSecondPreference() && validThirdPreference() && validFourPreference() && validFifthPreference();
        }

        function toggleDivVisibility(divId) {
            if (divId == 'second') {
                if ($("#<%=second.ClientID%>").is(':hidden'))
                    $("#<%=second.ClientID%>").show();
                else
                    $("#<%=second.ClientID%>").hide();
            }
            if (divId == 'third') {
                if ($("#<%=third.ClientID%>").is(':hidden'))
                    $("#<%=third.ClientID%>").show();
                else
                    $("#<%=third.ClientID%>").hide();
            }
            if (divId == 'four') {
                if ($("#<%=four.ClientID%>").is(':hidden'))
                    $("#<%=four.ClientID%>").show();
                else
                    $("#<%=four.ClientID%>").hide();
            }
            if (divId == 'five') {
                if ($("#<%=five.ClientID%>").is(':hidden'))
                    $("#<%=five.ClientID%>").show();
                else
                    $("#<%=five.ClientID%>").hide();
            }            
        }

         $('#ContentPlaceHolder1_txtCommencementdate1').flatpickr({

            dateFormat: 'Y-m-d',defaultDate:""
        });
        $('#ContentPlaceHolder1_txtCommencementdate2').flatpickr({

            dateFormat: 'Y-m-d',defaultDate:""
        });
        $('#ContentPlaceHolder1_txtCommencementdate3').flatpickr({

            dateFormat: 'Y-m-d',defaultDate:""
        });
        $('#ContentPlaceHolder1_txtCommencementdate4').flatpickr({

            dateFormat: 'Y-m-d',defaultDate:""
        });
        $('#ContentPlaceHolder1_txtCommencementdate5').flatpickr({

            dateFormat: 'Y-m-d',defaultDate:""
        });       
  
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#Application_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantcourse').addClass('active');
        });
        //campus1
         $("#<%=ddlCollege1.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetCampusDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {                        
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCampus1.ClientID%>").length >= 1) {
                                $("#<%=ddlCampus1.ClientID%>").empty();
                                $("#<%=ddlCampus1.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Campus"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCampus1.ClientID%>").append($("<option></option>").val(result[i].campusid).html(result[i].campusname));
                            }
                        }
                    }
                });
        });
        $("#<%=ddlCampus1.ClientID%>").change(function () {
                $("#<%=hidCampusField1.ClientID%>").val($("#<%=ddlCampus1.ClientID%>").val());
            });
        //city 1
          $("#<%=ddlCollege1.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetCityDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCity1.ClientID%>").length >= 1) {
                                $("#<%=ddlCity1.ClientID%>").empty();
                                $("#<%=ddlCity1.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select City"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCity1.ClientID%>").append($("<option></option>").val(result[i].city_id).html(result[i].description));
                            }
                        }
                    }
                });
        });
         $("#<%=ddlCity1.ClientID%>").change(function () {
                $("#<%=hidCityField1.ClientID%>").val($("#<%=ddlCity1.ClientID%>").val());
            });
    //country 1
        $("#<%=ddlCollege1.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetCountryDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCountry1.ClientID%>").length >= 1) {
                                $("#<%=ddlCountry1.ClientID%>").empty();
                                $("#<%=ddlCountry1.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Country"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCountry1.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].country_name));
                            }
                        }
                    }
                });
        });
         $("#<%=ddlCountry1.ClientID%>").change(function () {
                $("#<%=hidCountryField1.ClientID%>").val($("#<%=ddlCountry1.ClientID%>").val());
            });
        //Major1
        $("#<%=ddlCollege1.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetMajorDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlMajor1.ClientID%>").length >= 1) {
                                $("#<%=ddlMajor1.ClientID%>").empty();
                                $("#<%=ddlMajor1.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Discipline"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlMajor1.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].description));
                            }
                        }
                    }
                });
        });
         $("#<%=ddlMajor1.ClientID%>").change(function () {
                $("#<%=HidMajorField1.ClientID%>").val($("#<%=ddlMajor1.ClientID%>").val());
            });
        //Mode 1
        $("#<%=ddlCollege1.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetModeDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlmode1.ClientID%>").length >= 1) {
                                $("#<%=ddlmode1.ClientID%>").empty();
                                $("#<%=ddlmode1.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Study Mode"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlmode1.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].description));
                            }
                        }
                    }
                });
        });
         $("#<%=ddlmode1.ClientID%>").change(function () {
                $("#<%=hidModeField1.ClientID%>").val($("#<%=ddlmode1.ClientID%>").val());
            });
        //course 1 /////// COURSETYPE IS STUDYLEVEL  
       
        $("#<%=ddlCourseType1.ClientID%>").change(function () {
            if ($("#<%=hidModeField1.ClientID%>").val() != "") {
                if ($("#<%=HidMajorField1.ClientID%>").val() != "") {
                    var coursetype = $("#<%=ddlCourseType1.ClientID%>").val();
                    var studymodeid = $("#<%=hidModeField1.ClientID%>").val();
                    var majorid = $("#<%=HidMajorField1.ClientID%>").val();
                    $.ajax({
                    type: "POST",
                    url: "applicantcourse.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",                         
                    data: "{'coursetypeid': '" + coursetype + "','modeofstudyid':'" + studymodeid + "','selectedMajorid': '" + majorid+"'}", 
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCourse1.ClientID%>").length >= 1) {
                                $("#<%=ddlCourse1.ClientID%>").empty();
                                $("#<%=ddlCourse1.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCourse1.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                            }
                        }
                    }
                    });
                }
            }
                
        });
         $("#<%=ddlmode1.ClientID%>").change(function () {
            if ($("#<%=ddlCourseType1.ClientID%>").val() != "0") {
                if ($("#<%=HidMajorField1.ClientID%>").val() != "") {
                    var coursetype = $("#<%=ddlCourseType1.ClientID%>").val();
                    var studymodeid = $("#<%=hidModeField1.ClientID%>").val();
                    var majorid = $("#<%=HidMajorField1.ClientID%>").val();
                    $.ajax({
                    type: "POST",
                    url: "applicantcourse.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'coursetypeid': '" + coursetype + "','modeofstudyid':'" + studymodeid + "','selectedMajorid': '" + majorid+"'}", 
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCourse1.ClientID%>").length >= 1) {
                                $("#<%=ddlCourse1.ClientID%>").empty();
                                $("#<%=ddlCourse1.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCourse1.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                            }
                        }
                    }
                    });
                }
            }
                
        });
        $("#<%=ddlMajor1.ClientID%>").change(function () {
            if ($("#<%=ddlCourseType1.ClientID%>").val() != "0") {
                if ($("#<%=hidModeField1.ClientID%>").val() != "") {
                    var coursetype = $("#<%=ddlCourseType1.ClientID%>").val();
                    var studymodeid = $("#<%=hidModeField1.ClientID%>").val();
                    var majorid = $("#<%=HidMajorField1.ClientID%>").val();
                    $.ajax({
                    type: "POST",
                    url: "applicantcourse.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'coursetypeid': '" + coursetype + "','modeofstudyid':'" + studymodeid + "','selectedMajorid': '" + majorid+"'}", 
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCourse1.ClientID%>").length >= 1) {
                                $("#<%=ddlCourse1.ClientID%>").empty();
                                $("#<%=ddlCourse1.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCourse1.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                            }
                        }
                    }
                    });
                }
            }
                
        });
        //course eligibility1
        $("#<%=ddlCourse1.ClientID%>").change(function ()
        {            
            var courseID = $("#<%=ddlCourse1.ClientID%>").val();
            $.ajax({
            type: "POST",
            url: "applicantcourse.aspx/GetCourseEligibility",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data:"{'courseid': '" + courseID + "'}",
            success: function (response) {
                if (response.d) {                    
                    var result = JSON.parse(response.d);
                    if (courseID != 0) {
                        $("#<%=courseeligibility.ClientID%>").show();
                        $("#<%=lblcourseeligibility.ClientID%>").text("");
                        for (var i = 0; i < result.length; i++)
                            $("#<%=lblcourseeligibility.ClientID%>").append(result[i].courseeligibility);
                    }
                    else
                        $("#<%=courseeligibility.ClientID%>").hide();
                }
            }
            });
        });     
        $("input[name='ctl00$ContentPlaceHolder1$eligibilityresponse']").click(function () {
            if ($("#<%=eligibilityYes.ClientID%>").is(":checked"))
                $("#<%=Hidcourseeligibility.ClientID%>").val(1);
            else if($("#<%=eligibilityNo.ClientID%>").is(":checked"))
                $("#<%=Hidcourseeligibility.ClientID%>").val(0);
        });
        $("#<%=ddlCourse1.ClientID%>").change(function () {
            $("#<%=hidCourseField1.ClientID%>").val($("#<%=ddlCourse1.ClientID%>").val());

            if ($("#<%=hidCourseField1.ClientID%>").val() != "") {
                var courseId = $("#<%=ddlCourse1.ClientID%>").val();
                $.ajax({
                    type: "POST",
                    url: "applicantcourse.aspx/GetCommenceDateDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'courseid': '" + courseId + "'}",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlCommencementdate.ClientID%>").length >= 1) {
                                $("#<%=ddlCommencementdate.ClientID%>").empty();
                                $("#<%=ddlCommencementdate.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Commencement Date"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlCommencementdate.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].commencementdate));
                        }
                    }
                });
            }
        });

        $("#<%=ddlCommencementdate.ClientID%>").change(function () {
            $("#<%=hidCommencementDate1.ClientID%>").val($("#<%=ddlCommencementdate.ClientID%>").val());
        });

        //campus2
        $("#<%=ddlCollege2.ClientID%>").change(function () {
            $.ajax({
                type: "GET",
                url: "applicantcourse.aspx/GetCampusDropdown",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        if ($("#<%=ddlCampus2.ClientID%>").length >= 1) {
                            $("#<%=ddlCampus2.ClientID%>").empty();
                            $("#<%=ddlCampus2.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Campus"));
                        }
                        for (var i = 0; i < result.length; i++) {
                            $("#<%=ddlCampus2.ClientID%>").append($("<option></option>").val(result[i].campusid).html(result[i].campusname));
                        }
                    }
                }
            });
        });
        $("#<%=ddlCampus2.ClientID%>").change(function () {
            $("#<%=hidCampusField2.ClientID%>").val($("#<%=ddlCampus2.ClientID%>").val());
        });
         //city 2
          $("#<%=ddlCollege2.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetCityDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCity2.ClientID%>").length >= 1) {
                                $("#<%=ddlCity2.ClientID%>").empty();
                                $("#<%=ddlCity2.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select City"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCity2.ClientID%>").append($("<option></option>").val(result[i].city_id).html(result[i].description));
                            }
                        }
                    }
                });
        });
        $("#<%=ddlCity2.ClientID%>").change(function () {
            $("#<%=hidCityField2.ClientID%>").val($("#<%=ddlCity2.ClientID%>").val());
        });
        //country 2
        $("#<%=ddlCollege2.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetCountryDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCountry2.ClientID%>").length >= 1) {
                                $("#<%=ddlCountry2.ClientID%>").empty();
                                $("#<%=ddlCountry2.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Country"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCountry2.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].country_name));
                            }
                        }
                    }
                });
        });
         $("#<%=ddlCountry2.ClientID%>").change(function () {
                $("#<%=hidCountryField2.ClientID%>").val($("#<%=ddlCountry2.ClientID%>").val());
            });
        //Major2
        $("#<%=ddlCollege2.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetMajorDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlMajor2.ClientID%>").length >= 1) {
                                $("#<%=ddlMajor2.ClientID%>").empty();
                                $("#<%=ddlMajor2.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Discipline"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlMajor2.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].description));
                            }
                        }
                    }
                });
        });
         $("#<%=ddlMajor2.ClientID%>").change(function () {
                $("#<%=hidMajorField2.ClientID%>").val($("#<%=ddlMajor2.ClientID%>").val());
            });
        //Mode 2
        $("#<%=ddlCollege2.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetModeDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlMode2.ClientID%>").length >= 1) {
                                $("#<%=ddlMode2.ClientID%>").empty();
                                $("#<%=ddlMode2.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Study Mode"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlMode2.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].description));
                            }
                        }
                    }
                });
        });
         $("#<%=ddlMode2.ClientID%>").change(function () {
                $("#<%=hidModeField2.ClientID%>").val($("#<%=ddlMode2.ClientID%>").val());
            });
        //course 2
        $("#<%=ddlcoursetype2.ClientID%>").change(function () {
            if ($("#<%=hidModeField2.ClientID%>").val() != "") {
                if ($("#<%=hidMajorField2.ClientID%>").val() != "") {
                    var coursetype = $("#<%=ddlcoursetype2.ClientID%>").val();
                    var studymodeid = $("#<%=hidModeField2.ClientID%>").val();
                    var majorid = $("#<%=hidMajorField2.ClientID%>").val();
                    $.ajax({
                    type: "POST",
                    url: "applicantcourse.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",                         
                    data: "{'coursetypeid': '" + coursetype + "','modeofstudyid':'" + studymodeid + "','selectedMajorid': '" + majorid+"'}", 
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCourse2.ClientID%>").length >= 1) {
                                $("#<%=ddlCourse2.ClientID%>").empty();
                                $("#<%=ddlCourse2.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCourse2.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                            }
                        }
                    }
                    });
                }
            }
                
        });
         $("#<%=ddlMode2.ClientID%>").change(function () {
            if ($("#<%=ddlcoursetype2.ClientID%>").val() != "0") {
                if ($("#<%=hidMajorField2.ClientID%>").val() != "") {
                    var coursetype = $("#<%=ddlcoursetype2.ClientID%>").val();
                    var studymodeid = $("#<%=hidModeField2.ClientID%>").val();
                    var majorid = $("#<%=hidMajorField2.ClientID%>").val();
                    $.ajax({
                    type: "POST",
                    url: "applicantcourse.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'coursetypeid': '" + coursetype + "','modeofstudyid':'" + studymodeid + "','selectedMajorid': '" + majorid+"'}", 
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCourse2.ClientID%>").length >= 1) {
                                $("#<%=ddlCourse2.ClientID%>").empty();
                                $("#<%=ddlCourse2.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCourse2.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                            }
                        }
                    }
                    });
                }
            }
                
        });
        $("#<%=ddlMajor2.ClientID%>").change(function () {
            if ($("#<%=ddlcoursetype2.ClientID%>").val() != "0") {
                if ($("#<%=hidModeField2.ClientID%>").val() != "") {
                    var coursetype = $("#<%=ddlcoursetype2.ClientID%>").val();
                    var studymodeid = $("#<%=hidModeField2.ClientID%>").val();
                    var majorid = $("#<%=hidMajorField2.ClientID%>").val();
                    $.ajax({
                    type: "POST",
                    url: "applicantcourse.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'coursetypeid': '" + coursetype + "','modeofstudyid':'" + studymodeid + "','selectedMajorid': '" + majorid+"'}", 
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCourse2.ClientID%>").length >= 1) {
                                $("#<%=ddlCourse2.ClientID%>").empty();
                                $("#<%=ddlCourse2.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCourse2.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                            }
                        }
                    }
                    });
                }
            }
                
        });   
        //course eligibility2
        $("#<%=ddlCourse2.ClientID%>").change(function ()
        {            
            var courseID = $("#<%=ddlCourse2.ClientID%>").val();
            $.ajax({
            type: "POST",
            url: "applicantcourse.aspx/GetCourseEligibility",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data:"{'courseid': '" + courseID + "'}",
            success: function (response) {
                if (response.d) {                    
                    var result = JSON.parse(response.d);
                    if (courseID != 0) {
                        $("#<%=courseeligibility2.ClientID%>").show();
                        $("#<%=lblcourseeligibility2.ClientID%>").text("");
                        for (var i = 0; i < result.length; i++)
                            $("#<%=lblcourseeligibility2.ClientID%>").append(result[i].courseeligibility);
                    }
                    else
                        $("#<%=courseeligibility2.ClientID%>").hide();
                }
            }
            });
        });     
        $("input[name='ctl00$ContentPlaceHolder2$eligibilityresponse']").click(function () {
            if ($("#<%=eligibilityYes2.ClientID%>").is(":checked"))
                $("#<%=Hidcourseeligibility2.ClientID%>").val(1);
            else if($("#<%=eligibilityNo2.ClientID%>").is(":checked"))
                $("#<%=Hidcourseeligibility2.ClientID%>").val(0);
        });


        $("#<%=ddlCourse2.ClientID%>").change(function () {
            $("#<%=hidCourseField2.ClientID%>").val($("#<%=ddlCourse2.ClientID%>").val());

            if ($("#<%=hidCourseField2.ClientID%>").val() != "") {
                var courseId = $("#<%=ddlCourse2.ClientID%>").val();
                $.ajax({
                    type: "POST",
                    url: "applicantcourse.aspx/GetCommenceDateDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'courseid': '" + courseId + "'}",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlCommencementdate2.ClientID%>").length >= 1) {
                                $("#<%=ddlCommencementdate2.ClientID%>").empty();
                                $("#<%=ddlCommencementdate2.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Commencement Date"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlCommencementdate2.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].commencementdate));
                        }
                    }
                });
            }
        });

        $("#<%=ddlCommencementdate2.ClientID%>").change(function () {
            $("#<%=hidCommencementDate2.ClientID%>").val($("#<%=ddlCommencementdate2.ClientID%>").val());
        });

        //campus3
        $("#<%=ddlCollege3.ClientID%>").change(function () {
            $.ajax({
                type: "GET",
                url: "applicantcourse.aspx/GetCampusDropdown",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        if ($("#<%=ddlCampus3.ClientID%>").length >= 1) {
                            $("#<%=ddlCampus3.ClientID%>").empty();
                            $("#<%=ddlCampus3.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Campus"));
                        }
                        for (var i = 0; i < result.length; i++) {
                            $("#<%=ddlCampus3.ClientID%>").append($("<option></option>").val(result[i].campusid).html(result[i].campusname));
                        }
                    }
                }
            });
        });
        $("#<%=ddlCampus3.ClientID%>").change(function () {
                $("#<%=hidCampusField3.ClientID%>").val($("#<%=ddlCampus3.ClientID%>").val());
            });
         //city 3
          $("#<%=ddlCollege3.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetCityDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCity3.ClientID%>").length >= 1) {
                                $("#<%=ddlCity3.ClientID%>").empty();
                                $("#<%=ddlCity3.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select City"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCity3.ClientID%>").append($("<option></option>").val(result[i].city_id).html(result[i].description));
                            }
                        }
                    }
                });
        });
         $("#<%=ddlCity3.ClientID%>").change(function () {
                $("#<%=hidCityField3.ClientID%>").val($("#<%=ddlCity3.ClientID%>").val());
        });
        //country 3
        $("#<%=ddlCollege3.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetCountryDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCountry3.ClientID%>").length >= 1) {
                                $("#<%=ddlCountry3.ClientID%>").empty();
                                $("#<%=ddlCountry3.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Country"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCountry3.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].country_name));
                            }
                        }
                    }
                });
        });
         $("#<%=ddlCountry3.ClientID%>").change(function () {
                $("#<%=hidCountryField3.ClientID%>").val($("#<%=ddlCountry3.ClientID%>").val());
            });
        //Major 3
        $("#<%=ddlCollege3.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetMajorDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlMajor3.ClientID%>").length >= 1) {
                                $("#<%=ddlMajor3.ClientID%>").empty();
                                $("#<%=ddlMajor3.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Discipline"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlMajor3.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].description));
                            }
                        }
                    }
                });
        });
         $("#<%=ddlMajor3.ClientID%>").change(function () {
                $("#<%=hidMajorField3.ClientID%>").val($("#<%=ddlMajor3.ClientID%>").val());
            });
        //Mode 3
        $("#<%=ddlCollege3.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetModeDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlMode3.ClientID%>").length >= 1) {
                                $("#<%=ddlMode3.ClientID%>").empty();
                                $("#<%=ddlMode3.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Study Mode"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlMode3.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].description));
                            }
                        }
                    }
                });
        });
         $("#<%=ddlMode3.ClientID%>").change(function () {
                $("#<%=hidModeField3.ClientID%>").val($("#<%=ddlMode3.ClientID%>").val());
            });
        
    //course 3
        $("#<%=ddlcoursetype3.ClientID%>").change(function () {
            if ($("#<%=hidModeField3.ClientID%>").val() != "") {
                if ($("#<%=hidMajorField3.ClientID%>").val() != "") {
                    var coursetype = $("#<%=ddlcoursetype3.ClientID%>").val();
                    var studymodeid = $("#<%=hidModeField3.ClientID%>").val();
                    var majorid = $("#<%=hidMajorField3.ClientID%>").val();
                    $.ajax({
                    type: "POST",
                    url: "applicantcourse.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",                         
                    data: "{'coursetypeid': '" + coursetype + "','modeofstudyid':'" + studymodeid + "','selectedMajorid': '" + majorid+"'}", 
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCourse3.ClientID%>").length >= 1) {
                                $("#<%=ddlCourse3.ClientID%>").empty();
                                $("#<%=ddlCourse3.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCourse3.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                            }
                        }
                    }
                    });
                }
            }
                
        });
         $("#<%=ddlMode3.ClientID%>").change(function () {
            if ($("#<%=ddlcoursetype3.ClientID%>").val() != "0") {
                if ($("#<%=hidMajorField3.ClientID%>").val() != "") {
                    var coursetype = $("#<%=ddlcoursetype3.ClientID%>").val();
                    var studymodeid = $("#<%=hidModeField3.ClientID%>").val();
                    var majorid = $("#<%=hidMajorField3.ClientID%>").val();
                    $.ajax({
                    type: "POST",
                    url: "applicantcourse.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'coursetypeid': '" + coursetype + "','modeofstudyid':'" + studymodeid + "','selectedMajorid': '" + majorid+"'}", 
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCourse3.ClientID%>").length >= 1) {
                                $("#<%=ddlCourse3.ClientID%>").empty();
                                $("#<%=ddlCourse3.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCourse3.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                            }
                        }
                    }
                    });
                }
            }
                
        });
        $("#<%=ddlMajor3.ClientID%>").change(function () {
            if ($("#<%=ddlcoursetype3.ClientID%>").val() != "0") {
                if ($("#<%=hidModeField3.ClientID%>").val() != "") {
                    var coursetype = $("#<%=ddlcoursetype3.ClientID%>").val();
                    var studymodeid = $("#<%=hidModeField3.ClientID%>").val();
                    var majorid = $("#<%=hidMajorField3.ClientID%>").val();
                    $.ajax({
                    type: "POST",
                    url: "applicantcourse.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'coursetypeid': '" + coursetype + "','modeofstudyid':'" + studymodeid + "','selectedMajorid': '" + majorid+"'}", 
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCourse3.ClientID%>").length >= 1) {
                                $("#<%=ddlCourse3.ClientID%>").empty();
                                $("#<%=ddlCourse3.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCourse3.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                            }
                        }
                    }
                    });
                }
            }
                
        });
        //course eligibility3
        $("#<%=ddlCourse3.ClientID%>").change(function ()
        {            
            var courseID = $("#<%=ddlCourse3.ClientID%>").val();
            $.ajax({
            type: "POST",
            url: "applicantcourse.aspx/GetCourseEligibility",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data:"{'courseid': '" + courseID + "'}",
            success: function (response) {
                if (response.d) {                    
                    var result = JSON.parse(response.d);
                    if (courseID != 0) {
                        $("#<%=courseeligibility3.ClientID%>").show();
                        $("#<%=lblcourseeligibility3.ClientID%>").text("");
                        for (var i = 0; i < result.length; i++)
                            $("#<%=lblcourseeligibility3.ClientID%>").append(result[i].courseeligibility);
                    }
                    else
                        $("#<%=courseeligibility3.ClientID%>").hide();
                }
            }
            });
        });     
        $("input[name='ctl00$ContentPlaceHolder3$eligibilityresponse']").click(function () {
            if ($("#<%=eligibilityYes3.ClientID%>").is(":checked"))
                $("#<%=Hidcourseeligibility3.ClientID%>").val(1);
            else if($("#<%=eligibilityNo3.ClientID%>").is(":checked"))
                $("#<%=Hidcourseeligibility3.ClientID%>").val(0);
        });
        $("#<%=ddlCourse3.ClientID%>").change(function () {
            $("#<%=hidCourseField3.ClientID%>").val($("#<%=ddlCourse3.ClientID%>").val());

            if ($("#<%=hidCourseField3.ClientID%>").val() != "") {
                var courseId = $("#<%=ddlCourse3.ClientID%>").val();
                $.ajax({
                    type: "POST",
                    url: "applicantcourse.aspx/GetCommenceDateDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'courseid': '" + courseId + "'}",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlCommencementdate3.ClientID%>").length >= 1) {
                                $("#<%=ddlCommencementdate3.ClientID%>").empty();
                                $("#<%=ddlCommencementdate3.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Commencement Date"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlCommencementdate3.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].commencementdate));
                        }
                    }
                });
            }
        });

        $("#<%=ddlCommencementdate3.ClientID%>").change(function () {
            $("#<%=hidCommencementDate3.ClientID%>").val($("#<%=ddlCommencementdate3.ClientID%>").val());
        });

        //campus4
        $("#<%=ddlCollege4.ClientID%>").change(function () {
            $.ajax({
                type: "GET",
                url: "applicantcourse.aspx/GetCampusDropdown",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        if ($("#<%=ddlCampus4.ClientID%>").length >= 1) {
                            $("#<%=ddlCampus4.ClientID%>").empty();
                            $("#<%=ddlCampus4.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Campus"));
                        }
                        for (var i = 0; i < result.length; i++) {
                            $("#<%=ddlCampus4.ClientID%>").append($("<option></option>").val(result[i].campusid).html(result[i].campusname));
                        }
                    }
                }
            });
        });
        $("#<%=ddlCampus4.ClientID%>").change(function () {
                $("#<%=hidCampusField4.ClientID%>").val($("#<%=ddlCampus4.ClientID%>").val());
            });
         //city 4
          $("#<%=ddlCollege4.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetCityDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCity4.ClientID%>").length >= 1) {
                                $("#<%=ddlCity4.ClientID%>").empty();
                                $("#<%=ddlCity4.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select City"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCity4.ClientID%>").append($("<option></option>").val(result[i].city_id).html(result[i].description));
                            }
                        }
                    }
                });
        });
         $("#<%=ddlCity4.ClientID%>").change(function () {
                $("#<%=hidCityField4.ClientID%>").val($("#<%=ddlCity4.ClientID%>").val());
            });
    //country 4
        $("#<%=ddlCollege4.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetCountryDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCountry4.ClientID%>").length >= 1) {
                                $("#<%=ddlCountry4.ClientID%>").empty();
                                $("#<%=ddlCountry4.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Country"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCountry4.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].country_name));
                            }
                        }
                    }
                });
        });
         $("#<%=ddlCountry4.ClientID%>").change(function () {
                $("#<%=hidCountryField4.ClientID%>").val($("#<%=ddlCountry4.ClientID%>").val());
        });
          //Major4
        $("#<%=ddlCollege4.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetMajorDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlMajor4.ClientID%>").length >= 1) {
                                $("#<%=ddlMajor4.ClientID%>").empty();
                                $("#<%=ddlMajor4.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Discipline"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlMajor4.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].description));
                            }
                        }
                    }
                });
        });
         $("#<%=ddlMajor4.ClientID%>").change(function () {
                $("#<%=hidMajorField4.ClientID%>").val($("#<%=ddlMajor4.ClientID%>").val());
            });
        //Mode 4
        $("#<%=ddlCollege4.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetModeDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlMode4.ClientID%>").length >= 1) {
                                $("#<%=ddlMode4.ClientID%>").empty();
                                $("#<%=ddlMode4.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Study Mode"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlMode4.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].description));
                            }
                        }
                    }
                });
        });
         $("#<%=ddlMode4.ClientID%>").change(function () {
                $("#<%=hidModeField4.ClientID%>").val($("#<%=ddlMode4.ClientID%>").val());
            });
        //course 4
        $("#<%=ddlcoursetype4.ClientID%>").change(function () {
            if ($("#<%=hidModeField4.ClientID%>").val() != "") {
                if ($("#<%=hidMajorField4.ClientID%>").val() != "") {
                    var coursetype = $("#<%=ddlcoursetype4.ClientID%>").val();
                    var studymodeid = $("#<%=hidModeField4.ClientID%>").val();
                    var majorid = $("#<%=hidMajorField4.ClientID%>").val();
                    $.ajax({
                    type: "POST",
                    url: "applicantcourse.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",                         
                    data: "{'coursetypeid': '" + coursetype + "','modeofstudyid':'" + studymodeid + "','selectedMajorid': '" + majorid+"'}", 
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCourse4.ClientID%>").length >= 1) {
                                $("#<%=ddlCourse4.ClientID%>").empty();
                                $("#<%=ddlCourse4.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCourse4.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                            }
                        }
                    }
                    });
                }
            }
                
        });
         $("#<%=ddlMode4.ClientID%>").change(function () {
            if ($("#<%=ddlcoursetype4.ClientID%>").val() != "0") {
                if ($("#<%=hidMajorField4.ClientID%>").val() != "") {
                    var coursetype = $("#<%=ddlcoursetype4.ClientID%>").val();
                    var studymodeid = $("#<%=hidModeField4.ClientID%>").val();
                    var majorid = $("#<%=hidMajorField4.ClientID%>").val();
                    $.ajax({
                    type: "POST",
                    url: "applicantcourse.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'coursetypeid': '" + coursetype + "','modeofstudyid':'" + studymodeid + "','selectedMajorid': '" + majorid+"'}", 
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCourse4.ClientID%>").length >= 1) {
                                $("#<%=ddlCourse4.ClientID%>").empty();
                                $("#<%=ddlCourse4.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCourse4.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                            }
                        }
                    }
                    });
                }
            }
                
        });
        $("#<%=ddlMajor4.ClientID%>").change(function () {
            if ($("#<%=ddlcoursetype4.ClientID%>").val() != "0") {
                if ($("#<%=hidModeField4.ClientID%>").val() != "") {
                    var coursetype = $("#<%=ddlcoursetype4.ClientID%>").val();
                    var studymodeid = $("#<%=hidModeField4.ClientID%>").val();
                    var majorid = $("#<%=hidMajorField4.ClientID%>").val();
                    $.ajax({
                    type: "POST",
                    url: "applicantcourse.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'coursetypeid': '" + coursetype + "','modeofstudyid':'" + studymodeid + "','selectedMajorid': '" + majorid+"'}", 
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCourse4.ClientID%>").length >= 1) {
                                $("#<%=ddlCourse4.ClientID%>").empty();
                                $("#<%=ddlCourse4.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCourse4.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                            }
                        }
                    }
                    });
                }
            }
                
        });
        //course eligibility4
        $("#<%=ddlCourse4.ClientID%>").change(function ()
        {            
            var courseID = $("#<%=ddlCourse4.ClientID%>").val();
            $.ajax({
            type: "POST",
            url: "applicantcourse.aspx/GetCourseEligibility",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data:"{'courseid': '" + courseID + "'}",
            success: function (response) {
                if (response.d) {                    
                    var result = JSON.parse(response.d);
                    if (courseID != 0) {
                        $("#<%=courseeligibility4.ClientID%>").show();
                        $("#<%=lblcourseeligibility4.ClientID%>").text("");
                        for (var i = 0; i < result.length; i++)
                            $("#<%=lblcourseeligibility4.ClientID%>").append(result[i].courseeligibility);
                    }
                    else
                        $("#<%=courseeligibility4.ClientID%>").hide();
                }
            }
            });
        });     
        $("input[name='ctl00$ContentPlaceHolder4$eligibilityresponse']").click(function () {
            if ($("#<%=eligibilityYes4.ClientID%>").is(":checked"))
                $("#<%=Hidcourseeligibility4.ClientID%>").val(1);
            else if($("#<%=eligibilityNo4.ClientID%>").is(":checked"))
                $("#<%=Hidcourseeligibility4.ClientID%>").val(0);
        });
        $("#<%=ddlCourse4.ClientID%>").change(function () {
            $("#<%=hidCourseField4.ClientID%>").val($("#<%=ddlCourse4.ClientID%>").val());

            if ($("#<%=hidCourseField3.ClientID%>").val() != "") {
                var courseId = $("#<%=ddlCourse4.ClientID%>").val();
                $.ajax({
                    type: "POST",
                    url: "applicantcourse.aspx/GetCommenceDateDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'courseid': '" + courseId + "'}",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlCommencementdate4.ClientID%>").length >= 1) {
                                $("#<%=ddlCommencementdate4.ClientID%>").empty();
                                $("#<%=ddlCommencementdate4.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Commencement Date"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlCommencementdate4.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].commencementdate));
                        }
                    }
                });
            }
        });

        $("#<%=ddlCommencementdate4.ClientID%>").change(function () {
            $("#<%=hidCommencementDate4.ClientID%>").val($("#<%=ddlCommencementdate4.ClientID%>").val());
        });

        //campus5
        $("#<%=ddlCollege5.ClientID%>").change(function () {
            $.ajax({
                type: "GET",
                url: "applicantcourse.aspx/GetCampusDropdown",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        if ($("#<%=ddlCampus5.ClientID%>").length >= 1) {
                            $("#<%=ddlCampus5.ClientID%>").empty();
                            $("#<%=ddlCampus5.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Campus"));
                        }
                        for (var i = 0; i < result.length; i++) {
                            $("#<%=ddlCampus5.ClientID%>").append($("<option></option>").val(result[i].campusid).html(result[i].campusname));
                        }
                    }
                }
            });
        });
        $("#<%=ddlCampus5.ClientID%>").change(function () {
                $("#<%=hidCampusField5.ClientID%>").val($("#<%=ddlCampus5.ClientID%>").val());
            });
         //city 5
          $("#<%=ddlCollege5.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetCityDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCity5.ClientID%>").length >= 1) {
                                $("#<%=ddlCity5.ClientID%>").empty();
                                $("#<%=ddlCity5.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select City"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCity5.ClientID%>").append($("<option></option>").val(result[i].city_id).html(result[i].description));
                            }
                        }
                    }
                });
        });
         $("#<%=ddlCity5.ClientID%>").change(function () {
                $("#<%=hidCityField5.ClientID%>").val($("#<%=ddlCity5.ClientID%>").val());
            });
    //country 5
        $("#<%=ddlCollege5.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetCountryDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCountry5.ClientID%>").length >= 1) {
                                $("#<%=ddlCountry5.ClientID%>").empty();
                                $("#<%=ddlCountry5.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Country"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCountry5.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].country_name));
                            }
                        }
                    }
                });
        });
         $("#<%=ddlCountry5.ClientID%>").change(function () {
                $("#<%=hidCountryField5.ClientID%>").val($("#<%=ddlCountry5.ClientID%>").val());
            });
        //Major5
        $("#<%=ddlCollege5.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetMajorDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlMajor5.ClientID%>").length >= 1) {
                                $("#<%=ddlMajor5.ClientID%>").empty();
                                $("#<%=ddlMajor5.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Discipline"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlMajor5.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].description));
                            }
                        }
                    }
                });
        });
         $("#<%=ddlMajor5.ClientID%>").change(function () {
                $("#<%=hidMajorField5.ClientID%>").val($("#<%=ddlMajor5.ClientID%>").val());
            });
       
           //Mode 5
        $("#<%=ddlCollege5.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "applicantcourse.aspx/GetModeDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlMode5.ClientID%>").length >= 1) {
                                $("#<%=ddlMode5.ClientID%>").empty();
                                $("#<%=ddlMode5.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Study Mode"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlMode5.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].description));
                            }
                        }
                    }
                });
        });
         $("#<%=ddlMode5.ClientID%>").change(function () {
                $("#<%=hidModeField5.ClientID%>").val($("#<%=ddlMode5.ClientID%>").val());
            });
        
      //course 5
        $("#<%=ddlcoursetype5.ClientID%>").change(function () {
            if ($("#<%=hidModeField4.ClientID%>").val() != "") {
                if ($("#<%=hidMajorField5.ClientID%>").val() != "") {
                    var coursetype = $("#<%=ddlcoursetype4.ClientID%>").val();
                    var studymodeid = $("#<%=hidModeField5.ClientID%>").val();
                    var majorid = $("#<%=hidMajorField5.ClientID%>").val();
                    $.ajax({
                    type: "POST",
                    url: "applicantcourse.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",                         
                    data: "{'coursetypeid': '" + coursetype + "','modeofstudyid':'" + studymodeid + "','selectedMajorid': '" + majorid+"'}", 
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCourse5.ClientID%>").length >= 1) {
                                $("#<%=ddlCourse5.ClientID%>").empty();
                                $("#<%=ddlCourse5.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCourse5.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                            }
                        }
                    }
                    });
                }
            }
                
        });
         $("#<%=ddlMode5.ClientID%>").change(function () {
            if ($("#<%=ddlcoursetype5.ClientID%>").val() != "0") {
                if ($("#<%=hidMajorField5.ClientID%>").val() != "") {
                    var coursetype = $("#<%=ddlcoursetype5.ClientID%>").val();
                    var studymodeid = $("#<%=hidModeField5.ClientID%>").val();
                    var majorid = $("#<%=hidMajorField5.ClientID%>").val();
                    $.ajax({
                    type: "POST",
                    url: "applicantcourse.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'coursetypeid': '" + coursetype + "','modeofstudyid':'" + studymodeid + "','selectedMajorid': '" + majorid+"'}", 
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCourse5.ClientID%>").length >= 1) {
                                $("#<%=ddlCourse5.ClientID%>").empty();
                                $("#<%=ddlCourse5.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCourse5.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                            }
                        }
                    }
                    });
                }
            }
                
        });
        $("#<%=ddlMajor5.ClientID%>").change(function () {
            if ($("#<%=ddlcoursetype5.ClientID%>").val() != "0") {
                if ($("#<%=hidModeField5.ClientID%>").val() != "") {
                    var coursetype = $("#<%=ddlcoursetype5.ClientID%>").val();
                    var studymodeid = $("#<%=hidModeField5.ClientID%>").val();
                    var majorid = $("#<%=hidMajorField5.ClientID%>").val();
                    $.ajax({
                    type: "POST",
                    url: "applicantcourse.aspx/GetCourseDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'coursetypeid': '" + coursetype + "','modeofstudyid':'" + studymodeid + "','selectedMajorid': '" + majorid+"'}", 
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);                            
                            if ($("#<%=ddlCourse5.ClientID%>").length >= 1) {
                                $("#<%=ddlCourse5.ClientID%>").empty();
                                $("#<%=ddlCourse5.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Course"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlCourse5.ClientID%>").append($("<option></option>").val(result[i].courseid).html(result[i].coursename));
                            }
                        }
                    }
                    });
                }
            }
                
        });
        //course eligibility5
        $("#<%=ddlCourse5.ClientID%>").change(function ()
        {            
            var courseID = $("#<%=ddlCourse5.ClientID%>").val();
            $.ajax({
            type: "POST",
            url: "applicantcourse.aspx/GetCourseEligibility",
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            data:"{'courseid': '" + courseID + "'}",
            success: function (response) {
                if (response.d) {                    
                    var result = JSON.parse(response.d);
                    if (courseID != 0) {
                        $("#<%=courseeligibility5.ClientID%>").show();
                        $("#<%=lblcourseeligibility5.ClientID%>").text("");
                        for (var i = 0; i < result.length; i++)
                            $("#<%=lblcourseeligibility5.ClientID%>").append(result[i].courseeligibility);
                    }
                    else
                        $("#<%=courseeligibility5.ClientID%>").hide();
                }
            }
            });
        });     
        $("input[name='ctl00$ContentPlaceHolder5$eligibilityresponse']").click(function () {
            if ($("#<%=eligibilityYes5.ClientID%>").is(":checked"))
                $("#<%=Hidcourseeligibility5.ClientID%>").val(1);
            else if($("#<%=eligibilityNo5.ClientID%>").is(":checked"))
                $("#<%=Hidcourseeligibility5.ClientID%>").val(0);
        });
        $("#<%=ddlCourse5.ClientID%>").change(function () {
            $("#<%=hidCourseField5.ClientID%>").val($("#<%=ddlCourse5.ClientID%>").val());

            if ($("#<%=hidCourseField5.ClientID%>").val() != "") {
                var courseId = $("#<%=ddlCourse5.ClientID%>").val();
                $.ajax({
                    type: "POST",
                    url: "applicantcourse.aspx/GetCommenceDateDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: "{'courseid': '" + courseId + "'}",
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlCommencementdate5.ClientID%>").length >= 1) {
                                $("#<%=ddlCommencementdate5.ClientID%>").empty();
                                $("#<%=ddlCommencementdate5.ClientID%>").append($('<option selected="selected"></option>').val(0).html("Select Commencement Date"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlCommencementdate5.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].commencementdate));
                        }
                    }
                });
            }
        });

        $("#<%=ddlCommencementdate5.ClientID%>").change(function () {
            $("#<%=hidCommencementDate5.ClientID%>").val($("#<%=ddlCommencementdate5.ClientID%>").val());
        });       
              
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#studentapplication_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantcourse').addClass('active');
        });  
    </script>
</asp:Content>
