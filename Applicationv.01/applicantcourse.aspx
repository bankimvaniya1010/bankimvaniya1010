<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantcourse.aspx.cs" Inherits="applicantcourse" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">YOUR APPLICATION</li>
        </ol>
        <h1 class="h2">YOUR APPLICATION</h1>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">
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
                                        <asp:DropDownList ID="ddlCollege1" CssClass="form-control" OnSelectedIndexChanged="ddlCollege1_SelectedIndexChanged" AutoPostBack="true" runat="server" >
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
                                            <asp:ListItem value="0">Select Campus</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="ddlCity1" runat="server" CssClass="form-control"> 
                                            <asp:ListItem value="0">Select City</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="ddlCountry1" runat="server" CssClass="form-control">
                                            <asp:ListItem value="0">Select Country</asp:ListItem>
                                        </asp:DropDownList>
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
                                            <asp:ListItem value="0">Select Study Mode</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="major1" runat="server">
                            <div class="form-group m-0" role="group" aria-labelledby="label-major1">
                                <div class="form-row">
                                    <label id="label-major1" for="major1" class="col-md-3 col-form-label form-label">Select Major or Discipline</label>
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlMajor1" OnSelectedIndexChanged="ddlMajor1_SelectedIndexChanged" AutoPostBack="true" runat="server" CssClass="form-control">
                                             <asp:ListItem value="0">Select Discipline</asp:ListItem>
                                        </asp:DropDownList>
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
                                            <asp:ListItem value="0">Select Course</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="list-group-item" id="commencementmonth1" runat="server">
                            <div class="form-group m-0" role="group" aria-labelledby="label-commencementmonth1">
                                <div class="form-row">
                                    <label id="label-commencementmonth1" for="commencementmonth1" class="col-md-3 col-form-label form-label">Select Commencement Date</label>
                                    <div class="col-md-6">
                                        <input id="txtCommencementdate1" runat="server" type="text" class="form-control" placeholder="Commencement Date" data-toggle="flatpickr" value="">
                                    </div>
                                </div>
                            </div>
                        </div>                       
                        <!--- End First Preference-->

                        <!---  Second Preference-->
                        <a class="btn btn-success" style="width: 200px" onclick="toggleDivVisibility('second');">Add Second Preference
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
                                            <asp:DropDownList ID="ddlCollege2" OnSelectedIndexChanged="ddlCollege2_SelectedIndexChanged" AutoPostBack="true" runat="server" CssClass="form-control">
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
                                                <asp:ListItem value="0">Select Campus</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlCity2" runat="server" CssClass="form-control">
                                                <asp:ListItem value="0">Select City</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlCountry2" runat="server" CssClass="form-control">
                                                <asp:ListItem value="0">Select Country</asp:ListItem>
                                            </asp:DropDownList>
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
                                                 <asp:ListItem value="0">Select Study Mode</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="major2" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-major2">
                                    <div class="form-row">
                                        <label id="label-major2" for="major2" class="col-md-3 col-form-label form-label">Select Major or Discipline</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMajor2" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlMajor2_SelectedIndexChanged" AutoPostBack="true">
                                                 <asp:ListItem value="0">Select Discipline</asp:ListItem>
                                            </asp:DropDownList>
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
                                                 <asp:ListItem value="0">Select Course</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="commencementmonth2" runat="server">
                            <div class="form-group m-0" role="group" aria-labelledby="label-commencementmonth1">
                                <div class="form-row">
                                    <label id="label-commencementmonth2" for="commencementmonth1" class="col-md-3 col-form-label form-label">Select Commencement Date</label>
                                    <div class="col-md-6">
                                         <input id="txtCommencementdate2" runat="server" type="text" class="form-control" placeholder="Commencement Date" data-toggle="flatpickr" value="">
                                    </div>
                                </div>
                            </div>
                        </div> 
                            </div> 
                        <!--- End Second Preference-->

                        <!---  Third Preference-->
                        <a class="btn btn-success" style="width: 200px" onclick="toggleDivVisibility('third')">Add Third Preference
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
                                            <asp:DropDownList ID="ddlCollege3" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlCollege3_SelectedIndexChanged" AutoPostBack="true">
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
                                                <asp:ListItem value="0">Select Campus</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlCity3" runat="server" CssClass="form-control">
                                                <asp:ListItem value="0">Select City</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlCountry3" runat="server" CssClass="form-control">
                                                <asp:ListItem value="0">Select Country</asp:ListItem>
                                            </asp:DropDownList>
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
                                                 <asp:ListItem value="0">Select Study Mode</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="major3" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-major3">
                                    <div class="form-row">
                                        <label id="label-major3" for="major3" class="col-md-3 col-form-label form-label">Select Major or Discipline</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMajor3" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlMajor3_SelectedIndexChanged" AutoPostBack="true">
                                                 <asp:ListItem value="0">Select Discipline</asp:ListItem>
                                            </asp:DropDownList>
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
                                                 <asp:ListItem value="0">Select Course</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           <div class="list-group-item" id="commencementmonth3" runat="server">
                            <div class="form-group m-0" role="group" aria-labelledby="label-commencementmonth1">
                                <div class="form-row">
                                    <label id="label-commencementmonth3" for="commencementmonth1" class="col-md-3 col-form-label form-label">Select Commencement Date</label>
                                    <div class="col-md-6">
                                        <input id="txtCommencementdate3" runat="server" type="text" class="form-control" placeholder="Commencement Date" data-toggle="flatpickr" value="">
                                    </div>
                                </div>
                            </div>
                        </div> 
                        </div>
                        <!--- End Third Preference-->
                        <!---  Fourth Preference-->
                        <a class="btn btn-success" style="width: 200px" onclick="toggleDivVisibility('four')">Add Fourth Preference
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
                                            <asp:DropDownList ID="ddlCollege4" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlCollege4_SelectedIndexChanged" AutoPostBack="true">
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
                                                <asp:ListItem value="0">Select Campus</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlCity4" CssClass="form-control" runat="server">
                                                <asp:ListItem value="0">Select City</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlCountry4" CssClass="form-control" runat="server">
                                                <asp:ListItem value="0">Select Country</asp:ListItem>
                                            </asp:DropDownList>
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
                                                 <asp:ListItem value="0">Select Study Mode</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="major4" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-major4">
                                    <div class="form-row">
                                        <label id="label-major4" for="major4" class="col-md-3 col-form-label form-label">Select Major or Discipline</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMajor4" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlMajor4_SelectedIndexChanged" AutoPostBack="true">
                                                 <asp:ListItem value="0">Select Discipline</asp:ListItem>
                                            </asp:DropDownList>
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
                                                 <asp:ListItem value="0">Select Course</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="commencementmonth4" runat="server">
                            <div class="form-group m-0" role="group" aria-labelledby="label-commencementmonth1">
                                <div class="form-row">
                                    <label id="label-commencementmonth4" for="commencementmonth1" class="col-md-3 col-form-label form-label">Select Commencement Date</label>
                                    <div class="col-md-6">
                                        <input id="txtCommencementdate4" runat="server" type="text" class="form-control" placeholder="Commencement Date" data-toggle="flatpickr" value="">
                                    </div>
                                </div>
                            </div>
                        </div> 
                        </div>
                        <!--- End Fourth Preference-->

                        <!---  Fifth Preference-->
                        <a class="btn btn-success" style="width: 200px" onclick="toggleDivVisibility('five')">Add Fifth Preference
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
                                            <asp:DropDownList ID="ddlCollege5" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlCollege5_SelectedIndexChanged" AutoPostBack="true">
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
                                                <asp:ListItem value="0">Select Campus</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlCity5" CssClass="form-control" runat="server">
                                                <asp:ListItem value="0">Select City</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="ddlCountry5" CssClass="form-control" runat="server">
                                                <asp:ListItem value="0">Select Country</asp:ListItem>
                                            </asp:DropDownList>
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
                                                 <asp:ListItem value="0">Select Study Mode</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="major5" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-major2">
                                    <div class="form-row">
                                        <label id="label-major5" for="major5" class="col-md-3 col-form-label form-label">Select Major or Discipline</label>
                                        <div class="col-md-6">
                                            <asp:DropDownList ID="ddlMajor5" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlMajor5_SelectedIndexChanged" AutoPostBack="true">
                                                 <asp:ListItem value="0">Select Discipline</asp:ListItem>
                                            </asp:DropDownList>
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
                                                 <asp:ListItem value="0">Select Course</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           <div class="list-group-item" id="commencementmonth5" runat="server">
                            <div class="form-group m-0" role="group" aria-labelledby="label-commencementmonth1">
                                <div class="form-row">
                                    <label id="label-commencementmonth5" for="commencementmonth1" class="col-md-3 col-form-label form-label">Select Commencement Date</label>
                                    <div class="col-md-6">
                                        <input id="txtCommencementdate5" runat="server" type="text" class="form-control" placeholder="Commencement Date" data-toggle="flatpickr" value="">
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
            else if ($("#<%=ddlCampus1.ClientID%>").val() == "0")
                alert("Please Select Campus");
            else if ($("#<%=ddlCity1.ClientID%>").val() == "0")
                alert("Please Select City");
            else if ($("#<%=ddlCountry1.ClientID%>").val() == "0")
                alert("Please Select Country");
            else if ($("#<%=ddlCourseType1.ClientID%>").val() == "0")
                alert("Please Select Course Type");
            else if ($("#<%=ddlmode1.ClientID%>").val() == "0")
                alert("Please Select Mode Of Study");
            else if ($("#<%=ddlMajor1.ClientID%>").val() == "0")
                alert("Please Select Major Or Discipline");
            else if ($("#<%=ddlCourse1.ClientID%>").val() == "0")
                alert("Please Select Course");
            else if ($("#<%=txtCommencementdate1.ClientID%>").val() == "")
                alert("Please Select Commencement Date");
            else
                flag = true;
            
            return flag;
        }
        function validSecondPreference() {
            var flag = false;
            if (!$("#<%=second.ClientID%>").is(':hidden') || !($("#<%=ddlCollege2.ClientID%>").val() == "0")) {               
                if ($("#<%=ddlCampus2.ClientID%>").val() == "0")
                    alert("Please Select Campus");
                else if ($("#<%=ddlCity2.ClientID%>").val() == "0")
                    alert("Please Select City");
                else if ($("#<%=ddlCountry2.ClientID%>").val() == "0")
                    alert("Please Select Country");
                else if ($("#<%=ddlcoursetype2.ClientID%>").val() == "0")
                    alert("Please Select Course Type");
                else if ($("#<%=ddlMode2.ClientID%>").val() == "0")
                    alert("Please Select Mode Of Study");
                else if ($("#<%=ddlMajor2.ClientID%>").val() == "0")
                    alert("Please Select Major Or Discipline");
                else if ($("#<%=ddlCourse2.ClientID%>").val() == "0")
                    alert("Please Select Course");
                else if ($("#<%=txtCommencementdate2.ClientID%>").val() == "")
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

                    if ($("#<%=ddlCampus3.ClientID%>").val() == "0")
                        alert("Please Select Campus");
                    else if ($("#<%=ddlCity3.ClientID%>").val() == "0")
                        alert("Please Select City");
                    else if ($("#<%=ddlCountry3.ClientID%>").val() == "0")
                        alert("Please Select Country");
                    else if ($("#<%=ddlcoursetype3.ClientID%>").val() == "0")
                        alert("Please Select Course Type");
                    else if ($("#<%=ddlMode3.ClientID%>").val() == "0")
                        alert("Please Select Mode Of Study");
                    else if ($("#<%=ddlMajor3.ClientID%>").val() == "0")
                        alert("Please Select Major Or Discipline");
                    else if ($("#<%=ddlCourse3.ClientID%>").val() == "0")
                        alert("Please Select Course");
                    else if ($("#<%=txtCommencementdate3.ClientID%>").val() == "")
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
                    if ($("#<%=ddlCampus4.ClientID%>").val() == "0")
                        alert("Please Select Campus");
                    else if ($("#<%=ddlCity4.ClientID%>").val() == "0")
                        alert("Please Select City");
                    else if ($("#<%=ddlCountry4.ClientID%>").val() == "0")
                        alert("Please Select Country");
                    else if ($("#<%=ddlcoursetype4.ClientID%>").val() == "0")
                        alert("Please Select Course Type");
                    else if ($("#<%=ddlMode4.ClientID%>").val() == "0")
                        alert("Please Select Mode Of Study");
                    else if ($("#<%=ddlMajor4.ClientID%>").val() == "0")
                        alert("Please Select Major Or Discipline");
                    else if ($("#<%=ddlCourse4.ClientID%>").val() == "0")
                        alert("Please Select Course");
                    else if ($("#<%=txtCommencementdate4.ClientID%>").val() == "")
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

                    if ($("#<%=ddlCampus5.ClientID%>").val() == "0")
                        alert("Please Select Campus");
                    else if ($("#<%=ddlCity5.ClientID%>").val() == "0")
                        alert("Please Select City");
                    else if ($("#<%=ddlCountry5.ClientID%>").val() == "0")
                        alert("Please Select Country");
                    else if ($("#<%=ddlcoursetype5.ClientID%>").val() == "0")
                        alert("Please Select Course Type");
                    else if ($("#<%=ddlMode5.ClientID%>").val() == "0")
                        alert("Please Select Mode Of Study");
                    else if ($("#<%=ddlMajor5.ClientID%>").val() == "0")
                        alert("Please Select Major Or Discipline");
                    else if ($("#<%=ddlCourse5.ClientID%>").val() == "0")
                        alert("Please Select Course");
                    else if ($("#<%=txtCommencementdate5.ClientID%>").val() == "")
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
  

    </script>
</asp:Content>
