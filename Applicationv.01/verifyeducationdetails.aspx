<%@ Page Language="C#" AutoEventWireup="true" CodeFile="verifyeducationdetails.aspx.cs" Inherits="verifyhighschool" %>

<!DOCTYPE html>
<html lang="en" dir="ltr">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
       <div runat="server" id="afterVerfication">
            Thank you for verifying details.
        </div>
        <div runat="server" id="verified">
            Details already verified.
        </div>
        <div runat="server" id="detailsNotFound">
            Details Not Found. Please click on validation link once again.
        </div>
    </form>
</body>
</html>
