<%@ Page Language="C#" AutoEventWireup="true" CodeFile="addgrade.aspx.cs" Inherits="addgrade" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Student - Dashboard</title>
    <link href="assets/css/tipso.min.css" rel="stylesheet" />
    <!-- Prevent the demo from appearing in search engines (REMOVE THIS) -->
    <meta name="robots" content="noindex">

    <!-- Perfect Scrollbar -->
    <link type="text/css" href="assets/vendor/perfect-scrollbar.css" rel="stylesheet">
    <!-- Flatpickr -->
    <link type="text/css" href="assets/css/flatpickr.css" rel="stylesheet">
    <link type="text/css" href="assets/css/flatpickr.rtl.css" rel="stylesheet">
    <link type="text/css" href="assets/css/flatpickr-airbnb.css" rel="stylesheet">
    <link type="text/css" href="assets/css/flatpickr-airbnb.rtl.css" rel="stylesheet">
    <!-- Material Design Icons -->
    <link type="text/css" href="assets/css/material-icons.css" rel="stylesheet">
    <link type="text/css" href="assets/css/material-icons.rtl.css" rel="stylesheet">

    <!-- Font Awesome Icons -->
    <link type="text/css" href="assets/css/fontawesome.css" rel="stylesheet">
    <link type="text/css" href="assets/css/fontawesome.rtl.css" rel="stylesheet">
    <script src="assets/vendor/jquery.min.js"></script>

    <!-- Flatpickr -->
    <script src="assets/vendor/flatpickr/flatpickr.min.js"></script>
    <script src="assets/js/flatpickr.js"></script>
    <!-- App CSS -->
    <link type="text/css" href="assets/css/app.css" rel="stylesheet">
    <link type="text/css" href="assets/css/app.rtl.css" rel="stylesheet">
