<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exam_assign.aspx.cs" Inherits="admin_exam_assign" MasterPageFile="~/admin/admin.master"%>


<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">
  
    <div class="container page__container">
        <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                <li class="breadcrumb-item active">Assign EXAM</li>
        </ol>
        <h1 class="h2">Assign EXAM</h1>

        <div class="card">
           <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <div class="form-group row" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Institution </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlUniversity_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>                    
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Exam</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlexam" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlexam_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Scheduled Date & Time</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlExamDateTime" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Student</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlstudentid" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                             </div>
                         </div>
                     </div> 
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Assign Proctor</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" ID="txtproctor" runat="server" class="form-control"/>
                                    <%--<asp:DropDownList ID="ddlproctor" runat="server" CssClass="form-control"></asp:DropDownList>--%>
                                </div>
                             </div>
                         </div>
                     </div> 
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Proctor Email</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" ID="txtproctoremail" runat="server" class="form-control"/>
                                    <%--<asp:DropDownList ID="ddlproctor" runat="server" CssClass="form-control"></asp:DropDownList>--%>
                                </div>
                             </div>
                         </div>
                     </div> 
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Virtual Meeting Link</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" ID="txtvirtualLink" runat="server" class="form-control"/>
                                </div>
                             </div>
                         </div>
                     </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Student Passkey</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" ID="txtstudentpasskey" runat="server" class="form-control" disabled="disabled"/>
                                    <asp:HiddenField runat="server" ID="hidtxtstudentpasskey"/>
                                </div>
                             </div>
                         </div>
                     </div> 
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Proctor Passkey</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" ID="txtproctorpasskey" runat="server" class="form-control" disabled="disabled"/>
                                    <asp:HiddenField runat="server" ID="hidtxtproctorpasskey"/>
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
                                    <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btn_submit_Click" OnClientClick="return validateForm()"/>
                                   <div class="col-md-20">
                                         <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                   </div>                                  
                                </div>
                            </div>
                        </div>
                    </div>
           </div>
    </div>
    
  
   <script>
      
       function validateForm() {
           var flag = false;
           if ($("#<%=ddlUniversity.ClientID%>").val() == "0")
               alert("Please Select University");
           else if ($("#<%=ddlexam.ClientID%>").val() == "0")
               alert("Please Select exam");
           else if ($("#<%=ddlExamDateTime.ClientID%>").val() == "0")
               alert("Please select exam time");
           else if ($("#<%=ddlstudentid.ClientID%>").val() == "0")
               alert("Please select student name");
           else if ($("#<%=txtproctor.ClientID%>").val() == "0")
               alert("Please enter proctor");
               else if ($("#<%=txtproctoremail.ClientID%>").val() == "0")
               alert("Please enter proctor email");
           else if ($("#<%=txtvirtualLink.ClientID%>").val() == "")
               alert("Please Enter Virtual link");
           else
               flag = true;
           return flag;
       }
       $("#<%=ddlstudentid.ClientID%>").change(function () {      
           if ($("#<%=ddlstudentid.ClientID%>").val() != "0") {
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
           }
       });
      
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
                           $("#<%=txtproctorpasskey.ClientID%>").val(result);
                           $("#<%=hidtxtproctorpasskey.ClientID%>").val(result);
                       }
                   }
               });
       });
    </script>        
</asp:Content>