<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_conduct_class.aspx.cs" Inherits="admin_ec_conduct_class" MasterPageFile="~/admin/admin.master"%>

<asp:Content ID="content1" runat="server" ContentPlaceHolderID="head">
    <title></title>
    
    <script type="text/javascript">
        function ConfirmOnDelete() {
            if (confirm("Are you sure you want to start this class for all verified applicants ?") == true)
                return true;
            else
                return false;
        }
        
    </script>
</asp:Content>
<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">My Dashboard</a></li>
            <li class="breadcrumb-item"><a href="Default.aspx">Manage Classes</a></li>
            <li class="breadcrumb-item active">CONDUCT A CLASS</li>
        </ol>
        <table style="border:none;width:1600px !important;">
            <tr>
                <td><h1 class="h2">CONDUCT A CLASS</h1> </td>
                <td>
                    <h5>CLASS TIME: <%=class_start_datetime %></h5>
                    <h6>UTC: <%=class_start_datetime_utc%></h6>
                </td>
            </tr>
        
            </table>
         
        <div runat="server" id="creatediv" class="card">
            <div class="card-body">
                
                <table>
                    <tr>
                        <td>NUMBER OF STUDENTS ASSIGNED THIS CLASS :</td>
                        <td><input type="text" runat="server" class="form-control" style="width: 100px;border: 1px solid;text-align:center" id="lblstudent_assigned" /></td>
                        <td>
                            <div class="col-sm-12">
                            <asp:DropDownList runat="server" ID="rejectionlist" CssClass="form-control">
                                <asp:ListItem Value="0">Please select</asp:ListItem>
                                <%---Do not change the listitem spelling. acc check was there is exam_verification page --%>
                                <asp:ListItem Value="1">Verified</asp:ListItem>
                                <asp:ListItem Value="2">Not Present</asp:ListItem>
                                <asp:ListItem Value="3">Not Verified</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        </td>
                        <td> <div class="col-sm-4">
                            <asp:HiddenField runat="server" ID="selected_value_chk"/>
                            <asp:Button runat="server" ID="btnsave" class="btn btn-success" OnClick="btnsave_Click" OnClientClick="return validate()" Text="Submit" />
                        </div></td>
                    </tr>
                </table>
                
                    

            </div>
               
                <div id="refreshtbl" runat="server">
                     
                    <div class="form-group">
                        <div class="tab-content card-body">
                            <div class="tab-pane active" id="first1" style="white-space: nowrap">
                                <div class="table-responsive">
                                    <%--<asp:CheckBox ID="chkAll" Text="Select All" runat="server" onclick="javascript:Header_Click(this);" />--%>
                                    <table id="refreshtblcontent" class="table table-bordered" style="border: 1px solid #1b1c1c !important; text-align:center">
                                        <tr>
                                            <th style="border:1px solid #1b1c1c;">Record Id</th>
                                            <th style="border:1px solid #1b1c1c;">Select </th>
                                            <th style="border:1px solid #1b1c1c;">Applicant ID</th>
                                            <th style="border:1px solid #1b1c1c;">Applicant Name</th>
                                            <th style="border:1px solid #1b1c1c;">Login Status</th>
                                            <th style="border:1px solid #1b1c1c;">Login Time</th>
                                            <th style="border:1px solid #1b1c1c;">Verification Status</th>
                                        </tr>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="remainingapplicantDiv">

                    </div>
                </div>

            <div>

                <asp:button runat="server" id="btnstart" class="btn btn-success" onclick="btnstart_Click" text="Start Class" onclientclick="return ConfirmOnDelete()" />
                <label runat="server" id="lblexpired" style="font-weight: bold" />

            </div>
                </div>
        </div>
    
    <script>
        setInterval(persec, 5000);
        function persec() {
            var classID = <%=classID%>;
            var RecordID = <%=RecordID%>;

            refreshTableContent(classID, RecordID);
        }
           function refreshTableContent(classID,RecordID) {
            $.ajax({
                type: "GET",
                url: "ec_conduct_class.aspx/Getstudentstatus",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: { classID: classID, RecordID: RecordID},
                success: function (response) {
                    if (response.d) {
                        var result = JSON.parse(response.d);
                        $('#refreshtblcontent tr').slice(1).remove()
                        for (var i = 0; i < result.length; i++) {
                            var trHTML = '';
                            var style;
                            if (result[i].is_studentactiveforexam == "Logged In")
                                style = 'style ="color:green;border:1px solid #1b1c1c;"';
                            else
                                style = 'style ="color:red;border:1px solid #1b1c1c;"';

                            var id = result[i].assignid;
                            
                            var chk_box = '<input type="checkbox" value="'+id+'" name="chk" onclick="boxDisable(' + id + ');" id="'+id+'" disabled />';
                            
                            if (result[i].is_studentactiveforexam == "Logged In")
                                chk_box = '<input type="checkbox" value="'+id+'" name="chk" onclick="boxDisable(' + id + ');" id="' + id + '" />';
                            if (result[i].status == "" && result[i].is_studentactiveforexam == "Logged In")
                                chk_box = '<input type="checkbox" value="'+id+'" name="chk" onclick="boxDisable(' + id + ');" id="'+id+'" />';
                            if(result[i].Ischeck== "1")
                                chk_box='<input type="checkbox" value="'+id+'" name="chk" onclick="boxDisable(' + id + ');" id="'+id+'" checked />';
                            if (result[i].status != "")
                                chk_box = '';
                            //    //chk_box='<input type="checkbox" name="chk" onclick="boxDisable(' + id + ');" id="'+id+'" checked disabled />';
                           
                            
                            trHTML += '<tr><td style="border:1px solid #1b1c1c;">' + result[i].assignid + '</td><td style="border:1px solid #1b1c1c;">'+chk_box+'</td><td style="border:1px solid #1b1c1c;">' + result[i].applicantid + '</td><td style="border:1px solid #1b1c1c;">' + result[i].applicantname + '</td><td ' + style + '>' + result[i].is_studentactiveforexam + '</td><td style="border:1px solid #1b1c1c;">' + result[i].loggedintime + '</td><td style="border:1px solid #1b1c1c;">' + result[i].status + '</td>/tr>';
                            $('#refreshtblcontent').append(trHTML);
                        }
                        $("#<%=lblstudent_assigned.ClientID%>").val(result.length);
                    }
                }
            });
        }
        function GetSelected() {
            debugger;
            var chected = new Array();
            $("[name='chk']").each(function (index, data) {
                if (data.checked) {

                    chected.push(data.value +",");
                }
            });
            $("#<%=selected_value_chk.ClientID%>").val(chected);
            //alert(chected);
        }
        function validate() {
            debugger;
            var flag = false;
            if ($("#<%=rejectionlist.ClientID%>").val() == "0")
                alert("Please select action");
            else if ($('input[name="chk"]:checked').length == 0) 
                alert("Please select applicant");
            //else if ($('[name="ContentPlaceHolder1_questionList_chk_3"]').length != 0 && $('[name="ctl00$ContentPlaceHolder1$questionList$ctl03$chk"]:checked').length == 0) 
            //    alert("Please select checkbox .");
            
            else
                flag = true;

            if (flag == true)
                GetSelected();
            
            return flag;
            
        }

        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#classlist').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#createclass_service5').addClass('active');

            
        });
        
         function callAjax(QID,ISadd,rejectionID) {
            $.ajax({
                type: "POST",
                url: "ec_conduct_class.aspx/QuestionSequence",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'QID': '" + QID + "', 'ISadd': '" + ISadd + "', 'rejectionID': '" + rejectionID + "'}",
               success: function (response) {
                   if (response.d) {

                       var result = JSON.parse(response.d);

                   }      
                }
            });
        }
        function boxDisable(t) {
            var ckbox = $('#' + t + '');
             if (ckbox.is(':checked')) 
                    callAjax(t, "YES", $("#<%=rejectionlist.ClientID%>").text());
                else 
                callAjax(t, "NO", $("#<%=rejectionlist.ClientID%>").text());

          <%--  if ($("#<%=rejectionlist.ClientID%>").val() == "0") {
                ckbox.prop('checked', false);
                alert("Please select action");
                return false;
            }
            else {
                if (ckbox.is(':checked')) 
                    callAjax(t, "YES", $("#<%=rejectionlist.ClientID%>").text());
                else 
                    callAjax(t, "NO", $("#<%=rejectionlist.ClientID%>").text());
            }--%>

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
    </script>
</asp:Content>