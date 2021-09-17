<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_assignment_scheduleassign_edit.aspx.cs" Inherits="admin_ec_assignment_scheduleassign_edit" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.13.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment-timezone/0.5.3/moment-timezone-with-data.min.js"></script>
    <div class="container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item"><a href="ec_assignment_scheduleassign_master.aspx">MANGE ASSIGNMENTS</a></li>
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
                                <ContentTemplate>--%>
                            <div class="form-group row" id="group">
                                <label for="name" class="col-sm-3 col-form-label form-label">Select Grade</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <asp:DropDownList disabled runat="server" ID="ddlgrade" class="form-control" style="width:160%" OnSelectedIndexChanged="ddlgrade_SelectedIndexChanged" AutoPostBack="true" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row" id="examsubject">
                                <label for="name" class="col-sm-3 col-form-label form-label">Select Subject</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <asp:DropDownList disabled runat="server" ID="ddlsubject" class="form-control" style="width:160%"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                           
                            <%--<div class="form-group row" id="subject">
                                <label for="name" class="col-sm-3 col-form-label form-label">Select Start Date</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <asp:DropDownList disabled runat="server" ID="ddlstartdate" class="form-control" OnSelectedIndexChanged="ddlstartdate_SelectedIndexChanged" AutoPostBack="true" />
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                            <div class="form-group row" id="type">
                                <label for="name" class="col-sm-3 col-form-label form-label">Type</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <asp:DropDownList disabled runat="server" ID="ddltype" class="form-control" style="width:160%">
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
                                            <asp:DropDownList disabled runat="server" ID="ddlmode" style="width:160%" class="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlmode_SelectedIndexChanged">
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
                                            <asp:DropDownList disabled runat="server" ID="ddlclass" style="width:160%" class="form-control" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row" id="studrymaterial">
                                <label for="name" class="col-sm-3 col-form-label form-label">Select Assignments</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <asp:ListBox runat="server" ID="list_materials" SelectionMode="Multiple" onchange="javascript:createFacilityBlock();" CssClass="form-control"></asp:ListBox>
                                            <%--<asp:ListBox runat="server" ID="list_materials" SelectionMode="Multiple" AutoPostBack="true" OnSelectedIndexChanged="list_materials_SelectedIndexChanged" CssClass="form-control"></asp:ListBox>--%>
                                            <label style="color: black; width:160%;"><i class="fa fa-info-circle" aria-hidden="true"></i> Ctrl/Command Click to select multiple options</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row" id="timezone">
                                <label for="name" class="col-sm-3 col-form-label form-label">Time Zone</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <select id="dropdownTimeZone" name="timezone" style="width:160%" class="form-control">
                                                <option value="">Please select</option>
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
                            <%--<div class="form-group row" id="material_time">                                
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <div runat="server" id="div_material_time"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                            <div runat="server" class="div_material_time" id="div_material_time">
                            </div>
                            <%--</ContentTemplate>--%>
                            <%--<triggers>
                                <asp:PostBackTrigger ControlID="btn_submit"></asp:PostBackTrigger>
                            </triggers>--%>
                            <%--</asp:UpdatePanel>--%>
                            <%--<div class="form-group row">
                                <div class="col-sm-8 offset-sm-3">
                                    <div class="media align-items-center">
                                        <div class="media-left">--%>
                            <center>
                                <asp:Button ID="btn_submit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btn_submit_Click" OnClientClick="return validateForm()" />
                            </center>
                            <%-- <div class="col-md-20">
                                                <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
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
                <label style="font-weight:bold; font-size:20px;">@material_name@</label>
            </div>
            <label for="startdate_1" class="col-sm-3 col-form-label form-label" style="margin-top:20px;">Starts Showing At </label>
            <div class="col-sm-8">
                <div class="row">
                    <div class="col-md-8" style="margin-top: 20px;">
                        <input type="datetime-local" class="form-control startdatecheck" style="width:160%;"<%--min="@date_validate@"--%> onchange="submitDate(@value@)" name="startdate_@value@" value="@s_value@" id="startdate_@value@">
                        <input type="text" class="form-control" style="display: none;" name="hidstartutcdatetime_@value@" value="@utc_start_date@" id="hidstartutcdatetime_@value@">
                    </div>
                    <div class="col-md-1" style="margin-top: 19px;">
                    </div>
                 </div>
            </div>
            <label for="deadline_1" class="col-sm-3 col-form-label form-label" style="margin-top:20px;">Stop Showing At</label>
            <div class="col-sm-8">
                <div class="row">
                    <div class="col-md-8" style="margin-top: 20px;">
                        <input type="datetime-local" id="pickerDateTime_@value@" style="width:160%;" <%--min="@date_validate@"--%> onchange="submitDate(@value@)" name="pickerDateTime_@value@" value="@p_value@" class="form-control stopdatecheck">
                        <input type="text" class="form-control" style="display: none;" name="hidstoputcdatetime_@value@" value="@utc_stopdate_date@" id="hidstoputcdatetime_@value@">
                    </div>
                </div>
            </div>
        </div>
    </script>
    <script>
        //JSON.parse(JSON.stringify([{"asmd_id":7,"asmd_asm_id":21,"asmd_material_id":3,"asmd_start_date":"2021-07-23T19:22:00","asmd_stop_time":"2021-07-22T15:23:00"}]));
        var materialData = JSON.parse(JSON.stringify(<%=Session["edit_material_data"]%>));
        var timezonee = "";
        var start_id_for_utc;
        function GenerateMaterialControl() {
            if (materialData != null && materialData != undefined && materialData.length > 0) {
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
                $.each(materialData, function (ind, item) {

                    var html = $("#template-material").html();
                    html = html.replaceAll('@value@', item.assignment_id);
                    html = html.replaceAll("@s_value@", item.asmd_start_date);
                    html = html.replaceAll("@p_value@", item.asmd_stop_time);
                    html = html.replaceAll('@material_name@', item.assignment_name);
                    html = html.replaceAll('@utc_start_date@', item.asmd_start_utc_date);
                    html = html.replaceAll('@utc_stopdate_date@', item.asm_stop_utc_date);
                    html = html.replaceAll('@date_validate@', today);
                    timezonee = item.asm_time_zone;
                    start_id_for_utc = item.assignment_id;
                    $(".div_material_time").append(html);
                })
            }
        }

        GenerateMaterialControl();
        function createFacilityBlock() {
            var hfFacilityCount = $("#<%=hidFacilityCount.ClientID %>");
            var selected_materalIds = $("#ContentPlaceHolder1_list_materials").val();
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
                        html = html.replaceAll("@s_value@", "");
                        html = html.replaceAll("@p_value@", "");
                        html = html.replaceAll('@date_validate@', today);
                        $(".div_material_time").append(html);
                    }
                });

            } else {
                $(".custom-date").remove();
            }
        }
    </script>

    <script>
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
        init();

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
            var objSelect = document.getElementById("dropdownTimeZone");
            for (var i = 0; i < objSelect.options.length; i++) {
                if (objSelect.options[i].value == timezonee) {
                    objSelect.options[i].selected = true;
                    return;
                }
            }
        }
        function init() {
            loadTimeZoneList();
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
        function submitDate(value) {
            var tiemzone = $("#dropdownTimeZone option:selected").text();// document.getElementById("dropdownTimeZone").value;
            //$("#<%=hidTimeZone.ClientID%>").val(tiemzone);
            let endlocalValue = $("#pickerDateTime_" + value).val();
            let startlocalValue = $("#startdate_" + value).val();
            let timeZoneValue = document.getElementById("dropdownTimeZone").value;
            let utcstartvalue = formatDate(getSelectedUTCValue(startlocalValue, timeZoneValue));
            let utcendvalue = formatDate(getSelectedUTCValue(endlocalValue, timeZoneValue));
            $("#hidstartutcdatetime_" + value + "").val(utcstartvalue);
            $("#hidstoputcdatetime_" + value + "").val(utcendvalue);
        }
        const DEFAULT_FORMAT = 'YYYY-MM-DDTHH:mm';
        function formatDate(momentDate) {
            return momentDate.format(DEFAULT_FORMAT);
        }
        function getSelectedUTCValue(localDateTime, timeZone) {
            return moment.tz(localDateTime, timeZone).utc();
        }

        function checkvalidedate() {
            var all_date = $(".div_material_time .custom-date");
            for (var i = 0; i < all_date.length; i++) {
                var id = $(all_date[i]).attr("id")
                var item1 = $("#" + id + " .startdatecheck").val();
                var item2 = $("#" + id + " .stopdatecheck").val();
                var materialname = $($(".div_material_time  .custom-date div label")[i]).text();
                if (item1 != "" || item2 != "") {
                    if (item1 > item2) {
                        alert('Select Correct Date  ' + materialname)
                        return false;
                    }
                }
                else {
                    alert("Please Select Date " + materialname)
                    return false;
                }
            }
            return true;
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
                alert("Please select type");
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
    </script>
    <script>
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
         $("#<%=ddltype.ClientID%>").change(function () {
            var typeID = $("#<%=ddltype.ClientID%>").val();
            if (typeID == 1)
                $("#ContentPlaceHolder1_ddlmode option[value=3]").hide();
            else
                $("#ContentPlaceHolder1_ddlmode option[value=3]").show();
        });
    </script>
</asp:Content>
