<%@ Page Language="C#" AutoEventWireup="true" CodeFile="create_exampaper.aspx.cs" Inherits="admin_create_exampaper" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">

</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">
  
    <div class="container page__container">
        <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                <li class="breadcrumb-item active">Create Paper</li>
        </ol>
        <h1 class="h2">Create Paper </h1>

        <div class="card">
           <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <div class="form-group row" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Institution </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>                    
                    <div class="form-group row" id="examname">
                        <label for="name" class="col-sm-3 col-form-label form-label">Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtexamname" runat="server" type="text" class="form-control" >
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" id="examcourse">
                        <label for="name" class="col-sm-3 col-form-label form-label">Course</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtcourse" runat="server" type="text" class="form-control" >
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row" id="examsubject">
                        <label for="name" class="col-sm-3 col-form-label form-label">Subject</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtsubject" runat="server" type="text" class="form-control" >
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row" id="examgrade">
                        <label for="name" class="col-sm-3 col-form-label form-label">Grade</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtgrade" runat="server" type="text" class="form-control" >
                                </div>
                            </div>
                        </div>
                    </div>
                   <%-- <div class="form-group row" id="examcreateddate">
                        <label for="name" class="col-sm-3 col-form-label form-label">Date Created</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtdatecreated" runat="server" type="text" class="form-control" >
                                </div>
                            </div>
                        </div>
                    </div>--%>
                    <div class="form-group row" id="examcreatedby">
                        <label for="name" class="col-sm-3 col-form-label form-label">Created By</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtexamcreatedby" runat="server" type="text" class="form-control" >
                                </div>
                            </div>
                        </div>
                    </div>  
                    <div class="form-group row" id="Examtime">
                        <label for="name" class="col-sm-3 col-form-label form-label">Duration (Minutes)</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    
                                    <input runat="server" type="text" id="txtExamtime"  class="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div> 
                    <div class="form-group row" id="maximummarks">
                        <label for="name" class="col-sm-3 col-form-label form-label">Maximum Marks</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    
                                    <input runat="server" type="text" id="txtmaximummarks"  class="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div> 
                    <div class="form-group row" id="instructionbox">
                        <label for="name" class="col-sm-3 col-form-label form-label">Instructions</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    
                                    <asp:textbox runat="server" type="text" id="txtinstrcution" class="form-control" ></asp:textbox>
                                </div>
                            </div>
                        </div>
                    </div> 
                    <div class="form-group row" id="shotremarks">
                        <label for="name" class="col-sm-3 col-form-label form-label">Short Remarks</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    
                                    <input runat="server" type="text" id="txtshotremarks"  class="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" id="studentfile">
                        <label for="name" class="col-sm-3 col-form-label form-label">Student Download File</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Label ID="Label2" runat="server" />
                                    <asp:FileUpload ID="studentFileUpload" runat="server" ></asp:FileUpload> 
                                </div>
                            </div>
                        </div>
                    </div>                    
                    </div> 
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">                                  
                                    <asp:Button ID="btn_submit" runat="server" Text="Submit & Proceed" CssClass="btn btn-success" OnClick="btn_submit_Click" OnClientClick="return validateForm()"/>
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
  
   <script>
       
      <%-- function validateUploadedFile() {
           var filePath = $("#<%=FileUpload.ClientID%>").val();           
           if (filePath == "") {
               alert("Please upload a file");
               return false;
           }           
           var fileExtension = filePath.substring(filePath.lastIndexOf(".") + 1).toString().toLowerCase();
           if (fileExtension != "jpg" && fileExtension != "png" && fileExtension != "jpeg") {
               alert("Invalid File. Please select file of type jpg,png,jpge");
               return false;
           }
          
           return true;
       }--%>
      function validateForm() {
           
          var flag = false;
          if ($("#<%=ddlUniversity.ClientID%>").val() == "0")
              alert("Please Select University");
          else if ($("#<%=txtexamname.ClientID%>").val() == "")
              alert("Please enter exam name");
          else if ($("#<%=txtcourse.ClientID%>").val() == "")
              alert("Please Enter course name");
          else if ($("#<%=txtsubject.ClientID%>").val() == "")
              alert("Please enter subject");
          else if ($("#<%=txtgrade.ClientID%>").val() == "")
              alert("Please Enter grade");
          else if ($("#<%=txtexamcreatedby.ClientID%>").val() == "")
              alert("Please Enter created by");
          else if ($("#<%=txtmaximummarks.ClientID%>").val() == "")
              alert("Please Enter maximum marks");
          else if ($("#<%=txtshotremarks.ClientID%>").val() == "")
              alert("Please Enter short remarks");
          else if ($("#<%=studentFileUpload.ClientID%>").val() == "")
              alert("Please upload student download file");
         <%-- else if ($("#<%=rbupload.ClientID%>").is(":checked") && !validateUploadedFile()) { }--%>
          else
               flag = true;
           return flag;
       }
       
       $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#exammodule_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
           $('#exammodule').addClass('active');

           <%--if ($("#<%=rbupload.ClientID%>").is(":checked")) {
               $("#<%=uploadpaperDiv.ClientID%>").show();
               $("#<%=buildinpaperDiv.ClientID%>").hide();
           }
           else if ($("#<%=rbbuild.ClientID%>").is(":checked")) {
               $("#<%=buildinpaperDiv.ClientID%>").show();
               $("#<%=uploadpaperDiv.ClientID%>").hide();
           }

            $('#FileUpload').change(function(evt) {
                alert($(this).val());
            });--%>

       });

       <%-- $(function () {
         $("input[name='ctl00$ContentPlaceHolder1$exampaper']").click(function () {
              if ($("#<%=rbupload.ClientID%>").is(":checked")) {
               $("#<%=uploadpaperDiv.ClientID%>").show();
               $("#<%=buildinpaperDiv.ClientID%>").hide();
           }
           else if ($("#<%=rbbuild.ClientID%>").is(":checked")) {
               $("#<%=buildinpaperDiv.ClientID%>").show();
               $("#<%=uploadpaperDiv.ClientID%>").hide();
           }
             });
        });--%>
    </script>        
</asp:Content>


