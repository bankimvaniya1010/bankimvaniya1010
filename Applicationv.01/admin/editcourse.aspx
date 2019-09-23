﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="editcourse.aspx.cs" Inherits="admin_editcourse" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
</asp:Content>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Edit Course </li>
        </ol>

        <h1 class="h2">Edit Course</h1>

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
                                    <asp:DropDownList ID="ddlstudymode" name="ddlstudymode" runat="server" class="form-control"></asp:DropDownList>
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
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label for="commencementDates" class="col-sm-3 col-form-label form-label">Please enter commencement date for course </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtCommencementDate" runat="server" type="text" class="form-control" placeholder="Commencement Date" value="">
                                    <asp:HiddenField ID="hidCommencementDate" runat="server" Value="" />
                                </div>
                            </div>
                        </div>
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
       

       function validateForm() {

            var txtCourse = $('#<%=txtCourseName.ClientID%>').val();
            var txtcoursefee = $('#<%=txtCoursefee.ClientID%>').val();
            var discipline = $('#<%=ddldiscipline.ClientID%>').val();
            var studyLevel = $('#<%=ddlstudylevel.ClientID%>').val();
            var studymode = $('#<%=ddlstudymode.ClientID%>').val();
            var university =$('#<%=ddlUniversity.ClientID%>').val();

            var universityCampuses = $("#<%=hidUniversityCampuses.ClientID%>").val().split(',');
            universityCampuses = $.grep(universityCampuses, function (n) { return (n); });

            if (txtCourse == '') {
                alert("Please enter Course Name");
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
            else if (university == 0) {
                alert("Please select University");
                return false;
            }
            else if (universityCampuses.length < 1) {
                alert("Please select applicable university campuses for the course");
                return false;
            }
            else if ($('#<%=txtCommencementDate.ClientID%>').val() == "") {
                alert("Please select commencement date for the course");
                return false;
            }
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

                            $("#<%=hidUniversityCampuses.ClientID%>").val("");
                        }
                    }
                });
            });

            $(function () {
                $('#<%=txtCommencementDate.ClientID%>').datepicker({ minDate: new Date(), dateFormat: 'dd-mm-yy', altField: '#hidCommencementDate', altFormat: 'mm-dd-yy' });
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
