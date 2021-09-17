<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ec_view_question.aspx.cs" Inherits="admin_ec_view_question" %>

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
    <script src="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/js/jquery-ui-1.12.1.min.js"></script>
    <link type="text/css" href="<%=ConfigurationManager.AppSettings["WebUrl"].Replace("#DOMAIN#", Request.Url.Host.ToLower()).ToString() %>/assets/css/jquery-ui-1.12.1.min.css" rel="stylesheet">


</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div runat="server" id="Div4" class="form-row justify-content-between" style="margin: auto; width: auto; padding: 10px;">
                <div class="table-responsive">
               <table class="table table-bordered w-auto" style="margin: auto;font-size: 18px;">
                    <tr>
                        <td>Question Name</td>
                        <td><%=questionname %></td>
                    </tr>
                    <tr>
                        <td>Question</td>
                        <td><%=question%></td>
                    </tr>
                    <tr>
                        <td>Correct Answer</td>
                        <td><%=correctanswer %></td>
                    </tr>
                    <tr>
                        <td>Answer 1</td>
                        <td><%=answer1 %></td>
                    </tr>
                    <tr>
                        <td>Answer 1 Description</td>
                        <td><%=answer_description_1 %></td>
                    </tr>

                     <tr>
                        <td>Answer 2</td>
                        <td><%=answer2 %></td>
                    </tr>
                    <tr>
                        <td>Answer 2 Description</td>
                        <td><%=answer_description_2 %></td>
                    </tr>

                     <tr>
                        <td>Answer 3</td>
                        <td><%=answer3 %></td>
                    </tr>
                    <tr>
                        <td>Answer 3 Description</td>
                        <td><%=answer_description_3 %></td>
                    </tr>

                     <tr>
                        <td>Answer 4</td>
                        <td><%=answer4 %></td>
                    </tr>
                    <tr>
                        <td>Answer 4 Description</td>
                        <td><%=answer_description_4 %></td>
                    </tr>
                
                    <tr>
                        <td>Marks</td>
                        <td><%=marks%></td>
                    </tr>
                    <tr>
                        <td>Time(in Minutes)</td>
                        <td><%=time%></td>
                    </tr>
                    <tr>
                        <td>question For</td>
                        <td><%=questionfor%></td>
                    </tr>
                </table>
                    </div>
            </div>
        </div>
    </form>
</body>
</html>
