
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exam_schedule.aspx.cs" Inherits="admin_exam_schedule" MasterPageFile="~/admin/admin.master"%>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
  
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">
    
 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.3/moment-timezone-with-data.min.js"></script>

    <div class="container page__container">
        <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
                <li class="breadcrumb-item active">Schedule Assessment</li>
        </ol>
        <h1 class="h2">Schedule Assessment</h1>

        <div class="card">
           <div class="tab-content card-body">
                <div class="tab-pane active" id="first">
                   <%-- <div class="form-group row" runat="server">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Institution </label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlUniversity" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlUniversity_SelectedIndexChanged1" AutoPostBack="true"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>--%>                    
                    <div class="form-group row" id="examname">
                        <label for="name" class="col-sm-3 col-form-label form-label">Select Assessment</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <asp:DropDownList ID="ddlexam" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlexam_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row" id="DivifNot" style="display:none" runat="server">                        
                        <div class="">
                            <div class="row">
                                
                                  <label for="name" class="col-sm-12 col-form-label form-label">No Exam paper are uploded for selected exam paper. Please upload exam sheets in create assessment section</label>
                               
                            </div>
                        </div>
                    </div>
                    <div id="showDiv" runat="server" style="display:none">
                    <div class="form-group row" id="examcourse">
                        <label for="name" class="col-sm-3 col-form-label form-label">Time Zone</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                   <select id="dropdownTimeZone" class="form-control" >
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
                                    <input type="datetime-local" id="pickerDateTime" onchange="submitDate()"  class="form-control" />   
                                     <asp:HiddenField runat="server" ID="selectedexamdate_time"/>                                    
                                </div>
                             </div>
                         </div>
                     </div>                    
                    <div class="form-group row" id="examgrade">
                        <label for="name" class="col-sm-3 col-form-label form-label">Assessment Date & Time (Based on UTC):</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="datetime-local" id="examutcdatetime" class="form-control" disabled="disabled"/>  
                                    <asp:HiddenField runat="server" ID="hidexamutcdatetime"/>
                                </div>
                                </div>
                            </div>
                        </div>
                    <div class="form-group row">
                <div class="col-sm-8 offset-sm-3">
                    <div class="media align-items-center">
                        <div class="media-left">                                  
                            <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btn_submit_Click" OnClientClick="return validateForm()"/>
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
         </div>
      
           </div>
  
   <script>
        function loadTimeZoneList(){   
        let select = document.getElementById("dropdownTimeZone");
            select.innerHTML = "";            
        let browserTimeZone ="Australia/Perth";
        let timeZones = moment.tz.names();
           timeZones.forEach((timeZone) =>{
               option = document.createElement("option");               
               option.textContent = `${timeZone} (GMT${moment.tz(timeZone).format('Z')})`; 
               option.value = timeZone;               
               if (timeZone == browserTimeZone) {
                   option.selected = true;
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

           var tiemzone =$( "#dropdownTimeZone option:selected" ).text();// document.getElementById("dropdownTimeZone").value;
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
           
           var flag = false;
           <%--if ($("#<%=ddlUniversity.ClientID%>").val() == "0")
               alert("Please Select University");--%>
           if ($("#<%=ddlexam.ClientID%>").val() == "0")
               alert("Please Select Exam");           
           else if ($("#<%=hidTimeZone.ClientID%>").val() == "")
               alert("Please Select time zone");
           else if ($("#<%=selectedexamdate_time.ClientID%>").val() == "")
               alert("Please Select assessment date time");
           else
               flag = true;
           return flag;
       }
        
       $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#exammodule_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
           $('#examshedule').addClass('active');

           $('#ContentPlaceHolder1_txtexamdate').datepicker({ dateFormat: 'dd-mm-yy' });
           
       });
    </script>        
</asp:Content>



