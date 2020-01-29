<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gte_certificate.aspx.cs" Inherits="gte_certificate" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title></title>

    <!-- Bootstrap -->
    <link href="https://fonts.googleapis.com/css?family=Parisienne&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700|Parisienne&display=swap" rel="stylesheet">
    <link href="assets/dashboard/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .certificate-container {width: 960px;height: 686px;margin: 50px auto;background-image: url('../assets/images/certificate-bg.jpg');padding: 50px 80px;}
        .certi-heading {text-align: center;position: relative;margin-top: 40px;font-size: 40px;font-family: 'Lato', sans-serif;font-weight: 700;color: #262626;}
        .certi-heading:before, .certi-heading:after {content: '';position: absolute;background-color: transparent;border-top: 3px solid #f2f2f2;border-bottom: 3px solid #f2f2f2;width: 251px;height: 97px;left: 87px;top: 3px;}
        .certi-heading span {font-family: 'Parisienne', cursive;font-size: 81px;display: inline-block;vertical-align: middle;margin: 0 15px;color: #653a95;}
        .certi-heading:after {left: auto;right: 86px;width: 288px;}
        .partici-name {font-size: 40px;font-family: 'lato';font-weight: 700;margin: 30px 0;position: relative;color: #262626;}
        .partici-name:before {content: '';left: 0;right: 0;position: absolute;height: 3px;background-color: #f2f2f2;bottom: -9px;}
        .gte-dcrb {font-size: 16px;text-align: center;font-family: lato;}
        .gte-dcrb span {font-weight: 700;}
        .usr-inf-txt {font-size: 20px;text-align: center;font-weight: 700;font-family: lato;margin-top: 16px;}
        .usr-inf-txt1 {font-size: 16px;font-weight: 700;text-align: center;font-family: lato;}
        .certi-info-wrpr {width: 580px;float: left;}
        .certi-info-txt {margin-top: 20px;width: 485px;color: #262626;position: relative;}
        .certi-info-txt-t1 {float: left;width: 200px;font-family: lato;font-weight: 700;font-size: 16px;}
        .certi-info-txt-t2 {float: right;width: 284px;text-align: center;font-size: 16px;}
        .certi-info-txt:before {content: '';position: absolute;left: 0;right: 0;bottom: -11px;height: 3px;background-color: #f2f2f2;width: 100%;}
        .certi-info-txt-mt-50 {margin-top: 50px;}
        .certi-logo-img {float: right;}
        .certi-logo-img img {max-width: 180px;max-height: 180px;display: block;}
    </style>
</head>
<body>
    <form runat="server">
        <div class="certificate-container">
            <div class="certi-heading">CERTIFICATE <span>of</span> PARTICIPATION</div>
            <div class="partici-name text-center"><%=_studentName %></div>
            <div class="gte-dcrb">Has successfully completed the Genuine Student and Genuine Temporary Entrant Orientation program and has demonstrated <span><%=_performanceCategory %></span> understanding of the Australian Student Visa Conditions.</div>
            <div class="usr-inf-txt">GTE DIRECT CERTIFICATE # <%=_certificateNumber %></div>
            <%--<div class="usr-inf-txt1">PASSPORT NUMBER GH80098Y; DATE OF BIRTH 05/NOVEMBER/1976</div>--%>
            <div class="clearfix">
                <div class="certi-info-wrpr">
                    <div class="certi-info-txt certi-info-txt-mt-50 clearfix"><span class="certi-info-txt-t1">PRESENTED BY:</span><span class="certi-info-txt-t2">Richard Geddes – Principal Instructor</span></div>
                    <div class="certi-info-txt clearfix"><span class="certi-info-txt-t1">ON THIS DAY:</span><span class="certi-info-txt-t2"><%=_certificateCreationDate %></span></div>
                </div>
                <div class="certi-logo-img">
                    <img src="../assets/images/gte_direct_logo.png">
                </div>
            </div>
        </div>
        <div runat="server" id="btnDiv" class="form-row justify-content-between" style="display: none;margin: auto;width: 50%;padding: 10px;">
            <input id="backNavLink" runat="server" type="button" value="Back" onclick="return window.location = '/default.aspx';"/>
            <asp:Button ID="btnDownload" runat="server" CssClass="btn btn-success" Text="Download Certificate" OnClick="btnDownload_Click" />
        </div>
    </form>
</body>
</html>