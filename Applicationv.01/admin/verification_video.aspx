<%@ Page Language="C#" AutoEventWireup="true" CodeFile="verification_video.aspx.cs" Inherits="admin_verification_video" MasterPageFile="~/admin/admin.master"%>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">STUDENT VERIFICATION VIDEO</li>
        </ol>
        <h1 class="h2">STUDENT VERIFICATION VIDEO</h1>
    </div>
    <div class="page ">
        <div class="container page__container">
            <div class="row">
                <div class="col-md-12">
                    
                    <div class="card">
                        <div class="card-body list-group list-group-fit">

<%--                             <div class="list-group-item" id="question1" runat="server">
                                <div class="form-group m-0" role="group" aria-labelledby="label-dateofissue">
                                    <div class="form-row">
                                        <label id="questionno" runat="server" for="passportno" class="col-md-12 col-form-label form-label" style="font-size: medium;">
                                            Please upload student verification video.                                        
                                        </label>
                                        <br/>
                                        <label> (*File formats should be any of the mp4, 3gp, webm, wmv, flv, ogv and should be less than 200MB )</label>
                                    </div>
                                </div>
                            </div>                               
                             <div class="list-group-item" id="uploadbtn">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="row">
                                        <div class="col-md-12 get-upldv">
                                          <input type="file" runat="server" name="FileUpload" id="FileUpload"/>
                                        </div>
                                        <div class="media-left col-md-12">
                                            <div style="position:relative;width:202px;background:transparent;margin-bottom: 15px;height:25px;"> 
                                                <div id="progress" class="hide" style="background: blue; height: 25px;width:0;color:#fff;">
                                                    <div class="status" style="margin-left:10px;"></div>
                                                </div> 
                                            </div> 
                                        </div>
                                        <div class="media-left col-md-4">                                  
                                            <asp:Button ID="btnupload" runat="server" Text="Upload" CssClass="btn btn-primary btn-block" OnClientClick="return validateUploadedFile()" OnClick="btnupload_Click" />
                                         </div>
                                        <div class="col-md-6 d-flex align-self-center">
                                            <asp:Label ID="lblupload" runat="server" />
                                         <input type="hidden" id="hidDocumentPath" runat="server" />
                                         <asp:HyperLink runat="server" ID="uploadedFile" Target="_blank"></asp:HyperLink>
                                        </div>
                                         
                                    </div>
                                </div>
                            </div> --%>
                      <div class="form-group row">
                        <label for="name" class="col-sm-4 col-form-label form-label">Please upload student verification video</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-10">

                                    <asp:FileUpload runat="server" name="FileUpload" id="FileUpload"/>
                                    <label> (*File formats should be any of the mp4, 3gp, webm, wmv, flv, ogv and should be less than 100MB )</label>
                                </div>
                                <div class="col-md-6 d-flex align-self-center">
                                            <asp:Label ID="Label1" runat="server" />
                                         <input type="hidden" id="hidDocumentPath" runat="server" />
                                         <asp:HyperLink runat="server" ID="uploadedFile" Target="_blank"></asp:HyperLink>
                                    <%-- <asp:Button runat="server" Text="Download Video" CssClass="btn btn-primary btn-block" OnClick="vvideodownload_Click" ID="vvideodownload"></asp:Button>--%>
                                 </div>
                                         
                            </div>
                            <div class="col-md-4">                                  
                                            <asp:Button ID="btnupload" runat="server" Text="Upload" CssClass="btn btn-primary btn-block" OnClientClick="return validateUploadedFile()" OnClick="btnupload_Click" />
                                         </div> 
                        </div>
                    </div>
                     <div class="form-group row">
                        <label for="name" class="col-sm-4 col-form-label form-label">upload student verification Photo</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-10">
                                     <asp:FileUpload runat="server" name="FileUpload1" id="FileUpload1"/>                                    
                                    <label style="font-size: small;" class="marginright">*The file formats you can upload are - .jpg, .png, .jpeg</label>
                                </div>
                                <div class="col-md-6 d-flex align-self-center">
                                            <asp:Label ID="Label2" runat="server" />
                                         <input type="hidden" id="Hidden1" runat="server" />
                                         <asp:HyperLink runat="server" ID="HyperLink1" Target="_blank"></asp:HyperLink>
                                 </div>                               
                            </div>
                             <div class="col-md-4">                                  
                                <asp:Button ID="btnupload1" runat="server" Text="Upload" CssClass="btn btn-primary btn-block" OnClientClick="return validateUploadedImage()" OnClick="btnupload1_Click" />
                                </div> 
                        </div>
                    </div>

                        </div>
                    </div>
                    </div>
                   <div class="col-md-4">                       
                    </div>
                <div id="page-nav" class="col-lg-auto page-nav">
                    <div>
                        <span id="tooltip"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function validateFile(fileupload) {
            var fileExtension = fileupload.substring(fileupload.lastIndexOf(".") + 1).toString().toLowerCase();
            if (fileExtension != "jpg" && fileExtension != "png" && fileExtension != "jpeg") {
                    alert("Invalid File. Please select file of type jpg, png, jpge");
                    return false;
                }
            return true;
        }

        function checkFileType() {
            var fileName = $("#ContentPlaceHolder1_FileUpload")[0].files[0].name;
            var extension = fileName.substr(fileName.lastIndexOf(".") + 1);
            return (extension == "mp4" || extension == "3gp" || extension == "webm" || extension == "wmv" || extension == "flv" || extension == "ogv");
        }

        function checkFileSize() {
            var fileSize = $("#ContentPlaceHolder1_FileUpload")[0].files[0].size;
            var fileSizeInMB = (fileSize / 1024) / 1024;
            return (fileSizeInMB < 100);
        }

        function validateUploadedImage(){
             if ($("#<%=FileUpload1.ClientID%>").val() == "") {
                 alert("Please Select a verification image");
                return false;
            }
            else if (!validateFile($("#<%=FileUpload1.ClientID%>").val())) {
                alert("Please upload a valid verification image")
                return false;
            }
        }
        function validateUploadedFile() {            
            if ($("#ContentPlaceHolder1_FileUpload")[0].files.length == 0) {
                alert("Please Select a video");
                return false;
            }
            else if (!checkFileType()) {
                alert("Please upload a valid video")
                return false;
            }
            else if (!checkFileSize()) {
                alert("Video Size should be less than 200MB")
                return false;
            }
           
        }
               
        $(document).ready(function () {
            $('.fa-info-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });           
        });

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#manageapplicantions_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#applicantlist').addClass('active');
        });

       
       
    </script>
</asp:Content>

