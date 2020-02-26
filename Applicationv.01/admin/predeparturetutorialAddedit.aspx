<%@ Page Language="C#" AutoEventWireup="true" CodeFile="predeparturetutorialAddedit.aspx.cs" Inherits="admin_predeparturetutorialAddedit" MasterPageFile="~/admin/admin.master"%>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
     
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container page__container">
        <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                <li class="breadcrumb-item active">Predeparture Tutorials Add/Edit</li>
        </ol>
        <h1 class="h2">Predeparture Tutorials Add/Edit </h1>

        <div class="card">
           <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <div class="form-group row" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">Institution Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">File Type</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="0">Select Type</asp:ListItem>
                                        <asp:ListItem Value="video">Video</asp:ListItem>
                                        <asp:ListItem Value="ppt">PPT</asp:ListItem>
                                        <asp:ListItem Value="pdf">PDF</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="form-group row" id="Videourl">
                        <label for="name" class="col-sm-3 col-form-label form-label">vedio Url</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtVideourl" runat="server" type="text" class="form-control" >
                                </div>
                            </div>
                        </div>
                    </div>                    
                    
                     <div class="form-group row" id="upload">
                        <label for="name" class="col-sm-3 col-form-label form-label">Upload File</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                     <asp:Label ID="lblupload" runat="server" />
                                    <asp:FileUpload ID="FileUpload" runat="server" /> 
                                    <input type="hidden" id="hidDocumentPath" runat="server" />
                                    <asp:HyperLink runat="server" ID="uploadedFile" Target="_blank"></asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div> 
                
                          
                    <div class="form-group row" id="description" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">Title</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtDescription" runat="server" type="text" class="form-control" >
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">                                  
                                    <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btn_submit_Click"  OnClientClick="return validateForm()" />                                    
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
       function validateUploadedFile() {
           var filePath = $("#<%=FileUpload.ClientID%>").val();
           if (filePath == "") {
               filePath = $("#<%=hidDocumentPath.ClientID%>").val();;
           }
           if (filePath == "") {
               alert("Please upload a file");
               return false;
           }
           var docType = $("#<%=ddlType.ClientID%>").val();
           var fileExtension = filePath.substring(filePath.lastIndexOf(".") + 1).toString().toLowerCase();
           if (docType == "ppt" && fileExtension != "ppt" && fileExtension != "pptx") {
               alert("Invalid File");
               return false;
           }
           if (docType == "pdf" && fileExtension != "pdf") {
               alert("Invalid File");
               return false;
           }
           return true;
       }
       function validateForm() {
           var urlValue = $("#<%=txtVideourl.ClientID%>").val();
           var validateurl = urlValue.includes("=");
           var flag = false;
           if ($("#<%=ddlUniversity.ClientID%>").val() == "0")
               alert("Please Select University");
           else if ($("#<%=ddlType.ClientID%>").val() == "0")
               alert("Please Select File Type");
           else if ($("#<%=ddlType.ClientID%>").val() == "video" && $("#<%=txtVideourl.ClientID%>").val() == "" || validateurl)
               alert("Please Enter Valid video Url");
           else if ($("#<%=ddlType.ClientID%>").val() != "video" && !validateUploadedFile()) { }
           else if ($("#<%=txtDescription.ClientID%>").val() == "")
               alert("Please Enter Title");
           else
               flag = true;
           return flag;
       }
       $(document).ready(function() {
           $("#Videourl").hide();
           $("#upload").hide();
         
         if ($("#<%=ddlType.ClientID%>").val() == "video")              
             $("#Videourl").show();
         else
               $("#Videourl").hide();  
         if ($("#<%=ddlType.ClientID%>").val() == "ppt" || $("#<%=ddlType.ClientID%>").val() == "pdf")              
             $("#upload").show();
         else
             $("#upload").hide();  
       });

       $(function() {
            $("#<%=ddlType.ClientID%>").change(function() {
                if ($(this).val() == "video")
                    $("#Videourl").show();               
                else
                    $("#Videourl").hide();                   
            });
       });
        $(function() {
            $("#<%=ddlType.ClientID%>").change(function() {
                if ($(this).val() == "ppt" || $(this).val() == "pdf")
                    $("#upload").show();                
                else                   
                    $("#upload").hide();
               
            });
       });
       $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#tutorial_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#predeparturetutorial').addClass('active');
        });
    </script>
        </div>
</asp:Content>




