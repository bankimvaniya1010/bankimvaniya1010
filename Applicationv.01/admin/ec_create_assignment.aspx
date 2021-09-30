<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_create_assignment.aspx.cs" Inherits="admin_ec_create_assignment" MasterPageFile="~/admin/admin.master"%>


<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item"><a href="ec_manage_assignment.aspx">MANAGE ASSIGNMENT</a></li>
            <li class="breadcrumb-item">create</li>
        </ol>
        <h1 class="h2">CREATE AN ASSIGNMENT</h1>
        <div class="">
            <div class="card" id="createDiv" runat="server">
                <div class="tab-content card-body">
                    <div class="tab-pane active" id="first">
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Assignment Name</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input type="text" class="form-control" id="txtassignmentname" runat="server">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Assignment Type</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="col-md-8">
                                        <input type="radio" runat="server" id="rblbuild" name="type" class="form-check-input" onclick="show();"> Build Assignment
                                    </div>
                                    <div class="col-md-3">
                                        <input type="radio" runat="server" id="rbluploadfile" name="type" class="form-check-input" onclick="show2();">Upload File
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="buildDiv" runat="server" style="display:none;">
                            <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Question Order Settings</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="col-md-3">
                                        <input type="radio" runat="server" id="rblfixed" name="order" class="form-check-input" > Fixed Order
                                    </div>
                                    <div class="col-md-8">
                                        <input type="radio" runat="server" id="rblrandom" name="order" class="form-check-input" >Random Order
                                    </div>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <div class="form-group row">
                                <label for="name" class="col-sm-3 col-form-label form-label">Allow User To Download file</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="col-md-3">
                                                <input type="radio" runat="server" id="rblyes" name="download" class="form-check-input">Yes
                                            </div>
                                            <div class="col-md-3">
                                                <input type="radio" runat="server" id="rblNo" name="download" class="form-check-input">No
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Select Grade</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:ListBox id="lstgrade" SelectionMode="Multiple" CssClass="form-control" runat="server" Height="120px"/>
                                        <label style="color: black;"><i class="fa fa-info-circle" aria-hidden="true"></i>Ctrl/Command Click to select multiple options</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Select Subject</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:ListBox id="lstsubject" SelectionMode="Multiple" CssClass="form-control" runat="server" Height="120px"/>
                                        <label style="color: black;"><i class="fa fa-info-circle" aria-hidden="true"></i>Ctrl/Command Click to select multiple options</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Upload checking guide</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                       <asp:FileUpload runat="server" ID="file_guide"/>
                                        <asp:HiddenField runat="server" ID="hidfile_upload"/>
                                        <asp:HyperLink runat="server" ID="file_uploadLink" Target="_blank"/>
                                        <label style="color: black;"><i class="fa fa-info-circle" aria-hidden="true"></i>The file formats you can upload are - jpg, jpeg, png, pdf</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Upload user download file</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:FileUpload runat="server" ID="file_userfile"/>
                                        <asp:HiddenField runat="server" ID="hidfile_userfile"/>
                                        <asp:HyperLink runat="server" ID="file_userfilelink" Target="_blank"/>
                                        <label style="color: black;"><i class="fa fa-info-circle" aria-hidden="true"></i>The file formats you can upload are - jpg,jpeg, png, pdf</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Remarks</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input type="text" runat="server" id="txtremarks" class="form-control" maxlength="250">
                                    </div>
                                </div>
                            </div>
                        </div>
                     
                            <div class="form-group row">
                                <label for="name" class="col-sm-3 col-form-label form-label">SELF-CHECK</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div class="col-md-3">
                                                <input type="radio" runat="server" id="rblselfcheck_yes" name="selfcheck" class="form-check-input">Yes
                                            </div>
                                            <div class="col-md-3">
                                                <input type="radio" runat="server" id="rblselfcheck_no" name="selfcheck" class="form-check-input">No
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
                                        <asp:Button ID="btn_submit" runat="server" Text="Submit & Proceed" CssClass="btn btn-success" OnClick="btn_submit_Click" OnClientClick="return validateForm()" />
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
    <script>
        $(document).ready(function () {
           $('.sidebar-menu-item').removeClass('open');
            $('#assignmentList').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#assignmentmaster').addClass('active');
            
            $("#<%=buildDiv.ClientID%>").hide();

            if ($("#<%=rblbuild.ClientID%>").is(":checked"))
                $("#<%=buildDiv.ClientID%>").show();
            else if ($("#<%=rbluploadfile.ClientID%>").is(":checked"))
                $("#<%=buildDiv.ClientID%>").hide();
        });
       
        function validateForm() {
            var checOnlykNum = /^[0-9]*$/;
            var flag = false;
            if ($("#<%=txtassignmentname.ClientID%>").val() == "")
                alert("Please enter assignment name");
            else if (!($("#<%=rblbuild.ClientID%>").is(":checked") || $("#<%=rbluploadfile.ClientID%>").is(":checked")))
                alert("Please select assignment type");
            else if ($("#<%=rblbuild.ClientID%>").is(":checked") && !($("#<%=rblfixed.ClientID%>").is(":checked") || $("#<%=rblrandom.ClientID%>").is(":checked")))
                alert("Please select option for question order settings");
            else if ($("#<%=rblbuild.ClientID%>").is(":checked") && !($("#<%=rblyes.ClientID%>").is(":checked") || $("#<%=rblNo.ClientID%>").is(":checked")))
                alert("Please select option for user to download file");
            else if ($("#<%=lstgrade.ClientID%>").val().length == 0)
                alert("Please select option for grade");
            else if ($("#<%=lstsubject.ClientID%>").val().length == 0)
                alert("Please select option for subject");
            else if (!(validateUploadedFile($("#<%=file_guide.ClientID%>").val(), $("#<%=hidfile_upload.ClientID%>").val()))) { }
            else if (!(validateUploadedFile($("#<%=file_userfile.ClientID%>").val(), $("#<%=hidfile_userfile.ClientID%>").val()))) { }
            else if ($("#<%=txtremarks.ClientID%>").val() == "")
                alert("Please enter remarks");
            else if (!($("#<%=rblselfcheck_yes.ClientID%>").is(":checked") || $("#<%=rblselfcheck_no.ClientID%>").is(":checked")))
                alert("Please select option for self-check");
            else
                flag = true;

            return flag;

        }
        function show() {
            $("#<%=buildDiv.ClientID%>").show();
        }
         function show2() {
            $("#<%=buildDiv.ClientID%>").hide();
        }
        
        function validateUploadedFile(fileupload, hiddocpath) {
           var filePath = fileupload;
           if (filePath == "") {
               filePath = hiddocpath;
           }
           if (filePath == "") {
               alert("Please upload a file");
               return false;
           }
           
           var fileExtension = filePath.substring(filePath.lastIndexOf(".") + 1).toString().toLowerCase();
           if (fileExtension != "jpg" && fileExtension != "png" && fileExtension != "jpeg" && fileExtension != "pdf") {
               alert("Please select valid file.");
               return false;
           }
            return true;
       }
    </script>
</asp:Content>