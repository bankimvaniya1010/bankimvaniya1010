<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicantrefrencecheck.aspx.cs" Inherits="applicantrefrencecheck" MasterPageFile="~/student.master" %>

<asp:Content ID="content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">


    <div class="container-fluid page__container">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="Default.aspx">Home</a></li>
            <li class="breadcrumb-item active">Applicant Refernece Check</li>
        </ol>
        <h1 class="h2">Applicant Refernece Check</h1>

    </div>
    <div class="page ">
        <div class="container page__container p-0">
            <div class="row m-0">
                <div class="col-lg container-fluid page__container">

                    <div class="card" style="width: 650px;">

                        <div class="list-group list-group-fit">
                            <div class="list-group-item" id="Name" runat="server" style="display:none;">
                                <div class="form-group m-0" role="group" aria-labelledby="label-email">
                                    <div class="form-row">
                                        <label id="labelname"  runat="server"  for="email" class="col-md-3 col-form-label form-label">Name *</label>
                                        <div class="col-md-6">
                                            <input id="txtName" runat="server" type="text" placeholder="Name"  value="" required="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="Mobile"  runat="server" style="display:none;">
                                <div class="form-group m-0" role="group" aria-labelledby="label-Mobile">
                                    <div class="form-row">
                                        <label id="labelMobile"  runat="server"  for="Mobile" class="col-md-3 col-form-label form-label">Mobile/Cellular Number *</label>
                                        <div class="col-md-6">
                                            <input id="txtMobile" runat="server" type="tel" placeholder="Mobile/Cellular Number" required="" value="" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="list-group-item" id="Email"  runat="server" style="display:none;">
                                <div class="form-group m-0" role="group" aria-labelledby="label-phone">
                                    <div class="form-row">
                                        <label id="labelEmail"  runat="server"  for="phone" class="col-md-3 col-form-label form-label">Email</label>
                                        <div class="col-md-6">
                                            <input id="txtEmail" runat="server" type="text" class="form-control" placeholder="Email">
                                        </div>
                                    </div>
                                </div>
                            </div>
                           
                            <div class="list-group-item" id="employerwebsite">
                                <div class="form-group m-0" role="group" aria-labelledby="label-employerwebsite">
                                    <div class="form-row">
                                       
                                        <asp:Button ID="btnReference" runat="server" Text="Save Changes" CssClass="btn btn-success" OnClick="btnReference_Click"  />
                                        <div class="col-md-6">
                                            <asp:Label ID="lblMessage" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="lblSaveTime" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                     <div class="list-group-item" id="highergrade">
                                    <div class="form-group m-0" role="group" aria-labelledby="label-highschoolYear">
                                      
                                        <div class="form-row">
                                            <div class="col-md-9">
                                                <div style="margin-top: 10px;" class="table-responsive" data-toggle="lists" data-lists-values='["name"]'>
                                                    <asp:GridView ID="grdRefernce" DataKeyNames="id" runat="server" CssClass="table" AutoGenerateColumns="false" OnRowDeleting="grdtrefernce_RowDeleting" OnDataBound="grdRefernce_DataBound" >
                                                        <Columns>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Name">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblName" runat="server"
                                                                        Text='<%#Eval("Name")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Email">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblEmail" runat="server"
                                                                        Text='<%#Eval("email")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField ItemStyle-Width="30px" HeaderText="Mobile">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblMobile" runat="server"
                                                                        Text='<%#Eval("Mobile")%>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                          

                                                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="True" ShowHeader="True" />
                                                        </Columns>
                                                    </asp:GridView>

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
         function ConfirmOnDelete(item) {
            if (confirm("Are you sure to delete: " + item + "?") == true)
                return true;
            else
                return false;
        }
        $(document).ready(function () {
            
            $(".form-control")
                .mouseover(function () {
                    var controlId = $(this).attr('id');
                    var title = $(this).attr('title');
                    $("#tooltip").text(title);
                });
            var input = document.querySelector("#ContentPlaceHolder1_txtMobile");
            window.intlTelInput(input, {
                utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
            });
            var input = document.querySelector("#ContentPlaceHolder1_txtHomePhone");
            window.intlTelInput(input, {
                utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
            });
           
            var input = document.querySelector("#ContentPlaceHolder1_txtWhatsappNo");
            window.intlTelInput(input, {
                utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
            });
            var skype = $("input[type=radio][name='ctl00$ContentPlaceHolder1$skype']:checked").val()
            if (skype == 'rblSkypeYes') {
                $("#skypeDesc").show();

            } else {
                $("#skypeDesc").hide();

            }
            var whatsup = $("input[type=radio][name='ctl00$ContentPlaceHolder1$whatsappSame']:checked").val()
            if (whatsup == 'rblWhatsupsameNo') {
                $("#whatsappDesc").show();

            } else {
                $("#whatsappDesc").hide();

            }
            var whatsupsame = $("input[type=radio][name='ctl00$ContentPlaceHolder1$whatsapp']:checked").val()
            if (whatsup == 'rblwhatsappYes') {
                $("#whatsappHave").show();

            } else {
                $("#whatsappHave").hide();

            }
             var input = document.querySelector("#ContentPlaceHolder1_txtMobileNominee");
            window.intlTelInput(input, {
                utilsScript: "/assets/js/utils.js?1551697588835" // just for formatting/placeholders etc
            });
        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$skype']").click(function () {
                if ($("#ContentPlaceHolder1_rblSkypeYes").is(":checked")) {
                    $("#skypeDesc").show();

                } else {
                    $("#skypeDesc").hide();

                }
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$whatsappSame']").click(function () {
                if ($("#ContentPlaceHolder1_rblWhatsupsameNo").is(":checked")) {
                    $("#whatsappDesc").show();

                } else {
                    $("#whatsappDesc").hide();

                }
            });
        });
        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$whatsapp']").click(function () {
                if ($("#ContentPlaceHolder1_rblwhatsappYes").is(":checked")) {
                    $("#whatsappHave").show();

                } else {
                    $("#whatsappHave").hide();

                }
            });
        });

        $(function () {
            $("input[name='ctl00$ContentPlaceHolder1$address']").click(function () {
                if ($("#ContentPlaceHolder1_rblAddressYes").is(":checked")) {
                    $("#ContentPlaceHolder1_txtResidentialAddress1").val($("#ContentPlaceHolder1_txtAddressLine1").val());
                    $("#ContentPlaceHolder1_txtResidentialAddress2").val($("#ContentPlaceHolder1_txtAddressLine2").val());
                    $("#ContentPlaceHolder1_txtResidentialAddress3").val($("#ContentPlaceHolder1_txtAddressLine3").val());
                    $("#ContentPlaceHolder1_txtResidentialCity").val($("#ContentPlaceHolder1_txtCity").val());
                    $("#ContentPlaceHolder1_txtResidentialState").val($("#ContentPlaceHolder1_txtState").val());
                    $("#ContentPlaceHolder1_txtResidentialpostal").val($("#ContentPlaceHolder1_txtpostal").val());
                    $('#ContentPlaceHolder1_ddlResidential option[value="3"]').attr("selected", "selected");
                    var country = $('#ContentPlaceHolder1_ddlpostalCountry').val();
                    $("#ContentPlaceHolder1_ddlResidential").val(country);



                } else {
                    $("#ContentPlaceHolder1_txtResidentialAddress1").val('');
                    $("#ContentPlaceHolder1_txtResidentialAddress2").val('');
                    $("#ContentPlaceHolder1_txtResidentialAddress3").val('');
                    $("#ContentPlaceHolder1_txtResidentialCity").val('');
                    $("#ContentPlaceHolder1_txtResidentialState").val('');
                    $("#ContentPlaceHolder1_txtResidentialpostal").val('');
                    $('#ContentPlaceHolder1_ddlResidential').val('');

                }
            });
        });
        $('#ContentPlaceHolder1_dob').flatpickr({

            dateFormat: 'Y-m-d'
        });



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


