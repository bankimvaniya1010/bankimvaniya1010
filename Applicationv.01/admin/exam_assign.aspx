<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exam_assign.aspx.cs" Inherits="admin_exam_assign" MasterPageFile="~/admin/admin.master" %>


<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Assign Assessment</li>
        </ol>
        <h1 class="h2">Assign Assessment</h1>
        <div class="row" style="margin-right: -1.625rem;">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-body">
                        <div class="tab-content card-body">
                            <div class="tab-pane active" id="first">
                                <%--<div class="form-group row" runat="server">
                        <label for="name" class="col-sm-4 col-form-label form-label">Select Institution </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlUniversity_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>  --%>
                                <div class="form-group row">
                                    <label for="name" class="col-sm-4 col-form-label form-label">Select Class</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8 updt-prftbl">
                                                <asp:DropDownList runat="server" ID="ddlclass" CssClass="form-control" OnSelectedIndexChanged="ddlclass_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="name" class="col-sm-4 col-form-label form-label">Select Group</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8 updt-prftbl">
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlgroup" OnSelectedIndexChanged="ddlgroup_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="name" class="col-sm-4 col-form-label form-label">Select Subject</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8 updt-prftbl">
                                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlsubjcet" OnSelectedIndexChanged="ddlsubjcet_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="name" class="col-sm-4 col-form-label form-label">Select Assessment</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <asp:DropDownList ID="ddlexam" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlexam_SelectedIndexChanged"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="name" class="col-sm-4 col-form-label form-label">Select Scheduled Date & Time</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <asp:DropDownList ID="ddlExamDateTime" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlExamDateTime_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                              <%--  <div class="form-group row">
                                    <label for="name" class="col-sm-4 col-form-label form-label">Select Student</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <asp:CheckBoxList ID="ddlstudentid" runat="server" RepeatDirection="Horizontal" RepeatColumns="2"></asp:CheckBoxList>
                                            </div>
                                        </div>
                                    </div>
                                </div>--%>
                                <div class="form-group row">
                                    <label for="name" class="col-sm-4 col-form-label form-label">Assign Invigilator</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <%--                                    <input type="text" ID="txtproctor" runat="server" class="form-control"/>--%>
                                                <asp:DropDownList ID="ddlproctor" runat="server" CssClass="form-control"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" style="display: none">
                                    <label for="name" class="col-sm-4 col-form-label form-label">Invigilator Email</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <input type="text" id="txtproctoremail" runat="server" class="form-control" disabled="disabled" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="name" class="col-sm-4 col-form-label form-label">Virtual Meeting Link</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <input type="text" id="txtvirtualLink" runat="server" class="form-control" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" style="display: none">
                                    <label for="name" class="col-sm-4 col-form-label form-label">Student Passkey</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <input type="text" id="txtstudentpasskey" runat="server" class="form-control" disabled="disabled" />
                                                <asp:HiddenField runat="server" ID="hidtxtstudentpasskey" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" style="display: none">
                                    <label for="name" class="col-sm-4 col-form-label form-label">Invigilator Passkey</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <input type="text" id="txtproctorpasskey" runat="server" class="form-control" disabled="disabled" />
                                                <asp:HiddenField runat="server" ID="hidtxtproctorpasskey" />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-8 offset-sm-3">
                                <div class="media align-items-center">
                                    <div class="media-left">
                                        <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btn_submit_Click" OnClientClick="return validateForm()" />
                                        <div class="col-md-20">
                                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card card-checkbox-list" runat="server">
                    <div class="form-group row">
                        <label for="name" class="col-sm-12 col-form-label form-label">Select Student</label>  
                    </div>
                    <div class="">
                        <div class="col-md-12">
                                <asp:CheckBoxList ID="ddlstudentid" runat="server" RepeatDirection="Horizontal" RepeatColumns="1"></asp:CheckBoxList>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script>

        function validateForm() {

            var flag = false;
           <%--if ($("#<%=ddlUniversity.ClientID%>").val() == "0")
               alert("Please Select University");--%>
           if ($("#<%=ddlexam.ClientID%>").val() == "0")
               alert("Please Select exam");
           else if ($("#<%=ddlExamDateTime.ClientID%>").val() == "0")
               alert("Please select asssessment time");
           else if ($("#<%=ddlclass.ClientID%>").val() == "0")
               alert("Please select class.");
           else if ($("#<%=ddlgroup.ClientID%>").val() == "0")
               alert("Please select group.");
           else if ($("input[type=checkbox]:checked").length == 0)
               alert("Please select student");
           else if ($("#<%=ddlproctor.ClientID%>").val() == "0")
               alert("Please select invigilator");
           <%--else if ($("#<%=txtproctoremail.ClientID%>").val() == "")
               alert("Please enter proctor email");--%>
           else if ($("#<%=txtvirtualLink.ClientID%>").val() == "")
                alert("Please enter virtual link");
            else
                flag = true;
            return flag;
        }
        $("#<%=ddlsubjcet.ClientID%>").change(function () {
            var subjectid = $("#<%=ddlsubjcet.ClientID%>").val();
           var universityid = 0;
           if (universityid != 0)
               $.ajax({
                   type: "GET",
                   url: "exam_assign.aspx/GetstudentList",
                   contentType: "application/json; charset=utf-8",
                   dataType: "json",
                   data: { countryId: countryid, universityid: universityid },
                   success: function (response) {
                       if (response.d) {
                           var result = JSON.parse(response.d);
                           if ($("#<%=ddlstudentid.ClientID%>").length >= 1) {
                                $("#<%=ddlstudentid.ClientID%>").empty();
                                $("#<%=ddlstudentid.ClientID%>").append($('<option selected="selected" disabled="disabled"></option>').val(0).html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++) {
                                $("#<%=ddlstudentid.ClientID%>").append($("<option></option>").val(result[i].applicantid).html(result[i].applicantname));
                            }
                        }
                    }
                });

        });

            <%--$("#<%=ddlstudentid.ClientID%>").change(function () {
                $("#<%=hidStudentid.ClientID%>").val($("#<%=ddlstudentid.ClientID%>").val());
            });--%>
     <%--  $("#<%=ddlproctor.ClientID%>").change(function () {
           if ($("#<%=ddlproctor.ClientID%>").val() != "0") {
               $.ajax({
                   type: "GET",
                   url: "exam_assign.aspx/Genrateotp",
                   contentType: "application/json; charset=utf-8",
                   dataType: "json",
                   success: function (response) {
                       if (response.d) {
                           var result = JSON.parse(response.d);
                           $("#<%=txtproctorpasskey.ClientID%>").val(result);
                       }
                   }
               });
           }
       });--%>


        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#exammodule_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#examsassign').addClass('active');
            $.ajax({
                type: "GET",
                url: "exam_assign.aspx/Genrateotp",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        $("#<%=txtstudentpasskey.ClientID%>").val(result);
                           $("#<%=hidtxtstudentpasskey.ClientID%>").val(result);
                   }
               }
           });
           $.ajax({
               type: "GET",
               url: "exam_assign.aspx/Genrateotp",
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (response) {
                   if (response.d) {
                       var result = JSON.parse(response.d);
                       $("#<%=txtproctorpasskey.ClientID%>").val(result);
                           $("#<%=hidtxtproctorpasskey.ClientID%>").val(result);
                    }
                }
            });
        });
    </script>        
</asp:Content>
