<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_upload_exampaper.aspx.cs" Inherits="admin_ec_upload_exampaper" MasterPageFile="~/admin/admin.master"%>

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
            <li class="breadcrumb-item"><a href="Default.aspx">MY DASHBOARD</a></li>
            <li class="breadcrumb-item active">Upload Assignment</li>
        </ol>

        <div class="card">
            <div class="tab-content card-body" id="uploadpaperDiv" style="display: block" runat="server">
                <div>
                    <div class="form-group row">
                        <h2>Upload Assignment</h2>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Label ID="Label2" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="div1" runat="server">
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Select Assignment</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:FileUpload runat="server" ID="FileUpload" onchange="showdiv()" /><br/>
                                        <label style="font-size: small;" runat="server" id="lbl1"></label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div runat="server" id="showdivfield">
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Extra sheet</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:FileUpload ID="extrasheet_FileUpload" runat="server" /><br/>
                                        <label style="font-size: small;">*The file formats you can upload are - .jpg, .png, .jpeg,.pdf</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Upload audio/video file</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:FileUpload ID="audiofile_FileUpload" runat="server" /><br/>
                                        <label style="font-size: small;">*The file formats you can upload are - .mp3, .mp4, .3gp, .webm, .wmv, .flv, .mkv and File size must be till 100 MB</label><br/>
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
                                        <input type="text" runat="server" id="txtmarks" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                   
                </div>
                <div class="media-left col-md-12">
                    <div style="position: relative; width: 202px; background: transparent; margin-bottom: 15px; height: 25px;">
                        <div id="progress" class="hide" style="background: blue; height: 25px; width: 0; color: #fff;">
                            <div class="status" style="margin-left: 10px;"></div>
                        </div>
                    </div>
                </div>
              
            </div>
         
            
              <div class="form-group">
                    <div class="tab-content card-body">
                        <div class="tab-pane active" id="first">
                            <div class="table-responsive">
                            <asp:GridView ID="grid" runat="server" CssClass="table" AutoGenerateColumns="False" ShowFooter="false"
                                DataKeyNames="papersheetID"
                                AllowPaging="True"
                                CellPadding="3" BorderStyle="None" BorderWidth="1px" CellSpacing="2"
                                PageSize="25"
                                OnDataBound="grid_DataBound" OnRowCancelingEdit="grid_RowCancelingEdit" OnRowCommand="grid_RowCommand" OnRowDataBound="grid_RowDataBound" OnRowDeleted="grid_RowDeleted" OnRowDeleting="grid_RowDeleting" OnRowEditing="grid_RowEditing" OnRowUpdated="grid_RowUpdated" OnRowUpdating="grid_RowUpdating" OnPageIndexChanging="grid_PageIndexChanging">

                                <Columns>
                                    <asp:BoundField DataField="papersheetID" HeaderText="ID" InsertVisible="False"
                                        ReadOnly="True" SortExpression="id" />
                                    <asp:TemplateField HeaderText="Assessment Sheet">
                                        <EditItemTemplate>
                                            <asp:FileUpload runat="server" ID="fileupload1" />
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <a runat="server" href='<%# Bind("exampaper_path") %>' target="_blank" id="exampath">View </a>
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
                                            <a runat="server" href='<%# Bind("audiovideofilepath") %>' target="_blank" id="extrafile" visible='<%# !String.IsNullOrEmpty(Convert.ToString(Eval("audiovideofilepath"))) %>'>View </a>
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
            <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <div class="form-row justify-content-between">
                                        <asp:Button ID="btnupload" runat="server" CssClass="btn btn-success" OnClientClick="return validateForm()" Text="Upload" OnClick="btnupload_Click"/>
                                        <asp:Button ID="gotoNextPage" runat="server" Text="Go to Schedule Assignment" CssClass="btn btn-success" OnClick="gotoNextPage_Click"/>
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
        <%--function validate() {
            var uploadtype = '<%= uploadtype%>';
            if (uploadtype == 2)
                validateFormquestionbank();
            else if (uploadtype == 1)
                validateForm();
        }
        function validateFormquestionbank() {
            if ($("#<%=ddlquestiontype.ClientID%>").val() == "0") {
                alert("Please select question type ");
                return false;
            }
            else if ($("input[type=checkbox]:checked").length == 0) {
                alert("Please select question");
                return false;
            }              
            else
                flag = true;
            return flag;
        }--%>

        function validateUploadedFile(sheettype, fileupload, uploadtype) {

            var fileExtension = fileupload.substring(fileupload.lastIndexOf(".") + 1).toString().toLowerCase();

            if (sheettype == "assessment" && uploadtype == 1) {
                if (fileExtension != "jpg" && fileExtension != "png" && fileExtension != "jpeg") {
                    alert("Invalid File. Please select file of type jpg, png, jpge");
                    return false;
                }
            }
            else if (sheettype == "assessment" && uploadtype == 3) {
                if (fileExtension != "pdf") {
                    alert("Invalid File. Please select file of type pdf");
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
        function checkFileType() {
            var fileName = $("#ContentPlaceHolder1_audiofile_FileUpload")[0].files[0].name;
            var extension = fileName.substr(fileName.lastIndexOf(".") + 1);
            return (extension == "mp4" || extension == "3gp" || extension == "webm" || extension == "wmv" || extension == "flv" || extension == "mkv" || extension == "mp3");
        }

        function checkFileSize() {
            var fileSize = $("#ContentPlaceHolder1_audiofile_FileUpload")[0].files[0].size;
            var fileSizeInMB = (fileSize / 1024) / 1024;
            return (fileSizeInMB < 100);
        }
        function validateForm() {
           var uploadtype = '<%= assignment_type%>';

            var flag = false;

            if ((uploadtype == 2) && $("#<%=FileUpload.ClientID%>").val() == "")
                alert("please upload file");
            else if ((uploadtype == 2) && !validateUploadedFile("assessment", $("#<%=FileUpload.ClientID%>").val(), uploadtype)) { }

            else if ((uploadtype == 2) && $("#<%=FileUpload.ClientID%>").val() != "" && !checkFileSize())
                alert("file Size should be less than 100MB");
            else if ((uploadtype == 2) && $("#<%=extrasheet_FileUpload.ClientID%>").val() != "" && !validateUploadedFile("extra", $("#<%=extrasheet_FileUpload.ClientID%>").val(), uploadtype)) { }
            else if ((uploadtype == 2) && $("#<%=extrasheet_FileUpload.ClientID%>").val() != "" && !checkFileSize())
                alert("file Size should be less than 100MB");
            else if ((uploadtype == 2) && $("#<%=audiofile_FileUpload.ClientID%>").val() != "" && !checkFileType())
                alert("Please upload a valid file ");
            else if ((uploadtype == 2) && $("#<%=audiofile_FileUpload.ClientID%>").val() != "" && !checkFileSize())
                alert("file Size should be less than 100MB");
            else
                flag = true;
            return flag;
           
        }

        $(document).ready(function () {
             $('.sidebar-menu-item').removeClass('open');
            $('#assignmentList').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#assignmentmaster').addClass('active');
        });
    </script>
</asp:Content>


