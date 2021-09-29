<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_uploadanswer_create.aspx.cs" Inherits="admin_ec_uploadanswer_create" MasterPageFile="~/admin/admin.master" %>


<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript" language="javascript">
        function ConfirmOnDelete(item) {
            if (confirm("Are you sure to delete: " + item + "?") == true)
                return true;
            else
                return false;
        }
    </script>
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Upload Answer Master</li>
        </ol>
        <h1 class="h2">Upload Answer Master </h1>

        <div class="card">
            <div class="tab-content card-body">
                <div class="form-group row">
                    <label for="name" class="col-sm-3 col-form-label form-label">Select Grade</label>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-md-8">
                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlgrade" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-3 col-form-label form-label">Select Subject</label>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-md-8">
                                <asp:DropDownList runat="server" CssClass="form-control" ID="ddlsubject" />
                            </div>
                        </div>
                    </div>
                </div>
                <div id="uploadpaperDiv" runat="server">
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Question Name</label>
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
                                    <asp:FileUpload runat="server" ID="uploadcheckingfile" />
                                    <asp:HyperLink runat="server" ID="uploadcheckingfile_Link" Target="_blank"/>
                                    <asp:HiddenField runat="server" ID="Hid_uploadcheckingfile"/>

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
                                    
                                    <asp:HyperLink runat="server" ID="FileUpload_Link" Target="_blank"/>
                                    <asp:HiddenField runat="server" ID="Hid_FileUpload"/>
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
                                        <asp:HyperLink runat="server" ID="extrasheet_FileUpload_link" Target="_blank"/>
                                    <asp:HiddenField runat="server" ID="Hid_extrasheet_FileUpload"/>
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
                                        
                                        <asp:HyperLink runat="server" ID="audiofile_FileUpload_Link" Target="_blank"/>
                                    <asp:HiddenField runat="server" ID="Hid_audiofile_FileUpload"/>
                                        <label style="font-size: small;" class="marginright">*The file formats you can upload are - .mp4, .3gp, .webm, .wmv, .flv,.ogv, .mkv</label>
                                        <asp:CheckBox runat="server" ID="chkview" />Allow Audio/Video file to be viewed one time 
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
                                        <input type="text" runat="server" id="txtmarks" textmode="MultiLine" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Time (in minutes)</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-10">
                                        <input type="text" runat="server" id="txttime" textmode="MultiLine" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Question for</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-3">
                                        <input type="radio" runat="server" id="rbl1" name="for" class="form-check-input" > For Assignment
                                    </div>
                                    <div class="col-md-3">
                                        <input type="radio" runat="server" id="rbl2" name="for" class="form-check-input" >For Assessment
                                    </div>
                                    <div class="col-md-2">
                                        <input type="radio" runat="server" id="rbl3" name="for" class="form-check-input" >For Both
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

                </div>
            </div>

        </div>
    </div>


    <script>

        function validateUploadedFile(sheettype, fileupload, hidfilepath,msg) {
            if (fileupload == "")
                fileupload = hidfilepath;
            if (fileupload == "") {

                alert("Please select file for "+msg);
                    return false;
            }
            var fileExtension = fileupload.substring(fileupload.lastIndexOf(".") + 1).toString().toLowerCase();
            if (sheettype == "assessment") {
                if (fileExtension != "jpg" && fileExtension != "png" && fileExtension != "jpeg") {
                    alert("Invalid File. Please select file of type jpg, png, jpge for "+msg);
                    return false;
                }
            }
            else if (sheettype == "extra") {
                if (fileExtension != "jpg" && fileExtension != "png" && fileExtension != "jpeg" && fileExtension != "pdf") {
                    alert("Invalid File. Please select file of type jpg, png, jpge,.pdf for " + msg);
                    return false;
                }
            }
            return true;
        }
        function validateevalutionFile(fileupload, hidfilepath,msg) {
            if (fileupload == "")
                fileupload = hidfilepath;
            if (fileupload == "") {

                alert("Please select file for "+msg);
                return false;
            }

            var fileExtension = fileupload.substring(fileupload.lastIndexOf(".") + 1).toString().toLowerCase();
            if (fileExtension != "docx" && fileExtension != "pdf") {
                alert("Invalid File. Please select file of type docx, pdf for "+msg);
                return false;
            }
            return true;
        }
        function checkFileType(fileupload, hidfilepath) {
            if (fileupload == "")
                fileupload = hidfilepath;
            if (fileupload == "") {

                alert("Please select file");
                return false;
            }
            var fileName = $("#" + fileupload + "")[0].files[0].name;
            var extension = fileName.substr(fileName.lastIndexOf(".") + 1).toString().toLowerCase();
            return (extension == "mp4" || extension == "3gp" || extension == "webm" || extension == "wmv" || extension == "flv" || extension == "ogv" || extension == "mkv" || extension == "flac" || extension == "mp3" || extension == "wav" || extension == "aac");
        }

        function checkFileSize(fileupload, hidfilepath) {
            if (fileupload == "")
                fileupload = hidfilepath;
            if (fileupload == "") {

                alert("Please select file");
                return false;
            }
            var fileSize = $("#" + fileupload + "")[0].files[0].size;
            var fileSizeInMB = (fileSize / 1024) / 1024;
            return (fileSizeInMB < 100);
        }
        function validateForm() {
             var checOnlykNum = /^[0-9]*$/;
            var flag = false;
             if ($("#<%=ddlgrade.ClientID%>").val() == "0")
                 alert("Please select grade");
            else if ($("#<%=ddlsubject.ClientID%>").val() == "0")
                  alert("Please select subject");
            else if ($("#<%=txtquestiondescription.ClientID%>").val() == "")
                alert("please enter question name.");
            else if (!validateevalutionFile($("#<%=uploadcheckingfile.ClientID%>").val(),$("#<%=Hid_uploadcheckingfile.ClientID%>").val(),"Instruction for checking & evalution.")) { }
           
            else if (!validateUploadedFile("assessment", $("#<%=FileUpload.ClientID%>").val(),$("#<%=Hid_FileUpload.ClientID%>").val(),"upload assessment paper")) { }
            else if ($("#<%=extrasheet_FileUpload.ClientID%>").val() != "" && !validateUploadedFile("extra", $("#<%=extrasheet_FileUpload.ClientID%>").val(),$("#<%=Hid_extrasheet_FileUpload.ClientID%>").val(),"extra sheet.")) { }
            else if ($("#<%=audiofile_FileUpload.ClientID%>").val() != "" && !checkFileType("ContentPlaceHolder1_audiofile_FileUpload","ContentPlaceHolder1_Hid_audiofile_FileUpload"))
                alert("Please upload a valid file ");
            else if ($("#<%=audiofile_FileUpload.ClientID%>").val() != "" && !checkFileSize("ContentPlaceHolder1_audiofile_FileUpload","ContentPlaceHolder1_Hid_audiofile_FileUpload"))
                alert("file Size should be less than 20MB");
            else if ($("#<%=txtmarks.ClientID%>").val() == ""|| !(checOnlykNum.test($("#<%=txtmarks.ClientID%>").val())))
                alert("Please entervalid marks");
            else if ($("#<%=txttime.ClientID%>").val() == ""|| !(checOnlykNum.test($("#<%=txttime.ClientID%>").val())))
                alert("Please enter valid time in minutes");
            else if (!($("#<%=rbl1.ClientID%>").is(":checked") || $("#<%=rbl2.ClientID%>").is(":checked") || $("#<%=rbl3.ClientID%>").is(":checked")))
                alert("Please select option for question bank");
        <%--    else if ($("#<%=txttime.ClientID%>").val() == "")
                alert("Please enter time in minutes");--%>
            else
                flag = true;
            return flag;
        }

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#questionbank').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#uploadanswermaster').addClass('active');
        });
    </script>
</asp:Content>


