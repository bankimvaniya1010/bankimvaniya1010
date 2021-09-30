<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_openquestion_create.aspx.cs" Inherits="admin_ec_openquestion_create" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
  
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">
    <style>
        #myBar {
            width: 10%;
            height: 30px;
            background-color: #04AA6D;
            text-align: center; /* To center it horizontally (if you want) */
            line-height: 30px; /* To center it vertically */
            color: white;
        }
    </style>
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Question Bank</li>
            <li class="breadcrumb-item active">CREATE OPEN QUESTION MASTER</li>
        </ol>
        <h1 class="h2">CREATE OPEN QUESTION MASTER</h1>
        <div class="">
            <div class="card" id="createDiv" runat="server">
                <div class="tab-content card-body">
                    <div class="tab-pane active" id="first">

                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Select Grade</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlgrade"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Select Subject</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlsubject"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Question Name</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input id="txtquestionname" runat="server" type="text" class="form-control" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" runat="server">
                            <label for="name" class="col-sm-3 col-form-label form-label">Question Type</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlquestiontype" CssClass="form-control">
                                            <asp:ListItem Value="0">Please Select</asp:ListItem>
                                            <asp:ListItem Value="1">Text</asp:ListItem>
                                            <asp:ListItem Value="2">Image</asp:ListItem>
                                            <asp:ListItem Value="3">Audio</asp:ListItem>
                                            <asp:ListItem Value="4">Video</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="fileDiv" runat="server">
                            <label for="name" class="col-sm-3 col-form-label form-label">Upload file</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:FileUpload runat="server" ID="file_upload"/>
                                        <asp:HiddenField runat="server" ID="hidfile_upload"/>
                                        <asp:HyperLink runat="server" ID="file_uploadLink" Target="_blank"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Insert Text</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" CssClass="form-control" id="txtinserttext" Height="150px" Width="412px" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Upload Checking guide</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:FileUpload runat="server" ID="file_guide"/>
                                        <asp:HiddenField runat="server" ID="hidfile_guide"/>
                                        <asp:HyperLink runat="server" ID="file_guideLink" Target="_blank"/>
                                      <%--  <div id="myProgress">
                                            <div id="myBar">10%</div>
                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Correct Answer</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" CssClass="form-control" id="txtcorrectanswer" Height="150px" Width="412px" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Marks</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input id="txtmarks" runat="server" type="text" class="form-control" autocomplete="off" maxlength="3">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Time in Minutes</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input id="txttime" runat="server" type="text" class="form-control" autocomplete="off" maxlength="2">
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
        </div>
    <script>
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#questionbank').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#openquestionemaster').addClass('active');
            
            var filterid = $("#<%=ddlquestiontype.ClientID%>").val();
            if (filterid == 1)
                $("#<%=fileDiv.ClientID%>").hide();
            else
                $("#<%=fileDiv.ClientID%>").show();
        });

        function validateUploadedFile(fileupload, hiddocpath, type) {
           var filePath = fileupload;
           if (filePath == "") {
               filePath = hiddocpath;
           }
           if (filePath == "") {
               alert("Please upload a file");
               return false;
           }
           
           var fileExtension = filePath.substring(filePath.lastIndexOf(".") + 1).toString().toLowerCase();
           if (type == "2" && fileExtension != "img" && fileExtension != "png" && fileExtension != "jpeg") {
               alert("Invalid File");
               return false;
           }
           if (docType == "3" && fileExtension != "mp3" && fileExtension != "mp4" && fileExtension != "wav" && fileExtension != "aac") {//audio
               alert("Invalid File");
               return false;
           }
           if (docType == "4"  && fileExtension != "mp4" && fileExtension != "3gp" && fileExtension != "mp3" && fileExtension != "ogv" && fileExtension !="wmv" && fileExtension !="mov") { //video
               alert("Invalid File");
               return false;
           }
            return true;
       }
 function validateForm() {
            var checOnlykNum = /^[0-9]*$/;
            var flag = false;
            if ($("#<%=ddlgrade.ClientID%>").val() == "0")
                alert("Please select grade");
            else if ($("#<%=ddlsubject.ClientID%>").val() == "0")
                alert("Please select subject");
            else if ($("#<%=txtquestionname.ClientID%>").val() == "")
                alert("Please enter question name"); 
            else if ($("#<%=ddlquestiontype.ClientID%>").val() == "")
                alert("Please select question type");
            else if ($("#<%=ddlquestiontype.ClientID%>").val() != "1" && !(validateUploadedFile($("#<%=file_upload.ClientID%>").val(),$("#<%=hidfile_upload.ClientID%>").val(),$("#<%=ddlquestiontype.ClientID%>").val())))
                alert("Please select file to upload");
            else if ($("#<%=txtinserttext.ClientID%>").val() == "")
                alert("Please enter insert text field");
            else if (!(validateUploadedFile($("#<%=file_guide.ClientID%>").val(),$("#<%=hidfile_guide.ClientID%>").val(),$("#<%=ddlquestiontype.ClientID%>").val())))
                alert("Please upload valid checking guide");            
            else if ($("#<%=txtcorrectanswer.ClientID%>").val() == "")
                alert("Please enter correct answer"); 
            else if ($("#<%=txtmarks.ClientID%>").val() == ""|| !(checOnlykNum.test($("#<%=txtmarks.ClientID%>").val())))
                alert("Please entervalid marks");
            else if ($("#<%=txttime.ClientID%>").val() == ""|| !(checOnlykNum.test($("#<%=txttime.ClientID%>").val())))
                alert("Please enter valid time in minutes");
            else if (!($("#<%=rbl1.ClientID%>").is(":checked") || $("#<%=rbl2.ClientID%>").is(":checked") || $("#<%=rbl3.ClientID%>").is(":checked")))
                alert("Please select option for question bank");
            else
                flag = true;

            return flag;
            
        }
        $("#<%=ddlquestiontype.ClientID%>").change(function () {
            var filterid = $("#<%=ddlquestiontype.ClientID%>").val();
            if (filterid == 1)
                $("#<%=fileDiv.ClientID%>").hide();
            else
                $("#<%=fileDiv.ClientID%>").show();
        });

    </script>
</asp:Content>
