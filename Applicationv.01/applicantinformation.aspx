<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantinformation.aspx.cs" Inherits="applicantinformation" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active"></li>
        </ol>
        <h1 class="h2"></h1>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">

                        <div class="list-group list-group-fit">
                            <div runat="server" id="mainDiv"></div>

                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                        <asp:Button ID="btn_login" runat="server" Text="Save Changes" CssClass="btn btn-success" />
                                        <div class="col-md-6">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>





                <div id="page-nav" class="col-lg-auto page-nav">

                    <div>
                        <span id="tooltip"></span>
                    </div>


                </div>
            </div>
        </div>
    </div>

    <div class="container page__container">
        <div class="footer">
        </div>

    </div>

    <script>
        $(document).ready(function () {

            $(".form-control")
                .mouseover(function () {

                    var controlId = $(this).attr('id');
                    var title = $(this).attr('title');
                    $("#tooltip").text(title);
                });
            var controlarray = [];
            var validateControlArray = [];
            $.each($('.list-group-item'), function (i, attrib) {
                if ($(this).attr('controltype') === 'calendardropdownlist') {
                    const monthNames = ["January", "February", "March", "April", "May", "June",
                        "July", "August", "September", "October", "November", "December"
                    ];
                    var combineIDs = $(this).attr('calendardropid').split('|');
                   
                    var qntYears = 15;
                    var selectYear = $('#ContentPlaceHolder1_' + combineIDs[2]);
                    var selectMonth = $('#ContentPlaceHolder1_' + combineIDs[1]);
                    var selectDay = $('#ContentPlaceHolder1_' + combineIDs[0]);
                    var currentYear = new Date().getFullYear();

                    for (var y = 0; y < qntYears; y++) {
                        let date = new Date(currentYear);
                        var yearElem = document.createElement("option");
                        yearElem.value = currentYear
                        yearElem.textContent = currentYear;
                        selectYear.append(yearElem);
                        currentYear--;
                    }

                    for (var m = 0; m < 12; m++) {
                        let monthNum = new Date(2018, m).getMonth()
                        let month = monthNames[monthNum];
                        var monthElem = document.createElement("option");
                        monthElem.value = monthNum;
                        monthElem.textContent = month;
                        selectMonth.append(monthElem);
                    }

                    var d = new Date();
                    var month = d.getMonth();
                    var year = d.getFullYear();
                    var day = d.getDate();

                    selectYear.val(year);
                    selectYear.on("change", AdjustDays);
                    selectMonth.val(month);
                    selectMonth.on("change", AdjustDays);

                    AdjustDays();
                    selectDay.val(day)

                    function AdjustDays() {
                        var year = selectYear.val();
                        var month = parseInt(selectMonth.val()) + 1;
                        selectDay.empty();

                        //get the last day, so the number of days in that month
                        var days = new Date(year, month, 0).getDate();

                        //lets create the days of that month
                        for (var d = 1; d <= days; d++) {
                            var dayElem = document.createElement("option");
                            dayElem.value = d;
                            dayElem.textContent = d;
                            selectDay.append(dayElem);
                        }
                    }

                }
                if (typeof $(this).attr('expression') !== 'undefined') {
                    var controlshavetovalidate = {};
                    if ($(this).attr('required') == 'required') {
                        controlshavetovalidate["primary"] = 1;
                    }
                    controlshavetovalidate["controlid"] = $(this).attr('id');
                    controlshavetovalidate["regularexpression"] = $(this).attr('expression');
                    validateControlArray.push(controlshavetovalidate);
                }
                validateControlArray.push(controlshavetovalidate);
                if ($(this).attr('isdepedent') == 'True') {
                    var DepedentControls = {};
                    DepedentControls["depedendentvalue"] = $(this).attr('depedendentvalue');
                    DepedentControls["childcontroldivid"] = $(this).attr('id');
                    var depedentid = $(this).attr('depedentid')
                    $.each($('.list-group-item'), function (i, attrib) {
                        if ($(this).attr('formfieldid') == depedentid) {
                            DepedentControls["controltype"] = $(this).attr('controltype');
                            DepedentControls["parentcontrolid"] = $(this).attr('parentcontrolid');
                        }
                    });
                    controlarray.push(DepedentControls);
                }
            });

            // for (var i = 0; i < controlarray.length; i++)
            $.each(controlarray, function (index, value) {
                var dyanmiccontrol = value;
                console.log(controlarray);
                switch (dyanmiccontrol.controltype.toLowerCase()) {
                    case 'dropdownlist':
                        {
                            $('#ContentPlaceHolder1_' + dyanmiccontrol.parentcontrolid).change(function () {

                                if ($('#ContentPlaceHolder1_' + dyanmiccontrol.parentcontrolid + ' option:selected').text().toLowerCase() == dyanmiccontrol.depedendentvalue.toLowerCase()) {
                                    $('#' + dyanmiccontrol.childcontroldivid).css({ 'display': 'block' });
                                }
                                else { $('#' + dyanmiccontrol.childcontroldivid).css({ 'display': 'none' }); }
                            });
                        }
                    case 'radiobutton':
                        {
                            $('input:radio').click(function () {
                                if ($(this).attr('name').indexOf(dyanmiccontrol.parentcontrolid) > -1) {

                                    if ($('input[name="' + $(this).attr('name') + '"]:radio:checked').val().toLowerCase() == dyanmiccontrol.depedendentvalue.toLowerCase()) {
                                        $('#' + dyanmiccontrol.childcontroldivid).css({ 'display': 'block' });
                                    }
                                    else { $('#' + dyanmiccontrol.childcontroldivid).css({ 'display': 'none' }); }
                                }
                            });

                        }

                }

                //else if (dyanmiccontrol.controltype.toLowerCase() == "radiobutton") {

                //    $('#ContentPlaceHolder1_' + dyanmiccontrol.parentcontrolid).change(function () {
                //        if ($(this).val().toLowerCase() == dyanmiccontrol.depedendentvalue) {
                //            $('#' + dyanmiccontrol.childcontroldivid).css({ 'display': 'block' });
                //        }
                //        else { $('#' + dyanmiccontrol.childcontroldivid).css({ 'display': 'none' }); }
                //    });
                //}
            });

            // Set Dateformat for Calendar

            $("input[type='text']").each(function () {
                if ($(this).attr('data-toggle') == 'flatpickr') {
                    $('#' + $(this).attr('id')).flatpickr({
                        dateFormat: 'Y-m-d'
                    });
                }
            });
            // Bind Day,Month and Year Dropdown



        });


        //$('#ContentPlaceHolder1_txtCourseStartDate').flatpickr({

        //    dateFormat: 'Y-m-d'
        //});

        //$('#ContentPlaceHolder1_txtCourseEndate').flatpickr({

        //    dateFormat: 'Y-m-d'
        //});

        //document.getElementById("ContentPlaceHolder1_dob").flatpickr({
        //    wrap: true,
        //    weekNumbers: true,
        //    enableTime: true, // enables timepicker default is false    
        //    time_24hr: true, // set to false for AM PM default is false
        //    onChange: function (selectedDates, dateStr, instance) {
        //        console.log("changed");
        //    }
        //});



    </script>
</asp:Content>

