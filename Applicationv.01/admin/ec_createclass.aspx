﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_createclass.aspx.cs" Inherits="admin_ec_createclass" MasterPageFile="~/admin/admin.master"%>


<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">
    
 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.3/moment-timezone-with-data.min.js"></script>

    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item"><a href="ec_manageclass.aspx">Mange Classes</a></li>
            <li class="breadcrumb-item">create</li>
        </ol>
        <h1 class="h2">CREATE A CLASS</h1>
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
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row" id="group">
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
                        <div class="form-group row" id="mode">
                            <label for="name" class="col-sm-3 col-form-label form-label">Mode</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlmode" class="form-control">
                                            <asp:ListItem Value="0">Please Select</asp:ListItem>
                                            <asp:ListItem Value="1">Online</asp:ListItem>
                                            <asp:ListItem Value="2">F2F</asp:ListItem>
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
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <input type="radio" class="form-check-input" name="examsetting" runat="server" id="rblauto">Auto Start 
                                        <br>
                                            <input type="radio" class="form-check-input" name="examsetting" runat="server" id="rblmanual">Manual
                                        </div>
                                    </div>
                                </div>
                            </div>
                             <div class="form-group row">
                                <label for="name" class="col-sm-3 col-form-label form-label">Location(s)</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <asp:ListBox ID="lstLocation" SelectionMode="Multiple" CssClass="form-control" runat="server"></asp:ListBox>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row" id="type">
                            <label for="name" class="col-sm-3 col-form-label form-label">Type</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddltype" class="form-control">
                                        </asp:DropDownList>
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
                        <div class="form-group row" id="fee">
                            <label for="name" class="col-sm-3 col-form-label form-label">FEE</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" ID="ddlcurrency" class="form-control">
                                        </asp:DropDownList>
                                        <input id="txtfee" runat="server" type="text" class="form-control" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Requirement(s)</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input id="txtrequirements" runat="server" type="text" class="form-control" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Instruction(s)</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input id="txtinstructions" runat="server" type="text" class="form-control" autocomplete="off">
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
                         <div class="form-group row" id="examcourse">
                                <label for="name" class="col-sm-3 col-form-label form-label">Time Zone</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <select id="dropdownTimeZone" class="form-control">
                                                <option value="">Please select</option>
                                            </select>
                                            <asp:HiddenField runat="server" ID="hidTimeZone" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <asp:HiddenField ID="hidFacilityCount" runat="server" Value="0" />
                        <asp:HiddenField ID="hidRemoveIDCount" runat="server" Value="0" />
                        <asp:HiddenField ID="hidFacilities" runat="server" Value="" />
                        <asp:HiddenField ID="hidFacilityCost" runat="server" Value="" />
                        <asp:HiddenField ID="hidFacilityPrice" runat="server" Value="" />
                        <asp:HiddenField ID="hidFacilityLocation" runat="server" Value="" />
                        <asp:HiddenField ID="hidFacilityDistance" runat="server" Value="" />
                        <div id="facilityContainer">
                        <input id="btnAddFacility" type="button" class="form-control" value=" Add Start Date " style="width: 130px;" /></div>

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
            </div>
        </div>
    <script>

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
            if ($("#<%=txtclassname.ClientID%>").val() == "")
                alert("Please enter class name.");
            else if ($("#<%=txtclassdescription.ClientID%>").val() == "")
                alert("Please enter class description."); 
            else if ($("#<%=txtwebpageurl.ClientID%>").val() == "")
                alert("Please enter class web page URL.");
            else if ($("#<%=ddlmajor.ClientID%>").val() == "0")
                alert("Please select major discipline");
            else if ($("#<%=ddllevel.ClientID%>").val() == "0")
                alert("Please select level.");
            else if ($("#<%=ddlgrade.ClientID%>").val() == "0")
                alert("Please select grade");
            else if ($("#<%=ddlsubject.ClientID%>").val() == "0")
                alert("Please select subject");
            else if ($("#<%=ddlmode.ClientID%>").val() == "0")
                alert("Please select mode");
            else if ($("#<%=ddlmode.ClientID%>").val() == "1" && $("#<%=txtvirtuallink.ClientID%>").val() == "")
                alert("Please enter virtual meeting link");
            else if ($("#<%=ddlmode.ClientID%>").val() == "1" &&(!($("#<%=rblauto.ClientID%>").is(":checked")|| $("#<%=rblmanual.ClientID%>").is(":checked"))))
                alert("Please select class start settings");
            else if ($("#<%=ddlmode.ClientID%>").val() == "1" && $('#lstLocation').val().length == 0)
                alert("Please select Location's.");
            else if ($("#<%=ddltype.ClientID%>").val() == "0")
                alert("Please select type");
            else if ( $("#<%=ddlyear.ClientID%>").val() == "0")
                alert("Please select years");
            else if ($("#<%=ddlmonths.ClientID%>").val() == "0")
                alert("Please select months");
            else if ($("#<%=ddldays.ClientID%>").val() == "0")
                alert("Please select days");
            else if ($("#<%=ddlhours.ClientID%>").val() == "0")
                alert("Please select hourse");
            else if ($("#<%=ddlcurrency.ClientID%>").val() == "0")
                alert("Please select currency");
            else if ($("#<%=txtfee.ClientID%>").val() == "" && !(checOnlykNum.test($("#<%=txtfee.ClientID%>").val())))
                alert("Please enter fee ");
            else if ($("#<%=txtrequirements.ClientID%>").val() == "")
                alert("Please enter requirements");
            else if ($("#<%=txtinstructions.ClientID%>").val() == "")
                alert("Please enter instructions");
            else if (!validateUploadedFile($("#<%=intructionfile.ClientID%>").val())) { }
            else if ($("#<%=ddlbooklatestatus.ClientID%>").val() == "0")
                alert("Please select booklate status.");            
            else if (!isvalidFacilities()) 
                return false;
            else
                flag = true;

            return flag;
            
        }
        function isvalidFacilities() {
             var flag = false;
            var facilitiesCount = $("#<%=hidFacilityCount.ClientID %>").val();
            var RemoveIDCount = $("#<%=hidRemoveIDCount.ClientID %>").val();

            facilitiesCount = facilitiesCount - RemoveIDCount;

            $("#<%=hidFacilities.ClientID %>").val('');
            $("#<%=hidFacilityCost.ClientID %>").val('');
            $("#<%=hidFacilityPrice.ClientID %>").val('');
            $("#<%=hidFacilityLocation.ClientID %>").val('');
            $("#<%=hidFacilityDistance.ClientID %>").val('');

            if (facilitiesCount > 0) {
                for (var i = 0; i < facilitiesCount; i++) {

                    var myEle = document.getElementById("startdate_"+i+"");
                    var myEle1 = document.getElementById("pickerDateTime_"+i+"");

                    if (myEle != null&& ($("#startdate_" + i).val() == "" || $("#startdate_" + i).val() == undefined)) {
                        alert("Please select start date" + i);
                        return false;
                    }
                    else if (myEle != null) {
                        var data = $('#startdate_' + i).val() + ";" + $("#<%=hidFacilities.ClientID %>").val();
                        $("#<%=hidFacilities.ClientID %>").val(data);
                    }
                    if (myEle1 != null && ($("#pickerDateTime_" + i).val() == "" || $("#pickerDateTime_" + i).val() == undefined)) {
                        alert("Please select booking deadline date for " + i);
                        return false;
                    }
                    else if (myEle1 != null) {
                        var data = $('#pickerDateTime_' + i).val() + ";" + $("#<%=hidFacilityCost.ClientID %>").val();
                        $("#<%=hidFacilityCost.ClientID %>").val(data);

                        var data = $('#hidexamutcdatetime_' + i).val() + ";" + $("#<%=hidFacilityPrice.ClientID %>").val();
                        $("#<%=hidFacilityPrice.ClientID %>").val(data);
                    }
                }
                return true;
            }
            else {
                 alert("Please select start date" + i);
                        return false;
            }
        }
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#classlist').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#createclass_service5').addClass('active');

            $("#<%=onlinemodeDiv.ClientID%>").hide();
                  
            $("#btnAddFacility").click(function () {
                createFacilityBlock();
            });
            
        });
          
        
        $("#<%=ddlmode.ClientID%>").change(function () {
            var modeID = $("#<%=ddlmode.ClientID%>").val();
            if (modeID == 1)
                $("#<%=onlinemodeDiv.ClientID%>").show();
            else
                $("#<%=onlinemodeDiv.ClientID%>").hide();
        });
        $('#ContentPlaceHolder1_txtstartDate').datepicker({ dateFormat: 'dd-mm-yy' });
        function createFacilityBlock() {
            var hfFacilityCount = $("#<%=hidFacilityCount.ClientID %>");
            var count = parseInt(hfFacilityCount.val());
            hfFacilityCount.val(count + 1);

            $("#facilityContainer").append('<div class="form-group row" id="date_' + count + '"><label for="startdate_' + count + '" class="col-sm-3 col-form-label form-label" style="margin-top:20px;">Start Date</label>' +
                '<div class="col-sm-8">' +
                '<div class="row">' +
               '<div class="col-md-5" style="margin-top: 20px;">' +
               '<input type="date" name="bday" class="form-control" id="startdate_' + count + '"></div>' + 
                '<div class="col-md-1" style="margin-top: 19px;">' +
                '<input id="btnRemove_' + count + '" type="button" class="form-control" value="x" onclick="return getData(' + count + ')"/>' +
                
               '</div></div></div>' +

                '<label for="deadline_' + count + '" class="col-sm-3 col-form-label form-label" style="margin-top:20px;">Booking Deadline Date & Time</label>' +
                '<div class="col-sm-8">' +
                '<div class="row">' +
               '<div class="col-md-6">' +
               '<input type="datetime-local" id="pickerDateTime_' + count + '" onchange="submitDate(' + count + ')" class="form-control" />' +
               '<asp:HiddenField runat="server" ID="selectedexamdate_time_" /> ' +
               '<input type="datetime-local" id="examutcdatetime' + count + '" class="form-control" disabled="disabled" style="display: none;"/>' +
               '<input type="text" class="form-control" style="display: none;" id="hidexamutcdatetime_' + count + '">' + 

               '</div></div></div></div>');

        }
        function getData(DivID) {
            var hfdRemoveIDCount = $("#<%=hidRemoveIDCount.ClientID %>");
            var count = parseInt(hfdRemoveIDCount.val());
            hfdRemoveIDCount.val(count + 1);

            var ID = "date_" + DivID;
            $('#' + ID + '').remove();
            
        }
        
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
            $("#pickerDateTime_").val().value = moment().format('YYYY-MM-DDTHH:mm');
        }
        const DEFAULT_FORMAT = 'YYYY-MM-DDTHH:mm'; 
 
        function formatDate(momentDate){
                return momentDate.format(DEFAULT_FORMAT);
         }
       
        function getSelectedUTCValue(localDateTime, timeZone)
        {
             return moment.tz(localDateTime,timeZone).utc();
       }
        function submitDate(count) {

           var tiemzone =$( "#dropdownTimeZone option:selected" ).text();// document.getElementById("dropdownTimeZone").value;
           $("#<%=hidTimeZone.ClientID%>").val(tiemzone);

            let localValue = $("#pickerDateTime_" + count).val();
            $("#selectedexamdate_time" + count + "").val(localValue);
            let timeZoneValue = document.getElementById("dropdownTimeZone").value;
           // let utcSelected =  document.getElementById('divUTCSelected');
           //utcSelected.innerHTML = formatDate(getSelectedUTCValue(localValue, timeZoneValue));
            let utcvalue = formatDate(getSelectedUTCValue(localValue, timeZoneValue));
            $("#examutcdatetime" + count + "").val(utcvalue);           //document.getElementById('examutcdatetime').value = utcvalue;

            $("#hidexamutcdatetime_" + count + "").val(utcvalue);
               }
        function init()
           {
            //loadDefaultDateTime();
            loadTimeZoneList();  
            //submitDate();
            }
 
  
        init();
      
    </script>
</asp:Content>