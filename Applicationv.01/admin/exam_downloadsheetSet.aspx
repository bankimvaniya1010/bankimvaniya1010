<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exam_downloadsheetSet.aspx.cs" Inherits="admin_exam_downloadsheetSet" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Assessment Upload Sheet Master</li>
        </ol>
        <h1 class="h2">Assessment Upload Sheet Master </h1>

        <div class="card">
            <div class="tab-content card-body">
                <div id="validate" runat="server">
                      <div class="form-group row">
                <label for="name" class="col-sm-3 col-form-label form-label">Select Institution</label>
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlUniversity_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <label for="name" class="col-sm-3 col-form-label form-label">Select Examiner</label>
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddlexaminer" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlexaminer_SelectedIndexChanged"></asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <label for="name" class="col-sm-3 col-form-label form-label">Enter Examiner Passkey</label>
                <div class="col-sm-8">
                    <div class="row">
                        <div class="col-md-6">
                            <input type="text" runat="server" id="txtpasskey" class="form-control" autocomplete="off">
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-sm-8 offset-sm-3">
                    <div class="media align-items-center">
                        <div class="media-left">
                            <asp:Button ID="btn_submit" runat="server" Text="Validate" CssClass="btn btn-success" OnClick="btn_submit_Click" OnClientClick="return validatepasskey()" />
                            <div class="col-md-20">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
                    </div>
                <div id="uploadpaperDiv" runat="server" style="display:none">
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Question Description</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-10">
                                    <asp:TextBox runat="server" ID="txtquestiondescription" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Instruction for checking and evalution</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-10">
                                    <asp:FileUpload runat="server" ID="uploadcheckingfile"/>
                                    <label style="font-size: small;" class="marginright">*The file formats you can upload are -.docs, .pdf</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Upload Assessment Paper</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-10">

                                    <asp:FileUpload runat="server" ID="FileUpload" onchange="showdiv()" />
                                    <label style="font-size: small;" class="marginright">*The file formats you can upload are - .jpg, .png, .jpeg</label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div runat="server" id="showdivfield">
                        <div class="form-group row">
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
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Upload audio/video file</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-10">
                                        <asp:FileUpload ID="audiofile_FileUpload" runat="server" />
                                        <asp:Label ID="Label3" runat="server" />
                                        <label style="font-size: small;" class="marginright">*The file formats you can upload are - .mp4, .3gp, .webm, .wmv, .flv,.ogv, .mkv</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Instruction</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-10">
                                        <asp:TextBox runat="server" ID="txtfileinstruction" TextMode="MultiLine" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Marks</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-10">
                                        <input type="text" runat="server" ID="txtmarks" TextMode="MultiLine" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Time in minutes</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-10">
                                       <input type="text" runat="server" ID="txttime" TextMode="MultiLine" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btnupload" runat="server" Text="Upload" CssClass="btn btn-success" OnClick="btnupload_Click1" OnClientClick="return validateForm()" />
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <asp:DataList ID="rptVideo" runat="server" GridLines="Horizontal">
                                <HeaderTemplate>
                                    
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblquestiondescription" runat="server" Text='<%# Eval("questiondescription") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemTemplate>
                                    <div style="display:none">
                                        <asp:Label ID="lblpapersheetID" runat="server" Text='<%# Eval("questionid") %>'></asp:Label>
                                    </div>
                                    <div class="form-group">

                                        <label for="choice" class="col-form-label form-label"><a href="<%# Eval("questionpath") %>" target="_blank">Assessment sheet</a></label>

                                        <label for="choice" class="col-form-label form-label" style="<%# Eval("extrasheetpath") == null ? "visibility: hidden;": "visibility:visible;"  %>">/ <a href="<%# Eval("extrasheetpath") %>" target="_blank">Extra sheet</a></label>

                                        <label for="choice" class="col-form-label form-label" style="<%# Eval("extrafilepath") == null ? "visibility: hidden;": "visibility:visible;"  %>">/ <a href="<%# Eval("extrafilepath") %>" target="_blank">file</a></label>
                                    </div>
                                   <%-- <div>
                                        <asp:Label ID="lblmarks" runat="server" Text='<%# Eval("marks") %>'></asp:Label>
                                    </div>
                                    <div>
                                        <asp:Label ID="lbltime" runat="server" Text='<%# Eval("time") %>'></asp:Label>
                                    </div>--%>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </div>
                </div>

            </div>
        </div>


    <script>

        function validatepasskey() {
            var flag = false;   
            if ($("#<%=ddlexaminer.ClientID%>").val() == "0")
                 alert("please select examiner ");
             else if ($("#<%=txtpasskey.ClientID%>").val() == "")
                alert("Please enter passkey ");
            else
                flag = true;
            return flag;
        }

         function validateUploadedFile(sheettype, fileupload) {
            var fileExtension = fileupload.substring(fileupload.lastIndexOf(".") + 1).toString().toLowerCase();
            if (sheettype == "assessment") {
                if (fileExtension != "jpg" && fileExtension != "png" && fileExtension != "jpeg") {
                    alert("Invalid File. Please select file of type jpg, png, jpge");
                    return false;
                }
            }
            else if (sheettype == "extra") {
                if (fileExtension != "jpg" && fileExtension != "png" && fileExtension != "jpeg" && fileExtension != "pdf") {
                    alert("Invalid File. Please select file of type jpg, png, jpge,.pdf");
                    return false;
                }
            }
            return true;
        }
         function validateevalutionFile(fileupload) {
            var fileExtension = fileupload.substring(fileupload.lastIndexOf(".") + 1).toString().toLowerCase();
            if (fileExtension != "docx" && fileExtension != "pdf") {
                alert("Invalid File. Please select file of type docx, pdf");
                return false;
            }
            return true;
        }
        function checkFileType() {
            var fileName = $("#ContentPlaceHolder1_audiofile_FileUpload")[0].files[0].name;
            var extension = fileName.substr(fileName.lastIndexOf(".") + 1).toString().toLowerCase();
            return (extension == "mp4" || extension == "3gp" || extension == "webm" || extension == "wmv" || extension == "flv" || extension == "ogv" || extension == "mkv"|| extension == "flac"|| extension == "mp3"|| extension == "wav"|| extension == "aac");
        }

        function checkFileSize() {
            var fileSize = $("#ContentPlaceHolder1_audiofile_FileUpload")[0].files[0].size;
            var fileSizeInMB = (fileSize / 1024) / 1024;
            return (fileSizeInMB < 100);
        }
        function validateForm() {

            var flag = false;
            if ($("#<%=txtquestiondescription.ClientID%>").val() == "")
                alert("please enter question description.");
            else if (!validateevalutionFile($("#<%=uploadcheckingfile.ClientID%>").val())) { }
            else if ($("#<%=FileUpload.ClientID%>").val() == "")
                alert("please upload file");
            else if (!validateUploadedFile("assessment", $("#<%=FileUpload.ClientID%>").val())) { }
            else if ($("#<%=extrasheet_FileUpload.ClientID%>").val() != "" && !validateUploadedFile("extra", $("#<%=extrasheet_FileUpload.ClientID%>").val())) { }
            else if ($("#<%=audiofile_FileUpload.ClientID%>").val() != "" && !checkFileType())
                alert("Please upload a valid file ");
            else if ($("#<%=audiofile_FileUpload.ClientID%>").val() != "" && !checkFileSize())
                alert("file Size should be less than 20MB");
            else if ($("#<%=txtmarks.ClientID%>").val() == "")
                alert("Please enter marks");
        <%--    else if ($("#<%=txttime.ClientID%>").val() == "")
                alert("Please enter time in minutes");--%>
            else
                flag = true;
            return flag;
        }

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#buildpaper_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#exam_downloadsheetset').addClass('active');
        });
    </script>
</asp:Content>


