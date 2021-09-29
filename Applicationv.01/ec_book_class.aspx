<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_book_class.aspx.cs" Inherits="ec_book_class" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <style>
        .ui-accordion-header:hover {
            color: black;
        }

        .ui-accordion-header {
            background: unset;
            color: black;
            text-decoration: solid;
        }
    </style>

    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">MY DASHBOARD</a></li>
            <li class="breadcrumb-item active">BOOK A CLASS</li>
        </ol>
        <h1 class="h2">BOOK A CLASS</h1>

    </div>
    <div class="page ">
        <div class="container page__container" style="padding-left: 8px;">
            <div class="row" style="margin-right: -1.625rem;">
                <div class="col-md-8">
                    <div class="card">

                        <div class="">

                            <div class="row" style="margin-left: -40px;margin-top:10px;">
                                <div class="col-md-2.5" style="display: inline-block;margin-right:10px;">
                                    <asp:DropDownList runat="server" ID="ddlgrade" class="form-control" />
                                    <asp:HiddenField runat="server" ID="HidSelectedGrade" />
                                </div>
                                <div class="col-md-2.5" style="display: inline-block;margin-right:10px;">
                                    <asp:DropDownList runat="server" ID="ddlsubject" class="form-control" />
                                    <asp:HiddenField runat="server" ID="HidSelectedSubject" />
                                </div>
                                <div class="col-md-2.5" style="display: inline-block;margin-right:10px;">
                                    <asp:DropDownList runat="server" ID="ddltype" class="form-control" />
                                    <asp:HiddenField runat="server" ID="HidselectedType" />
                                </div>
                                <div class="col-md-2.5" style="display: inline-block;margin-right:10px;">
                                    <asp:DropDownList runat="server" ID="ddlMode" class="form-control" />
                                    <asp:HiddenField runat="server" ID="HidselectedMode" />
                                </div>
                                <div class="col-md-2" style="display: inline-block;margin-right:10px;" id="locationDiv" runat="server">
                                    <asp:DropDownList runat="server" ID="ddllocation" class="form-control" />
                                    <asp:HiddenField runat="server" ID="HidselectedLocation" />
                                </div>
                            </div>

                            <div class="">
                                <label class="form-group m-0" for="enrollmentyear" aria-labelledby="label-password"></label>
                                <div class="col-sm-8 offset-sm-5">
                                    <asp:Button ID="btnsearchcourse" runat="server" Text="Search" CssClass="btn btn-success" OnClick="btnsearchcourse_Click" OnClientClick="return ac()" />
                                </div>
                            </div>

                            <div id="coursegrid" runat="server" style="display: none" class="course-table-wrpr">
                                <div class="card">
                                    <div class="card-body">
                                        <asp:HiddenField runat="server" ID="Hidresultcount" />
                                        <label runat="server" style="font-size: 17px; font-weight: 500;">
                                            Search Results:
                                    <label runat="server" id="lblresultcount"></label>
                                            Classes Found.
                                        </label>
                                        <div class="table-responsive">
                                            <asp:GridView ID="courseGridView"
                                                CssClass="table"
                                                runat="server"
                                                AutoGenerateColumns="False"
                                                ShowFooter="false"
                                                CellPadding="3"
                                                AllowPaging="true"
                                                PageSize="7"
                                                BorderStyle="None"
                                                BorderWidth="1px" DataKeyNames="id" Font-Size="12px"
                                                CellSpacing="2" ShowHeaderWhenEmpty="true" EmptyDataText="No courses found. Change your preferences above and retry." OnPageIndexChanging="courseGridView_PageIndexChanging">

                                                <Columns>
                                                    <asp:TemplateField HeaderText="">
                                                        <ItemTemplate>
                                                            <asp:RadioButton runat="server" ID="selectedRB" OnClick="javascript:SelectSingleRadiobutton(this.id)"></asp:RadioButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Class Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCourse" runat="server" Text='<%# Bind("classname") %>'></asp:Label>
                                                            <asp:HiddenField runat="server" ID="courseid" Value='<%# Bind("id") %>' />

                                                            <asp:HiddenField ID="lblgrade" runat="server" Value='<%# Bind("grade") %>'></asp:HiddenField>
                                                            <asp:HiddenField ID="lblgrade_id" runat="server" Value='<%# Bind("grade_id") %>'></asp:HiddenField>
                                                            <asp:HiddenField ID="lblsubject" runat="server" Value='<%# Bind("subject") %>'></asp:HiddenField>
                                                            <asp:HiddenField ID="lblsubject_id" runat="server" Value='<%# Bind("subject_id") %>'></asp:HiddenField>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Type">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbltype" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                                                            <asp:HiddenField runat="server" ID="HidtypeID" Value='<%# Bind("type_id") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Mode">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblmode" runat="server" Text='<%# Bind("mode") %>'></asp:Label>
                                                            <asp:HiddenField runat="server" ID="HidmodeID" Value='<%# Bind("mode_id") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Fee">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblfee" runat="server" Text='<%# Bind("fee_amount") %>'></asp:Label>
                                                            <asp:HiddenField runat="server" ID="Hidfee" Value='<%# Bind("fee_amount") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Start Date">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblstartdate" runat="server" Text='<%# Bind("startdate") %>'></asp:Label>
                                                            <asp:HiddenField runat="server" ID="Hidstartdate_utc" Value='<%# Bind("startdate_utc") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Apply By">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblbookingdeadline" runat="server" Text='<%# Bind("bookingdeadline") %>'></asp:Label>
                                                            <asp:HiddenField runat="server" ID="Hidbookingdeadline_utc" Value='<%# Bind("bookingdeadline_utc") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>

                                                    <%-- <asp:TemplateField HeaderText="Course Tuition Fee (in Australian Dollars)"><ItemTemplate>
                                                    <asp:Label ID="lblcurrency" runat="server" Text='<%# Bind("currencysymbol") %>'></asp:Label>
                                                    <asp:Label ID="lblCoursefee" runat="server" Text='<%# Bind("coursefee") %>'></asp:Label>
                                                    <asp:HiddenField runat="server" ID="HidSelectedcampusCityID" Value='<%#Bind("campuscityID") %>' />
                                                    <asp:HiddenField runat="server" ID="HidSelectedcampusCityName" Value='<%#Bind("campuscityname") %>' />
                                                    <asp:HiddenField runat="server" ID="HidSelectedcampusCountryID" Value='<%#Bind("campuscontryID") %>' />
                                                    <asp:HiddenField runat="server" ID="HidSelectedcampusCountryName" Value='<%#Bind("campuscountryName") %>' />
                                                    <asp:HiddenField runat="server" ID="HidlevelofstudyID" Value='<%# Bind("levelodstudyID") %>' />
                                                    <asp:HiddenField runat="server" ID="Hidlbllevelofstudy" Value='<%#Bind("levelodstudy") %>' />
                                                    <asp:HiddenField runat="server" ID="HidmajorDisciplineID" Value='<%# Bind("majorID") %>' />
                                                    <asp:HiddenField runat="server" ID="Hidlblmajor" Value='<%# Bind("major") %>' />
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                                                </Columns>
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body" style="margin-bottom: 40%;">
                            <asp:HiddenField runat="server" ID="HidpreferenceID" />
                            <%--<label style="font-size: 77%;">You may apply for a maximum of 5 courses</label>--%>
                            <label id="lblInstructionHeader" runat="server" style="font-size: medium; font-weight: bold;">You Have Applied For :</label><br />


                            <% if (appliedcourseData.Count > 0)
                                { %>
                            <ol style="font-size: small; padding-left: 15px;">
                                <% for (int i = 0; i < appliedcourseData.Count; i++)
                                    { %>
                                <li>
                                    <%= appliedcourseData[i].classname %>
                                </li>
                                <% } %>
                            </ol>
                            <%}
                                else
                                {%>
                            <label runat="server">No Applied Classes.</label>
                            <%} %>
                        </div>
                    </div>
                    <div id="courseInfo" style="display: none">
                        <div class="card">
                            <div class="card-body">
                                <%-- <div>
                                    <label style="font-size: small;">For more details about this course, visit <u><a href='#' id="courselink" target="_blank"> <%= universityname %>’s course page </a> </u></label>
                                </div>--%>
                                <div id="selectedcourseDiv" style="font-size: smaller; display: none" class="table-responsive">
                                    <table>
                                        <tr>
                                            <td colspan="2">
                                                <label runat="server" id="lblCourseName" style="font-size: 17px; font-weight: 500;"></label>
                                                <asp:HiddenField runat="server" ID="Hidcoursename" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: initial;">About This Class :</td>
                                            <td>
                                                <label runat="server" id="lblclassdescription"></label>
                                                <asp:HiddenField runat="server" ID="HidClassid" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: initial;">Grade :</td>
                                            <td>
                                                <label runat="server" id="lblgarde"></label>
                                                <asp:HiddenField runat="server" ID="lblgradeid" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: initial;">Subject :</td>
                                            <td>
                                                <label runat="server" id="lblsubject"></label>
                                                <asp:HiddenField runat="server" ID="HidsubjectID" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: initial;">Type : </td>
                                            <td>
                                                <label runat="server" id="lbltype"></label>
                                                <asp:HiddenField runat="server" ID="HidtypeID" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: initial;">Mode :</td>
                                            <td>
                                                <label runat="server" id="lblmode"></label>
                                                <asp:HiddenField runat="server" ID="HidmodeID" />
                                            </td>
                                        </tr>
                                        <tr style="display: none;">
                                            <td style="vertical-align: initial;">Location :</td>
                                            <td>
                                                <label runat="server" id="lbllocation"></label>
                                                <asp:HiddenField runat="server" ID="HidlocationID" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: initial;">Fee :</td>
                                            <td>
                                                <label runat="server" id="lblfee"></label>
                                                <asp:HiddenField runat="server" ID="Hidfee_currencyID" />
                                                <asp:HiddenField runat="server" ID="Hidfee_amount" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: initial;">Start Date :</td>
                                            <td>
                                                <label runat="server" id="lblstartdate"></label>
                                                <asp:HiddenField runat="server" ID="Hidlblstartdate" />
                                                <asp:HiddenField runat="server" ID="Hidlblstartdate_utc" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: initial;">Apply By :</td>
                                            <td>
                                                <label runat="server" id="lblapplyby"></label>
                                                <asp:HiddenField runat="server" ID="lblapplyby_utc"></asp:HiddenField>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: initial;">Duration :</td>
                                            <td>
                                                <label runat="server" id="lblDuration"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: initial;">Class Start Time :</td>
                                            <td>
                                                <label runat="server" id="lblclassstarttime"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: initial;">Class End Time :</td>
                                            <td>
                                                <label runat="server" id="lblclassendtime"></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: initial;">Requirements :</td>
                                            <td>
                                                <label runat="server" id="lblEligibility"></label>
                                            </td>
                                        </tr>
                                        <tr id="eligibilityresponse" runat="server">
                                            <td>Do you meet the requirement(s) for this class:</td>
                                            <td>
                                                <input type="radio" runat="server" id="yesRB" name="eligibility" style="margin-right: 5px;" onclick="btntoshow('Yes')" />Yes
                                           <input type="radio" runat="server" id="NoRB" name="eligibility" style="margin-right: 5px;" onclick="btntoshow('No')" />NO
                                            </td>
                                        </tr>
                                        <%--<tr id="eligibilityresponseNote" style="display: none" runat="server">
                                            <td></td>
                                            <td>
                                                <label>*If you do not meet the eligibility criteria, you may still apply for this course; our counsellors would recommend a pathway program</label></td>
                                        </tr>
                                        <tr>
                                            <td style="vertical-align: initial;">Select the date you want to start this Course :
                                           <asp:HiddenField runat="server" ID="HidSelectedDateID" />
                                           <asp:HiddenField runat="server" ID="HidSelectedDateText" />
                                            </td>
                                            <td id="commencementDateContainer" style="vertical-align: initial;"</td>
                                        </tr>--%>
                                        <tr>
                                            <td colspan="2">
                                                <asp:Button runat="server" ID="savedata" Text="Submit an Application" CssClass="btn btn-success" OnClick="savedata_Click" OnClientClick="return validatecourseInfo()" />
                                                <asp:HiddenField runat="server" ID="recordsaveDateTime" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <%-- <div class="row" style="margin-right: -1.625rem;">
                <div class="col-md-8">
                    
                    <div class="card">
                        <div style="margin-left:60%">
                            <asp:Button ID="gotoNextPage" runat="server" Text="Go to Your SOP section" CssClass="btn btn-success" onclick="gotoNextPage_Click"/>
                        </div>                        
                    </div>
                </div>
                <div class="col-md-4">
                  
                </div>
            </div>--%>

            <div id="page-nav" class="col-lg-auto page-nav">
                <div>
                    <span id="tooltip"></span>
                </div>
            </div>
        </div>
    </div>

    <script>
        function ac() {
            var flag = false;
            if ($("#<%=ddlgrade.ClientID%>").val() == "0")
                alert("Please select grade");
            else if ($("#<%=ddlsubject.ClientID%>").val() == "0")
                alert("Please select subject");
            else
                flag = true;
            return flag;
        }
        function validateform() {

        }

        function SelectSingleRadiobutton(rdbtnid) {
            var rdBtn = document.getElementById(rdbtnid);
            var rdBtnList = document.getElementsByTagName("input");
            for (i = 0; i < rdBtnList.length; i++) {
                if (rdBtnList[i].type == "radio" && rdBtnList[i].id != rdBtn.id)
                    rdBtnList[i].checked = false;
            }
            var radioBtnId = rdbtnid.replace("ContentPlaceHolder1_courseGridView_selectedRB_", "");
            getInfo(radioBtnId);
        }

        function getInfo(id) {
            $("#selectedcourseDiv").show();
            $("#courseInfo").show();

            //data from grid
            var courseid = $("#ContentPlaceHolder1_courseGridView_courseid_" + id).val();

            var coursename = $("#ContentPlaceHolder1_courseGridView_lblCourse_" + id).text();

            var grade = $("#ContentPlaceHolder1_courseGridView_lblgrade_" + id).val();
            var grade_ID = $("#ContentPlaceHolder1_courseGridView_lblgrade_id_" + id).val();

            var subject = $("#ContentPlaceHolder1_courseGridView_lblsubject_" + id).val();
            var subject_ID = $("#ContentPlaceHolder1_courseGridView_lblsubject_id_" + id).val();

            //var type = $("#ContentPlaceHolder1_courseGridView_lbltype_" + id).val();
            //var type_ID = $("#ContentPlaceHolder1_courseGridView_HidtypeID_" + id).val();

            //var mode = $("#ContentPlaceHolder1_courseGridView_lblmode_" + id).val();
            //var mode_ID = $("#ContentPlaceHolder1_courseGridView_HidmodeID_" + id).val();

            //var location = $("#ContentPlaceHolder1_courseGridView_lbllocation_" + id).val();
            //var location_ID= $("#ContentPlaceHolder1_courseGridView_HidlocationID_" + id).val();

            //var fee = $("#ContentPlaceHolder1_courseGridView_lblfee_" + id).val();

            //var startdate = $("#ContentPlaceHolder1_courseGridView_lblstartdate_" + id).val();
            //var startdateUTC= $("#ContentPlaceHolder1_courseGridView_Hidstartdate_utc_" + id).val();

            //var deadlinedate= $("#ContentPlaceHolder1_courseGridView_lblbookingdeadline_" + id).val();
            //var deadlinedateUTC= $("#ContentPlaceHolder1_courseGridView_Hidbookingdeadline_utc_" + id).val();

            $("#<%= lblCourseName.ClientID%>").val(coursename).html(coursename);
            $("#<%= lblgarde.ClientID%>").val(grade).html(grade);
            $("#<%= lblgradeid.ClientID%>").val(grade_ID).html(grade_ID);

            $("#<%= lblsubject.ClientID%>").val(subject).html(subject);
            $("#<%= HidsubjectID.ClientID%>").val(subject_ID).html(subject_ID);



            $.ajax({
                type: "POST",
                url: "ec_book_class.aspx/GetCourseDetails",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'courseid': '" + courseid + "'}",
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);

                        $("#<%= HidClassid.ClientID%>").val(courseid).html(courseid);
                        $("#<%= lblclassdescription.ClientID%>").val(result[0].classdescription).html(result[0].classdescription);
                        $("#<%= lblEligibility.ClientID%>").val(result[0].eligibility).html(result[0].eligibility);
                        $("#<%= lblDuration.ClientID%>").val(result[0].courseduration).html(result[0].courseduration);

                        $("#<%= lbltype.ClientID%>").val(result[0].type).html(result[0].type);
                        $("#<%= HidtypeID.ClientID%>").val(result[0].type_id).html(result[0].type_id);

                        $("#<%= lblmode.ClientID%>").val(result[0].mode).html(result[0].mode);
                        $("#<%= HidmodeID.ClientID%>").val(result[0].mode_id).html(result[0].mode_id);

                        $("#<%= lbllocation.ClientID%>").val(result[0].location).html(result[0].location);
                        $("#<%= HidlocationID.ClientID%>").val(result[0].location_id).html(result[0].location_id);

                        $("#<%= lblfee.ClientID%>").val(result[0].fee_amount).html(result[0].fee_amount);
                        $("#<%= lblstartdate.ClientID%>").val(result[0].startdate).html(result[0].startdate);
                        $("#<%= Hidlblstartdate_utc.ClientID%>").val(result[0].startdate_utc).html(result[0].startdate_utc);

                        $("#<%= lblapplyby.ClientID%>").val(result[0].bookingdeadline).html(result[0].bookingdeadline);
                        $("#<%= lblapplyby_utc.ClientID%>").val(result[0].bookingdeadline_utc).html(result[0].bookingdeadline_utc);

                        $("#<%= lblclassstarttime.ClientID%>").val(result[0].classstarttime).html(result[0].classstarttime);
                        $("#<%= lblclassendtime.ClientID%>").val(result[0].classendtime).html(result[0].classendtime);
                        $("#<%= Hidfee_currencyID.ClientID%>").val(result[0].currencyId).html(result[0].currencyId);
                        $("#<%= Hidfee_amount.ClientID%>").val(result[0].fee_amountID).html(result[0].fee_amountID);
                    }
                }
            });
            //scroll to top of info div
            //$(window).scrollTop($('#InfoRow').offset().top);
            //getcommencemntsDates(courseid);
            //getcareerOutcomes(courseid);
        };

        function validatecourseInfo() {
            if (!$("#<%=eligibilityresponse.ClientID%>").is(':hidden') && !($("#<%=yesRB.ClientID%>").is(':checked') || $("#<%=NoRB.ClientID%>").is(':checked'))) {
                alert("Please Select Option to record eligibility response");
                return false;
            }
            //else if ($('[name="commencementdate"]').length != 0 && $('[name="commencementdate"]:checked').length == 0) {
            //    alert("Please select Commencement Date .");
            //    return false;
            //}
            //else if ($("#ContentPlaceHolder1_HidpreferenceID").val() > 5) {
            //    alert("You can apply for maximum 5 courses");
            //    return false;
            //}
        }

          $("#<%=ddlMode.ClientID%>").change(function () {
            var modeID = $("#<%=ddlMode.ClientID%>").val();
            if (modeID == 2) 
                $("#<%=locationDiv.ClientID%>").hide();
            else
                $("#<%=locationDiv.ClientID%>").show();
        });

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#studentapplication_list').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#ec_bookkclass').addClass('active');

            if ($("#<%=ddltype.ClientID%>").val() == 1)
                $("#ContentPlaceHolder1_ddlmode option[value=3]").hide();
            else
                $("#ContentPlaceHolder1_ddlmode option[value=3]").show();

            if ($("#<%=ddlMode.ClientID%>").val() == 2)
                $("#<%=locationDiv.ClientID%>").hide();
            else
                $("#<%=locationDiv.ClientID%>").show();

        });
        $("#<%=ddltype.ClientID%>").change(function () {
            var typeID = $("#<%=ddltype.ClientID%>").val();
            if (typeID == 1)
                $("#ContentPlaceHolder1_ddlmode option[value=3]").hide();
            else
                $("#ContentPlaceHolder1_ddlmode option[value=3]").show();
        });

        //$(document).keydown(function (event) {
        //    if (event.keyCode == 123) { // Prevent F12
        //        return false;
        //    } else if (event.ctrlKey && event.shiftKey && event.keyCode == 73) { // Prevent Ctrl+Shift+I        
        //        return false;
        //    }
        //});
        //$(document).on("contextmenu", function (e) {   //prevent inspect     
        //    e.preventDefault();
        //});
        function btntoshow(btn) {
            if (btn == "Yes") {
                $("#<%=savedata.ClientID%>").removeAttr('disabled')
                $("#<%=savedata.ClientID%>").val("");
                $("#<%=savedata.ClientID%>").val("Submit an Application");
            }
            else {
                $("#<%=savedata.ClientID%>").attr("disabled", "disabled");
                $("#<%=savedata.ClientID%>").val("");
                $("#<%=savedata.ClientID%>").val("Sorry!You Cannot Apply");
            }
        }
        $("#<%=ddlgrade.ClientID%>").change(function () {
            var gradeID = $("#<%=ddlgrade.ClientID%>").val();
            $("#<%=HidSelectedGrade.ClientID%>").val(gradeID);
        });

        $("#<%=ddlsubject.ClientID%>").change(function () {
            var subjectID = $("#<%=ddlsubject.ClientID%>").val();
            $("#<%=HidSelectedSubject.ClientID%>").val(subjectID);
        });

        $("#<%=ddltype.ClientID%>").change(function () {
            var typeID = $("#<%=ddltype.ClientID%>").val();
            $("#<%=HidtypeID.ClientID%>").val(gradeID);
        });

        $("#<%=ddlMode.ClientID%>").change(function () {
            var modeID = $("#<%=ddlMode.ClientID%>").val();
            $("#<%=HidselectedMode.ClientID%>").val(modeID);
        });

        $("#<%=ddllocation.ClientID%>").change(function () {
            var locationID = $("#<%=ddllocation.ClientID%>").val();
            $("#<%=HidselectedLocation.ClientID%>").val(locationID);
        });
    </script>
</asp:Content>
