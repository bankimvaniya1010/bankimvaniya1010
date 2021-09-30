<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ec_create_resource_material_master.aspx.cs" Inherits="admin_ec_create_resource_material_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content runat="server" ID="content2" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">CREATE A MATERIAL</li>
        </ol>
        <h1 class="h2">CREATE A MATERIAL </h1>
        <div class="card">
            <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                    <div class="form-group row" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select field</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:RadioButtonList runat="server" ID="rbl_service_institute" onchange="insti_service()" CssClass="form-control" RepeatColumns="2">
                                        <asp:ListItem Selected="True" Value="1">Institution</asp:ListItem>
                                        <asp:ListItem Value="2">Service Subscription</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" id="div_institute">
                        <label for="name" class="col-sm-3 col-form-label form-label">Institution Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="form-control"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" id="div_service">
                        <label for="name" class="col-sm-3 col-form-label form-label">Service Subscription</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlservice" runat="server" CssClass="form-control">
                                        <asp:ListItem Value="">Please Select</asp:ListItem>
                                        <asp:ListItem Value="0">GTE Service</asp:ListItem>
                                        <asp:ListItem Value="1">Full Service</asp:ListItem>
                                        <asp:ListItem Value="2">Assessment Service</asp:ListItem>
                                        <asp:ListItem Value="3">GTE(Certification)</asp:ListItem>
                                        <asp:ListItem Value="4">GTE(Evalution)</asp:ListItem>
                                        <asp:ListItem Value="5">E-Class Service</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" id="description" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">Material Name</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtDescription" runat="server" type="text" class="form-control">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">Material Type</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlType" runat="server" onchange="change();" CssClass="form-control">
                                        <asp:ListItem Value="0">Select Type</asp:ListItem>
                                        <asp:ListItem Value="video">Video</asp:ListItem>
                                        <asp:ListItem Value="ppt">PPT</asp:ListItem>
                                        <asp:ListItem Value="pdf">PDF</asp:ListItem>
                                        <asp:ListItem Value="audio">Audio</asp:ListItem>
                                        <asp:ListItem Value="web_link">Web Link</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" id="Videourl">
                        <label for="name" class="col-sm-3 col-form-label form-label">Web Url</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtVideourl" runat="server" type="text" class="form-control">
                                    <label style="color: black;"><i class="fa fa-info-circle" aria-hidden="true"></i>only accept "https" start with web link</label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row" id="upload">
                        <label for="name" class="col-sm-3 col-form-label form-label">Upload File</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:Label ID="lblupload" runat="server" />
                                    <asp:FileUpload ID="FileUpload" runat="server" onchange="UploadFile();" />
                                    <input type="hidden" id="hidDocumentPath" runat="server" />
                                    <asp:HyperLink runat="server" ID="uploadedFile" Target="_blank"></asp:HyperLink>
                                    <label style="color: black;"><i class="fa fa-info-circle" aria-hidden="true"></i>File size maximum 200 MB</label>
                                    <progress id="progressBar" value="0" max="100" style="width: 300px;"></progress>
                                    <h3 style="font-size: 80%; margin-left: 40%; margin-bottom: 0PX;" id="status"></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" id="Div1" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">Material Status</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:CheckBox runat="server" ID="chkactive" Text="Check to activate tutorial for institution" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <div class="col-sm-8 offset-sm-3">
                            <div class="media align-items-center">
                                <div class="media-left">
                                    <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-primary btn-block" OnClick="btn_submit_Click" OnClientClick="return validateForm()" />
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
        <script>
            //var counter;
            function UploadFile() {
                if (!vali_type()) {
                }
                else {
                    var files = $("#<%=FileUpload.ClientID%>").get(0).files;
                    // counter = 0;
                    // Loop through files
                    for (var i = 0; i < files.length; i++) {
                        var file = files[i];
                        var formdata = new FormData();
                        formdata.append("materialfile", file);
                        var ajax = new XMLHttpRequest();

                        ajax.upload.addEventListener("progress", progressHandler, false);
                        ajax.open("POST", "fileuploadhandler.ashx");
                        ajax.send(formdata);
                    }
                }
            }
            function progressHandler(event) {
                var percent = (event.loaded / event.total) * 100;
                $("#progressBar").val(Math.round(percent));
                $("#status").html(Math.round(percent) + "%");
                if (Math.round(percent) == 100) {
                    $("#status").html("Upload Successfully.....");
                }
            }
        </script>
        <script>
            function validateUploadedFile() {
                var filePath = $("#<%=FileUpload.ClientID%>").val();
                if (filePath == "") {
                    filePath = $("#<%=hidDocumentPath.ClientID%>").val();;
                }
                if (filePath == "") {
                    alert("Please upload a file");
                    return false;
                }
                var docType = $("#<%=ddlType.ClientID%>").val();
                var fileExtension = filePath.substring(filePath.lastIndexOf(".") + 1).toString().toLowerCase();
                if (docType == "ppt" && fileExtension != "ppt" && fileExtension != "pptx") {
                    alert("Invalid File");
                    return false;
                }
                if (docType == "pdf" && fileExtension != "pdf") {
                    alert("Invalid File");
                    return false;
                }
                if (docType == "audio" && fileExtension != "m4a" && fileExtension != "mp3" && fileExtension != "mp4" && fileExtension != "wav" && fileExtension != "aac" && fileExtension != "wma" && fileExtension != "flac" && fileExtension != "flp") {
                    alert("Invalid File");
                    return false;
                }
                if (docType == "video" && fileExtension != "mp4" && fileExtension != "3gp" && fileExtension != "mp3" && fileExtension != "ogv" && fileExtension != "wmv" && fileExtension != "mov" && fileExtension != "aac" && fileExtension != "avi" && fileExtension != "avchd" && fileExtension != "flv" && fileExtension != "f4v" && fileExtension != "swf") {
                    alert("Invalid File");
                    return false;
                }
                return true;
            }
            function validateForm() {
                var urlValue = $("#<%=txtVideourl.ClientID%>").val();
                var rbl_value = $("#<%=rbl_service_institute.ClientID%>").val();
                var validateurl = urlValue.includes("=");
                var flag = false;

                if ($("input[name='ctl00$ContentPlaceHolder1$rbl_service_institute']:checked").val() == "1" && $("#<%=ddlUniversity.ClientID%>").val() == "0")
                    alert("Please select institution");
                else if ($("input[name='ctl00$ContentPlaceHolder1$rbl_service_institute']:checked").val() == "2" && $("#<%=ddlservice.ClientID%>").val() == "")
                    alert("Please Select Subscription");
                else if ($("#<%=txtDescription.ClientID%>").val() == "")
                    alert("Please Enter Material Name");
                else if ($("#<%=ddlType.ClientID%>").val() == "0")
                    alert("Please Select File Type");
                else if ($("#<%=ddlType.ClientID%>").val() == "web_link" && $("#<%=txtVideourl.ClientID%>").val() == "" || validateurl)
                    alert("Please Enter Valid video Url");
                else if ($("#<%=ddlType.ClientID%>").val() != "web_link" && !validateUploadedFile()) { }
                else
                    flag = true;
                return flag;
            }
            $(document).ready(function () {
                $("#Videourl").hide();
                $("#upload").hide();

                if ($("#<%=ddlType.ClientID%>").val() == "web_link")
                    $("#Videourl").show();
                else
                    $("#Videourl").hide();
                if ($("#<%=ddlType.ClientID%>").val() == "ppt" || $("#<%=ddlType.ClientID%>").val() == "pdf" || $("#<%=ddlType.ClientID%>").val() == "audio" || $("#<%=ddlType.ClientID%>").val() == "video")
                    $("#upload").show();
                else
                    $("#upload").hide();
            });

            function vali_type() {
                var id_value = document.getElementById("<%=FileUpload.ClientID%>").value;
                var imgsize = document.getElementById("<%=FileUpload.ClientID%>");
                var size = parseFloat(imgsize.files[0].size / 1024).toFixed(2);
                if (size > 204800) {
                    alert('Please enter FIle size less then 200 MB.')
                    document.getElementById("<%=FileUpload.ClientID%>").value = "";
                    return false;
                }
                else {
                    return true;
                }
            }

            $(document).ready(function () {
                $("#div_institute").hide();
                $("#div_service").hide();

                if ($("input[name='ctl00$ContentPlaceHolder1$rbl_service_institute']:checked").val() == "1")
                    $("#div_institute").show();
                else
                    $("#div_service").show();
            });

            function insti_service() {
                if ($("input[name='ctl00$ContentPlaceHolder1$rbl_service_institute']:checked").val() == "1") {
                    $("#div_institute").show();
                    $("#div_service").hide();
                }
                else {
                    $("#div_service").show();
                    $("#div_institute").hide();
                }
            }

            $(function () {
                $("#<%=ddlType.ClientID%>").change(function () {
                    $("#ContentPlaceHolder1_txtVideourl").text = "";
                    $("#ContentPlaceHolder1_FileUpload").text = "";
                    if ($(this).val() == "web_link")
                        $("#Videourl").show();
                    else
                        $("#Videourl").hide();
                });
            });
            $(function () {
                $("#<%=ddlType.ClientID%>").change(function () {
                    $("#<%=FileUpload.ClientID%>").value = "";
                    $("#<%=txtVideourl.ClientID%>").value = "";
                    if ($(this).val() == "ppt" || $(this).val() == "pdf" || $(this).val() == "audio" || $(this).val() == "video")
                        $("#upload").show();
                    else
                        $("#upload").hide();

                });
            });
            $(document).ready(function () {
                $('.sidebar-menu-item').removeClass('open');
                $('#manageresources').addClass('open');
                $('.sidebar-menu-item').removeClass('active');
                $('#creatematerialmaster').addClass('active');
            });
        </script>
    </div>
</asp:Content>



