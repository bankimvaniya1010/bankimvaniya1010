<%@ Page Language="C#" AutoEventWireup="true" CodeFile="verifystudent.aspx.cs" Inherits="verifystudent"%>

<!DOCTYPE html>
<html lang="en" dir="ltr">
    <head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div runat="server" id="afterVerfication">
            Thank you for verifying details. Please <a href="login.aspx">click here</a> to login
        </div>
        <div runat="server" id="verified">
            Details already verified. Please <a href="login.aspx">click here</a> to login
        </div>
    </form>
</body>
</html>

