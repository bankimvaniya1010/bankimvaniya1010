<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_mcq_create.aspx.cs" Inherits="admin_ec_mcq_create" MasterPageFile="~/admin/admin.master"%>


<asp:Content ID="content2" runat="server" ContentPlaceHolderID="head">
</asp:Content>
<asp:Content runat="server" ID="content1" ContentPlaceHolderID="ContentPlaceHolder1">

    <div class="container page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item"><a href="ec_mcq_master.aspx">Question Bank</a></li>
            <li class="breadcrumb-item">create A MCQ</li>
        </ol>
        <h1 class="h2">CREATE A MULTIPLE CHOICE QUESTION (MCQ)</h1>
        <div class="">
            <div class="card" id="createDiv" runat="server">
                <div class="tab-content card-body">
                    <div class="tab-pane active" id="first">
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Select Grade</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlgrade"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Select Subject</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList runat="server" CssClass="form-control" ID="ddlsubject"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Question Name</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input id="txtquestionname" runat="server" type="text" class="form-control" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" runat="server">
                            <label for="name" class="col-sm-3 col-form-label form-label">Question</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" CssClass="form-control" id="txtquestion" Height="150px" Width="412px"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="classname">
                            <label for="name" class="col-sm-3 col-form-label form-label">Answer 1</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input id="txtanswer1" runat="server" type="text" class="form-control" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row" id="classdescription">
                            <label for="name" class="col-sm-3 col-form-label form-label">Answer 1 Description</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" CssClass="form-control" id="txtdecription1" Height="150px" Width="412px"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                           <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Answer 2</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input id="txtanswer2" runat="server" type="text" class="form-control" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Answer 2 Description</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" CssClass="form-control" id="txtdecription2" Height="150px" Width="412px"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                         <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Answer 3</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input id="txtanswer3" runat="server" type="text" class="form-control" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Answer 3 Description</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" CssClass="form-control" id="txtdecription3" Height="150px" Width="412px"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                         <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Answer 4</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input id="txtanswer4" runat="server" type="text" class="form-control" autocomplete="off">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Answer 4 Description</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:TextBox runat="server" CssClass="form-control" id="txtdecription4" Height="150px" Width="412px"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Correct Answer</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <asp:DropDownList CssClass="form-control" runat="server" ID="ddlcorrectans">
                                            <asp:ListItem Value="0">Please Select</asp:ListItem>
                                            <asp:ListItem Value="1">Answer 1</asp:ListItem>
                                            <asp:ListItem Value="2">Answer 2</asp:ListItem>
                                            <asp:ListItem Value="3">Answer 3</asp:ListItem>
                                            <asp:ListItem Value="4">Answer 4</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Marks</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input id="txtmarks" runat="server" type="text" class="form-control" autocomplete="off" maxlength="3">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Time in Minutes</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-8">
                                        <input id="txttime" runat="server" type="text" class="form-control" autocomplete="off" maxlength="2">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="name" class="col-sm-3 col-form-label form-label">Question for</label>
                            <div class="col-sm-8">
                                <div class="row">
                                    <div class="col-md-3">
                                        <input type="radio" runat="server" id="rbl1" name="for" class="form-check-input" > For Assignment
                                    </div>
                                    <div class="col-md-3">
                                        <input type="radio" runat="server" id="rbl2" name="for" class="form-check-input" >For Assessment
                                    </div>
                                    <div class="col-md-2">
                                        <input type="radio" runat="server" id="rbl3" name="for" class="form-check-input" >For Both
                                    </div>
                                </div>
                            </div>
                        </div>

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
        $(document).ready(function () {
            $('.sidebar-menu-item').removeClass('open');
            $('#questionbank').addClass('open');
            $('.sidebar-menu-item').removeClass('active');
            $('#mcqmaster').addClass('active');
        });

 function validateForm() {
            var checOnlykNum = /^[0-9]*$/;
     var flag = false;
            if ($("#<%=ddlgrade.ClientID%>").val() == "0")
                 alert("Please select grade");
            else if ($("#<%=ddlsubject.ClientID%>").val() == "0")
                  alert("Please select subject");
            else if ($("#<%=txtquestionname.ClientID%>").val() == "")
                alert("Please enter question name"); 
            else if ($("#<%=txtquestion.ClientID%>").val() == "")
                alert("Please enter question");
            else if ($("#<%=txtanswer1.ClientID%>").val() == "")
                alert("Please enter answer 1"); 
            else if ($("#<%=txtdecription1.ClientID%>").val() == "")
                alert("Please enter answer description 1");
            else if ($("#<%=txtanswer2.ClientID%>").val() == "")
                alert("Please enter answer 2");
            else if ($("#<%=txtdecription2.ClientID%>").val() == "")
                alert("Please enter answer description 2");
            else if ($("#<%=txtanswer3.ClientID%>").val() == "")
                alert("Please enter answer 3");
            else if ($("#<%=txtdecription3.ClientID%>").val() == "")
                alert("Please enter answer description 3");
            else if ($("#<%=txtanswer4.ClientID%>").val() == "")
                alert("Please enter answer 4");
            else if ($("#<%=txtdecription4.ClientID%>").val() == "")
                alert("Please enter answer description 4");
            else if ($("#<%=ddlcorrectans.ClientID%>").val() == "0")
                alert("Please select correct answer"); 
            else if ($("#<%=txtmarks.ClientID%>").val() == ""|| !(checOnlykNum.test($("#<%=txtmarks.ClientID%>").val())))
                alert("Please entervalid marks");
            else if ($("#<%=txttime.ClientID%>").val() == ""|| !(checOnlykNum.test($("#<%=txttime.ClientID%>").val())))
                alert("Please enter valid time in minutes");
            else if (!($("#<%=rbl1.ClientID%>").is(":checked") || $("#<%=rbl2.ClientID%>").is(":checked") || $("#<%=rbl3.ClientID%>").is(":checked")))
                alert("Please select option for question bank");
            else
                flag = true;

            return flag;
            
        }
    </script>
</asp:Content>