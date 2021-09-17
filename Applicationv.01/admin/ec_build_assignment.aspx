<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_build_assignment.aspx.cs" Inherits="admin_ec_build_assignment" MasterPageFile="~/admin/admin.master" EnableEventValidation="true"%>

<asp:Content ID="content3" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content runat="server" ID="content4" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item"><a href="#">MANAGE ASSIGNMENT</a></li>
            <li class="breadcrumb-item">BUILD AN ASSIGNMENTS</li>
        </ol>
        <h1 class="h2">BUILD AN ASSIGNMENTS</h1>
        <div class="row">
            <div class="col-md-8">
                <div class="card" id="Div1" runat="server">
                    <div class="tab-content card-body">
                        <div class="tab-pane active" id="first">
                          
                            <div class="form-group row">
                                <label for="name" class="col-sm-3 col-form-label form-label">Select Question type</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <asp:DropDownList runat="server" CssClass="form-control" ID="ddlquestiontype" AutoPostBack="true" OnSelectedIndexChanged="ddlquestiontype_SelectedIndexChanged">
                                                <asp:ListItem Value="0">Please Select</asp:ListItem>
                                                <asp:ListItem Value="1">MCQ</asp:ListItem>
                                                <asp:ListItem Value="2">True Or False</asp:ListItem>
                                                <asp:ListItem Value="3">Open Answer</asp:ListItem>
                                                <asp:ListItem Value="4">upload Answer</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="name" class="col-sm-3 col-form-label form-label">Add Question</label>
                                <div class="col-sm-8">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <asp:CheckBoxList runat="server" ID="chkQuestions" />
                                           <asp:HiddenField runat="server" ID="HidQueLine"/>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <div class="col-sm-8 offset-sm-3">
                                    <div class="media align-items-center">
                                        <div class="media-left">
                                            <asp:Button ID="Button1" runat="server" Text="Submit & Proceed" CssClass="btn btn-success" OnClick="Button1_Click" OnClientClick="return validateForm()" />
                                            <asp:Button ID="Button2" runat="server" Text="Go To Assign Student(s)" CssClass="btn btn-success" OnClick="Button2_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
             <div class="col-md-4">
                <div class="card card-checkbox-list" runat="server">
                    <div class="form-group row">
                        <%--<asp:Button ID="btnDeleteAll" Text="Clear All" runat="server" OnClientClick="return DeleteAllValues()" />--%>
                        <a onclick="openmodel()" style="color: rgba(33,150,243,.85);text-decoration: underline;">
                                        View Paper
                                    </a>
                        
                        <label for="name" class="col-sm-12 col-form-label form-label">Order of Question(s)</label>
                    </div>
                    <div class="">
                        <div style="margin-left:15px;">
                            <asp:Label runat="server" ID="lblOrder"/>
                        </div>
                        <div id="LanguagesDiv" runat="server">
                            <ol id="Languages" runat="server">
                            </ol>
                        </div>
                        <asp:ListBox runat="server" ID="lstQuestion" Visible="false"/>
                    </div>
                </div>
            </div>
        </div>
        </div>
    <script>
        $(document).ready(function () {
              $('.sidebar-menu-item').removeClass('open');
            $('#assignmentList').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#assignmentmaster').addClass('active');


            $("#<%=chkQuestions.ClientID %>").find('input[type="checkbox"]').click(function () {
                var leng = $(this).length;
             var id = $(this).val();
             var txt = $(this).next("label").text();

             if ($(this).is(':checked')) {
                 $("#<%=lstQuestion.ClientID%>").append($("<option></option>").attr("value", id).text(txt));
                 
             }
             else {
                 $("#<%=lstQuestion.ClientID %> option[value='" + id + "']").remove();
                 
             }
                
        });
        });

       function validateForm() {
            
           var flag = false;
            if ($("#<%=ddlquestiontype.ClientID%>").val() == "0")
                alert("Please select question type");
            else if($('input:checkbox').filter(':checked').length == 0)
                alert("Please select questions");
            else
                flag = true;

            return flag;

        }
   
         $("#<%=chkQuestions.ClientID %>").find('input[type="checkbox"]').click(function () {
                var leng = $(this).length;
             var id = $(this).val();
             var txt = $(this).next("label").text();

             if ($(this).is(':checked')) {
                 $("#<%=lstQuestion.ClientID%>").append($("<option></option>").attr("value", id).text(txt));
                 callAjax($("#<%=ddlquestiontype.ClientID%>").val(), id, "YES");
             }
             else {
                 $("#<%=lstQuestion.ClientID %> option[value='" + id + "']").remove();
                 callAjax($("#<%=ddlquestiontype.ClientID%>").val(), id, "NO");
             }
                
        });

        function callAjax(type, QID,ISadd) {
            $.ajax({
                type: "POST",
                url: "ec_build_assignment.aspx/QuestionSequence",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: "{'type': '" + type + "', 'QID': '" + QID + "', 'ISadd': '" + ISadd + "'}",
               success: function (response) {
                   if (response.d) {
                       
                       var result = JSON.parse(response.d);
                       $("#<%=lblOrder.ClientID %>").val("");
                       $("#<%=lblOrder.ClientID %>").hide();

                       const myArr = result.split("@");

                       var NodesString = "";
                       for (var i = 0; i < myArr.length-1; i++) {
                           NodesString += "<li>" + myArr[i] + "</li>";
                       }

                       var NodesString1 = "";
                       for (var i = 0; i < myArr.length - 1; i++) {
                           NodesString1 += i + 1 + ". " + myArr[i] + "<br/>";
                       }
                       $("#<%=lblOrder.ClientID %>").append(NodesString1);
                       
                       var UlElement = document.getElementById('Languages');
                       $("#<%=LanguagesDiv.ClientID %>").show();
                       $("#<%=Languages.ClientID %>").empty();
                       $("#<%=Languages.ClientID %>").append(NodesString);
                    }
                }
            });
        }
       <%--$(function () {
           $("[id*=btnDeleteAll]").bind("click", function () {
            $("#<%=lstQuestion.ClientID %> option").remove();
            //$("[id*=ContentPlaceHolder1_lstQuestion] option").remove();
        });--%>

        
        function openmodel() {
            var type = $("#<%=ddlquestiontype.ClientID%>").val();
            var assignmentid = '<%=assignmentid%>';

            $.ajax({
                type: "GET",
                url: "ec_build_assignment.aspx/Questionpaper",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: { type: type, assignmentid: assignmentid},
               success: function (response) {
                   if (response.d) {
                       var result = JSON.parse(response.d);
                       if (result.length > 0) {

                           var dg = '<div class="modal" id ="faq-ans-modal" style="padding-right: 415px;" tabindex ="-1" role ="dialog" ><div class="modal-dialog" role="document"><div class="modal-content"><div class="faq-modal-header modal-header">' +
                               '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div><div class="modal-body"><div class="faq-question">Review Paper: </div><div class="faq-answer"><div class="table-responsive"><table class="table table-bordered w-auto" style="margin: auto;font-size: 18px;"><tbody>';
                           var ad;
                           var name = result[0].assignmentName;
                           for (var i = 0; i < result.length; i++) {
                               var count = i + 1;
                               dg += '<tr><td>' + count + '</td> <td>' + result[i].question; + '</td></tr >';
                           }
                           dg += '</tbody ></table ></div ></div ></div ></div ></div ></div > '

                           $('body').append(dg);
                           $('#faq-ans-modal').modal('show');
                           $('#faq-ans-modal').on('hidden.bs.modal', function () {
                               $('#faq-ans-modal').remove();
                           });
                       }
                       //showQuestion(result[0].assignmentname, result.length);
                    }
                }
            });
        }
        function showQuestion(assignmentname, Questioncount) {
            var dg = '<div class="modal" id ="faq-ans-modal" tabindex ="-1" role ="dialog" ><div class="modal-dialog" style="width: 168%;" role="document"><div class="modal-content"><div class="faq-modal-header modal-header">' +
                '<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button></div><div class="modal-body"><div class="faq-question">Question Name : ' + assignmentname + '</div><div class="faq-answer"><div class="table-responsive"><table class="table table-bordered w-auto" style="margin: auto;font-size: 18px;"><tbody>';
            var ad;     
            for (var i = 1; i < Questioncount; i++) {
                ad += '<tr><td>'+i+' ) </td> <td>' + assignmentname + '</td></tr >';
                    }
                var fg ='</tbody ></table ></div ></div ></div ></div ></div ></div > '

            $('body').append(dg + ad + fg);
            $('#faq-ans-modal').modal('show');
            $('#faq-ans-modal').on('hidden.bs.modal', function () {
                $('#faq-ans-modal').remove();
            });
        }
    </script>
</asp:Content>