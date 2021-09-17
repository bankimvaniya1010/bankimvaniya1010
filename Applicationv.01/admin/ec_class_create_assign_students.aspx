<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_class_create_assign_students.aspx.cs" Inherits="admin_ec_class_create_assign_students" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">
    
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">MY DASHBOARD</a></li>
            <li class="breadcrumb-item"><a href="ec_manageclass.aspx">MANAGE CLASSES</a></li>
            <li class="breadcrumb-item">ASSIGN STUDENT(S)</li>
        </ol>
        <h1 class="h2">ASSIGN STUDENT(S) To A CLASS</h1>
        <div class="">
            <div class="card" id="createDiv" runat="server">
                <div class="tab-content card-body">
                    <div class="tab-pane active" id="first">

                        <div class="form-group row" id="grade">
                            <label for="name" class="col-sm-3 col-form-label form-label">Grade</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlgrade" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row" id="group">
                            <label for="name" class="col-sm-3 col-form-label form-label">Group</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlgroup" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="subject">
                            <label for="name" class="col-sm-3 col-form-label form-label">Subject</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlsubject" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Select Type</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddltype" class="form-control">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Select Mode</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlmode" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlmode_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="form-group row" id="class">
                            <label for="name" class="col-sm-3 col-form-label form-label">SELECT Class</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlclass" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlclass_SelectedIndexChanged"/>
                                        <asp:HiddenField runat="server" ID="HidClassID" />
                                        <br/>
                                        Availability : <asp:Label runat="server" ID="lblavilable"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                         <div class="form-group row">
                            <label for="name" class="col-sm-4 col-form-label form-label">Select Assignee(s) for this class</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8 updt-prftbl">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8 updt-prftbl">
                                        <asp:CheckBox ID="chkAll" Text="Select All" runat="server" onclick="javascript:Header_Click(this);" />
                              <asp:CheckBoxList runat="server" ID="chkstudent" RepeatColumns="2" RepeatDirection="Horizontal"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-8 offset-sm-3">
                                <div class="media align-items-center">
                                    <div class="media-left">
                                        <asp:Button ID="btn_submit" runat="server" Text="Submit & Proceed" CssClass="btn btn-success" OnClientClick="return validateForm()" OnClick="btn_submit_Click" />
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
        </div>
    </div>
     <script>
    
<%--
        $("#<%=ddlmode.ClientID%>").change(function () {
            var gradeID = $("#<%=ddlgrade.ClientID%>").val();
            var subjectID = $("#<%=ddlsubject.ClientID%>").val();
            var typeID = $("#<%=ddltype.ClientID%>").val();
            var modeID = $("#<%=ddlmode.ClientID%>").val();

            if (modeID > 0) {
                 $.ajax({
                     type: "GET",
                     url: "ec_assign_student_to_class_create.aspx/GetClass",
                     contentType: "application/json; charset=utf-8",
                     dataType: "json",
                     data: { gradeID: gradeID, subjectID: subjectID, typeID: typeID, modeID: modeID },
                     success: function (response) {
                         if (response.d) {
                             var result = JSON.parse(response.d);
                             if ($("#<%=ddlclass.ClientID%>").length >= 1) {
                                 $("#<%=ddlclass.ClientID%>").empty();
                                 $("#<%=ddlclass.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
                             }
                             for (var i = 0; i < result.length; i++)
                                 $("#<%=ddlclass.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].fieldname));
                         }
                     }
                 });
             }
             else {
                 $("#<%=ddlclass.ClientID%>").empty();
                 $("#<%=ddlclass.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
             }
        });
        $("#<%=ddlclass.ClientID%>").change(function () {
            $("#<%=HidClassID.ClientID%>").val($("#<%=ddlclass.ClientID%>").val());
        });
        --%>
        function validateForm() {
            if ($("#<%=ddlgrade.ClientID%>").val() == "0") {
                alert("Please select grade.");
                return false;
            }
            else if ($("#<%=ddlsubject.ClientID%>").val() == "0") {
                alert("Please select subject.");
                return false;
            }
            else if ($("#<%=ddltype.ClientID%>").val() == "0") {
                alert("Please select type.");
                return false;
            }
            else if ($("#<%=ddlmode.ClientID%>").val() == "0") {
                alert("Please select mode.");
                return false;
            }
            else if ($("#<%=ddlclass.ClientID%>").val() == "0") {
                alert("Please select class.");
                return false;
            }
            return true;
        }
         function Header_Click(isChecked) {
            if (isChecked.checked == true) {
                $('input[type="checkbox"]').each(function () {
                    this.checked = true;
                });
            }
            else {
                $('input[type="checkbox"]').each(function () {
                    if(!$(this).prop('disabled'))
                        this.checked = false;
                });
            }
         }
         $(document).ready(function () {
             $('.sidebar-menu-item').removeClass('open');
             $('#classlist').addClass('open');
             $('.sidebar-menu-item').removeClass('active');
             $('#schedule_service5').addClass('active');

             if ($("#<%=ddltype.ClientID%>").val() == 1)
                 $("#ContentPlaceHolder1_ddlmode option[value=3]").hide();
             else
                 $("#ContentPlaceHolder1_ddlmode option[value=3]").show();

         });
          $("#<%=ddltype.ClientID%>").change(function () {
            var typeID = $("#<%=ddltype.ClientID%>").val();
            if (typeID == 1)
                $("#ContentPlaceHolder1_ddlmode option[value=3]").hide();
            else
                $("#ContentPlaceHolder1_ddlmode option[value=3]").show();
        });

     </script>
</asp:Content>