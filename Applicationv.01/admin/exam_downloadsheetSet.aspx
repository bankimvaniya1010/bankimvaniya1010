<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exam_downloadsheetSet.aspx.cs" Inherits="admin_exam_downloadsheetSet" MasterPageFile="~/admin/admin.master" %>

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
                                        <asp:CheckBox runat="server" ID="chkview"/>Allow Audio/Video file to be viewed one time 
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
                    <div class="tab-content">
                        <div class="tab-pane active" id="first">
                            <div class="table-responsive">
                            <asp:GridView ID="grid" runat="server" CssClass="table" AutoGenerateColumns="False" ShowFooter="false"
                                DataKeyNames="questionid"
                                AllowPaging="True"
                                CellPadding="3" BorderStyle="None" BorderWidth="1px" CellSpacing="2"
                                PageSize="25"
                                OnDataBound="grid_DataBound" OnRowCancelingEdit="grid_RowCancelingEdit" OnRowCommand="grid_RowCommand" OnRowDataBound="grid_RowDataBound" OnRowDeleted="grid_RowDeleted" OnRowDeleting="grid_RowDeleting" OnRowEditing="grid_RowEditing" OnRowUpdated="grid_RowUpdated" OnRowUpdating="grid_RowUpdating" OnPageIndexChanging="grid_PageIndexChanging">

                                <Columns>
                                    <asp:BoundField DataField="questionid" HeaderText="ID" InsertVisible="False"
                                        ReadOnly="True" SortExpression="questionid" />
                                       
                                    <asp:TemplateField HeaderText="Question Description">
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtquestiondescription" Text='<%#Eval("questiondescription") %>'/>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                           <asp:Label ID="lblSubject" runat="server" Text='<%#Eval("questiondescription") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField>


                                    <asp:TemplateField HeaderText="Assessment Sheet">
                                        <EditItemTemplate>
                                            <asp:FileUpload runat="server" ID="fileupload" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <a runat="server" href='<%# Bind("questionpath") %>' target="_blank" id="exampath">View </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Extra Sheet">
                                        <EditItemTemplate>
                                            <asp:FileUpload runat="server" ID="fileupload_extra" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <a runat="server" href='<%# Bind("extrasheetpath") %>' target="_blank" id="extraexampath" visible='<%# !String.IsNullOrEmpty(Convert.ToString(Eval("extrasheetpath"))) %>'>View </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Audio/Video File">
                                        <EditItemTemplate>
                                            <asp:FileUpload runat="server" ID="fileupload_file" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <a runat="server" href='<%# Bind("extrafilepath") %>' target="_blank" id="extrafile" visible='<%# !String.IsNullOrEmpty(Convert.ToString(Eval("extrafilepath"))) %>'>View </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                     <asp:TemplateField HeaderText="One time view File">
                                        <EditItemTemplate>
                                           <asp:CheckBox ID="chkactive" runat="server" Checked='<%# bool.Parse(Eval("check").ToString()=="1"?"True":"False") %>'/>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" id="lblview" Text='<%# Bind("audiovideofile_tobeviewed") %>'></asp:Label>                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                       <asp:TemplateField HeaderText="Edit" ShowHeader="False">
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup='<%# "Group_" + Container.DataItemIndex %>'></asp:LinkButton>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
                                </Columns>
                            </asp:GridView>
                                </div>
                        </div>
                    </div>
                </div>
                     <div class="form-group row" style="display:none">
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


