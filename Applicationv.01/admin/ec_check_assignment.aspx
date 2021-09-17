<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_check_assignment.aspx.cs" Inherits="admin_ec_check_assignment" MasterPageFile="~/admin/admin.master"%>


<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.3/moment-timezone-with-data.min.js"></script>
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">MY DASHBOARD</a></li>
            <li class="breadcrumb-item"><a href="ec_manage_assignment.aspx">MANAGE ASSIGNMENT</a></li>
            <li class="breadcrumb-item">CHECK</li>
        </ol>
        <h1 class="h2">CHECK AN ASSIGNMENT</h1>
        <div class="">
            <div class="card" id="createDiv" runat="server">
                <div class="tab-content card-body">
                    <div class="tab-pane active" id="first">

                        <div class="form-group row" id="grade">
                            <label for="name" class="col-sm-3 col-form-label form-label">Grade</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlgrade" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="subject">
                            <label for="name" class="col-sm-3 col-form-label form-label">Subject</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlsubject" class="form-control"  AutoPostBack="true" OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                      
                        <div class="form-group row" id="class">
                            <label for="name" class="col-sm-3 col-form-label form-label">SELECT Class</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlclass" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlclass_SelectedIndexChanged"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                   <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">SELECT Assignment</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlassignment" class="form-control" OnSelectedIndexChanged="ddlassignment_SelectedIndexChanged" AutoPostBack="true"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                      <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">SELECT Assignment Date </label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlassignmentdate" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-sm-8 offset-sm-3">
                                <div class="media align-items-center">
                                    <div class="media-left">
                                        <asp:Button ID="btn_submit" runat="server" Text="View Submitted Assignment(s)" CssClass="btn btn-success" OnClientClick="return validateForm()" OnClick="btn_submit_Click" />
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <span id="stoptimelbl" style="display:none;" runat="server"><b>Assignment Stop showing Date : <asp:Label runat="server" ID="lblstopdate"/></b></span>
                        <div id="showuploadexamDiv" runat="server" style="display:none;">
                            <div class="" id="coeCard" runat="server">
                                <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                    <asp:GridView ID="GridView" CssClass="table" runat="server" AutoGenerateColumns="False" ShowFooter="false" CellPadding="3"
                                        PageSize="25"
                                        BorderStyle="None"
                                        BorderWidth="1px" DataKeyNames="id"
                                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowEditing="GridView_RowEditing" OnPageIndexChanging="GridView_PageIndexChanging" OnRowCommand="GridView_RowCommand" OnRowDataBound="GridView_RowDataBound">

                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="CASGID" InsertVisible="False"
                                                ReadOnly="True"/>
                                            <asp:TemplateField HeaderText="SID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblapplicantid" runat="server" Text='<%# Bind("applicantid") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Student Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblname" runat="server" Text='<%# Bind("studentname") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Submission Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblsubmissionstatus" runat="server" Text='<%# Bind("submissionstatus") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Check Status">
                                                <ItemTemplate>
                                                <asp:Label ID="lblcheckedstatus" runat="server" Text='<%# Bind("checkedstatus") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="View Submitted Assignment">
                                                <ItemTemplate>
                                                    <asp:HiddenField ID="lblanswersheetid" runat="server" Value='<%# Bind("answersheetid") %>'></asp:HiddenField>
                                                    <a href='<%# Bind("student_assignment_URL") %>' runat="server" id="lblstudent_assignment_URL" style='<%# Eval("student_assignment_URL") == null ? " display: none": "" %>' target="_blank">View</a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Marks">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" id="txtmarks"  Style='<%# Eval("toshow_txtmarks") == null ? " display: block": "display:none" %>' AutoCompleteType="Disabled" Width="100%"/>
                                                    <asp:Label ID="lblmarks" runat="server" Text='<%# Bind("marks_obtained") %>' Style='<%# Eval("toshow_lblmarks") == null ? " display: block": "display:none" %>' ></asp:Label>/<asp:Label ID="Label1" runat="server" Text='<%# Bind("marks_total") %>'></asp:Label>

                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Upload File">
                                                <ItemTemplate>
                                                    <asp:FileUpload runat="server" ID="fileupload_checkedsheet" Style='<%# Eval("toshow") == null ? " display: block": "display:none" %>' />
                                                    <a href='<%# Bind("checkedsheet") %>' runat="server" id="lblcheckedsheet" style='<%# Eval("is_checked ") == null ? " display: none": "" %>' target="_blank">View</a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Upload Checked Assignment">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkUpload" runat="server" CommandName="Upload" Text="Upload" CommandArgument='<%#Container.DataItemIndex%>' Style='<%# Eval("toshow") == null ? "display: block": "display:none" %>'></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>

                                </div>
                            </div>
                            
                        </div>
                        <div id="showBuildDiv" runat="server" style="display:none;">
                            <b>Build</b>
                             <div class="" id="Div1" runat="server">
                                <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                    <asp:GridView ID="GridView_build" CssClass="table" runat="server" AutoGenerateColumns="False" ShowFooter="false" CellPadding="3"
                                        PageSize="25"
                                        BorderStyle="None"
                                        BorderWidth="1px" DataKeyNames="id"
                                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnRowEditing="GridView_build_RowEditing" OnPageIndexChanging="GridView_build_PageIndexChanging" OnRowCommand="GridView_build_RowCommand" OnRowDataBound="GridView_build_RowDataBound">

                                        <Columns>
                                            <asp:BoundField DataField="id" HeaderText="CASGID" InsertVisible="False"
                                                ReadOnly="True"/>
                                            <asp:TemplateField HeaderText="SID">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblapplicantid" runat="server" Text='<%# Bind("applicantid") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Student Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblname" runat="server" Text='<%# Bind("studentname") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Submission Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblsubmissionstatus" runat="server" Text='<%# Bind("submissionstatus") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Check Status">
                                                <ItemTemplate>
                                                <asp:Label ID="lblcheckedstatus" runat="server" Text='<%# Bind("checkedstatus") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="View Submitted Assignment">
                                                <ItemTemplate>
                                                    <a href='<%# Bind("build_assignment_URL") %>' runat="server" id="lblstudent_assignment_URL" style='<%# Eval("build_assignment_URL") == null ? " display: none": "" %>' target="_blank">View</a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                             <%--<asp:TemplateField HeaderText="Marks">
                                                <ItemTemplate>
                                                    <asp:TextBox runat="server" id="txtmarks"  Style='<%# Eval("toshow_txtmarks") == null ? " display: block": "display:none" %>' />
                                                    <asp:Label ID="lblmarks" runat="server" Text='<%# Bind("marks_obtained") %>' Style='<%# Eval("toshow_lblmarks") == null ? " display: block": "display:none" %>' ></asp:Label>/<asp:Label ID="Label1" runat="server" Text='<%# Bind("marks_total") %>'></asp:Label>

                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                           <%-- <asp:TemplateField HeaderText="Upload File">
                                                <ItemTemplate>
                                                    <asp:FileUpload runat="server" ID="fileupload_checkedsheet" Style='<%# Eval("toshow") == null ? " display: block": "display:none" %>' />
                                                    <a href='<%# Bind("checkedsheet") %>' runat="server" id="lblcheckedsheet" style='<%# Eval("is_checked ") == null ? " display: none": "" %>' target="_blank">View</a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Upload Checked Assignment">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkUpload" runat="server" CommandName="Upload" Text="Upload" CommandArgument='<%#Container.DataItemIndex%>' Style='<%# Eval("toshow") == null ? "display: block": "display:none" %>'></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                        </Columns>
                                    </asp:GridView>

                                </div>
                            </div>
                        </div>

                        <div id="showfinalmarks_dateDiv" runat="server" style="display:none;">
                            <div id="date_edit" runat="server">
                                <div class="form-group row" id="examcourse">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Time Zone</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <select id="dropdownTimeZone" class="form-control">
                                                    <option value="">Please select</option>
                                                </select>
                                                <asp:HiddenField runat="server" ID="hidTimeZone" />
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
                           
                        </div>
                         <div id="lbldates_saved" runat="server" style="display: none">
                                <div class="form-group row">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Release Date & Time:</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-10">
                                                <label runat="server" id="lbltimezone"></label><br/>
                                                <label runat="server" id="lblreleasedatetime"></label><br/>
                                                <label runat="server" id="lblreleasedatetimeutc"></label><br/>
                                                <br />
                                                <label runat="server" id="lbldatesaved_at"></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <div id="savedatemarks" runat="server" style="display:none;">
                            <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                <div class="form-row">
                                    <div style="margin-left: 40%">
                                        <asp:Button ID="btnsavedatemarks" runat="server" Text="Save Date Time" CssClass="btn btn-success" OnClick="btnsavedatemarks_Click" OnClientClick="return validateForm2()" />
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
        function validateForm() {
            if ($("#<%=ddlgrade.ClientID%>").val() == "0") {
                alert("Please select grade.");
                return false;
            }
            else if ($("#<%=ddlsubject.ClientID%>").val() == "0") {
                alert("Please select subject.");
                return false;
            }
            else if ($("#<%=ddlclass.ClientID%>").val() == "0") {
                alert("Please select class.");
                return false;
            }
            else if ($("#<%=ddlassignment.ClientID%>").val() == "0") {
                alert("Please select assignment.");
                return false;
            }
            return true;
        }

         function validateForm2() {
             debugger;
            var applicantCount = '<%=applicantCount%>';
            var checked_assignmentcount = '<%=checked_assignmentcount%>';
             var is_stopdateexpired = '<%=is_stopdateexpired%>';
             var applicantCount_whosubmittedassignment = '<%=applicantCount_whosubmittedassignment%>';

            var flag = false;
            if (is_stopdateexpired == "No" && checked_assignmentcount != applicantCount)
                alert("Please check all applicant assignment response.");

            else if (is_stopdateexpired == "yes" && checked_assignmentcount != applicantCount_whosubmittedassignment)
                alert("Please check all applicant assignment response.");

            else if ($("#<%=selectedexamdate_time.ClientID%>").val() == "")
                alert("Please select date and time to relase assessment result.");
            else
                flag = true;
            return flag;
        }

          $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#assignmentList').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#checkassignment').addClass('active');

        });
    </script>
</asp:Content>