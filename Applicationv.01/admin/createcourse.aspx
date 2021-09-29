<%@ Page Language="C#" AutoEventWireup="true" CodeFile="createcourse.aspx.cs" Inherits="admin_createcourse" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Create Course</li>
        </ol>

        <h1 class="h2">Course Create</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">

                    <div class="form-group row">
                        <label for="CourseName" class="col-sm-3 col-form-label form-label">Course Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtCourseName" type="text" runat="server" class="form-control" placeholder="Course Name" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="CourseDescription" class="col-sm-3 col-form-label form-label">Course Description</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-12">
                                    <textarea runat="server" id="txtCourseDescription" class="form-control edit-textarea"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="ddluniversity" class="col-sm-3 col-form-label form-label">Institution</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlUniversity" name="ddluniversity" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="Courseactive" class="col-sm-3 col-form-label form-label">Course Active Status</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlactivestatus" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">Please Select</asp:ListItem>
                                        <asp:ListItem Value="True">True</asp:ListItem>
                                        <asp:ListItem Value="False">False</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="discipline" class="col-sm-3 col-form-label form-label">Major Discipline</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddldiscipline" name="ddldiscipline" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="studymode" class="col-sm-3 col-form-label form-label">Study Mode</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <select ID="ddlstudymode" name="ddlstudymode" runat="server" class="form-control">
                                    </select>
                                    <asp:HiddenField ID="hidStudyMode" runat="server" Value="" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="studylevel" class="col-sm-3 col-form-label form-label">Study Level</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlstudylevel" name="ddlstudylevel" runat="server" class="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="Coursefee" class="col-sm-3 col-form-label form-label">Course Fee</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtCoursefee" type="text" runat="server" class="form-control" placeholder="Course Fee" />                                    
                                </div>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlcurrency" runat="server" CssClass="form-control">                                        
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="ddlUniversityCampuses" class="col-sm-3 col-form-label form-label">University Campuses</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <select id="ddlUniversityCampuses" name="ddlUniversityCampuses" runat="server" class="form-control" multiple="true">
                                    </select>
                                    <asp:HiddenField ID="hidUniversityCampuses" runat="server" Value="" />
                                    <p>Hold Ctrl (windows) / Command (Mac) to select multiple options.</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="CourseURL" class="col-sm-3 col-form-label form-label">Course URL</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtCourseURL" type="text" runat="server" class="form-control" placeholder="Course URL" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="CourseDuration" class="col-sm-3 col-form-label form-label">Course Duration</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtCourseDuration" type="text" runat="server" class="form-control" placeholder="Course Duration" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="courseeligibility" class="col-sm-3 col-form-label form-label">Course eligibility</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-12">
                                    <textarea runat="server" id="txtcourseeligibility" class="form-control edit-textarea"></textarea>
                                </div>
                                <input id="btnAddCommencementDate" style="display: none" type="button" class="form-control" value="Add Commencement Date" />
                            </div>
                        </div>
                    </div>                     

                    <asp:HiddenField ID="hidCommencementDateCount" runat="server" Value="0" />
                    <asp:HiddenField ID="hidCommencementDates" runat="server" Value="" />
                    <div id="commencementDatesDiv" class="form-group row">
                    </div>
                    <div class="form-group row">
                        <div class="col-md-8">
                            <input id="btnAddDefermentDate" style="display:none ;margin-left: 214px;" type="button" class="form-control" value="Add Deferment Date" />
                        </div>
                    </div>
                    
                    <asp:HiddenField ID="HiddefermentdatesCount" runat="server" Value="0" />
                    <asp:HiddenField ID="Hiddefermentdates" runat="server" Value="" />
                    <div id="defermentdatesDiv" class="form-group row">
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btnSubmit_Click" OnClientClick="return validateForm()" />
                                    <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>




            </div>
        </div>
    </div>

    <script type="text/javascript">

        function isValidCommencementDate() {
            var commencementDateCounter = $("#<%=hidCommencementDateCount.ClientID %>").val();
            $("#<%=hidCommencementDates.ClientID %>").val('');

            if (commencementDateCounter == "0") {
                    alert("Please select commencement date");
                    return false;
            }

            for (var i = 0; i < commencementDateCounter; i++) {
                if ($('#txtCommencementDate_' + i).val() == "" || $('#txtCommencementDate_' + i).val() == null) {
                    alert("Please select commencement date");
                    return false;
                }
                else {
                    var data = $('#txtCommencementDate_' + i).val() + "," + $("#<%=hidCommencementDates.ClientID %>").val();
                    $("#<%=hidCommencementDates.ClientID %>").val(data);
                }
            }
            return true;
        }
        function isValidDefermentDates() {
            var defermentDatesCounter = $("#<%=HiddefermentdatesCount.ClientID %>").val();
            $("#<%=Hiddefermentdates.ClientID %>").val('');

            if (defermentDatesCounter == "0") {
                    alert("Please select Deferment date");
                    return false;
            }
            for (var i = 0; i < defermentDatesCounter; i++) {
                if ($('#txtdefermentdates_' + i).val() == "" || $('#txtdefermentdates_' + i).val() == null) {
                    alert("Please select Deferment date");
                    return false;
                }
                else {
                    var data = $('#txtdefermentdates_' + i).val() + "," + $("#<%=Hiddefermentdates.ClientID %>").val();
                    $("#<%=Hiddefermentdates.ClientID %>").val(data);
                }
            }
            return true;
        }
        function createDefermentDateBlock() {

            var hiddefermentdate= $("#<%=HiddefermentdatesCount.ClientID %>");
            var count = parseInt(hiddefermentdate.val());
            hiddefermentdate.val(count + 1);
            var DateContent = '<label for="defermentdates" class="col-sm-3 col-form-label form-label">Please enter Defermentdates date for course</label>' +
                          '<div class="col-sm-8"><div class="row"><div class="col-md-6">' +
                          '<input id="txtdefermentdates_' + count + '" type="text" class="form-control" placeholder="Defermentdates Date" value="" readonly>' +
                '</div></div></div>';
            $("#defermentdatesDiv").append(DateContent);
            $('#txtdefermentdates_' + count).datepicker({ minDate: new Date(), dateFormat: 'dd-mm-yy' });
        }
        function createCommencementDateBlock() {
            
            var hidCommencementDate = $("#<%=hidCommencementDateCount.ClientID %>");
            var count = parseInt(hidCommencementDate.val());
            hidCommencementDate.val(count + 1);

            var content = '<label for="commencementDates" class="col-sm-3 col-form-label form-label">Please enter commencement date for course</label>' +
                          '<div class="col-sm-8"><div class="row"><div class="col-md-6">' +
                          '<input id="txtCommencementDate_' + count + '" type="text" class="form-control" placeholder="Commencement Date" value="" readonly>' +
                '</div></div></div>';            
            $("#commencementDatesDiv").append(content);
            $('#txtCommencementDate_' + count).datepicker({ minDate: new Date(), dateFormat: 'dd-mm-yy' });
        }


        function validateForm() {

            var txtCourse = $('#<%=txtCourseName.ClientID%>').val();
            var txtcoursefee = $('#<%=txtCoursefee.ClientID%>').val();
            var currency = $('#<%=ddlcurrency.ClientID%>').val();
            var discipline = $('#<%=ddldiscipline.ClientID%>').val();
            var studyLevel = $('#<%=ddlstudylevel.ClientID%>').val();
            var studymode = $('#<%=hidStudyMode.ClientID%>').val();
            var university = $('#<%=ddlUniversity.ClientID%>').val();
            var universityCampuses = $("#<%=hidUniversityCampuses.ClientID%>").val().split(',');
            universityCampuses = $.grep(universityCampuses, function (n) { return (n); });
            var txtCourseUrl = $('#<%=txtCourseURL.ClientID%>').val();
            var txtCourseDuration = $('#<%=txtCourseDuration.ClientID%>').val();
            var txtCourseDescription = $('#<%=txtCourseDescription.ClientID%>').val();
            var ddlactivestatus = $('#<%=ddlactivestatus.ClientID%>').val();
            var urlRegex = /^(http[s]?:\/\/){0,1}(www\.){0,1}[a-zA-Z0-9\.\-]+\.[a-zA-Z]{2,5}[\.]{0,1}/;

            if (txtCourse == '') {
                alert("Please enter Course Name");
                return false;
            }
            else if (txtCourseDescription == '') {
                alert("Please enter Course Description");
                return false;
            }
            else if (ddlactivestatus == 0) {
                alert("Please enter Course Active status");
                return false;
            }
            else if (discipline == 0 || isNaN(parseInt(discipline))) {
                alert("Please select Major Discipline");
                return false;
            }
            else if (studymode == 0 || isNaN(parseInt(studymode))) {
                alert("Please select Study Mode");
                return false;
            }
            else if (studyLevel == 0 || isNaN(parseInt(studyLevel))) {
                alert("Please select Study Level");
                return false;
            }
            else if (txtcoursefee == '') {
                alert("Please enter Course fee");
                return false;
            }
            else if (currency == 0) {
                alert("Please Select Currency");
                return false;
            }
            else if (university == 0) {
                alert("Please select institution");
                return false;
            }
            else if (universityCampuses.length < 1) {
                alert("Please select applicable university campuses for the course");
                return false;
            }
            else if (txtCourseUrl == '' || !urlRegex.test(txtCourseUrl)) {
                alert("Please enter course URL");
                return false;
            }
            else if (txtCourseDuration == '') {
                alert("Please enter Course Duration in weeks");
                return false;
            }
            else if (!isValidCommencementDate()) { return false; }
            else if (!isValidDefermentDates()) { return false; }
            return true;

        }
        $(document).ready(function () {
	        $('.sidebar-menu-item').removeClass('open');
	        $('#course_list').addClass('open');
	        $('.sidebar-menu-item').removeClass('active');
            $('#coursemaster').addClass('active');

            $("#<%=ddlUniversity.ClientID%>").change(function () {
                $.ajax({
                    type: "GET",
                    url: "createcourse.aspx/GetUniversityCampuses",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { universityId: $("#<%=ddlUniversity.ClientID%>").val() },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlUniversityCampuses.ClientID%>").length >= 1) {
                                $("#<%=ddlUniversityCampuses.ClientID%>").empty();
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlUniversityCampuses.ClientID%>").append($("<option></option>").val(result[i].campusid).html(result[i].campusname));

                            $("#commencementDatesDiv").empty();
                            $("#btnAddCommencementDate").show();
                            $("#btnAddDefermentDate").show();
                            $("#<%=hidUniversityCampuses.ClientID%>").val("");
                            $("#<%=hidCommencementDateCount.ClientID %>").val('0');
                            $("#<%=HiddefermentdatesCount.ClientID %>").val('0');
                        }
                    }
                });

                $.ajax({
                    type: "GET",
                    url: "createcourse.aspx/GetStudyModeDropdown",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { universityId: $("#<%=ddlUniversity.ClientID%>").val() },
                    success: function (response) {
                        if (response.d) {
                            $('#<%=hidStudyMode.ClientID%>').val(0);
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlstudymode.ClientID%>").length >= 1) {
                                $("#<%=ddlstudymode.ClientID%>").empty();
                                $("#<%=ddlstudymode.ClientID%>").append($('<option selected="selected" disabled="disabled"></option>').val("0").html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlstudymode.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].description));
                        }
                    }
                });

            });

            $("#<%=ddlstudymode.ClientID%>").change(function () {
                var studyMode = $("#<%=ddlstudymode.ClientID%>").val();
                $('#<%=hidStudyMode.ClientID%>').val(studyMode);
            });

            $("#btnAddCommencementDate").click(function () {
                createCommencementDateBlock();
            });
            $("#btnAddDefermentDate").click(function () {
                createDefermentDateBlock();
            });

            $("#<%=ddlUniversityCampuses.ClientID%>").blur(function () {
                $("#<%=hidUniversityCampuses.ClientID%>").val("");
                var selectedUniCampuses = $("#<%=ddlUniversityCampuses.ClientID%>").val();
                if (selectedUniCampuses.length > 0) {
                    for (var i = 0; i < selectedUniCampuses.length; i++)
                        $("#<%=hidUniversityCampuses.ClientID%>").val($("#<%=hidUniversityCampuses.ClientID%>").val() + selectedUniCampuses[i] + ",");
                }
            });

	    });
    </script>
</asp:Content>
