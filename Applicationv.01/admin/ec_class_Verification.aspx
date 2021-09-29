<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_class_Verification.aspx.cs" Inherits="admin_ec_class_Verification"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title></title>
    <script src="assets/vendor/jquery.min.js"></script>
    <!-- Bootstrap -->
    <link href="https://fonts.googleapis.com/css?family=Parisienne&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700|Parisienne&display=swap" rel="stylesheet">
     <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/dashboard/css/bootstrap.min.css" rel="stylesheet">
  <!-- jQuery UI-->
    <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/js/jquery-ui-1.12.1.min.js"></script>
    <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/jquery-ui-1.12.1.min.css" rel="stylesheet">


    <script> 
        function validateform() {
            var checOnlykNum = /^[0-9]*$/;
            
            var flag = false;
            var marks = $("#<%=txtpasskey.ClientID%>").val();
            if (marks == "" || !(checOnlykNum.test(marks)))
                alert("Please enter valid passkey");
             else
                flag = true;
            return flag;

        }
         function validateform2() {
            
            var flag = false;
            
             if ($("#<%=ddlaction.ClientID%>").val() == "0")
                alert("Please select action");
             else
                flag = true;
            return flag;

        }
    </script>
</head>
<body>
    <form runat="server">

        <div class="card">
            <div class="card-body">
                <div id="div6" runat="server" style="display:none;">
                    <div class="list-group-item" id="Div7" runat="server">
                        <div class="form-group m-0" role="group" aria-labelledby="label-firstname">
                            <div class="form-row">
                                <label id="label3" runat="server" for="" class="col-md-12 col-form-label form-label"></label>
                                
                            </div>
                        </div>
                    </div>

                </div>
                  <div id="div4" runat="server" style="display:none;">
                    <div class="list-group-item" id="Div5" runat="server">
                        <div class="form-group m-0" role="group" aria-labelledby="label-firstname">
                            <div class="form-row">
                                <label id="label2" runat="server" for="" class="col-md-12 col-form-label form-label">You have already <b><%=verify_status %></b> applicant for this class</label>
                                
                            </div>
                        </div>
                    </div>

                </div>
                <div id="div1" runat="server">
                    <div class="list-group-item" id="firstname" runat="server">
                        <div class="form-group m-0" role="group" aria-labelledby="label-firstname">
                            <div class="form-row">
                                <label id="labelfirstname" runat="server" for="firstname" class="col-md-3 col-form-label form-label">Enter your passkey: </label>
                                <div class="col-md-6">
                                    <input id="txtpasskey" runat="server" type="text" placeholder="" value="" class="form-control" required="" maxlength="6" autocomplete="off">
                                </div>
                            </div>
                        </div>
                    </div>


                    <div>
                        <asp:Button runat="server" ID="btn_passkey" CssClass="btn btn-success" OnClick="btn_passkey_Click" Text="Submit & Proceed" OnClientClick="return validateform()" />
                    </div>
                </div>
                <div id="div2" runat="server" style="display:none;">
                    <div class="list-group-item" id="Div3" runat="server">
                        <div class="form-group m-0" role="group" aria-labelledby="label-firstname">
                            <div class="form-row">
                                <label id="label1" runat="server" for="firstname" class="col-md-3 col-form-label form-label">Select Action</label>
                                <div class="col-md-6">
                                    <asp:DropDownList runat="server" ID="ddlaction" CssClass="form-control">
                                        <asp:ListItem Value="0">Please select</asp:ListItem>
                                          <asp:ListItem Value="1">Verified</asp:ListItem>
                                <asp:ListItem Value="2">Not Present</asp:ListItem>
                                <asp:ListItem Value="3">Not Verified</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div>
                        <asp:Button runat="server" ID="Button1" CssClass="btn btn-success" OnClick="Button1_Click" Text="Submit" OnClientClick="return validateform2()" />
                    </div>
                </div>
            </div>
        </div>
    </form>

</body>
</html>

   