</head>
<body>
    <form id="form1" runat="server">
        <div class="page ">
            <div class="container page__container p-0">
                <div class="row m-0">
                    <div class="col-lg container-fluid page__container">

                        <div class="card shwcenter" style="width: 650px;">

                            <div class="list-group list-group-fit">
                                <div class="list-group-item" id="Qualification" runat="server" style="display: none;">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Qualification">
                                        <div class="form-row">
                                            <label id="labelQualification" runat="server" for="Qualification" class="col-md-3 col-form-label form-label">Qualification</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlCourse" CssClass="form-control" runat="server">
                                                    <asp:ListItem Value="" Text="Select Course"></asp:ListItem>
                                                    <asp:ListItem Value="tenth" Text="10Th"></asp:ListItem>
                                                    <asp:ListItem Value="twelth" Text="12th"></asp:ListItem>
                                                    <asp:ListItem Value="UG" Text="Under Graduate"></asp:ListItem>
                                                    <asp:ListItem Value="PG" Text="Post Graduate"></asp:ListItem>
                                                    <asp:ListItem Value="Phd" Text="Phd"></asp:ListItem>
                                                    <asp:ListItem Value="diploma" Text="Diploma"></asp:ListItem>
                                                    <asp:ListItem Value="Other" Text="Other"></asp:ListItem>
                                                </asp:DropDownList><span class="helpicon"><i id="icQualification" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="Subject" runat="server" style="display: none;">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Mobile">
                                        <div class="form-row">
                                            <label id="labelSubject" runat="server" for="Subject" class="col-md-3 col-form-label form-label">Subject</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlsubjects" CssClass="form-control" runat="server"></asp:DropDownList><span class="helpicon"><i id="icSubject" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="OtherSubject" runat="server" style="display: none;">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-Others">
                                        <div class="form-row">
                                            <label id="labelothers" runat="server" for="Others" class="col-md-3 col-form-label form-label">Other Subject</label>
                                            <div class="col-md-6">
                                                <input id="txtOther" runat="server" type="text" placeholder="Subject" value="" class="form-control" /><span class="helpicon"><i id="icOtherSubject" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="gradeType" runat="server" style="display: none;">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-gradeType">
                                        <div class="form-row">
                                            <label id="labelgradeType" runat="server" for="phone" class="col-md-3 col-form-label form-label">Grade Type</label>
                                            <div class="col-md-6">
                                                <asp:DropDownList ID="ddlGradeType" CssClass="form-control" runat="server"></asp:DropDownList><span class="helpicon"><i id="icGradeType" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="list-group-item" id="grade" runat="server" style="display: none;">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-grade">
                                        <div class="form-row">
                                            <label id="labelGrade" runat="server" for="grade" class="col-md-3 col-form-label form-label">Grade</label>
                                            <div class="col-md-6">
                                                <input id="txtGrade" runat="server" type="text" placeholder="Grade" value="" class="form-control" /><span class="helpicon"><i id="icGrade" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="page-nav__content" style="margin: 20px">
                                    <asp:Button ID="btn_login" OnClientClick="return validateForm()" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btn_login_Click" />
                                    <asp:Label runat="server" ID="lblMessage" Visible="false"></asp:Label>
                                </div>
                                <input type="hidden" runat="server" id="hidStatus" value="false" />
                                <input type="hidden" runat="server" id="hidGradeId" value="" />
                                <input type="hidden" runat="server" id="hidModeStatus" value="" />
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
    </form>
    <script src="assets/vendor/jquery.min.js"></script>
      <script src="assets/js/tipso.min.js"></script>
    <script type="text/javascript">



        function validateForm() {
            var flag = false;
            if (!$("#<%=Qualification.ClientID%>").is(':hidden') && $("#<%=ddlCourse.ClientID%>").val() == "")
                alert("Please Select Course name.");
            else if (!$("#<%=Subject.ClientID%>").is(':hidden') && $("#<%=ddlsubjects.ClientID%>").val() == "0")
                alert("Please Select Subject.");
            else if (!$("#<%=OtherSubject.ClientID%>").is(':hidden') && $("#<%=txtOther.ClientID%>").val() == "")
                alert("Please enter other subjects.");
            else if (!$("#<%=gradeType.ClientID%>").is(':hidden') && $("#<%=ddlGradeType.ClientID%>").val() == "0")
                alert("Please select valid grade type.");
            else if (!$("#<%=grade.ClientID%>").is(':hidden') && $("#<%=txtGrade.ClientID%>").val() == "")
                alert("Please enter grade value.");
            else if ($('#<%=ddlsubjects.ClientID%> option:selected').text() == 'Others' && !isValidOtherSubject()) { }
            else
                flag = true;
            return flag;
        }

        function isValidOtherSubject() {
            var otherSubjectVal = $("#<%=txtOther.ClientID%>").val();
            var ddl = $('#<%=ddlsubjects.ClientID%> option');
            for (var i = 0; i < ddl.length; i++) {
                if (ddl[i].text == otherSubjectVal) {
                    alert("Please enter other subject different from list.");
                    return false;
                }
            }

            return true;
        }

        $(document).ready(function () {
            if (window.opener != null && !window.opener.closed && $("#<%=hidStatus.ClientID%>").val() && $("#<%=hidStatus.ClientID%>").val() == "true") {                
                window.opener.refreshGrid($("#<%=hidGradeId.ClientID%>").val(), $("#<%=hidModeStatus.ClientID%>").val(), $("#<%=ddlCourse.ClientID%>").val(), $("#ddlsubjects option:selected").text(), $("#<%=txtOther.ClientID%>").val(), $("#ddlGradeType option:selected").text(), $("#<%=txtGrade.ClientID%>").val());
                self.window.close();
            }
            
            if ($('#<%=ddlsubjects.ClientID%> option:selected').text() == 'Others') 
                $("#<%=OtherSubject.ClientID%>").show();                
            else 
                $("#<%=OtherSubject.ClientID%>").hide();
     
            $('.fa-info-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });
        });
        $('#<%=ddlsubjects.ClientID%>').change(function () {
            if ($('#<%=ddlsubjects.ClientID%> option:selected').text() == 'Others') 
                $("#<%=OtherSubject.ClientID%>").show();                
            else 
                $("#<%=OtherSubject.ClientID%>").hide();                
        });
     
    </script>
</body>
</html>
