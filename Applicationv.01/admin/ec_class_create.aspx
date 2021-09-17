<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_class_create.aspx.cs" Inherits="admin_ec_class_create" MasterPageFile="~/admin/admin.master" EnableEventValidation="false"  %>


<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">
    
 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.3/moment-timezone-with-data.min.js"></script>
                               
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">MY DASHBOARD</a></li>
            <li class="breadcrumb-item"><a href="ec_manageclass.aspx">MANAGE CLASSES</a></li>
            <li class="breadcrumb-item">CREATE & SCHEDULE</li>
        </ol>
        <h1 class="h2">CREATE & SCHEDULE A CLASS</h1>
        <div class="">
            <div class="card" id="createDiv" runat="server">
                <div class="tab-content card-body">
                    <div class="tab-pane active" id="first">
                        <div class="form-group row" runat="server">
                            <label for="name" class="col-sm-3 col-form-label form-label">Class Code</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:Label runat="server" CssClass="form-control" ID="lblcode"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="classname">
                            <label for="name" class="col-sm-3 col-form-label form-label">Class Name</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input id="txtclassname" runat="server" type="text" class="form-control" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="classdescription">
                            <label for="name" class="col-sm-3 col-form-label form-label">Description</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" CssClass="form-control" id="txtclassdescription" Height="150px" Width="412px"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                          <div class="form-group row" id="classwebpageURL">
                            <label for="name" class="col-sm-3 col-form-label form-label">WebPage URL</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input id="txtwebpageurl" runat="server" type="text" class="form-control" autocomplete="off">
                                        <label style="color: black;"><i class="fa fa-info-circle" aria-hidden="true"></i>only accept "https" start with web link</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row" id="group" style="display:none">
                            <label for="name" class="col-sm-3 col-form-label form-label">Major Discipline</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                       <asp:DropDownList runat="server" ID="ddlmajor" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="examsubject">
                            <label for="name" class="col-sm-3 col-form-label form-label">Level</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddllevel" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Broad Field </label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList ID="ddlboradfield" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="0">Please Select</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:HiddenField runat="server" ID="hidbroadfieldId" />

                                        <span class="helpicon"><i id="i1" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Narrow Field </label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                         <asp:dropdownlist id="ddlnarrowfield" cssclass="form-control" runat="server">
                                            <asp:ListItem Value="0">Please Select</asp:ListItem>
                                        </asp:dropdownlist>
                                            <asp:hiddenfield runat="server" id="hidnarrowfieldId" />
                                            <span class="helpicon"><i id="i2" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Detailed Field </label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                          <asp:dropdownlist id="ddldetailedfield" cssclass="form-control" runat="server">
                                            <asp:ListItem Value="0">Please Select</asp:ListItem>
                                        </asp:dropdownlist>
                                            <asp:hiddenfield runat="server" id="hiddetailedfield" />
                                            <span class="helpicon"><i id="i3" runat="server" class="fa fa-info-circle" style="display: none;"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                      
                        <div class="form-group row" id="grade">
                            <label for="name" class="col-sm-3 col-form-label form-label">Grade</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlgrade" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Group</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlgroup" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="subject">
                            <label for="name" class="col-sm-3 col-form-label form-label">Subject</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlsubject" class="form-control"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Select Type</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <asp:DropDownList runat="server" ID="ddltype" class="form-control">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Select Mode</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <asp:DropDownList runat="server" ID="ddlmode" class="form-control">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                        <div runat="server" id="onlinemodeDiv">

                            <div class="form-group row">
                                <label for="name" class="col-sm-3 col-form-label form-label">Virtual meeting link</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <input id="txtvirtuallink" runat="server" type="text" class="form-control" autocomplete="off">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row" id="Div1" runat="server">
                                <label for="name" class="col-sm-3 col-form-label form-label">class start Settings </label>
                                <div class="col-sm-8 mrg-lft">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <input type="radio" class="form-check-input" name="examsetting" runat="server" id="rblauto">Auto Start 
                                        <br>
                                            <input type="radio" class="form-check-input" name="examsetting" runat="server" id="rblmanual">Manual
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div runat="server" id="F2FmodeDiv">
                             <div class="form-group row">
                                <label for="name" class="col-sm-3 col-form-label form-label">Location</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <asp:DropDownList ID="lstLocation" SelectionMode="Multiple" CssClass="form-control" runat="server"></asp:DropDownList>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="duration">
                            <label for="name" class="col-sm-3 col-form-label form-label">Duration</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="dropdown-lst">
                                        <label class="d-lbl">YEARS</label>
                                        <asp:DropDownList runat="server" ID="ddlyear" class="form-control">
                                        </asp:DropDownList></div>
                                        <div class="dropdown-lst">
                                        <label class="d-lbl">MONTH</label>
                                        <asp:DropDownList runat="server" ID="ddlmonths" class="form-control">
                                        </asp:DropDownList></div>
                                        <div class="dropdown-lst">
                                        <label class="d-lbl">DAYS</label>
                                        <asp:DropDownList runat="server" ID="ddldays" class="form-control">
                                        </asp:DropDownList></div>
                                        <div class="dropdown-lst">
                                        <label class="d-lbl">HOURS</label>
                                        <asp:DropDownList runat="server" ID="ddlhours" class="form-control">
                                            
                                        </asp:DropDownList></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Select Currency</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlcurrency" class="form-control">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="fee">
                            <label for="name" class="col-sm-3 col-form-label form-label">FEE</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        
                                        <input id="txtfee" runat="server" type="text" class="form-control" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="enrollmentfee">
                            <label for="name" class="col-sm-3 col-form-label form-label">Enrollment FEE</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input id="txtenrollment_fee" runat="server" type="text" class="form-control" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">Time Zone</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-8">
                                   <select id="dropdownTimeZone" class="form-control" >
                                       <option value="">Please select</option>
                                   </select>
                                    <asp:HiddenField runat="server" ID="hidTimeZone"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="name" class="col-sm-3 col-form-label form-label">START DATE</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">

                                    <input type="text" runat="server" id="txtstartdate" class="form-control" readonly="readonly" placeholder="Start Date">

                                   <%-- <label id="lbl1" runat="server" class="form-control" /> 

                                    <input type="date" id="pickerDateTime" onchange="submitDate('pickerDateTime','examutcdatetime',1)" class="form-control" value="<%=date1 %>" style="display:none"/> 
                                     <asp:HiddenField runat="server" ID="selectedexamdate_time"/>--%>
                                </div>
                                <%--<div class="col-md-2">
                                    <button id="button1" type="button" style="width:89%">change</button>
                                    </div>--%>
                             </div>
                         </div>
                     </div>                    
                    <div class="form-group row" id="examgrade" style="display:none;">
                        <label for="name" class="col-sm-3 col-form-label form-label">STart Date (Based on UTC):</label>
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
                        <label for="name" class="col-sm-3 col-form-label form-label">Booking Deadline</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">   
                                    <label id="lbl2" runat="server" class="form-control" /> 
                                   <%--<input id="txtexamdate" runat="server" type="text" class="form-control" placeholder="Select Date" value="" readonly="readonly">--%>
                                    <input type="datetime-local" id="pickerDateTime1" onchange="submitDate('pickerDateTime1','examutcdatetime1',2)"  class="form-control"value="<%=date2 %>" />   
                                     <asp:HiddenField runat="server" ID="selectedexamdate_time1"/>                                    
                                </div>
                                 <div class="col-md-2">
                                    <button id="button2" type="button" style="width:89%">change</button>
                                    </div>
                             </div>
                         </div>
                     </div>                    
                    <div class="form-group row" style="display:none;">
                        <label for="name" class="col-sm-3 col-form-label form-label">Booking Deadline(Based on UTC):</label>
                        <div class="col-sm-8">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type="datetime-local" id="examutcdatetime1" class="form-control" disabled="disabled"/>  
                                    <asp:HiddenField runat="server" ID="hidexamutcdatetime1"/>
                                </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row">
                                <label for="name" class="col-sm-3 col-form-label form-label">Recurrence</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <asp:DropDownList runat="server" ID="ddlrecurrence" class="form-control">
                                                <asp:ListItem Value="0">Please Select</asp:ListItem>
                                                <asp:ListItem Value="1">Daily</asp:ListItem>
                                                <asp:ListItem Value="2">Weekly</asp:ListItem>
                                                <asp:ListItem Value="3">Monthly</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div runat="server" id="DivDaily">
                                <div class="form-group row" runat="server">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Repeats Every</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <input id="txtrepeatsevery_day" runat="server" type="text" class="form-control" autocomplete="off" maxlength="1">
                                            </div>
                                            <div class="col-md-2">Day(s)</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" runat="server">
                                    <label for="name" class="col-sm-3 col-form-label form-label">End Date</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <input type="text" runat="server" id="txtenddate_daily" class="form-control" readonly="readonly">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div runat="server" id="DivWeekly">
                                <div class="form-group row" runat="server">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Repeats Every</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-5">
                                                <input id="txtrepeateevery_week" runat="server" type="text" class="form-control" autocomplete="off" maxlength="2">
                                            </div>
                                            <div class="col-md-3">Week(s)</div>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" runat="server">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Day(s) of Week</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <asp:ListBox ID="lstDayofWeek" SelectionMode="Multiple" CssClass="form-control" runat="server" Height="120px">
                                                    <asp:ListItem Value="1">Monday</asp:ListItem>
                                                    <asp:ListItem Value="2">Tuesday</asp:ListItem>
                                                    <asp:ListItem Value="3">Wednesday</asp:ListItem>
                                                    <asp:ListItem Value="4">Thursday</asp:ListItem>
                                                    <asp:ListItem Value="5">Friday</asp:ListItem>
                                                </asp:ListBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" runat="server">
                                    <label for="name" class="col-sm-3 col-form-label form-label">End Date</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <input type="text" runat="server" id="txtenddate_weekly" class="form-control" readonly="readonly">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div runat="server" id="DivMonthly">
                                <div class="form-group row" runat="server">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Repeats Every</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-7">
                                                <input id="txtrepeateevery_months" runat="server" type="text" class="form-control" autocomplete="off" maxlength="2">
                                            </div>
                                            <div class="col-md-2">Month(s)</div>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Days(s) of Month</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-1">
                                                <input type="radio" runat="server" id="rblday" name="dayofmonths">
                                            </div>
                                            <div class="col-md-6">
                                                <input type="text" runat="server" id="txtday_months" class="form-control" maxlength="1"></div>
                                            <div class="col-md-2">Day</div>
                                        </div>
                                        <br/>
                                          <div class="row">
                                            <div class="col-md-1">
                                                <input type="radio" runat="server" id="rblday2" name="dayofmonths">
                                            </div>
                                            <div class="col-md-3">
                                               <asp:DropDownList runat="server" ID="ddlday" class="form-control">
                                                    <asp:ListItem Value="0">Please Select </asp:ListItem>
                                                    <asp:ListItem Value="1">First</asp:ListItem>
                                                    <asp:ListItem Value="2">Second</asp:ListItem>
                                                    <asp:ListItem Value="3">Third</asp:ListItem>
                                                    <asp:ListItem Value="4">Fourth</asp:ListItem>
                                                    <asp:ListItem Value="5">Last</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-md-3">
                                                <asp:DropDownList runat="server" ID="ddlday2" class="form-control">
                                                    <asp:ListItem Value="0">Please Select </asp:ListItem>
                                                    <asp:ListItem Value="1">Monday</asp:ListItem>
                                                    <asp:ListItem Value="2">Tuesday</asp:ListItem>
                                                    <asp:ListItem Value="3">Wednesday</asp:ListItem>
                                                    <asp:ListItem Value="4">Thursday</asp:ListItem>
                                                    <asp:ListItem Value="5">Friday</asp:ListItem>
                                                    <asp:ListItem Value="6">Saturday</asp:ListItem>
                                                    <asp:ListItem Value="7">Sunday</asp:ListItem>
                                                    <asp:ListItem Value="8">Day</asp:ListItem>
                                                    <asp:ListItem Value="9">Week Day</asp:ListItem>
                                                    <asp:ListItem Value="10">Weekend Day</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" runat="server">
                                    <label for="name" class="col-sm-3 col-form-label form-label">End Date</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <input type="text" runat="server" id="txtenddate_monthly" class="form-control" readonly="readonly">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row" runat="server">
                                <label for="name" class="col-sm-3 col-form-label form-label">Class Start Time</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <input type="time" runat="server" id="txtclassstarttime" class="form-control" style="width: 135px;" onchange="submitDate('txtclassstarttime','Hid_txtclassstarttime',3)">
                                            <asp:HiddenField ID="Hid_txtclassstarttime" runat="server"></asp:HiddenField>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row" runat="server">
                                <label for="name" class="col-sm-3 col-form-label form-label">Class End Time</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <input type="time" runat="server" id="txtclassendtime" class="form-control" style="width: 135px;" onchange="submitDate('txtclassendtime','Hid_txtclassendtime',4)">
                                            <asp:HiddenField ID="Hid_txtclassendtime" runat="server"></asp:HiddenField>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Availability</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input id="txtAvailability" runat="server" type="text" class="form-control" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">single Instructor</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input type="radio" runat="server" id="chkyes" name="instructor" style="margin-right: 6px;"/>Yes
                                        <input type="radio" runat="server" id="chkNo" name="instructor" style="margin-left: 25px;margin-right: 6px;"/>No
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Requirement(s)</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" CssClass="form-control" id="txtrequirements" Height="150px" Width="412px"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Instruction(s)</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" CssClass="form-control" id="txtinstructions" Height="150px" Width="412px"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="studentfile">
                            <label for="name" class="col-sm-3 col-form-label form-label">Instruction(s) File </label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:Label ID="Label2" runat="server" />
                                        <asp:FileUpload ID="intructionfile" runat="server"></asp:FileUpload>
                                        <asp:HyperLink runat="server" ID="intructionfileLink"/>
                                        <br/>
                                        <label style="color: black;" id="lbl1" runat="server"><i class="fa fa-info-circle" aria-hidden="true"></i>only accept "jpg","png","jpeg", "docx", "pdf"</label>
                                       <asp:HiddenField runat="server" ID="Hidintructionfile"/>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Booklate status</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlbooklatestatus" class="form-control">
                                            <asp:ListItem Value="0">Please Select</asp:ListItem>
                                            <asp:ListItem Value="1">Yes</asp:ListItem>
                                            <asp:ListItem Value="2">No</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-group row">
                            <div class="col-sm-8 offset-sm-3">
                                <div class="media align-items-center">
                                    <div class="media-left">
                                        <asp:Button ID="btn_submit" runat="server" Text="Submit & Proceed" CssClass="btn btn-success" OnClick="btn_submit_Click" /><%--OnClientClick="return validateForm()" --%>
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


        function validateUploadedFile(filepath,hidpath) {
            if (filepath == "")
                filepath = hidpath;
            if (filepath == "")
            {
                alert("Please upload a file");
                return false;
            }
            var fileExtension = filepath.substring(filepath.lastIndexOf(".") + 1).toString().toLowerCase();
            if (fileExtension != "pdf" && fileExtension != "docx" && fileExtension != "jpg" && fileExtension != "jpeg" && fileExtension != "png") {
                alert("Invalid file. Please select file of type pdf, docx");
                return false;
            }

            return true;
        }
        function validateForm() {
            var ispagedit = '<%=editpage%>';
            var checOnlykNum = /^[0-9]*$/;
            var currentdate = '<%=currentdatetime%>';
            var flag = false;
            if ($("#<%=txtclassname.ClientID%>").val() == "")
                alert("Please enter class name.");
            else if ($("#<%=txtclassdescription.ClientID%>").val() == "")
                alert("Please enter class description.");
            else if ($("#<%=txtwebpageurl.ClientID%>").val() == "" && !(url.test($("#<%=txtwebpageurl.ClientID%>").val())))
                alert("Please enter class web page URL.");
           <%-- else if ($("#<%=ddlmajor.ClientID%>").val() == "0")
                alert("Please select major discipline");--%>
            else if ($("#<%=ddllevel.ClientID%>").val() == "0")
                alert("Please select level.");

            else if ($("#<%=ddlboradfield.ClientID%>").val() == "0")
                alert("Please select broad field ");
            else if ($("#<%=ddlnarrowfield.ClientID%>").val() == "0")
                alert("Please select narrow field ");
            else if ($("#<%=ddldetailedfield.ClientID%>").val() == "0")
                alert("Please select detailed field ");
            
            else if ($("#<%=ddlgrade.ClientID%>").val() == "0")
                alert("Please select grade");
            else if ($("#<%=ddlgroup.ClientID%>").val() == "0")
                alert("Please select group");
            else if ($("#<%=ddlsubject.ClientID%>").val() == "0")
                alert("Please select subject");
            else if ($("#<%=ddltype.ClientID%>").val() == "0")
                alert("Please select type");
            else if ($("#<%=ddlmode.ClientID%>").val() == "0")
                alert("Please select mode");
            else if ($("#<%=ddlmode.ClientID%>").val() == "2" && $("#<%=txtvirtuallink.ClientID%>").val() == "")
                alert("Please enter virtual meeting link");
            else if ($("#<%=ddlmode.ClientID%>").val() != "2" && $("#<%=lstLocation.ClientID%>").val().val == "0")
                alert("Please select Location's.");

            else if ($("#<%=ddlmode.ClientID%>").val() == "2" && (!($("#<%=rblauto.ClientID%>").is(":checked") || $("#<%=rblmanual.ClientID%>").is(":checked"))))
                alert("Please select class start settings");
            
            else if ($("#<%=ddlcurrency.ClientID%>").val() == "0")
                alert("Please select currency");
            else if ($("#<%=txtfee.ClientID%>").val() == "" || !(checOnlykNum.test($("#<%=txtfee.ClientID%>").val())))
                alert("Please enter valid fee amount ");
            else if ($("#<%=txtenrollment_fee.ClientID%>").val() == "" || !(checOnlykNum.test($("#<%=txtenrollment_fee.ClientID%>").val())))
                alert("Please enter valid enrollment fee amount ");
            else if ($("#<%=hidTimeZone.ClientID%>").val() == "")
                alert("Please Select time zone");
            else if ($("#<%=txtstartdate.ClientID%>").val() == "")
                alert("Please Select start date");
            else if (ispagedit == 0 && !($("#<%=txtstartdate.ClientID%>").val() < currentdate))
                alert("Please Select valid start date, start date can not be less than today");

            else if ($("#<%=selectedexamdate_time1.ClientID%>").val() == "")
                alert("Please Select valid booking deadline date");

           <%-- else if ($("#<%=selectedexamdate_time.ClientID%>").val() > $("#<%=selectedexamdate_time1.ClientID%>").val())
                alert("Please Select valid booking deadline date.booking deadline date can not be less than start date");--%>

            else if ($("#<%=ddlrecurrence.ClientID%>").val() == "0")
                alert("Please select recurrence");
            else if ($("#<%=ddlrecurrence.ClientID%>").val() == "1" && ($("#<%=txtrepeatsevery_day.ClientID%>").val() == "" || !checOnlykNum.test($("#<%=txtrepeatsevery_day.ClientID%>").val())))
                alert("Please enter valid value for repeats every day's");
            else if ($("#<%=ddlrecurrence.ClientID%>").val() == "1" && $("#<%=txtenddate_daily.ClientID%>").val() == "")
                alert("Please select end date");
            else if ($("#<%=ddlrecurrence.ClientID%>").val() == "2" && ($("#<%=txtrepeateevery_week.ClientID%>").val() == "" || !checOnlykNum.test($("#<%=txtrepeateevery_week.ClientID%>").val())))
                alert("Please enter valur for repeats every week's");
            else if ($("#<%=ddlrecurrence.ClientID%>").val() == "2" && $("#<%=lstDayofWeek.ClientID%>").val().length == 0)
                alert("Please select day's of week");
            else if ($("#<%=ddlrecurrence.ClientID%>").val() == "2" && $("#<%=txtenddate_weekly.ClientID%>").val() == "")
                alert("Please select end date");
            else if ($("#<%=ddlrecurrence.ClientID%>").val() == "3" && ($("#<%=txtrepeateevery_months.ClientID%>").val() == "" || !checOnlykNum.test($("#<%=txtrepeateevery_months.ClientID%>").val())))
                alert("Please enter valur for repeats every month's");
            else if ($("#<%=ddlrecurrence.ClientID%>").val() == "3" && (!($("#<%=rblday.ClientID%>").is(":checked") || $("#<%=rblday2.ClientID%>").is(":checked"))))
                alert("Please select option for day(s) of month");
            else if ($("#<%=ddlrecurrence.ClientID%>").val() == "3" && $("#<%=rblday.ClientID%>").is(":checked") == true && $("#<%=txtday_months.ClientID%>").val() == "")
                alert("Please enter valur for day(s) of month");
            else if ($("#<%=ddlrecurrence.ClientID%>").val() == "3" && $("#<%=rblday2.ClientID%>").is(":checked") == true && $("#<%=ddlday.ClientID%>").val() == "0")
                alert("Please select options from dropdown");
            else if ($("#<%=ddlrecurrence.ClientID%>").val() == "3" && $("#<%=rblday2.ClientID%>").is(":checked") == true && $("#<%=ddlday2.ClientID%>").val() == "0")
                alert("Please select options from dropdown");
            else if ($("#<%=ddlrecurrence.ClientID%>").val() == "3" && $("#<%=txtenddate_monthly.ClientID%>").val() == "")
                alert("Please select end date");
            else if ($("#<%=txtclassstarttime.ClientID%>").val() == "")
                alert("Please select class start time");
            else if ($("#<%=txtclassendtime.ClientID%>").val() == "")
                alert("Please select class end time");
            else if ($("#<%=txtAvailability.ClientID%>").val() == "" || !(checOnlykNum.test($("#<%=txtAvailability.ClientID%>").val())))
                alert("Please enter valid availability");
            else if (!($("#<%=chkyes.ClientID%>").is(":checked") || $("#<%=chkNo.ClientID%>").is(":checked")))
                alert("Please select option singel instructor");
            else if ($("#<%=txtrequirements.ClientID%>").val() == "")
                alert("Please enter requirements");
            else if ($("#<%=txtinstructions.ClientID%>").val() == "")
                alert("Please enter instructions");
            else if ($("#<%=intructionfile.ClientID%>").val() != "" && !validateUploadedFile($("#<%=intructionfile.ClientID%>").val(),$("#<%=Hidintructionfile.ClientID%>").val())) { }
            else if ($("#<%=ddlbooklatestatus.ClientID%>").val() == "0")
                alert("Please select booklate status.");
            <%--else if ( $("#<%=ddlyear.ClientID%>").val() == "")
                alert("Please select years");
            else if ($("#<%=ddlmonths.ClientID%>").val() == "")
                alert("Please select months");
            else if ($("#<%=ddldays.ClientID%>").val() == "")
                alert("Please select days");
            else if ($("#<%=ddlhours.ClientID%>").val() == "")
                alert("Please select hourse");--%>
            else
                flag = true;

            return flag;

        }

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#classlist').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#createclass_service5').addClass('active');
           
            $("#<%=onlinemodeDiv.ClientID%>").hide();
            $("#<%=F2FmodeDiv.ClientID%>").hide();

            var modeID = $("#<%=ddlmode.ClientID%>").val();
            if (modeID == 2) {
                $("#<%=onlinemodeDiv.ClientID%>").show();
                $("#<%=F2FmodeDiv.ClientID%>").hide();
            }
            else if (modeID != 2 && modeID != 0) {
                $("#<%=F2FmodeDiv.ClientID%>").show();
                $("#<%=onlinemodeDiv.ClientID%>").hide();
            }
            else {
                $("#<%=F2FmodeDiv.ClientID%>").hide();
                $("#<%=onlinemodeDiv.ClientID%>").hide();
            }

            if ($("#<%=ddltype.ClientID%>").val() == 1)
                $("#ContentPlaceHolder1_ddlmode option[value=3]").hide();
            else
                $("#ContentPlaceHolder1_ddlmode option[value=3]").show();

            var recurrrenceID = $("#<%=ddlrecurrence.ClientID%>").val();
            if (recurrrenceID == 1) {
                $("#<%=DivDaily.ClientID%>").show();
                $("#<%=DivWeekly.ClientID%>").hide();
                $("#<%=DivMonthly.ClientID%>").hide();
            }
            else if (recurrrenceID == 2) {
                $("#<%=DivDaily.ClientID%>").hide();
                $("#<%=DivWeekly.ClientID%>").show();
                $("#<%=DivMonthly.ClientID%>").hide();
            }
            else if (recurrrenceID == 3) {
                $("#<%=DivDaily.ClientID%>").hide();
                $("#<%=DivWeekly.ClientID%>").hide();
                $("#<%=DivMonthly.ClientID%>").show();
            }
            else {
                $("#<%=DivDaily.ClientID%>").hide();
                $("#<%=DivWeekly.ClientID%>").hide();
                $("#<%=DivMonthly.ClientID%>").hide();
            }
        });
        $("#<%=ddltype.ClientID%>").change(function () {
            var typeID = $("#<%=ddltype.ClientID%>").val();
            if (typeID == 1)
                $("#ContentPlaceHolder1_ddlmode option[value=3]").hide();
            else
                $("#ContentPlaceHolder1_ddlmode option[value=3]").show();
        });

       $("#<%=ddlmode.ClientID%>").change(function () {
            var modeID = $("#<%=ddlmode.ClientID%>").val();
            if (modeID == 2) {
                $("#<%=onlinemodeDiv.ClientID%>").show();
                $("#<%=F2FmodeDiv.ClientID%>").hide();
            }
            else if (modeID != 2 && modeID != 0) {
                $("#<%=F2FmodeDiv.ClientID%>").show();
                $("#<%=onlinemodeDiv.ClientID%>").hide();
           }
            else {
                $("#<%=F2FmodeDiv.ClientID%>").hide();
                $("#<%=onlinemodeDiv.ClientID%>").hide();
            }
        });
        
        $("#<%=ddlrecurrence.ClientID%>").change(function () {
            var recurrrenceID = $("#<%=ddlrecurrence.ClientID%>").val();
            if (recurrrenceID == 1) {
                $("#<%=DivDaily.ClientID%>").show();
                $("#<%=DivWeekly.ClientID%>").hide();
                $("#<%=DivMonthly.ClientID%>").hide();
            }
            else if (recurrrenceID == 2) {
                $("#<%=DivDaily.ClientID%>").hide();
                $("#<%=DivWeekly.ClientID%>").show();
                $("#<%=DivMonthly.ClientID%>").hide();
            }
            else if (recurrrenceID == 3) {
                $("#<%=DivDaily.ClientID%>").hide();
                $("#<%=DivWeekly.ClientID%>").hide();
                $("#<%=DivMonthly.ClientID%>").show();
            }
            else {
                $("#<%=DivDaily.ClientID%>").hide();
                $("#<%=DivWeekly.ClientID%>").hide();
                $("#<%=DivMonthly.ClientID%>").hide();
            }
        });
        function loadTimeZoneList() {
            let select = document.getElementById("dropdownTimeZone");
            select.innerHTML = "";
            let browserTimeZone ="<%=timezone_value%>";
            let timeZones = moment.tz.names();

            option = document.createElement("option");
            option.textContent = `Please Select`;
            option.value = 0;
            option.selected = true;
            select.appendChild(option);


            timeZones.forEach((timeZone) => {
                option = document.createElement("option");
                option.textContent = `${timeZone} (GMT${moment.tz(timeZone).format('Z')})`;
                option.value = timeZone;
                //if (timeZone == browserTimeZone) {
                //    option.selected = true;
                //}
                select.appendChild(option);
            });

        }
        //function loadDefaultDateTime(){
        //    document.getElementById('pickerDateTime').value = moment().format('YYYY-MM-DDTHH:mm');
        //}
        const DEFAULT_FORMAT = 'YYYY-MM-DDTHH:mm';

        function formatDate(momentDate) {
            return momentDate.format(DEFAULT_FORMAT);
        }

        function getSelectedUTCValue(localDateTime, timeZone) {
            return moment.tz(localDateTime, timeZone).utc();
        }
        function submitDate(id1, id2, datetype) {
            debugger;
            var tiemzone = $("#dropdownTimeZone option:selected").text();// document.getElementById("dropdownTimeZone").value;
            if (tiemzone == "Please Select") {
                $("#<%=txtclassstarttime.ClientID%>").val("");
                $("#<%=txtclassendtime.ClientID%>").val("");
                alert("Please select timezone");
                return false;
            }
            if ($("#<%=txtstartdate.ClientID%>").val() == 0) {
                $("#<%=txtclassstarttime.ClientID%>").val("");
                $("#<%=txtclassendtime.ClientID%>").val("");
                alert("Please select start date");
                return false;
            }

            $("#<%=hidTimeZone.ClientID%>").val(tiemzone);

            let localValue;
        
            if (datetype == 3) 
                localValue = $("#<%=txtstartdate.ClientID%>").val() + "T" + $("#<%=txtclassstarttime.ClientID%>").val();
            else if (datetype == 4) 
                localValue = $("#<%=txtstartdate.ClientID%>").val() + "T" + $("#<%=txtclassendtime.ClientID%>").val();
            else
                localValue = document.getElementById('' + id1 + '').value;
            
            if (datetype == 2) 
                $("#<%=selectedexamdate_time1.ClientID%>").val(localValue);

            let timeZoneValue = document.getElementById("dropdownTimeZone").value;
            // let utcSelected =  document.getElementById('divUTCSelected');
            //utcSelected.innerHTML = formatDate(getSelectedUTCValue(localValue, timeZoneValue));
            let utcvalue = formatDate(getSelectedUTCValue(localValue, timeZoneValue));
             if (datetype == 2) 
                document.getElementById('' + id2 + '').value = utcvalue;

            if (datetype == 1)
                $("#<%=hidexamutcdatetime.ClientID%>").val(document.getElementById('' + id2 + '').value);
            else if (datetype == 2)
                $("#<%=hidexamutcdatetime1.ClientID%>").val(document.getElementById('' + id2 + '').value);
            else if (datetype == 3)
                $("#<%=Hid_txtclassstarttime.ClientID%>").val(utcvalue);
            else if (datetype == 4)
                $("#<%=Hid_txtclassendtime.ClientID%>").val(utcvalue);


        }
        function init() {
            //loadDefaultDateTime();
            loadTimeZoneList();
            //submitDate();
        }


        init();


        
        $('#ContentPlaceHolder1_txtenddate_weekly').datepicker({ minDate: new Date(), dateFormat: 'dd-mm-yy' });
        $('#ContentPlaceHolder1_txtenddate_monthly').datepicker({ minDate: new Date(), dateFormat: 'dd-mm-yy' });
        $('#ContentPlaceHolder1_txtenddate_daily').datepicker({ minDate: new Date(), dateFormat: 'dd-mm-yy' });
        $('#ContentPlaceHolder1_txtstartdate').datepicker({ minDate: new Date(), dateFormat: 'yy-mm-dd' });

        $(document).ready(function () {
            // to handle Tool tips
            var i = 0;
            $('.fa-info-circle').tipso({
                position: 'right',
                background: 'rgba(0,0,0,0.8)',
                useTitle: false,
            });
        });
        $(document).ready(function () {
            var is_editpage = '<%=editpage%>';
            if (is_editpage == 1) {
                $("#pickerDateTime").hide();
                <%--$("#<%=lbl1.ClientID%>").show();--%>

                $("#pickerDateTime1").hide();
                $("#<%=lbl2.ClientID%>").show();
            }
            else {
                <%--$("#<%=lbl1.ClientID%>").hide();--%>
                $("#button1").hide();

                $("#<%=lbl2.ClientID%>").hide();
                $("#button2").hide();
            }
        });
        $('#button1').click(function (e) {
            e.preventDefault();
            // Code goes here
            <%--$("#<%=lbl1.ClientID%>").hide();--%>
            $("#pickerDateTime").show();
            $("#button1").hide();
        });
        $('#button2').click(function (e) {
            e.preventDefault();
            // Code goes here
            $("#<%=lbl2.ClientID%>").hide();
            $("#pickerDateTime1").show();
            $("#button2").hide();
        });

           $("#<%=ddlboradfield.ClientID%>").change(function () {
            var broadfieldID = $("#<%=ddlboradfield.ClientID%>").val()
            if (broadfieldID > 0) {
                $.ajax({
                    type: "GET",
                    url: "ec_class_create.aspx/GetNarrowFields",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { broadfieldID: broadfieldID },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlnarrowfield.ClientID%>").length >= 1) {
                                $("#<%=ddlnarrowfield.ClientID%>").empty();
                                $("#<%=ddlnarrowfield.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlnarrowfield.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].fieldname));
                        }
                    }
                });
            }
            else {
                $("#<%=ddlnarrowfield.ClientID%>").empty();
                $("#<%=ddlnarrowfield.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
            }
        });

        $("#<%=ddlnarrowfield.ClientID%>").change(function () {
            $("#<%=hidnarrowfieldId.ClientID%>").val($("#<%=ddlnarrowfield.ClientID%>").val());
        });
        ////
        $("#<%=ddlnarrowfield.ClientID%>").change(function () {
            var narrowfieldID = $("#<%=ddlnarrowfield.ClientID%>").val()
            if (narrowfieldID > 0) {
                $.ajax({
                    type: "GET",
                    url: "ec_class_create.aspx/GetDetailedFields",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { narrowfieldID: narrowfieldID },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddldetailedfield.ClientID%>").length >= 1) {
                                 $("#<%=ddldetailedfield.ClientID%>").empty();
                                 $("#<%=ddldetailedfield.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
                             }
                             for (var i = 0; i < result.length; i++)
                                 $("#<%=ddldetailedfield.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].fieldname));
                         }
                     }
                 });
             }
             else {
                 $("#<%=ddldetailedfield.ClientID%>").empty();
                 $("#<%=ddldetailedfield.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
            }
        });

        $("#<%=ddldetailedfield.ClientID%>").change(function () {
            $("#<%=hiddetailedfield.ClientID%>").val($("#<%=ddldetailedfield.ClientID%>").val());
        });

        $("#<%=ddllevel.ClientID%>").change(function () {
            var studeylevelID = $("#<%=ddllevel.ClientID%>").val()
            if (studeylevelID > 0) {
                $.ajax({
                    type: "GET",
                    url: "ec_class_create.aspx/GetBroadFields",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    data: { studeylevelID: studeylevelID },
                    success: function (response) {
                        if (response.d) {
                            var result = JSON.parse(response.d);
                            if ($("#<%=ddlboradfield.ClientID%>").length >= 1) {
                                $("#<%=ddlboradfield.ClientID%>").empty();
                                $("#<%=ddlboradfield.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
                            }
                            for (var i = 0; i < result.length; i++)
                                $("#<%=ddlboradfield.ClientID%>").append($("<option></option>").val(result[i].id).html(result[i].fieldname));
                        }
                    }
                });
            }
            else {
                $("#<%=ddlboradfield.ClientID%>").empty();
                $("#<%=ddlboradfield.ClientID%>").append($('<option selected="selected"></option>').val("0").html("Please Select"));
            }
        });

        $("#<%=ddlboradfield.ClientID%>").change(function () {
            $("#<%=hidbroadfieldId.ClientID%>").val($("#<%=ddlboradfield.ClientID%>").val());
        });

    </script>
</label>
</asp:Content>