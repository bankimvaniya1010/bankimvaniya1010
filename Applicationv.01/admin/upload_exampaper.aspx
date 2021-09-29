<%@ Page Language="C#" AutoEventWireup="true" CodeFile="upload_exampaper.aspx.cs" Inherits="admin_upload_exampaper" MasterPageFile="~/admin/admin.master" %>

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
            <li class="breadcrumb-item active">Upload Assessmnet</li>
        </ol>

        <div class="card">
            <div class="tab-content card-body" id="uploadpaperDiv" style="display: none" runat="server">
                <div>
                    <div class="form-group row">
                        <h2>Upload Assessment Paper</h2>
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
                            <label for="name" class="col-sm-3 col-form-label form-label">Select Assessment Sheet</label>
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
                    </div>
                   
                </div>
                <div class="media-left col-md-12">
                    <div style="position: relative; width: 202px; background: transparent; margin-bottom: 15px; height: 25px;">
                        <div id="progress" class="hide" style="background: blue; height: 25px; width: 0; color: #fff;">
                            <div class="status" style="margin-left: 10px;"></div>
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
                                            <asp:FileUpload runat="server" ID="fileupload" />
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
            </div>
            <div id="buildinpaperDiv" style="display: none" runat="server">
                <div class="form-group row">
                    <h2>Build Assessment Paper</h2>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Label ID="Label1" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
                <div id="questionbankDiv" runat="server">
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Question Type</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList runat="server" ID="ddlquestiontype" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlquestiontype_SelectedIndexChanged">
                                        <asp:ListItem Value="">Please Select </asp:ListItem>
                                        <asp:ListItem Value="MCQ"></asp:ListItem>
                                        <asp:ListItem Value="True/False"></asp:ListItem>
                                        <asp:ListItem Value="Open Answer"></asp:ListItem>
                                        <asp:ListItem Value="Upload Answer"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Questions</label>
                        <div class="col-sm-9">
                            <div class="row">
                                <div class="col-md-12 admin-checkbx">
                                    <asp:CheckBoxList ID="chkquestion" runat="server" RepeatDirection="Vertical">
                                    </asp:CheckBoxList>

                                    <%-- <% if (data.count > 0) {%>
                                        <table>
                                            <%for (int i = 0; i < data.count; i++)
                                                { %>
                                            <tr>
                                                <td id="">
                                                    <input type="checkbox" id="Checkbox1" runat="server"/>
                                                </td>
                                                <td>
                                                    <span>
                                                        <%=data[i].question %>
                                                    </span>
                                                </td>
                                                <td style="<%=data[i].questiontype== null ? "visibility: hidden;": "visibility:visible;"  %>">
                                                    <a href=" <%=data[i].questionpath %>" target="_blank"> View File</a>
                                                </td>
                                            </tr>
                                            <%} %>
                                        </table>
                                        <%} %>--%>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div id="mainNav"></div>
                </div>
            </div>

            <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <div class="form-row justify-content-between">
                                        <asp:Button ID="btnupload" runat="server" CssClass="btn btn-success" OnClientClick="return validateForm()" OnClick="btnupload_Click" />
                                        <asp:Button ID="gotoNextPage" runat="server" Text="Go to Schedule Assessment" CssClass="btn btn-success" OnClick="gotoNextPage_Click" />
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
            var uploadtype = '<%= uploadtype%>';

            var flag = false;

            if ((uploadtype == 1 || uploadtype == 3) && $("#<%=FileUpload.ClientID%>").val() == "")
                alert("please upload file");
            else if ((uploadtype == 1 || uploadtype == 3) && !validateUploadedFile("assessment", $("#<%=FileUpload.ClientID%>").val(), uploadtype)) { }

            else if ((uploadtype == 1 || uploadtype == 3) && $("#<%=FileUpload.ClientID%>").val() != "" && !checkFileSize())
                alert("file Size should be less than 100MB");

            else if ((uploadtype == 1 || uploadtype == 3) && $("#<%=extrasheet_FileUpload.ClientID%>").val() != "" && !validateUploadedFile("extra", $("#<%=extrasheet_FileUpload.ClientID%>").val(), uploadtype)) { }

            else if ((uploadtype == 1 || uploadtype == 3) && $("#<%=extrasheet_FileUpload.ClientID%>").val() != "" && !checkFileSize())
                alert("file Size should be less than 100MB");

            else if ((uploadtype == 1 || uploadtype == 3) && $("#<%=audiofile_FileUpload.ClientID%>").val() != "" && !checkFileType())
                alert("Please upload a valid file ");
            else if ((uploadtype == 1 || uploadtype == 3) && $("#<%=audiofile_FileUpload.ClientID%>").val() != "" && !checkFileSize())
                alert("file Size should be less than 100MB");
            else if (uploadtype == 2 && $("#<%=ddlquestiontype.ClientID%>").val() == "0")
                alert("Please select question type ");
            else if (uploadtype == 2 && $("input[type=checkbox]:checked").length == "0")
                alert("Please select question");
            else
                flag = true;
            return true;
            <%--if (flag) {
                $("#ContentPlaceHolder1_btnupload").attr("disabled", "true")
                $("#progress").removeClass("hide");
                var progressEle = $("#progress");
                progressEle.css("background-color", "blue");

                var formData = new FormData();
                var data1 = $("#ContentPlaceHolder1_FileUpload")[0].files[0];
                var data2 = $("#ContentPlaceHolder1_extrasheet_FileUpload")[0].files[0];
                var data3 = $("#ContentPlaceHolder1_audiofile_FileUpload")[0].files[0];

                formData.append("files", data1);

                formData.append("files", data2);

                formData.append("files", data3);

                var dummyProgress = 1;
                var intervalId = -1;
                var req = new XMLHttpRequest();

                req.upload.addEventListener("progress", function (event) {

                    var percent = (event.loaded / event.total) * 90;
                    var progress = Math.round((event.loaded / event.total) * 90);
                    console.log("progress:" + progress);
                    if (progress < 90) {
                        $(".status").html(progress + "%");
                        progressEle.width(progress + "%");
                    }
                    else {
                        progress = progress + dummyProgress;
                        if (progress <= 99) {
                            $(".status").html(progress + "%");
                            progressEle.width(progress + "%");
                        }
                        if (intervalId == -1) {
                            intervalId = setInterval(function () {
                                progress = progress + dummyProgress;
                                dummyProgress++;
                                if (progress <= 99) {
                                    $(".status").html(progress + "%");
                                    progressEle.width(progress + "%");
                                }
                                else
                                    clearInterval(intervalId);
                            }, 2500);
                        }
                    }
                });

                req.onreadystatechange = function () {
				var hostName = "<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>";
                    if (req.status && req.status == 200 && (req.readyState == 4)) {
                        $("#ContentPlaceHolder1_btnupload").removeAttr("disabled");
                        alert("Video uploaded successfully");
                        location.replace(hostName + "admin/upload_exampaper.aspx?exampapersid=<%=exampapersid%>");
                    }
                }

                req.open("POST", 'upload_exampaper.aspx/uploadVideo', true);
                req.send(formData);
            }
            return false;--%>
        }

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#exammodule_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#exammodule').addClass('active');
        });
    </script>
</asp:Content>


