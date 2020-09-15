<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exam_marking.aspx.cs" Inherits="admin_exam_marking" MasterPageFile="~/admin/admin.master" %>

<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.3/moment-timezone-with-data.min.js"></script>
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Assessment Checking</li>
        </ol>
        <h1 class="h2">Assessment Checking</h1>

        <div class="card">
            <div class="tab-content card-body">
                <div id="validDiv" runat="server">
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Institution</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddluniversity" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddluniversity_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                </div>

                            </div>
                        </div>
                    </div>
                     <div class="form-group row" id="class">
                            <label for="name" class="col-sm-3 col-form-label form-label">Class</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                         <asp:DropDownList runat="server" ID="ddlclass" class="form-control" OnSelectedIndexChanged="ddlclass_SelectedIndexChanged" AutoPostBack="true"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row" id="group">
                            <label for="name" class="col-sm-3 col-form-label form-label">Group</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                       <asp:DropDownList runat="server" ID="ddlgroup" class="form-control" OnSelectedIndexChanged="ddlgroup_SelectedIndexChanged" AutoPostBack="true"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="examsubject">
                            <label for="name" class="col-sm-3 col-form-label form-label">Subject</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-6">
                                        <asp:DropDownList runat="server" ID="ddlsubject" class="form-control" OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged" AutoPostBack="true"/>
                                     <%--   <input id="txtsubject" runat="server" type="text" class="form-control" autocomplete="off">--%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Checker</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlexaminer" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlexaminer_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Assessment</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlexam" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlexam_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Assessment Date</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlexamdate" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlexamdate_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Enter Checker Passkey</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="text" id="txtpasskey" runat="server" class="form-control" autocomplete="off">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-8 offset-sm-3">
                        <div class="media align-items-center">
                            <div class="media-left">
                                <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btn_submit_Click" OnClientClick="return validateForm1()" />
                                <div class="col-md-20">
                                    <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="studentddl_evalutionDiv" runat="server" style="display: none">
                <div id="selectapplicant" runat="server">
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Applicant</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlstudent" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlstudent_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                <div>
                                     <label runat="server" id="lblMess" visible="false" style="margin-left: 7%; margin-bottom: 4%"></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="evalutionguid" runat="server" style="display: none">
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Checking Guide</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <a href='<%=evalutionfile %>' target="_blank">View File</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="showuploadexamDiv" runat="server" style="display: none">


                <div class="card" id="coeCard" runat="server" style="display: none">
                    <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                        <asp:GridView ID="GridView" CssClass="table" runat="server" AutoGenerateColumns="False" ShowFooter="false" CellPadding="3"
                            PageSize="25"
                            BorderStyle="None"
                            BorderWidth="1px" DataKeyNames="answesheetid"
                            CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowEditing="GridView_RowEditing" OnPageIndexChanging="GridView_PageIndexChanging" OnRowCommand="GridView_RowCommand" OnRowDataBound="GridView_RowDataBound">

                            <Columns>
                                <asp:BoundField DataField="answesheetid" HeaderText="Id" InsertVisible="False"
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

            </div>

            <div id="showbuildexamDiv" runat="server" style="display: none">

                <div id="answer_records" runat="server">
                    <asp:DataList ID="questionList" runat="server">
                        <ItemTemplate>
                            <asp:Panel ID="options" runat="server">
                                <div class="card-header">
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

                                                    <asp:TextBox ID="txtmarks" runat="server" class="form-control" value='<%#Eval("questionmarks") %>'>  </asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-3" style="font-size: x-large; margin-top: 1%;">
                                            /<asp:Label runat="server" ID="Label3" Text='<%#Eval("questionfinalmarks") %>'></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:DataList>
                    <div class="card-footer" id="button" runat="server" style="display:none">
                        <asp:Button ID="btnsubmit" runat="server" CssClass="btn btn-success" Text="Next" OnClick="btnsubmit_Click" OnClientClick="return validateresponse()" />
                    </div>
                </div>

            </div>

            <div id="showfinalmarks_dateDiv" runat="server" style="display:none">
                <div id="divfinalmarks" runat="server">
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Final Marks</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-7">
                                    <input type="text" runat="server" id="txtmarksobtain" class="form-control" />
                                </div>
                                <div class="col-md-3" style="margin-top: 2%">
                                    /
                                    <asp:Label ID="lbltotalmarks" runat="server"></asp:Label>
                                </div>
                                <%--<div class="col-md-3">
                                     <asp:Button runat="server" ID="btn_reenter" OnClientClick="" Text="ReEnter"/>
                                  </div>--%>
                                <label runat="server" id="lblmarkssaveat" class=""></label>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="date_edit" runat="server">
                    <div class="form-group row" id="examcourse">
                        <label for="name" class="col-sm-3 col-form-label form-label">Time Zone</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <select id="dropdownTimeZone" class="form-control">
                                        <option value="">Please select</option>
                                    </select>
                                    <asp:HiddenField runat="server" ID="hidTimeZone"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" id="examsubject">
                        <label for="name" class="col-sm-3 col-form-label form-label">Assessment Date & Time (Based on time zone):</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <%--<input id="txtexamdate" runat="server" type="text" class="form-control" placeholder="Select Date" value="" readonly="readonly">--%>
                                    <input type="datetime-local" id="pickerDateTime" onchange="submitDate()" class="form-control" />
                                    <asp:HiddenField runat="server" ID="selectedexamdate_time" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group row" id="examgrade">
                        <label for="name" class="col-sm-3 col-form-label form-label">Assessment Date & Time (Based on UTC):</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="datetime-local" id="examutcdatetime" class="form-control" disabled="disabled" />
                                    <asp:HiddenField runat="server" ID="hidexamutcdatetime" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 <div id="lbldates_saved" runat="server" style="display: none">
                <div class="form-group row">
                    <label for="name" class="col-sm-3 col-form-label form-label">Release Date & Time:</label>
                    <div class="col-sm-8">
                        <div class="row">
                            <div class="col-md-10">
                               
                                <label runat="server" id="lblreleasedatetime"></label> 
                                <label runat="server" id="lblreleasedatetimeutc"></label><br/>
                                <label runat="server" id="lbldatesaved_at"></label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
           
            <div class="" id="savedatemarks" runat="server" style="display:none">
                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                    <div class="form-row">
                       
                        <br />
                        <div style="margin-left:40%">
                            <asp:Button ID="btnsavedatemarks" runat="server" Text="Save Date Time" CssClass="btn btn-success" OnClick="btnsavedatemarks_Click" OnClientClick="return validateForm()"/>
                            </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script>
       function loadTimeZoneList(){   
        let select = document.getElementById("dropdownTimeZone");
            select.innerHTML = "";            
        let browserTimeZone = moment.tz.guess();
        let timeZones = moment.tz.names();
           timeZones.forEach((timeZone) =>{
               option = document.createElement("option");               
               option.textContent = `${timeZone} (GMT${moment.tz(timeZone).format('Z')})`; 
               option.value = timeZone;               
               if (timeZone == browserTimeZone) {
                   option.selected = false;
               }               
               select.appendChild(option);
           });
        
      }
        function loadDefaultDateTime(){
            document.getElementById('pickerDateTime').value = moment().format('YYYY-MM-DDTHH:mm');
        }
        const DEFAULT_FORMAT = 'YYYY-MM-DDTHH:mm'; 
 
        function formatDate(momentDate){
                return momentDate.format(DEFAULT_FORMAT);
         }
       
        function getSelectedUTCValue(localDateTime, timeZone)
        {
             return moment.tz(localDateTime,timeZone).utc();
       }
        function submitDate() {

           var tiemzone = $( "#dropdownTimeZone option:selected" ).text();//document.getElementById("dropdownTimeZone").value;
           $("#<%=hidTimeZone.ClientID%>").val(tiemzone);

           let localValue = document.getElementById('pickerDateTime').value;
           $("#<%=selectedexamdate_time.ClientID%>").val(localValue);
            let timeZoneValue = document.getElementById("dropdownTimeZone").value;
           // let utcSelected =  document.getElementById('divUTCSelected');
           //utcSelected.innerHTML = formatDate(getSelectedUTCValue(localValue, timeZoneValue));
           let utcvalue = formatDate(getSelectedUTCValue(localValue, timeZoneValue));
           document.getElementById('examutcdatetime').value = utcvalue;
           $("#<%=hidexamutcdatetime.ClientID%>").val(document.getElementById('examutcdatetime').value );
               }
        function init()
           {
            //loadDefaultDateTime();
            loadTimeZoneList();  
            //submitDate();
            }
 
  
        init();
        function validatefile(filepath) {
             if (filepath == "") {
                alert("Please upload checked assessment file");
                return false;
            }
            var fileExtension = filepath.substring(filepath.lastIndexOf(".") + 1).toString().toLowerCase();
            if (fileExtension != "jpg" && fileExtension != "png" && fileExtension != "jpeg") {
                alert("Invalid file. Please select file of type jpg, png, jpeg");
                return false;
            }
             return true;
        }
        function validateresponse() {
            var checOnlykNum = /^[0-9]*$/;
            var totalmarksvalidation ='<%=totalmarksvalidation%>';
            var allpapersCount = '<%=allanswer_papersCount%>';
            var questiontype = '<%=questiontype%>';

           for (var i = 0; i < allpapersCount; i++) {
                  var txtmarks = $("#ContentPlaceHolder1_questionList_txtmarks_" + i);
                  var file = $("#ContentPlaceHolder1_questionList_checksheet_" + i);

               //if (questiontype == "Upload Answer" && file.val() == "" && !validatefile(file.val())) { }
               if (txtmarks.val() == "" || !(checOnlykNum.test(txtmarks.val()))) {
                     alert("Please enter valid marks.");
                     return false;
                 }
                 //else if (txtmarks.val() > totalmarksvalidation) {
                 //    alert("Please enter valid marks. marks obtain can not be grater than total marks.");
                 //    return false;
                 //}
                 
             }
            return true;
        }

       <%-- function submitDate() {
            let localValue = document.getElementById('pickerDateTime2').value;
            $("#<%=selectedexamdate_time.ClientID%>").val(localValue);
        }--%>
        function validateForm1() {
            var flag = false;
            if ($("#<%=ddlexaminer.ClientID%>").val() == "0")
                alert("Please select examiner");
             else if ($("#<%=ddlclass.ClientID%>").val() == "0")
               alert("Please select class");
            else if ($("#<%=ddlgroup.ClientID%>").val() == "0")
               alert("Please select group");
            else if ($("#<%=ddlsubject.ClientID%>").val() == "0")
               alert("Please select subject");
            else if ($("#<%=ddlexam.ClientID%>").val() == "0")
                alert("Please select exam");
            else if ($("#<%=ddlexamdate.ClientID%>").val() == "0")
                alert("Please select assessmnet date time");
            else if ($("#<%=txtpasskey.ClientID%>").val() == "")
                alert("Please enter passkey");
            else
                flag = true;
            return flag;
        }

        function validateForm() {
             var checOnlykNum = /^[0-9]*$/;
            var totalmarks = '<%=marksobtain%>';
            var flag = false;
     
            if ($("#<%=ddlstudent.ClientID%>").val() == "0")
                alert("Please select applicant");
            else if ($("#<%=txtmarksobtain.ClientID%>").val() == "" || !(checOnlykNum.test($("#<%=txtmarksobtain.ClientID%>").val())))// check final marks should not be grater
                alert("Please enter valid final marks");
            <%--else if ($("#<%=txtmarksobtain.ClientID%>").val() > totalmarks)
                alert("Entered marks is grater than total marks.");--%>
            else if ($("#<%=selectedexamdate_time.ClientID%>").val() == "")
                alert("Please select date and time to relase assessment result.");
            else
                flag = true;
            return flag;
        }

        <%--function validateBuildForm() {
            var flag = false;
            if ($("#<%=ddlbuildapplicant.ClientID%>").val() == "0")
                alert("Please select applicant");
            else if ($("#<%=txtbuildtotalmarks.ClientID%>").val() == "")// check final marks should not be grater
                alert("Please enter final marks");
           <%-- else if ($("#<%=Hidbuilddateofrelease.ClientID%>").val() == "")
                alert("Please select date and time to relase exam result.");
            else
                flag = true;
            return flag;
        }--%>
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#exammodule_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#exammarking').addClass('active');
        });
    </script>
</asp:Content>
