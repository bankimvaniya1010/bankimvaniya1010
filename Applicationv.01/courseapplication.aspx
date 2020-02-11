<%@ Page Language="C#" AutoEventWireup="true" CodeFile="courseapplication.aspx.cs" Inherits="courseapplication" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <style>
        .ui-accordion-header:hover {
            color: black;
        }

        .ui-accordion-header {
            background: unset;
            color: black;
            text-decoration: solid;
        }
    </style>

    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">YOUR APPLICATION</li>
        </ol>
        <h1 class="h2">YOUR COURSE APPLICATION</h1>

    </div>
    <div class="page ">
        <div class="container page__container" style="padding-left: 8px;">
            <div class="row" style="margin-right: -1.625rem;">
                <div class="col-md-8">
                    <div class="card">
                        <div class="card-body">

                            <div id="selectedbar" runat="server">
                                <div class="selectionPills">
                                    <div class="selectionPillsList" id="progressbar_country" style="display:none">
                                        <div class="selectionPillsListLabel">Country:</div>
                                        <div class="selectionPillsListText">
                                            <label id="selectedcountry" runat="server"></label>
                                        </div>
                                        <div class="selectionPillsListRemove">
                                            <button type="button" style="width: 30px;height:14px;" class="close" id="countryclosebtn">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                        </div>
                                        <asp:HiddenField runat="server" ID="HidselectedcountryID" />
                                        <asp:HiddenField runat="server" ID="HidselectedcountryName" />
                                    </div>

                                    <div class="selectionPillsList" id="progressbar_city" style="display:none">
                                        <div class="selectionPillsListLabel">City:</div>
                                        <div class="selectionPillsListText">
                                            <label id="selectedcity" runat="server"></label>
                                        </div>
                                        <div class="selectionPillsListRemove">
                                            <button type="button" class="close" style="width: 30px; height:14px;" id="cityclosebtn"><span aria-hidden="true">×</span></button>
                                        </div>
                                        <asp:HiddenField runat="server" ID="HidselectedcityID" />
                                        <asp:HiddenField runat="server" ID="HidselectedcityName" />
                                    </div>

                                    <div class="selectionPillsList" id="progressbar_studylevel" style="display:none">
                                        <div class="selectionPillsListLabel">Studylevel:</div>
                                        <div class="selectionPillsListText">
                                            <label id="selectedstudylevel" runat="server"></label>
                                        </div>
                                        <div class="selectionPillsListRemove">
                                            <button type="button" class="close" style="width: 30px;height:14px;" id="levelclosebtn"><span aria-hidden="true">×</span></button>
                                        </div>

                                        <asp:HiddenField runat="server" ID="HidselectedstudylevelID" />
                                        <asp:HiddenField runat="server" ID="HidselectedstudylevelName" />
                                    </div>

                                    <div class="selectionPillsList" id="progressbar_major" style="display:none">
                                        <div class="selectionPillsListLabel">Major:</div>
                                        <div class="selectionPillsListText">
                                            <label id="selectedmajor" runat="server"></label>
                                        </div>
                                        <div class="selectionPillsListRemove">
                                            <button type="button" class="close" style="width: 30px;height:14px;" id="majorclosebtn"><span aria-hidden="true">×</span></button>
                                        </div>
                                        <asp:HiddenField runat="server" ID="HidselectedmajorID" />
                                        <asp:HiddenField runat="server" ID="HidselectedmajorName" />
                                    </div>
                                </div>
                            </div>
                                    <%--accordion--%>
                                    <div id="accordion">

                                        <h3 aria-expanded="false" aria-selected="false">Select Country +</h3>
                                        <div id="rbCountryContainer">
                                            <p>
                                                <asp:RadioButtonList ID="rblcountry" runat="server" RepeatDirection="Vertical"></asp:RadioButtonList>
                                            </p>
                                        </div>

                                        <h3 id="citybtn">Select City +</h3>

                                        <div class="col-md-12 updt-prftbl" id="rbCityContainer" style="height: auto;">
                                        </div>
                                        <asp:HiddenField runat="server" ID="HidRBSelectedcityID" />
                                        <asp:HiddenField runat="server" ID="HidRBSelectedcityName" />

                                        <h3>Select Level Of Study  +</h3>
                                        <div id="studylevelcontainer" class="col-md-12 updt-prftbl">
                                            <p>
                                                <asp:RadioButtonList ID="rbllevelofstudy" runat="server" RepeatColumns="3"></asp:RadioButtonList>
                                            </p>
                                        </div>

                                        <h3>Select Major / Discipline +</h3>
                                        <div id="majorcontainer" class="col-md-12 updt-prftbl">
                                            <p>
                                                <asp:RadioButtonList ID="rblmajor" runat="server" RepeatColumns="2"></asp:RadioButtonList>
                                            </p>
                                        </div>
                                    </div>

                                    <%--Finish accordion--%>

                                    <div class="">
                                        <label class="form-group m-0" for="enrollmentyear" aria-labelledby="label-password"></label>
                                        <div class="col-sm-8 offset-sm-3">
                                            <asp:Button ID="btnsearchcourse" runat="server" Text="Search For Course" CssClass="btn btn-success" OnClick="btnsearchcourse_Click" OnClientClick="return validateform()" />
                                        </div>
                                    </div>

                                </div>
                    </div>
                </div>
                <div class="col-md-4">

                    <% if (appliedcourseData.Count > 0)
                        { %>
                    <div class="card">
                        <div class="card-body" style="margin-bottom:40%;">
                            <asp:HiddenField runat="server" ID="HidpreferenceID" />
                            <label style="font-size: 77%;">You may apply for a maximum of 5 courses</label>
                            <label id="lblInstructionHeader" runat="server" style="font-size: medium; font-weight: bold;">Courses for which your Application have been successfully submitted :</label><br />
                            <ol style="font-size: small; padding-left: 15px;">
                                <% for (int i = 0; i < appliedcourseData.Count; i++)
                                    { %>
                                <li>
                                    <%= appliedcourseData[i].coursename %>
                                </li>
                                <% } %>
                            </ol>
                        </div>
                    </div>
                    <%} %>
                </div>
            </div>
            <div class="row" style="margin-right: -1.625rem;">
                <div class="col-md-8">
                    <div id="coursegrid" runat="server" style="display: none">
                        <div class="card">
                            <div class="card-body">
                                <asp:HiddenField runat="server" ID="Hidresultcount" />
                                <label runat="server" style="font-size: 17px; font-weight: 500;">
                                    Search Results:
                                    <label runat="server" id="lblresultcount"></label>
                                    Courses Found.
                                </label>
                                <div class="table-responsive">
                                    <asp:GridView ID="courseGridView"
                                        CssClass="table"
                                        runat="server"                                        
                                        AutoGenerateColumns="False"
                                        ShowFooter="false"
                                        CellPadding="3"
                                        AllowPaging="true"
                                        PageSize="7"
                                        BorderStyle="None"
                                        BorderWidth="1px" DataKeyNames="id" Font-Size="X-Small"
                                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnPageIndexChanging="courseGridView_PageIndexChanging">

                                        <Columns>
                                            <asp:TemplateField HeaderText="" ItemStyle-Width="2%" FooterStyle-Width="2%" ControlStyle-Width="2%">
                                                <ItemTemplate>
                                                    <asp:RadioButton runat="server" ID="selectedRB" OnClick="javascript:SelectSingleRadiobutton(this.id)"></asp:RadioButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Courses">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCourse" runat="server" Text='<%# Bind("coursename") %>'></asp:Label>
                                                    <asp:HiddenField runat="server" ID="courseid" Value='<%# Bind("id") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="University">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbluniversityname" runat="server" Text='<%# Bind("universityname") %>'></asp:Label>
                                                    <asp:HiddenField runat="server" ID="Hiduniversityid" Value='<%# Bind("universityid") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Campus">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblCampus" runat="server" Text='<%# Bind("campus") %>'></asp:Label>
                                                    <asp:HiddenField runat="server" ID="Hidcampusid" Value='<%# Bind("campusid") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Study Mode">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblStudymode" runat="server" Text='<%# Bind("modeofstudy") %>'></asp:Label>
                                                    <asp:HiddenField runat="server" ID="Hidmodeofstudyid" Value='<%# Bind("modeofstudyid") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:TemplateField HeaderText="Level OF Study">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbllevelofstudy" runat="server" Text='<%# Bind("levelodstudy") %>'></asp:Label>
                                                    <asp:HiddenField runat="server" ID="HidlevelofstudyID" Value='<%# Bind("levelodstudyID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Major/Discipline">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblmajor" runat="server" Text='<%# Bind("major") %>'></asp:Label>
                                                    <asp:HiddenField runat="server" ID="HidmajorDisciplineID" Value='<%# Bind("majorID") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                            <asp:TemplateField HeaderText="Fee">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcurrency" runat="server" Text='<%# Bind("currencysymbol") %>'></asp:Label>
                                                    <asp:Label ID="lblCoursefee" runat="server" Text='<%# Bind("coursefee") %>'></asp:Label>
                                                    <asp:HiddenField runat="server" ID="HidSelectedcampusCityID" Value='<%#Bind("campuscityID") %>' />
                                                    <asp:HiddenField runat="server" ID="HidSelectedcampusCityName" Value='<%#Bind("campuscityname") %>' />
                                                    <asp:HiddenField runat="server" ID="HidSelectedcampusCountryID" Value='<%#Bind("campuscontryID") %>' />
                                                    <asp:HiddenField runat="server" ID="HidSelectedcampusCountryName" Value='<%#Bind("campuscountryName") %>' />
                                                    <asp:HiddenField runat="server" ID="HidlevelofstudyID" Value='<%# Bind("levelodstudyID") %>' />
                                                    <asp:HiddenField runat="server" ID="Hidlbllevelofstudy" Value='<%#Bind("levelodstudy") %>' />
                                                    <asp:HiddenField runat="server" ID="HidmajorDisciplineID" Value='<%# Bind("majorID") %>' />
                                                    <asp:HiddenField runat="server" ID="Hidlblmajor" Value='<%# Bind("major") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div id="courseInfo" style="display: none">
                        <div class="card">
                            <div class="card-body">
                                <div>
                                    <label style="font-size: small;">Your Selected Course for more details <a href='#' id="courselink" target="_blank">Click Here</a> </label>
                                </div>
                                <div id="selectedcourseDiv" style="font-size: smaller; display: none" class="table-responsive">
                                    <table>
                                        <tr>
                                            <td colspan="2">
                                                <label runat="server" id="lblCourseName" style="font-size: 20px; font-weight: 500;"></label>
                                                <asp:HiddenField runat="server" ID="Hidcoursename" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: initial;">Course Description :</td>
                                            <td>
                                                <label runat="server" id="lblcoursedescription"></label>
                                                <asp:HiddenField runat="server" ID="HidCourseid" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Institution :</td>
                                            <td>
                                                <label runat="server" id="lblInstitution"></label>
                                                <asp:HiddenField runat="server" ID="HidInstitutionId" />
                                                <asp:HiddenField runat="server" ID="HidUniversityName" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Campus :</td>
                                            <td>
                                                <label runat="server" id="lblCampus"></label>
                                                <asp:HiddenField runat="server" ID="HidCampusID" />
                                                <asp:HiddenField runat="server" ID="HidCampusname" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>City :</td>
                                            <td>
                                                <label runat="server" id="lblCity"></label>
                                                <asp:HiddenField runat="server" ID="HidCampusCityID" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Country :</td>
                                            <td>
                                                <label runat="server" id="lblCountry"></label>
                                                <asp:HiddenField runat="server" ID="HidCampusCountryID" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Study Level :</td>
                                            <td>
                                                <label runat="server" id="lblstudylevel"></label>
                                                <asp:HiddenField runat="server" ID="HidStudylevelID" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Major / Discipline :</td>
                                            <td>
                                                <label runat="server" id="lblmajor"></label>
                                                <asp:HiddenField runat="server" ID="HidMajorID" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Study Mode :</td>
                                            <td>
                                                <label runat="server" id="lblstudymode"></label>
                                                <asp:HiddenField runat="server" ID="HidstudymodeID" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Fee :</td>
                                            <td>
                                                <label runat="server" id="lblcurrencyshow"></label>
                                                <label runat="server" id="lblFee"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Duration :</td>
                                            <td>
                                                <label runat="server" id="lblDuration"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: initial;">Career Outcome :</td>
                                            <td id="outcomeContainer">
                                                <%--<label runat="server" id="lblCareeroutcome"> </label>
                                                <label runat="server" id="lblCareeroutcomepositions"> </label>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: initial;">Eligibility :</td>
                                            <td>
                                                <label runat="server" id="lblEligibility"></label>
                                            </td>
                                        </tr>
                                        <tr id="eligibilityresponse" style="display: none" runat="server">
                                            <td>I meet the eligibility of the course:</td>
                                            <td>
                                                <input type="radio" runat="server" id="yesRB" name="eligibility" />Yes
                                           <input type="radio" runat="server" id="NoRB" name="eligibility" />NO
                                            </td>
                                        </tr>
                                        <tr id="eligibilityresponseNote" style="display: none" runat="server">
                                            <td></td>
                                            <td>
                                                <label>*If you do not meet the eligibility criteria, you may still apply for this course; our counsellors would recommend a pathway program</label></td>
                                        </tr>
                                        <tr>
                                            <td>Select Commencement Date :
                                           <asp:HiddenField runat="server" ID="HidSelectedDateID" />
                                                <asp:HiddenField runat="server" ID="HidSelectedDateText" />
                                            </td>
                                            <td id="commencementDateContainer" style="vertical-align: initial;"</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Button runat="server" ID="savedata" Text="Submit Your application for this" CssClass="btn btn-success" OnClick="savedata_Click" OnClientClick="return validatecourseInfo()" />
                                                <asp:HiddenField runat="server" ID="recordsaveDateTime" />
                                            </td>
                                        </tr>
                                    </table>
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

    <script>
        function SelectSingleRadiobutton(rdbtnid) {
            var rdBtn = document.getElementById(rdbtnid);
            var rdBtnList = document.getElementsByTagName("input");
            for (i = 0; i < rdBtnList.length; i++) {
                if (rdBtnList[i].type == "radio" && rdBtnList[i].id != rdBtn.id)
                    rdBtnList[i].checked = false;
            }
            var radioBtnId = rdbtnid.replace("ContentPlaceHolder1_courseGridView_selectedRB_", "");
            getInfo(radioBtnId);
        }

        function getInfo(id) {
            $("#selectedcourseDiv").show();
            $("#courseInfo").show();

            //data from grid
            var courseid = $("#ContentPlaceHolder1_courseGridView_courseid_" + id).val();
            var universityID = $("#ContentPlaceHolder1_courseGridView_Hiduniversityid_" + id).val();
            var campusID = $("#ContentPlaceHolder1_courseGridView_Hidcampusid_" + id).val();
            var modeofstudyID = $("#ContentPlaceHolder1_courseGridView_Hidmodeofstudyid_" + id).val();
            var coursename = $("#ContentPlaceHolder1_courseGridView_lblCourse_" + id).text();
            var campusname = $("#ContentPlaceHolder1_courseGridView_lblCampus_" + id).text();
            var studymode = $("#ContentPlaceHolder1_courseGridView_lblStudymode_" + id).text();
            var fee = $("#ContentPlaceHolder1_courseGridView_lblCoursefee_" + id).text();
            var currency = $("#ContentPlaceHolder1_courseGridView_lblcurrency_" + id).text();
            var selectedlevelofstudy = $("#ContentPlaceHolder1_courseGridView_Hidlbllevelofstudy_" + id).val();
            var selectedlevelofstudyID = $("#ContentPlaceHolder1_courseGridView_HidlevelofstudyID_" + id).val();
            var selectedmajor = $("#ContentPlaceHolder1_courseGridView_Hidlblmajor_" + id).val();
            var selectedMajorID = $("#ContentPlaceHolder1_courseGridView_HidmajorDisciplineID_" + id).val();

            //data from rb
            var selectedcountryID = $("#ContentPlaceHolder1_courseGridView_HidSelectedcampusCountryID_" + id).val();
            var selectedCountryname = $("#ContentPlaceHolder1_courseGridView_HidSelectedcampusCountryName_" + id).val();
            var selectedCityname = $("#ContentPlaceHolder1_courseGridView_HidSelectedcampusCityName_" + id).val();
            var selectedcityID = $("#ContentPlaceHolder1_courseGridView_HidSelectedcampusCityID_" + id).val();
            $("#<%= lblCourseName.ClientID%>").val(coursename).html(coursename);
            $("#<%= HidInstitutionId.ClientID%>").val(universityID).html(universityID);
            $("#<%= lblCampus.ClientID%>").val(campusname).html(campusname);
            $("#<%= HidCampusname.ClientID%>").val(campusname).html(campusname);
            $("#<%= HidCampusID.ClientID%>").val(campusID).html(campusID);
            $("#<%= HidCourseid.ClientID%>").val(courseid).html(courseid);
            $("#<%= Hidcoursename.ClientID%>").val(coursename).html(coursename);
            $("#<%= lblCity.ClientID%>").val(selectedCityname).html(selectedCityname);
            $("#<%= HidCampusCityID.ClientID%>").val(selectedcityID).html(selectedcityID);
            $("#<%= HidCampusCountryID.ClientID%>").val(selectedcountryID).html(selectedcountryID);
            $("#<%= lblCountry.ClientID%>").val(selectedCountryname).html(selectedCountryname);
            $("#<%= lblstudymode.ClientID%>").val(studymode).html(studymode);
            $("#<%= HidstudymodeID.ClientID%>").val(modeofstudyID).html(modeofstudyID);
            $("#<%= lblstudylevel.ClientID%>").val(selectedlevelofstudy).html(selectedlevelofstudy);
            $("#<%= HidStudylevelID.ClientID%>").val(selectedlevelofstudyID).html(selectedlevelofstudyID);
            $("#<%= lblmajor.ClientID%>").val(selectedmajor).html(selectedmajor);
            $("#<%= HidMajorID.ClientID%>").val(selectedMajorID).html(selectedMajorID);
            $("#<%= lblFee.ClientID%>").val(fee).html(fee);
            $("#<%= lblcurrencyshow.ClientID%>").val(currency).html(currency);

            $.ajax({
                type: "POST",
                url: "courseapplication.aspx/GetCourseDetails",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'courseid': '" + courseid + "'}",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        $("#<%= lblcoursedescription.ClientID%>").val(result[0].coursedescription).html(result[0].coursedescription);
                        $("#<%= lblInstitution.ClientID%>").val(result[0].university_name).html(result[0].university_name);
                        $("#<%= HidUniversityName.ClientID%>").val(result[0].university_name).html(result[0].university_name);
                        $("#<%= lblEligibility.ClientID%>").val(result[0].eligibility).html(result[0].eligibility);
                        $("#<%= lblDuration.ClientID%>").val(result[0].courseduration).html(result[0].courseduration);

                        if ($("#<%= lblEligibility.ClientID%>").val() != "No Eligibility") {
                            $("#ContentPlaceHolder1_eligibilityresponse").show();
                            $("#ContentPlaceHolder1_eligibilityresponseNote").show();
                        }
                        else {
                            $("#ContentPlaceHolder1_eligibilityresponse").hide();
                            $("#ContentPlaceHolder1_eligibilityresponseNote").hide();
                        }

                        var url = result[0].courseurl;
                        $("#courselink")[0].href = url;
                    }
                }
            });
            //scroll to top of info div
            //$(window).scrollTop($('#InfoRow').offset().top);
            getcommencemntsDates(courseid);
            getcareerOutcomes(courseid);
        };
        function getcareerOutcomes(courseid) {
            $.ajax({
                type: "POST",
                url: "courseapplication.aspx/GetcareerOutcomes",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'courseid': '" + courseid + "'}",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        if (result.length >= 1)
                            $("#outcomeContainer").empty();
                        else {
                            $("#outcomeContainer").empty();
                            $('#outcomeContainer').append($('<label>').text("Not Set"));
                        }

                        for (var i = 0; i < result.length; i++) {
                            var $target = $('#outcomeContainer');
                            $target.append($('<label>').text(result[i].Careeroutcomepositions));
                            $target.append($('<label>').text("( " + result[i].Careeroutcome + " )"));
                            $target.append('<br/>')
                        }
                    }
                }
            });

        }
        function getcommencemntsDates(courseid) {

            $.ajax({
                type: "POST",
                url: "courseapplication.aspx/GetCommenceDateDropdown",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'courseid': '" + courseid + "'}",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        $("#commencementDateContainer").empty();
                        $("<%= HidSelectedDateID.ClientID %>").val("");
                        if (result.length >= 1) {
                            $("#commencementDateContainer").empty();
                            $("<%= HidSelectedDateID.ClientID %>").val("");
                        }
                        else
                            $('#commencementDateContainer').append($('<label>').text("Not Set"));

                        for (var i = 0; i < result.length; i++) {
                            var $target = $('#commencementDateContainer');
                            $target.append($('<label>').text(result[i].commencementdate)
                                .prepend($('<input type="radio" name="commencementdate" id="commencementdate_' + i + '"/>').val(result[i].id)));
                        }
                    }
                }
            });

        }

        $("#commencementDateContainer").on("click", "input[type=radio]", function () {
            var selecteddateID = $(this).val();
            var selectedName = $(this.nextSibling).text();
            $("#ContentPlaceHolder1_HidSelectedDateText").val(selectedName);
            $("#ContentPlaceHolder1_HidSelectedDateID").val(selecteddateID);
        });

        function validatecourseInfo() {
            if (!$("#<%=eligibilityresponse.ClientID%>").is(':hidden') && !($("#<%=yesRB.ClientID%>").is(':checked') || $("#<%=NoRB.ClientID%>").is(':checked'))) {
                alert("Please Select Option to record eligibility response");
                return false;
            }
            else if ($('[name="commencementdate"]').length != 0 && $('[name="commencementdate"]:checked').length == 0) {
                alert("Please select Commencement Date .");
                return false;
            }
            else if ($("#ContentPlaceHolder1_HidpreferenceID").val() > 5) {
                alert("You can apply for maximum 5 courses");
                return false;
            }
        }

        function validateform() {
            if ($("#ContentPlaceHolder1_HidselectedcountryID").val() == "") {
                alert("Please select Country");
                return false;
            }
            else if ($("#ContentPlaceHolder1_HidselectedcityID").val() == "") {
                alert("Please select city");
                return false;
            }
            else if ($("#ContentPlaceHolder1_HidselectedstudylevelID").val() == "") {
                alert("Please select Level of study");
                return false;
            }
            else if ($("#ContentPlaceHolder1_HidselectedmajorID").val() == "") {
                alert("Please select major/Discipline");
                return false;
            }
        }

        $("#rbCountryContainer").on("click", "input[type=radio]", function () {
            var selectedCountryID = $(this).val();
            var selectedName = $(this.nextSibling).text();
            $("#progressbar_country").show();
            $("#<%= selectedcountry.ClientID%>").val(selectedName).html(selectedName);
            $("#<%= HidselectedcountryName.ClientID%>").val(selectedName).html(selectedName);
            $("#<%= HidselectedcountryID.ClientID%>").val(selectedCountryID).html(selectedCountryID);
            $.ajax({
                type: "POST",
                url: "courseapplication.aspx/GetCityDropdown",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'countryId': '" + selectedCountryID + "'}",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        $('#rbCityContainer').empty();
                        for (var i = 0; i < result.length; i++) {
                            var $container = $('#rbCityContainer');
                            $container.append($('<label style="margin-right: 29px;">').text(result[i].name)
                                .prepend($('<input type="radio" name="rblcity" id="rblcity_' + i + '" OnClick="javascript:SelectSingle(' + i + ')"/>').val(result[i].city_id)));
                        }
                    }
                }
            });
            $("#rbCountryContainer").hide();
            $("#countryclosebtn").show();
        });

        $("#countryclosebtn").click(function () {
            $("#<%= selectedcountry.ClientID%>").val("All").html("All");
            $("#<%= HidselectedcountryName.ClientID%>").val("All").html("All");
            $("#<%= HidselectedcountryID.ClientID%>").val(0).html(0);
        });

        function SelectSingle(rdbtnid) {
            var rdBtnList = document.getElementsByTagName("input");
            for (i = 0; i < rdBtnList.length; i++) {
                if (rdBtnList[i].type == "radio" && rdBtnList[i].id == "rblcity_" + rdbtnid)
                    rdBtnList[i].checked = true;
            }
        }

        $("#rbCityContainer").on("click", "input[type=radio]", function () {
            var selectedCityID = $(this).val();
            var selectedCityName = $(this.nextSibling).text();
            $("#progressbar_city").show();

            $("#<%= selectedcity.ClientID%>").val(selectedCityName).html(selectedCityName);
            $("#<%= HidselectedcityName.ClientID%>").val(selectedCityName).html(selectedCityName);
            $("#<%= HidselectedcityID.ClientID%>").val(selectedCityID).html(selectedCityID);

            $("#ContentPlaceHolder1_HidRBSelectedcityName").val(selectedCityName);
            $("#ContentPlaceHolder1_HidRBSelectedcityID").val(selectedCityID);
            $("#rbCityContainer").hide();
            $("#<%= rblcountry.ClientID %> input[type='radio']").prop('checked', false);
            $('[name="rblcity"]:checked').prop('checked', false);
            $("#cityclosebtn").show();
        });

        $("#citybtn").click(function () {
            if ($("#ContentPlaceHolder1_selectedcountry").val() == "") {
                alert("Please Select Country");
                $("#rbCityContainer").collapse();
                $("#rbCityContainer").hide();
                $("#rbCityContainer").removeClass();
                $("#citybtn").removeClass();

                $("#citybtn").addClass("ui-accordion-header ui-corner-top ui-accordion-header-collapsed ui-corner-all ui-state-default ui-accordion-icons");
            }
            else {
                $("#rbCityContainer").show();
                $("#rbCityContainer").addClass("ui-accordion-content ui-corner-bottom ui-helper-reset ui-widget-content ui-accordion-content-active");
            }
        });
        $("#cityclosebtn").click(function () {
            $("#<%= selectedcity.ClientID%>").val("All").html("All");
            $("#<%= HidselectedcityName.ClientID%>").val("All").html("All");
            $("#<%= HidselectedcityID.ClientID%>").val(0).html(0);
        });

        $("#studylevelcontainer").on("click", "input[type=radio]", function () {
            var selectedlevelID = $(this).val();
            var selectedlevelName = $(this.nextSibling).text();
            $("#progressbar_studylevel").show();
            $("#<%= selectedstudylevel.ClientID%>").val(selectedlevelName).html(selectedlevelName);
            $("#<%= HidselectedstudylevelName.ClientID%>").val(selectedlevelName).html(selectedlevelName);
            $("#<%= HidselectedstudylevelID.ClientID%>").val(selectedlevelID).html(selectedlevelID);
            $("#studylevelcontainer").hide();
            $("#<%= rbllevelofstudy.ClientID %> input[type='radio']").prop('checked', false);
            $("#levelclosebtn").show();
        });
        $("#levelclosebtn").click(function () {
            $("#<%= selectedstudylevel.ClientID%>").val("All").html("All");
            $("#<%= HidselectedstudylevelName.ClientID%>").val("All").html("All");
            $("#<%= HidselectedstudylevelID.ClientID%>").val(0).html(0);
        });

        $("#majorcontainer").on("click", "input[type=radio]", function () {
            var selectedMajorID = $(this).val();
            var selectedMajorName = $(this.nextSibling).text();
            $("#progressbar_major").show();
            $("#<%= selectedmajor.ClientID%>").val(selectedMajorName).html(selectedMajorName);
            $("#<%= HidselectedmajorName.ClientID%>").val(selectedMajorName).html(selectedMajorName);
            $("#<%= HidselectedmajorID.ClientID%>").val(selectedMajorID).html(selectedMajorID);
            $("#majorcontainer").hide();
            $("#<%= rblmajor.ClientID %> input[type='radio']").prop('checked', false);
            $("#majorclosebtn").show();
        });
        $("#majorclosebtn").click(function () {
            $("#<%= selectedmajor.ClientID%>").val("All").html("All");
            $("#<%= HidselectedmajorName.ClientID%>").val("All").html("All");
            $("#<%= HidselectedmajorID.ClientID%>").val(0).html(0);
        });

        $(document).ready(function () {
            if ($("#ContentPlaceHolder1_HidselectedcountryName").val() == "")
                $("#countryclosebtn").hide();
            else {
                $("#countryclosebtn").show();
                $("#progressbar_country").show();
            }

            if ($("#ContentPlaceHolder1_HidselectedcityName").val() == "")
                $("#cityclosebtn").hide();
            else {
                $("#cityclosebtn").show();
                $("#progressbar_city").show();
            }

            if ($("#ContentPlaceHolder1_HidselectedstudylevelName").val() == "")
                $("#levelclosebtn").hide();
            else {
                $("#levelclosebtn").show();
                $("#progressbar_studylevel").show();
            }

            if ($("#ContentPlaceHolder1_HidselectedmajorName").val() == "")
                $("#majorclosebtn").hide();
            else {
                $("#majorclosebtn").show();
                $("#progressbar_major").show();
            }

            $('.sidebar-menu-item').removeClass('open');
            $('#studentapplication_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantcourse').addClass('active');
        });
        //$(document).keydown(function (event) {
        //    if (event.keyCode == 123) { // Prevent F12
        //        return false;
        //    } else if (event.ctrlKey && event.shiftKey && event.keyCode == 73) { // Prevent Ctrl+Shift+I        
        //        return false;
        //    }
        //});
        //$(document).on("contextmenu", function (e) {   //prevent inspect     
        //    e.preventDefault();
        //});

        $(function () {
            $("#accordion").accordion({
                collapsible: true,
                active: false,
                autoHeight: true,
                heightStyle: "content",
            });
        });

    </script>
</asp:Content>
