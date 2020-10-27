<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exam_openanswerSet.aspx.cs" Inherits="admin_exam_openanswerSet" MasterPageFile="~/admin/admin.master" %>


<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    <script type="text/javascript" language="javascript">
        function ConfirmOnDelete(item) {
            if (confirm("Are you sure to delete: " + item + "?") == true)
                return true;
            else
                return false;
        }
    </script>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Open Answer Master</li>
        </ol>
        <h1 class="h2">Open Answer Master</h1>

        <div class="card">
           <%-- <div id="validateDiv" runat="server">
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
                                <asp:DropDownList ID="ddlexaminer" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlexaminer_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
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
                                <asp:Button ID="btn_submit" runat="server" Text="Validate" CssClass="btn btn-success" OnClick="btn_submit_Click" OnClientClick="return validateForm()" />
                                <div class="col-md-20">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>
            <div id="gridDiv" runat="server" style="display:block">
                <div class="form-group row">
                    <label for="name" class="col-sm-3 col-form-label form-label">Enter Question</label>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-md-6">
                                <asp:TextBox runat="server" ID="txtquestion" class="form-control" TextMode="MultiLine" Height="157px" Width="550px"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-3 col-form-label form-label">Instruction for checking & Evalution</label>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-md-9">
                                <asp:FileUpload runat="server" ID="uploadcheckingfile" />
                                <asp:HiddenField runat="server" ID="hidlnkevalution" />
                                <asp:HyperLink runat="server" ID="lnkevalution" Target="_blank"> </asp:HyperLink>
                                <label>Please upload file of type .docx, .pdf, png, jpg</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-3 col-form-label form-label">Select type</label>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-md-6">
                                <asp:DropDownList runat="server" ID="ddltype" CssClass="form-control">
                                    <asp:ListItem Value="0">Please Select </asp:ListItem>
                                    <asp:ListItem Value="1">Text</asp:ListItem>
                                    <asp:ListItem Value="2">Image</asp:ListItem>
                                    <asp:ListItem Value="3">Audio</asp:ListItem>
                                    <asp:ListItem Value="4">Video</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class="col-sm-3 col-form-label form-label">Answer</label>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-md-6">
                                <asp:TextBox runat="server" ID="txtanswer" class="form-control" TextMode="MultiLine" Height="157px" Width="550px"></asp:TextBox>
                                <div runat="server" id="fileuploaddiv" style="display: none">
                                    <asp:FileUpload runat="server" ID="fileupload" />
                                    <asp:HiddenField runat="server" ID="hidlnkanswer" />
                                    <asp:HyperLink runat="server" ID="lnkanswer" Target="_blank"></asp:HyperLink>
                                </div>
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
                <div class="form-group row">
                    <div class="col-sm-8 offset-sm-3">
                        <div class="media align-items-center">
                            <div class="media-left">
                                <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnsubmit_Click" OnClientClick="return validateForm2()" />
                                <div class="col-md-20">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-content card-body" style="display:none;">
                    <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                        <asp:GridView ID="GridView" CssClass="table" runat="server" AutoGenerateColumns="False" ShowFooter="false" CellPadding="3"
                            PageSize="25"
                            BorderStyle="None"
                            BorderWidth="1px" DataKeyNames="id"
                            CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowEditing="GridView_RowEditing" OnPageIndexChanging="GridView_PageIndexChanging" OnRowCommand="GridView_RowCommand" OnRowDataBound="GridView_RowDataBound" OnRowDeleted="GridView_RowDeleted" OnRowDeleting="GridView_RowDeleting" OnRowUpdated="GridView_RowUpdated" OnRowUpdating="GridView_RowUpdating">

                            <Columns>
                                <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False"
                                    ReadOnly="True" SortExpression="id" />
                                <asp:TemplateField HeaderText="Question">
                                    <ItemTemplate>
                                        <asp:Label ID="lblquestion" runat="server" Text='<%# Bind("question") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Type">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltype" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Answer">
                                    <ItemTemplate>
                                        <label class="col-form-label form-label" style="<%# Eval("questiontype") == null? "display:block;": "display:none;"  %>"><%# Eval("answer") %></label>

                                        <a href="<%# Eval("answer") %>" target="_blank" style="<%# Eval("questiontype") == null? "display:none;": "display:block;"  %>">View File</a>


                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Marks">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltype" runat="server" Text='<%# Bind("marks") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                  <asp:TemplateField HeaderText="Time (in minutes)">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltype" runat="server" Text='<%# Bind("duration") %>'></asp:Label>
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
    <script>
        function validateUploadedFile(typeid, filepath, hidepath) {
            if (filePath == "")
                filePath = hidepath;

            if (filePath == "") {
                alert("Please upload a file");
                return false;
            }
            var fileExtension = filepath.substring(filepath.lastIndexOf(".") + 1).toString().toLowerCase();
            if (typeid == 2 && fileExtension != "jpg" && fileExtension != "png" && fileExtension != "jpeg") {
                alert("Invalid file. Please select file of type jpg, png, jpeg");
                return false;
            }
            else if (typeid == 3 && fileExtension != "mp3" && fileExtension != "aac" && fileExtension != "flac" && fileExtension != "wav") {
                alert("Invalid file. Please select file of type .FLAC ,.MP3,.WAV,.AAC");
                return false;
            }
            else if (typeid == 4 && fileExtension != "mp4" && fileExtension != "3gp" && fileExtension != "webm" && fileExtension != "wmv" && fileExtension != "flv" && fileExtension != "ogv" && fileExtension != "mkv") {
                alert("Invalid file. Please select file of type .mp4, .3gp, .webm, .wmv, .flv,.ogv, .mkv");
                return false;
            }
            else if (typeid == 5 && fileExtension != "jpg" && fileExtension != "png" && fileExtension != "jpeg" && fileExtension != "pdf" && fileExtension != "docx") {
                alert("Invalid file. Please select file of type pdf, docx, jpg, png");
                return false;
            }

            return true;
        }

        function validateForm2() {

            var flag = false;
            if ($("#<%=txtquestion.ClientID%>").val() == "")
                alert("Please enter question");
            else if ($("#<%=uploadcheckingfile.ClientID%>").val() == "" && !validateUploadedFile(5, $("#<%=uploadcheckingfile.ClientID%>").val(), $("#<%=hidlnkevalution.ClientID%>").val())) { }
            else if ($("#<%=ddltype.ClientID%>").val() == "0")
                alert("Please select type");
            else if ($("#<%=ddltype.ClientID%>").val() != "0" && $("#<%=ddltype.ClientID%>").val() == 1 && $("#<%=txtanswer.ClientID%>").val() == "")
                alert("Please enter answer description");
            else if ($("#<%=ddltype.ClientID%>").val() != "0" && $("#<%=ddltype.ClientID%>").val() != 1 && !validateUploadedFile($("#<%=ddltype.ClientID%>").val(), $("#<%=fileupload.ClientID%>").val(), $("#<%=hidlnkanswer.ClientID%>").val())) { }
            else if ($("#<%=txtmarks.ClientID%>").val() == "")
                alert("Please enter marks");
           <%--  else if ($("#<%=txttime.ClientID%>").val() == "")
                alert("Please enter time in minutes");--%>
            else
                flag = true;
            return flag;
        }
       <%-- function validateForm() {

            var flag = false;
            if ($("#<%=ddlUniversity.ClientID%>").val() == "0")
                alert("Please select University");
            else if ($("#<%=ddlexaminer.ClientID%>").val() == "0")
                alert("Please select examiner");
            else
                flag = true;
            return flag;
        }--%>

        $("#<%=ddltype.ClientID%>").change(function () {

            var typeId = $("#<%=ddltype.ClientID%>").val();

             if (typeId == 1) {
                 $("#<%=txtanswer.ClientID%>").show();
                    $("#<%=fileuploaddiv.ClientID%>").hide();
                }
                else {
                    $("#<%=txtanswer.ClientID%>").hide();
                    $("#<%=fileuploaddiv.ClientID%>").show();
            }
        });

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#buildpaper_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#exam_openansset').addClass('active');

            var typeId = $("#<%=ddltype.ClientID%>").val();

            if (typeId == 1) {
                $("#<%=txtanswer.ClientID%>").show();
                    $("#<%=fileuploaddiv.ClientID%>").hide();
                }
                else {
                    $("#<%=txtanswer.ClientID%>").hide();
                    $("#<%=fileuploaddiv.ClientID%>").show();
            }
        });
    </script>

</asp:Content>

