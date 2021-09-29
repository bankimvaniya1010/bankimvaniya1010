<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exam_marking_test.aspx.cs" Inherits="admin_exam_marking_test" MasterPageFile="~/admin/admin.master"%>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">
   
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.3/moment-timezone-with-data.min.js"></script>    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
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
                                    <asp:DropDownList ID="ddlexamdate" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlexamdate_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
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
           <div runat="server" id="divGrid" style="display:none">
               <div class="tab-content card-body">
                
               <div class="table-responsive" data-toggle="lists" data-lists-values='["name"]' style="white-space: nowrap;">
                    <table id="refreshtblcontent" class="table table-bordered" style="border: 1px solid #1b1c1c !important;">
                                        <tr>
                                            <th>Record Id</th>
                                            <th>Applicant ID</th>
                                            <th>Applicant Name</th>
                                            <th>Status</th>
                                            <th>Checked</th>
                                            <th>View</th>
                                        </tr>

                                    </table>
                    <asp:GridView ID="Grid" CssClass="table" runat="server" AutoGenerateColumns="False" Visible="false"
                        DataKeyNames="assignid"
                        AllowPaging="True"
                        CellPadding="2"
                        PageSize="25"
                        BorderStyle="None"
                        BorderWidth="1px"
                        CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No Records Found" OnPageIndexChanging="Grid_PageIndexChanging" OnRowCommand="Grid_RowCommand" OnRowDataBound="Grid_RowDataBound">
                        
                        <Columns>

                            <asp:BoundField DataField="assignid" HeaderText="Record ID" InsertVisible="False"
                                ReadOnly="True"/>
                           
                          <%--  <asp:TemplateField HeaderText="Institution">
                                <ItemTemplate>
                                    <asp:Label ID="lbluniveristy" runat="server" Text='<%# Bind("universityname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                           <%-- <asp:TemplateField HeaderText="Assessment Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblpapername" runat="server" Text='<%# Bind("paper_name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Assessment Time">
                                <ItemTemplate>
                                    <asp:Label ID="lbldatetime" runat="server" Text='<%# Bind("exam_datetime") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>     --%>                       
                            <asp:TemplateField HeaderText="Applicant Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblapplicantname" runat="server" Text='<%# Bind("applicantname") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField> 
                            <asp:TemplateField HeaderText="Applicant ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblapplicantid" runat="server" Text='<%# Bind("applicantid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField> 
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <asp:Label ID="lblstatus" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="Checked">
                                <ItemTemplate>
                                    <asp:Label ID="lblisexamchecked" runat="server" Text='<%# Bind("isexamchecked") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="View"> 
                                <ItemTemplate>
                                    <a runat="server" href='<%# Bind("link") %>' target="_blank" id="extraexampath" visible='<%# !String.IsNullOrEmpty(Convert.ToString(Eval("toshowshowlink"))) %>'>View </a>
                                    <%--<asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%#Eval("assignid")%>' CommandName="View" Text="View More" OnClientClick='<%# Eval("assignid","return ConfirmOnVerify({0})") %>'></asp:LinkButton>--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                </div>
           </div>


            <div id="showfinalmarks_dateDiv" runat="server" style="display:none">
                
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
                    <div class="form-group row" id="examsubjectdate">
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
                 <div class="" id="savedatemarks" runat="server">
                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                    <div class="form-row">
                       
                        <br />
                        <div style="margin-left:40%">
                            <asp:Button ID="btnsavedatemarks" runat="server" Text="Save Release Date" CssClass="btn btn-success" OnClick="btnsavedatemarks_Click" OnClientClick="return validateForm()"/>
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
            var flag = false;
            if ($("#<%=selectedexamdate_time.ClientID%>").val() == "")
                alert("Please select date and time to relase assessment result.");
            else
                flag = true;
            return flag;
      }
      setInterval(persec, 1000);
            function persec() {
                var examid = $("#<%=ddlexam.ClientID%>").val();
                var examinerID = $("#<%=ddlexaminer.ClientID%>").val();
                var examdatetime = $("#<%=ddlexamdate.ClientID%>").val();
                var universityid = $("#<%=ddluniversity.ClientID%>").val();
                if (examid != null && examinerID != null && universityid != null)
                    refreshTableContent(examid, universityid,  examinerID);
      }

       function refreshTableContent(examid,universityid,examinerID) {
            $.ajax({
                type: "GET",
                url: "exam_marking_test.aspx/Getstudentstatus",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: { examid: examid,universityid:universityid ,examinerID:examinerID},
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        $('#refreshtblcontent tr').slice(1).remove()
                        for (var i = 0; i < result.length; i++) {
                            var trHTML = '';
                            if (result[i].toshowshowlink == "Yes")
                                trHTML += '<tr><td>' + result[i].assignid + '</td><td>' + result[i].applicantid + '</td><td>' + result[i].applicantname + '</td><td>' + result[i].status + '</td><td>' + result[i].isexamchecked + '</td><td><a href="' + result[i].link + '" target="_blank" runnat="server">View</a></td></tr>';
                            else
                                trHTML += '<tr><td>' + result[i].assignid + '</td><td>' + result[i].applicantid + '</td><td>' + result[i].applicantname + '</td><td>' + result[i].status + '</td><td>' + result[i].isexamchecked + '</td><td><a href="'+result[i].link+'" target="_blank" runnat="server" style="visibility: hidden;" >View</a></td></tr>';
                            
                            $('#refreshtblcontent').append(trHTML);
                        }
                    }
                }
            });
        }
  </script>
</asp:Content>