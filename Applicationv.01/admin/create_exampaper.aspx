<%@ Page Language="C#" AutoEventWireup="true" CodeFile="create_exampaper.aspx.cs" Inherits="admin_create_exampaper" MasterPageFile="~/admin/admin.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Create Assessment</li>
        </ol>
        <h1 class="h2">Create Assessment </h1>
        <div class="card">           
            <div class="card" id="createDiv" runat="server">
                <div class="tab-content card-body">
                    <div class="tab-pane active" id="first">
                        <%--<div class="form-group row" runat="server">
                            <label for="name" class="col-sm-3 col-form-label form-label">Select Institution </label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="form-control"></asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                        <div class="form-group row" id="examname">
                            <label for="name" class="col-sm-3 col-form-label form-label">Name</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <input id="txtexamname" runat="server" type="text" class="form-control" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                        </div>
                    <%--    <div class="form-group row" id="examcourse">
                            <label for="name" class="col-sm-3 col-form-label form-label">Course</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <input id="txtcourse" runat="server" type="text" class="form-control" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                         <div class="form-group row" id="class">
                            <label for="name" class="col-sm-3 col-form-label form-label">Class</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                         <asp:DropDownList runat="server" ID="ddlclass" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row" id="group">
                            <label for="name" class="col-sm-3 col-form-label form-label">Group</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                       <asp:DropDownList runat="server" ID="ddlgroup" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="examsubject">
                            <label for="name" class="col-sm-3 col-form-label form-label">Subject</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:DropDownList runat="server" ID="ddlsubject" class="form-control"/>
                                     <%--   <input id="txtsubject" runat="server" type="text" class="form-control" autocomplete="off">--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%--<div class="form-group row" id="examgrade">
                            <label for="name" class="col-sm-3 col-form-label form-label">Grade</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <input id="txtgrade" runat="server" type="text" class="form-control" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                        <%-- <div class="form-group row" id="examcreateddate">
                        <label for="name" class="col-sm-3 col-form-label form-label">Date Created</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input id="txtdatecreated" runat="server" type="text" class="form-control" >
                                </div>
                            </div>
                        </div>
                    </div>--%>
                        <div class="form-group row" id="examcreatedby">
                            <label for="name" class="col-sm-3 col-form-label form-label">Created By</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <input id="txtexamcreatedby" runat="server" type="text" class="form-control" disabled="disabled">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="Examtime">
                            <label for="name" class="col-sm-3 col-form-label form-label">Duration (Minutes)</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">

                                        <input runat="server" type="text" id="txtExamtime" class="form-control" placeholder="enter minutes" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row" id="ReadingExamtime">
                            <label for="name" class="col-sm-3 col-form-label form-label">Reading Duration (Minutes)</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <input runat="server" type="text" id="txtreadingtime" class="form-control" placeholder="enter minutes" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row" id="UploadExamtime">
                            <label for="name" class="col-sm-3 col-form-label form-label">Upload Duration (Minutes)</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">

                                        <input runat="server" type="text" id="txtuploadtime" class="form-control" placeholder="enter minutes" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="maximummarks">
                            <label for="name" class="col-sm-3 col-form-label form-label">Maximum Marks</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">

                                        <input runat="server" type="text" id="txtmaximummarks" class="form-control" autocomplete="off"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="instructionbox">
                            <label for="name" class="col-sm-3 col-form-label form-label">Instructions</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">

                                        <asp:TextBox TextMode="MultiLine" runat="server" Style="width:188%; height:140px" type="text" ID="txtinstrcution" class="form-control" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="shotremarks">
                            <label for="name" class="col-sm-3 col-form-label form-label">Short Remarks</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">

                                        <asp:TextBox TextMode="MultiLine" runat="server" Style="width:188%; height:140px" type="text" id="txtshotremarks" class="form-control" autocomplete="off"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="studentfile">
                            <label for="name" class="col-sm-3 col-form-label form-label">Student Download File </label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Label ID="Label2" runat="server" />
                                        <asp:FileUpload ID="studentFileUpload" runat="server"></asp:FileUpload>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="checkingguid">
                            <label for="name" class="col-sm-3 col-form-label form-label">Examination Checking Guide: </label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:Label ID="Label1" runat="server" />
                                        <asp:FileUpload ID="filecheckingguid" runat="server"></asp:FileUpload>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="selecttype">
                            <label for="name" class="col-sm-3 col-form-label form-label">Select type</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input type="radio" class="form-check-input" name="exampaper" runat="server" id="rbupload">Upload Assessment Paper(On Screen Mode) 
                                    <br />
                                        <div style="display:block">
                                        <input type="radio" class="form-check-input" name="exampaper" runat="server" id="rbbuild" >Build Assessment Paper
                                             <br />
                                            </div>
                                        <div>
                                            <input type="radio" runat="server" name="exampaper" class="form-check-input" id="rbnew">Upload Assessment Paper(QR Code Mode)                                    
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="basicsetting" style="display: none" runat="server">
                            <label for="name" class="col-sm-3 col-form-label form-label">Basic Settings </label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="radio" class="form-check-input" name="setting" runat="server" id="rblrandom">Random 
                                        <br>
                                        <input type="radio" class="form-check-input" name="setting" runat="server" id="rblfixed">Fixed
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                  
                      <div class="form-group row" id="ToPermissionDiv" style="display: none" runat="server">
                            <label for="name" class="col-sm-3 col-form-label form-label">Allow to download PDF</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <input type="radio" class="form-check-input" name="permission" runat="server" id="rbYes">Yes 
                                        <br>
                                        <input type="radio" class="form-check-input" name="permission" runat="server" id="rbNo">No
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
    <script>

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$exampaper']").click(function () {
                if ($("#<%=rbupload.ClientID%>").is(":checked")) {
                    $("#<%=basicsetting.ClientID%>").hide();
                    $("#<%=ToPermissionDiv.ClientID%>").hide();
                }
                else if ($("#<%=rbbuild.ClientID%>").is(":checked")) {
                    $("#<%=basicsetting.ClientID%>").show();
                    $("#<%=ToPermissionDiv.ClientID%>").hide();
                }
                else if ($("#<%=rbnew.ClientID%>").is(":checked")) {
                    $("#<%=basicsetting.ClientID%>").hide();
                    $("#<%=ToPermissionDiv.ClientID%>").show();
                }
            });
        });
        function validateUploadedFile(filepath) {
            if (filepath == "") {
                alert("Please upload a file");
                return false;
            }
            var fileExtension = filepath.substring(filepath.lastIndexOf(".") + 1).toString().toLowerCase();
            if (fileExtension != "pdf" && fileExtension != "docx") {
                alert("Invalid file. Please select file of type pdf, docx");
                return false;
            }

            return true;
        }
        function validateForm() {
            var checOnlykNum = /^[0-9]*$/;
            var flag = false;
            <%--if ($("#<%=ddlUniversity.ClientID%>").val() == "0")
                alert("Please select university");--%>
            if ($("#<%=txtexamname.ClientID%>").val() == "")
                alert("Please enter assessmnet name"); 
            else if ($("#<%=ddlclass.ClientID%>").val() == "")
                alert("Please select class");
            else if ($("#<%=ddlgroup.ClientID%>").val() == "")
                alert("Please select group");
            else if ($("#<%=ddlsubject.ClientID%>").val() == "")
                alert("Please select subject");
            else if ($("#<%=txtexamcreatedby.ClientID%>").val() == "")
                alert("Please enter created by");
            else if ($("#<%=txtExamtime.ClientID%>").val() == "" || !(checOnlykNum.test($("#<%=txtExamtime.ClientID%>").val())))
                alert("Please enter time in minutes");
            else if ($("#<%=txtreadingtime.ClientID%>").val() == "" || !(checOnlykNum.test($("#<%=txtreadingtime.ClientID%>").val())))
                alert("Please enter rading time in minutes");
            else if ($("#<%=txtuploadtime.ClientID%>").val() == "" || !(checOnlykNum.test($("#<%=txtuploadtime.ClientID%>").val())))
                alert("Please enter upload time in minutes");
            else if ($("#<%=txtmaximummarks.ClientID%>").val() == "")
                alert("Please enter maximum marks");
          <%--  else if ($("#<%=txtshotremarks.ClientID%>").val() == "")
                alert("Please enter short remarks");--%>
            <%--else if (!validateUploadedFile($("#<%=studentFileUpload.ClientID%>").val())) { }
            else if (!validateUploadedFile($("#<%=filecheckingguid.ClientID%>").val())) { }--%>
            else if (!($("#<%=rbupload.ClientID%>").is(":checked")|| $("#<%=rbbuild.ClientID%>").is(":checked") || $("#<%=rbnew.ClientID%>").is(":checked")))  <%-- || $("#<%=rbbuild.ClientID%>").is(":checked")--%>
                alert("select type to upload assessment paper");
            else if ($("#<%=rbbuild.ClientID%>").is(":checked") && !($("#<%=rblfixed.ClientID%>").is(":checked") || $("#<%=rblrandom.ClientID%>").is(":checked")))
                alert("Please select basic setting");
            else
                flag = true;
            return flag;
        }

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#exammodule_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#exammodule').addClass('active');

           if ($("#<%=rbupload.ClientID%>").is(":checked")) {
                    $("#<%=basicsetting.ClientID%>").hide();
                    $("#<%=ToPermissionDiv.ClientID%>").hide();
                }
                else if ($("#<%=rbbuild.ClientID%>").is(":checked")) {
                    $("#<%=basicsetting.ClientID%>").show();
                    $("#<%=ToPermissionDiv.ClientID%>").hide();
                }
                else if ($("#<%=rbnew.ClientID%>").is(":checked")) {
                    $("#<%=basicsetting.ClientID%>").hide();
                    $("#<%=ToPermissionDiv.ClientID%>").show();
                }
        });
    </script>
</asp:Content>


