<%@ Page Language="C#" AutoEventWireup="true" CodeFile="upload_exampaper.aspx.cs" Inherits="admin_upload_exampaper" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">

</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">
  
    <div class="container page__container">
        <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                <li class="breadcrumb-item active">Upload Paper</li>
        </ol>
        <h1 class="h2">Upload Paper </h1>

        <div class="card">
           <div class="tab-content card-body">
               
                    <div class="form-group row" id="selecttype">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select type</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                   <input type="radio" class="form-check-input" name="exampaper" runat="server" id="rbupload">Upload Exam Paper 
                                    <br/>
                                    <input type="radio" class="form-check-input" name="exampaper" runat="server" id="rbbuild">Build Exam Paper
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="uploadpaperDiv" style="display:none" runat="server"> 
                          <div class="form-group row" >
                            <label for="name" class="col-sm-3 col-form-label form-label">Upload Exam Paper</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-10">
                                        
                                        <asp:FileUpload runat="server" ID="FileUpload" onchange="showdiv()"/>
                                        <label style="font-size: small;" class="marginright">*The file formats you can upload are - .jpg, .png, .jpeg</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                         <div runat="server" id="showdivfield" style="display:none">
                         <div class="form-group row" >
                            <label for="name" class="col-sm-3 col-form-label form-label">Extra sheet</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-10">
                                       <asp:FileUpload ID="extrasheet_FileUpload" runat="server" /> 
                                        <asp:Label ID="Label6" runat="server" />  
                                        <label style="font-size: small;" class="marginright">*The file formats you can upload are - .jpg, .png, .jpeg</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row" >
                            <label for="name" class="col-sm-3 col-form-label form-label">Upload audio/video file</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-10">
                                         <asp:FileUpload ID="audiofile_FileUpload" runat="server" /> 
                                        <asp:Label ID="Label3" runat="server" />  
                                        <label style="font-size: small;" class="marginright">*The file formats you can upload are - vedio.</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row" >
                            <label for="name" class="col-sm-3 col-form-label form-label">Instruction</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-10">
                                        <asp:TextBox runat="server" ID="txtfileinstruction" TextMode="MultiLine" class="form-control"></asp:TextBox>                                         
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   </div> 
                     <div class="form-group row" id="buildinpaperDiv" style="display:none" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">Build Exam Paper</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                     <asp:Label ID="Label1" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div> 
                     <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">                                  
                                    <asp:Button ID="btnupload" runat="server" Text="Upload" CssClass="btn btn-success" OnClick="btnupload_Click" OnClientClick="return validateForm()"/>
                                </div>
                            </div>
                        </div>
                        </div>
                     <div class="form-group row">
                                    <div class="col-sm-8 offset-sm-3">
                                        <div class="media align-items-center">
                                            <div class="media-left">
                                                <asp:Repeater ID="rptVideo" runat="server">
                                                    <HeaderTemplate>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>

                                                        <table class="table">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lblSubject" runat="server" Text='<%#Eval("papersheetID") %>' Font-Bold="true" />
                                                                </td>
                                                                <td>
                                                                    <a href="<%#Eval("exampaper_path") %>" target="_blank">View this document</a>                                                                    
                                                                </td>
                                                                 <td>
                                                                    <a href="<%#Eval("extrasheetpath") %>" target="_blank">View this document</a>                                                                    
                                                                </td>
                                                                 <td>
                                                                    <a href="<%#Eval("audiovideofilepath") %>" target="_blank">View this document</a>                                                                    
                                                                </td>
                                                            </tr>
                                                        </table>


                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                                   
                                            </div>
                                        </div>

                                    </div>
                                </div>
                    </div> 
                </div>
           </div>
        
   <script>
       function showdiv() {
           $("#<%=showdivfield.ClientID%>").show();
       }
       function validateUploadedFile(fileupload) {                  
           var fileExtension = fileupload.substring(fileupload.lastIndexOf(".") + 1).toString().toLowerCase();
           if (fileExtension != "jpg" && fileExtension != "png" && fileExtension != "jpeg") {
               alert("Invalid File. Please select file of type jpg, png, jpge");
               return false;
           }
          
           return true;
       }
       function checkFileType() {
            var fileName = $("#ContentPlaceHolder1_audiofile_FileUpload")[0].files[0].name;
            var extension = fileName.substr(fileName.lastIndexOf(".") + 1);
            return (extension == "mp4" || extension == "3gp" || extension == "webm" || extension == "wmv" || extension == "flv" || extension == "ogv" || extension == "mkv");
        }

        function checkFileSize() {
            var fileSize = $("#ContentPlaceHolder1_audiofile_FileUpload")[0].files[0].size;
            var fileSizeInMB = (fileSize / 1024) / 1024;
            return (fileSizeInMB < 20);
        }
      function validateForm() {
           
           var flag = false;
          if (!($("#<%=rbupload.ClientID%>").is(":checked") || $("#<%=rbbuild.ClientID%>").is(":checked")))
              alert("select type to upload exam paper");
          else if ($("#<%=rbupload.ClientID%>").is(":checked") && $("#<%=FileUpload.ClientID%>").val() == "")
              alert("please upload file");
          else if (!validateUploadedFile($("#<%=FileUpload.ClientID%>").val())) { }

          else if ($("#<%=extrasheet_FileUpload.ClientID%>").val() != "" && !validateUploadedFile($("#<%=extrasheet_FileUpload.ClientID%>").val())) { }
          
          else if ($("#<%=audiofile_FileUpload.ClientID%>").val() != "" && !checkFileType())
              alert("Please upload a valid file ");
          else if ($("#<%=audiofile_FileUpload.ClientID%>").val() != "" && !checkFileSize())
              alert("file Size should be less than 20MB");
          else
               flag = true;
           return flag;
       }
       
       $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#exammodule_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
           $('#exammodule').addClass('active');

           if ($("#<%=rbupload.ClientID%>").is(":checked")) {
               $("#<%=uploadpaperDiv.ClientID%>").show();
               $("#<%=buildinpaperDiv.ClientID%>").hide();
           }
           else if ($("#<%=rbbuild.ClientID%>").is(":checked")) {
               $("#<%=buildinpaperDiv.ClientID%>").show();
               $("#<%=uploadpaperDiv.ClientID%>").hide();
           }

            $('#FileUpload').change(function(evt) {
                alert($(this).val());
            });

       });

        $(function () {
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
        });
    </script>        
</asp:Content>


