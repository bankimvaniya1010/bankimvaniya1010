<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantanswersheets.aspx.cs" Inherits="admin_applicantanswersheets" MasterPageFile="~/admin/admin.master"%>

<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.3/moment-timezone-with-data.min.js"></script>
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item active">Assessment </li>
        </ol>
        <h1 class="h2"></h1>

        <div class="card">
            
            <div id="studentddl_evalutionDiv" runat="server">
             
                <div id="evalutionguid" runat="server" style="display: none">
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Checking Guide</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <a href='<%=evalutionfile %>' target="_blank" id="evalutionfile">View File</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="applicantnameDiv" runat="server">
                 <div class="form-group row" id="class">
                            <label for="name" class="col-sm-3 col-form-label form-label" style="font-size:large;font-weight: 500;">Applicant Name :</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                          <span  style="font-size:large;font-weight: 500;"><%=applicantname %></span>
                                    </div>
                                </div>
                            </div>
                        </div>
               </div>

                <div class="card" id="coeCard" runat="server">
                    <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                        <asp:GridView ID="GridView" CssClass="table" runat="server" AutoGenerateColumns="False" ShowFooter="false" CellPadding="3"
                            PageSize="25"
                            BorderStyle="None"
                            BorderWidth="1px" DataKeyNames="answesheetid"
                            CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowEditing="GridView_RowEditing" OnPageIndexChanging="GridView_PageIndexChanging" OnRowCommand="GridView_RowCommand" OnRowDataBound="GridView_RowDataBound">

                            <Columns>
                                <asp:BoundField DataField="answesheetid" HeaderText="AnswerSheet Id" InsertVisible="False"
                                    ReadOnly="True" SortExpression="answesheetid" />
                                <asp:TemplateField HeaderText="Answer Sheet">
                                    <ItemTemplate>
                                        <a href='<%# Bind("anshwesheetpath") %>' runat="server" id="lblanswersheet" target="_blank">View Answer Sheet</a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Extra Sheet">
                                    <ItemTemplate>
                                        <a href='<%# Bind("extra_anshwesheetpath") %>' runat="server" id="lblextraanssheet" target="_blank" style='<%# Eval("extra_anshwesheetpath") == null ? " display: none": "" %>'>View Extra Anshwesheet</a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Upload">
                                    <ItemTemplate>
                                        <asp:FileUpload runat="server" ID="fileupload_checkedsheet" Style='<%# Eval("checkedsheet") == null ? " display: block": "display:none" %>' />
                                        <a href='<%# Bind("checkedsheet") %>' runat="server" id="lblcheckedsheet" style='<%# Eval("checkedsheet") == null ? " display: none": "" %>' target="_blank">View</a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Action">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkUpload" runat="server" CommandName="Upload" Text="Upload" CommandArgument='<%#Container.DataItemIndex%>' Style='<%# Eval("checkedsheet") == null ? " display: block": "display:none" %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                    </div>
                </div>


            <div id="showbuildexamDiv" runat="server" style="display: none">

                <div id="answer_records" runat="server" style=" margin-left: -21px;">
                    <asp:DataList ID="questionList" runat="server">
                        <ItemTemplate>
                            <asp:Panel ID="options" runat="server">
                                <div class="card-body">
                                    
                                <div class="">
                                    <div style="display: none;">
                                        <asp:Label ID="lblanswesheetid" runat="server" Text='<%# Eval("answesheetid") %>'></asp:Label>
                                        <asp:Label ID="lbluniversityid" runat="server" Text='<%# Eval("universityid") %>'></asp:Label>
                                        <asp:Label ID="lblexampaperid" runat="server" Text='<%# Eval("exampaperid") %>'></asp:Label>
                                        <asp:Label ID="lblexamdatetime" runat="server" Text='<%# Eval("examdatetime") %>'></asp:Label>
                                        <asp:Label ID="lblstudentid" runat="server" Text='<%# Eval("studentid") %>'></asp:Label>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="form-group row">
                                        <label for="avatar" class="col-sm-4 col-form-label form-label">Question</label>
                                        <div class="col-sm-8">
                                            <div class="media align-items-center">
                                                <div class="media-body">
                                                    <asp:Label runat="server" ID="lblquestion" Text='<%#Eval("question") %>' Style='<%# Eval("ifdownloadquestiontype") == null? "display:block;": "display:none;"  %>'></asp:Label>
                                                    <%-- for download --%>
                                                    <a href='<%#Eval("question") %>' style='<%# Eval("ifdownloadquestiontype") == null? "display:none;": "display:block;"  %>' target="_blank">View File</a>
                                                    <a href='<%#Eval("question_extrasheet") %>' style='<%# Eval("question_extrasheet") == null? "display:none;": "display:block;"  %>' target="_blank">View Extra Sheet</a>
                                                    <a href='<%#Eval("question_extrafile") %>' style='<%# Eval("question_extrafile") == null? "display:none;": "display:block;"  %>' target="_blank">View Extra File</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div  Style='<%# Eval("ifopenasnwer") == null? "display:none;": "display:block;"  %>'>
                                    <div class="form-group row">
                                        <label for="avatar" class="col-sm-4 col-form-label form-label">Note</label>
                                        <div class="col-sm-8">
                                            <div class="media align-items-center">
                                                <div class="media-body">
                                                    <asp:Label runat="server" ID="Label1" Text='<%#Eval("openasnwernote") %>' Style='<%# Eval("openasnwernotetype") == null? "display:block;": "display:none;"  %>'></asp:Label>
                                                    <a href='<%#Eval("openasnwernote") %>' style='<%# Eval("openasnwernotetype") == null? "display:none;": "display:block;"  %>' target="_blank">View File</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                        </div>
                                    <div class="form-group row">
                                        <label for="avatar" class="col-sm-4 col-form-label form-label">Applicant Response</label>
                                        <div class="col-sm-8">
                                            <div class="media align-items-center">
                                                <div class="media-body">
                                                    <asp:Label runat="server" ID="Label7" Text='<%#Eval("applicantanswer_description") %>'></asp:Label><br />
                                                    <%-- <div  style='<%# Eval("ifdownloadquestiontype") == null? "display:block;": "display:none;"  %>'>
                                                                    <asp:Label runat="server" ID="Label4" Text='<%#Eval("applicantanswer") %>'></asp:Label>
                                                                     </div>
                                                                   <i id="correctTick1"  runat="server" class="fas fa-check-circle fontsize correcttickclr" style='<%# Eval("correct") == null? "visibility: hidden;": "visibility:visible;"  %>'></i>                                                                  
                                                                     <i id="incorrectTick1"  runat="server" class="fas fa-times-circle fontsize crosstickcolor" style='<%# Eval("incorrect") == null? "visibility: hidden;": "visibility:visible;"  %>'></i>--%>

                                                    <a href='<%#Eval("applicantanswer") %>' style='<%# Eval("ifdownloadquestiontype") == null? "display:none;": "display:block;"  %>' target="_blank">View Response File</a>

                                                    <a href='<%#Eval("applicantanswer_extrafile") %>' style='<%# Eval("applicantanswer_extrafile") == null? "display:none;": "display:block;"  %>' target="_blank">View Response Extra File</a>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style='<%# Eval("correctansfileFlag") == null? "display: block;": "display:none;"  %>'>
                                        <div class="form-group row">
                                            <label for="avatar" class="col-sm-4 col-form-label form-label">Correct Answer</label>
                                            <div class="col-sm-8">
                                                <div class="media align-items-center">
                                                    <div class="media-body">
                                                        <asp:Label runat="server" ID="Label2" Text='<%#Eval("correctanswer_description") %>'></asp:Label>
                                                        <%-- (<asp:Label runat="server" ID="Label1" Text='<%#Eval("correctanswer") %>'></asp:Label>)--%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style='<%# Eval("correctansfileFlag") == null? "display:none;": "display:block;"  %>'>
                                        <div class="form-group row">
                                            <label for="avatar" class="col-sm-4 col-form-label form-label">Instruction for checking and evalution</label>
                                            <div class="col-sm-8">
                                                <div class="media align-items-center">
                                                    <div class="media-body">
                                                        <a runat="server" href='<%#Eval("correctanswer") %>' target="_blank">View Evaluation File</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div style='<%# Eval("ifdownloadquestiontype") == null? "display:none;": "display:block;"  %>'>
                                        <div class="form-group row">
                                            <label for="avatar" class="col-sm-4 col-form-label form-label">Upload checked Sheet</label>
                                            <div class="col-sm-8">
                                                <div class="media align-items-center">
                                                    <div class="media-body">
                                                        <asp:FileUpload runat="server" ID="checksheet" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                   
                                </div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:DataList>
                     <div class="form-group row">
                                        <label for="avatar" class="col-sm-4 col-form-label form-label">Comment</label>
                                        <div class="col-sm-8">
                                            <div class="media align-items-center">
                                                <div class="media-body">
                                                    <asp:TextBox runat="server" ID="txtcomments" class="form-control" TextMode="MultiLine" Height="157px" Width="550px"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="avatar" class="col-sm-4 col-form-label form-label">Marks</label>
                                        <div class="col-sm-3">
                                            <div class="media align-items-center">
                                                <div class="media-body">

                                                    <asp:TextBox ID="txtmarks2" runat="server" class="form-control" >  </asp:TextBox>  
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-3" style="font-size: x-large; margin-top: 1%;">
                                            /<asp:Label runat="server" ID="Label3"><%=lblquestionfinalmarks %></asp:Label>
                                        </div>
                                    </div>
                    <div class="card-footer" id="button" runat="server" style="display:none">
                        <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Next" OnClick="btnsubmit_Click" OnClientClick="return validateresponse()" />
                    </div>
                </div>
            </div>

           
                <div class="" id="marksDiv" runat="server">
                    <div class="form-group row">
                        <label for="avatar" class="col-sm-4 col-form-label form-label">Final Total Marks</label>
                        <div class="col-sm-3">
                            <div class="media align-items-center">
                                <div class="media-body">
                                    <input type="text" id="txtmarks" runat="server" class="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-3" style="font-size: x-large; margin-top: 1%;">
                            /<%=lblExamfinalmarks %>
                        </div>
                    </div>

                    <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                        <div class="form-row">
                            <br />
                            <div style="margin-left: 40%">
                                <asp:Button ID="btnsavedatemarks" runat="server" Text="Save Marks" CssClass="btn btn-success" OnClick="btnsavedatemarks_Click1" OnClientClick="return validateFinalMarks()" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>            <%--<div class="" id="savedatemarks" runat="server" style="display:none">
                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                    <div class="form-row">
                       
                        <br />
                        <div style="margin-left:40%">
                            <asp:Button ID="btnsavedatemarks" runat="server" Text="Save Date Time" CssClass="btn btn-success" OnClick="btnsavedatemarks_Click" OnClientClick="return validateForm()"/>
                            </div>
                    </div>
                </div>
            </div>--%>
        </div>

    <script>
        function validateFinalMarks() {
            var checOnlykNum = /^[0-9]*$/;
            var totalmarks = '<%=lblExamfinalmarks%>';
            var flag = false;
            var marks = $("#<%=txtmarks.ClientID%>").val();
            if (marks == "" || !(checOnlykNum.test(marks)))
                alert("Please enter valid marks");
            else if (isNaN(marks) || Number(marks) > Number(totalmarks))
                alert("Please enter valid marks. Entered marks can not be greater than total marks.");
            else
                flag = true;
            return flag;
        }

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#exammodule_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#exammarking').addClass('active');
        });
         function validatefile(filepath) {
             if (filepath == "") {
                alert("Please upload checked assessment file");
                return false;
            }
            var fileExtension = filepath.substring(filepath.lastIndexOf(".") + 1).toString().toLowerCase();
            if (fileExtension != "jpg" && fileExtension != "png" && fileExtension != "jpeg" && fileExtension != "pdf") {
                alert("Invalid file. Please select file of type jpg, png, jpeg");
                return false;
            }
             return true;
        }
        function validateresponse() {
            var flag = false;
            var checOnlykNum = /^[0-9]*$/;
           var totalmarksvalidation ='<%=lblquestionfinalmarks%>';
           <%-- var allpapersCount = '<%=allanswer_papersCount%>';--%>
            var questiontype = '<%=questiontype%>';

            var txtmarks = $("#<%=txtmarks2.ClientID%>").val();
            var comments = $("#<%=txtcomments.ClientID%>").val();
            var file = $("#ContentPlaceHolder1_questionList_checksheet_0");

            if (questiontype == "Upload Answer" && file.val() == "" && !validatefile(file.val())) { }
            else if (txtmarks == "" || !(checOnlykNum.test(txtmarks)))
                alert("Please enter valid marks.");
            else if (Number(txtmarks) > Number(totalmarksvalidation))
                alert("Please enter valid marks. Entered marks can not be greater than total marks.");
            //else if (comments == "")
            //    alert("Please enter comments.");
            else
                flag = true;
            return flag;
        }
    </script>
</asp:Content>
