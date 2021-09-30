<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_assignment_scheduleassign_create.aspx.cs" Inherits="admin_ec_assignment_scheduleassign_create" MasterPageFile="~/admin/admin.master" EnableEventValidation="true"%>


<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">
   <style>
       .width_list {
	width:160%;
    display: block;
    width: 158%;
    height: calc(2.40625rem + 2px);
    padding: .5rem .75rem;
    font-size: .9375rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #f0f1f2;
    border-radius: .25rem;
    box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
   </style>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.3/moment-timezone-with-data.min.js"></script>
    <div class="container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item"><a href="ec_assignment_scheduleassign_master.aspx">MANAGE ASSIGNMENT</a></li>
            <li class="breadcrumb-item">create</li>
        </ol>
        <h1 class="h2">SCHEDULE & ASSIGN AN ASSIGNMENT</h1>
        <div class="row" style="margin-right: -1.625rem;">
            <div class="col-md-8">
                <div class="card" id="createDiv" runat="server">
                    <div class="tab-content card-body">
                        <asp:ScriptManager runat="server" ID="sm1"></asp:ScriptManager>

                        <div class="tab-pane active" id="first">
                            <%--<asp:UpdatePanel ID="up1" runat="server">
                                <contenttemplate>--%>
                            <div>
                                <div class="form-group row" id="group">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Select Grade</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <asp:DropDownList runat="server" ID="ddlgrade" class="form-control" style="width:160%" OnSelectedIndexChanged="ddlgrade_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" id="examsubject">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Select Subject</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <asp:DropDownList runat="server" ID="ddlsubject" class="form-control" style="width:160%" OnSelectedIndexChanged="ddlsubject_SelectedIndexChanged" AutoPostBack="true" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" id="type">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Type</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <asp:DropDownList runat="server" ID="ddltype" class="form-control" style="width:160%">
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" id="mode">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Mode</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <asp:DropDownList runat="server" ID="ddlmode" class="form-control" style="width:160%" AutoPostBack="true" OnSelectedIndexChanged="ddlmode_SelectedIndexChanged">
                                                    <asp:ListItem Value="0">Please Select</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row" id="grade">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Select Class</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <asp:DropDownList runat="server" ID="ddlclass" class="form-control" style="width:160%;" OnSelectedIndexChanged="ddlclass_SelectedIndexChanged" AutoPostBack="true" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%--<div class="form-group row" id="subject">
                                    <label for="name" class="col-sm-3 col-form-label form-label">Select Start Date</label>
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <asp:DropDownList runat="server" ID="ddlstartdate" class="form-control" OnSelectedIndexChanged="ddlstartdate_SelectedIndexChanged" AutoPostBack="true" />
                                            </div>
                                        </div>
                                    </div>
                            </div>--%>
                            <div class="form-group row" id="studrymaterial">
                                <label for="name" class="col-sm-3 col-form-label form-label">Select Assignment</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <asp:ListBox runat="server" ID="list_materials" SelectionMode="Multiple" onchange="javascript:createFacilityBlock();" CssClass="form-control" style="width:160%"></asp:ListBox>
                                            <label style="color: black; width:160%;"><i class="fa fa-info-circle" aria-hidden="true"></i> Ctrl/ Command Click to select multiple options</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" runat="server" id="timezone_postback">
                            <label for="name" class="col-sm-3 col-form-label form-label">Time Zone</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <select id="dropdownTimeZone" name="timezone" class="form-control" style="width:160%">
                                            <option value="Please select">Please select</option>
                                        </select>
                                        <asp:HiddenField runat="server" ID="hidTimeZone" />
                                        <asp:HiddenField ID="hidFacilityCount" runat="server" Value="0" />
                                        <asp:HiddenField ID="hidRemoveIDCount" runat="server" Value="0" />
                                        <asp:HiddenField ID="hidFacilities" runat="server" Value="" />
                                        <asp:HiddenField ID="hidFacilityCost" runat="server" Value="" />
                                        <asp:HiddenField ID="hidFacilityPrice" runat="server" Value="" />
                                        <asp:HiddenField ID="hidFacilityLocation" runat="server" Value="" />
                                        <asp:HiddenField ID="hidFacilityDistance" runat="server" Value="" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div runat="server" class="div_material_time" id="div_material_time">
                        </div>
                        <center>
                            <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btn_submit_Click" OnClientClick="return validateForm()" />
                        </center>
                    </div>
                </div>
            </div>
        </div>
       <%-- <div class="col-md-4">
            <div class="card card-checkbox-list" runat="server">
                <div class="form-group row">
                    <label for="name" class="col-sm-12 col-form-label form-label">Select Assignee(s)</label>
                </div>
                <div class="">
                    <div class="col-md-12">
                        <asp:CheckBox ID="chkAll" Text="Select All" runat="server" onclick="javascript:Header_Click(this);" />
                        <asp:CheckBoxList ID="ddlstudentid" runat="server" RepeatDirection="Horizontal" RepeatColumns="1"></asp:CheckBoxList>
                    </div>
                </div>
            </div>
        </div>--%>
    </div>
    </div>
    <script id="template-material" type="text/x-custom-template">
        <div style="margin-top: 10px;" class="form-group row custom-date" data-tempid="@value@" id="date_@value@">
            <div class="col-lg-12">
                <label style="font-weight:bold; class='validname' font-size:20px;">@material_name@</label>
            </div>
            <label for="startdate_1" class="col-sm-3 col-form-label form-label" style="margin-top:20px;">Starts Showing At </label>
            <div class="col-sm-8">
                <div class="row">
                    <div class="col-md-8" style="margin-top: 20px;">
                        <input type="datetime-local" min="@date_validate@" style="width:160%;" name="startdate_@value@" onchange="submitDate(@value@)" id="startdate_@value@" class="form-control startdatecheck">
                        <input type="text" class="form-control" style="display: none;" name="hidstartutcdatetime_@value@" id="hidstartutcdatetime_@value@">
                    </div>
                    <div class="col-md-1" style="margin-top: 19px;">
                    </div>
                 </div>
            </div>
            <label for="deadline_1" class="col-sm-3 col-form-label form-label" style="margin-top:20px;">Stop Showing At</label>
            <div class="col-sm-8">
                <div class="row">
                    <div class="col-md-8" style="margin-top: 20px;">
                        <input type="datetime-local" min="@date_validate@" style="width:160%;" id="pickerDateTime_@value@" onchange="submitDate(@value@)" name="pickerDateTime_@value@" class="form-control stopdatecheck">
                        <input type="text" class="form-control" style="display: none;" name="hidstoputcdatetime_@value@" id="hidstoputcdatetime_@value@">
                    </div>
                </div>
            </div>
        </div>
    </script>

    <script>
        function createFacilityBlock() {
            var hfFacilityCount = $("#<%=hidFacilityCount.ClientID %>");
            var selected_materalIds = $("#ContentPlaceHolder1_list_materials").val();
            var start_id_for_utc;
            if (selected_materalIds != undefined && selected_materalIds.length > 0) {

                var old_materialControl = $(".div_material_time .custom-date");
                if (old_materialControl != undefined && old_materialControl.length > 0)
                    $.each(old_materialControl, function (ind, item) {
                        var temp_id = $(item).attr('data-tempid');
                        if (selected_materalIds.indexOf(temp_id) == -1) {
                            $(item).remove();
                        }
                    })

                $.each(selected_materalIds, function (ind, value) {
                    debugger;
                    var today = new Date();
                    var dd = today.getDate();
                    var mm = today.getMonth() + 1; //January is 0 so need to add 1 to make it 1!
                    var yyyy = today.getFullYear();
                    var hh = today.getHours();
                    var tmm = today.getMinutes();
                    if (dd < 10) {
                        dd = '0' + dd
                    }
                    if (mm < 10) {
                        mm = '0' + mm
                    }
                    if (hh < 10) {
                        hh = '0' + hh;
                    }
                    if (tmm < 10) {
                        tmm = '0' + tmm;
                    }
                    today = yyyy + '-' + mm + '-' + dd + 'T' + hh + ':' + tmm;

                    var material_text = $("#ContentPlaceHolder1_list_materials option[value='" + value + "' ]").text();
                    var alreayExist = $(".div_material_time .custom-date[data-tempid='" + value + "']");
                    if (alreayExist == undefined || alreayExist.length <= 0) {
                        var html = $("#template-material").html();
                        html = html.replaceAll('@value@', value);
                        html = html.replaceAll('@material_name@', material_text);
                        html = html.replaceAll('@date_validate@', today);
                        start_id_for_utc = value;
                        $(".div_material_time").append(html);
                    }
                });

            } else {
                $(".custom-date").remove();
            }
        }
        function Header_Click(isChecked) {
            if (isChecked.checked == true) {
                $('input[type="checkbox"]').each(function () {
                    this.checked = true;
                });
            }
            else {
                $('input[type="checkbox"]').each(function () {
                    this.checked = false;
                });
            }
        }
        function loadTimeZoneList() {
            let select = $("#dropdownTimeZone");
            $(select).empty();
            select.append(
                $('<option></option>').val("").html("Please Select")
            );
            let timeZones = moment.tz.names();
            timeZones.forEach((timeZone) => {
                select.append(
                    $('<option></option>').val(timeZone).html(`${timeZone} (GMT${moment.tz(timeZone).format('Z')})`)
                );
            });
        }

        function Validation_student() {
            debugger;
            var stud = 0;
            var chk_emp = $("input[name*=ddlstudentid]");
            for (var i = 0; i < chk_emp.length; i++) {
                if (chk_emp[i].checked) {
                    stud = 1;
                }
            }
            if (stud == 0) {
                alert('Select At list one Student')
                return false;
            }
            return true;
        }

        function checkvalidedate() {
            debugger;
            var all_date = $(".div_material_time .custom-date");
            for (var i = 0; i < all_date.length; i++) {
                var id = $(all_date[i]).attr("id")
                var item1 = $("#" + id + " .startdatecheck").val();
                var item2 = $("#" + id + " .stopdatecheck").val();
                var materialname = $($(".div_material_time  .custom-date div label")[i]).text();
                if (item1 != "" || item2 != "") {
                    if (item1 > item2) {
                        alert('Select Correct Date for ' + materialname)
                        return false;
                    }
                }
                else {
                    alert('Please Select Date' + materialname)
                    return false;
                }
            }
            return true;
        }
        function submitDate(value) {
            
            var tiemzone = $("#dropdownTimeZone option:selected").text();// document.getElementById("dropdownTimeZone").value;;
            if (tiemzone == "Please Select" || tiemzone == null) {
                $("#startdate_" + value).val("");
                alert("Please select timezone");
                return false;
            }
            else {

                //$("#<%=hidTimeZone.ClientID%>").val(tiemzone);
                let endlocalValue = $("#pickerDateTime_" + value).val();
                let startlocalValue = $("#startdate_" + value).val();
                let timeZoneValue = document.getElementById("dropdownTimeZone").value;
                let utcstartvalue = formatDate(getSelectedUTCValue(startlocalValue, timeZoneValue));
                let utcendvalue = formatDate(getSelectedUTCValue(endlocalValue, timeZoneValue));
                $("#hidstartutcdatetime_" + value + "").val(utcstartvalue);
                $("#hidstoputcdatetime_" + value + "").val(utcendvalue);
            }
        }

        function init() {
            loadTimeZoneList();
        }
        init();

        function loadDefaultDateTime() {
            $("#pickerDateTime_").val().value = moment().format('YYYY-MM-DDTHH:mm');
        }

        const DEFAULT_FORMAT = 'YYYY-MM-DDTHH:mm';

        function formatDate(momentDate) {
            return momentDate.format(DEFAULT_FORMAT);
        }

        function getSelectedUTCValue(localDateTime, timeZone) {
            return moment.tz(localDateTime, timeZone).utc();
        }

        function validateForm() {
            var checOnlykNum = /^[0-9]*$/;
            var flag = false;
            if ($("#<%=ddlgrade.ClientID%>").val() == "0")
                alert("Please select grade.");
            else if ($("#<%=ddlsubject.ClientID%>").val() == "0")
                alert("Please Select Subject.");
            else if ($("#<%=ddlclass.ClientID%>").val() == "0")
                alert("Please select class.");
            else if ($("#<%=ddltype.ClientID%>").val() == "0")
                alert("Please select Type");
            else if ($("#<%=ddlmode.ClientID%>").val() == "0")
                alert("Please select mode");
            else if ($("#<%=list_materials.ClientID%>").val() == "")
                alert("Please select Study Material.");
            else if ($("#dropdownTimeZone").val() == "")
                alert("Please select Timezone.");
            //else if (!Validation_student()) { }
            else if (!checkvalidedate()) { }
            else
                flag = true;

            return flag;

        }
        init();
        $("#<%=ddltype.ClientID%>").change(function () {
            var typeID = $("#<%=ddltype.ClientID%>").val();
            if (typeID == 1)
                $("#ContentPlaceHolder1_ddlmode option[value=3]").hide();
            else
                $("#ContentPlaceHolder1_ddlmode option[value=3]").show();
        });
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#assignmentList').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#shedule_assign').addClass('active');

            if ($("#<%=ddltype.ClientID%>").val() == 1)
                $("#ContentPlaceHolder1_ddlmode option[value=3]").hide();
            else
                $("#ContentPlaceHolder1_ddlmode option[value=3]").show();
        });
    </script>
</asp:Content>
