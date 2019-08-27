<%@ Page Language="C#" AutoEventWireup="true" CodeFile="visaprefill.aspx.cs" Inherits="visaprefill" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
        <!--
        span.cls_003 {
            font-family: Arial,serif;
            font-size: 9.1px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        div.cls_003 {
            font-family: Arial,serif;
            font-size: 9.1px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        span.cls_005 {
            font-family: Arial,serif;
            font-size: 16.1px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        div.cls_005 {
            font-family: Arial,serif;
            font-size: 16.1px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        span.cls_004 {
            font-family: Arial,serif;
            font-size: 28.1px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        div.cls_004 {
            font-family: Arial,serif;
            font-size: 28.1px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        span.cls_002 {
            font-family: Arial,serif;
            font-size: 12.1px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        div.cls_002 {
            font-family: Arial,serif;
            font-size: 12.1px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        span.cls_006 {
            font-family: Garamond,serif;
            font-size: 9.6px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        div.cls_006 {
            font-family: Garamond,serif;
            font-size: 9.6px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        span.cls_007 {
            font-family: Garamond,serif;
            font-size: 9.6px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        div.cls_007 {
            font-family: Garamond,serif;
            font-size: 9.6px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        span.cls_008 {
            font-family: Garamond,serif;
            font-size: 9.6px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: italic;
            text-decoration: none
        }

        div.cls_008 {
            font-family: Garamond,serif;
            font-size: 9.6px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: italic;
            text-decoration: none
        }

        span.cls_009 {
            font-family: Arial,serif;
            font-size: 9.6px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none;
        }

        div.cls_009 {
            font-family: Arial,serif;
            font-size: 9.6px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        span.cls_010 {
            font-family: Arial,serif;
            font-size: 6.0px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        div.cls_010 {
            font-family: Arial,serif;
            font-size: 6.0px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        span.cls_011 {
            font-family: Garamond,serif;
            font-size: 6.0px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        div.cls_011 {
            font-family: Garamond,serif;
            font-size: 6.0px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        span.cls_012 {
            font-family: Garamond,serif;
            font-size: 8.1px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        div.cls_012 {
            font-family: Garamond,serif;
            font-size: 8.1px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        span.cls_013 {
            font-family: Garamond,serif;
            font-size: 8.1px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        div.cls_013 {
            font-family: Garamond,serif;
            font-size: 8.1px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        span.cls_015 {
            font-family: Garamond,serif;
            font-size: 12.1px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: italic;
            text-decoration: none
        }

        div.cls_015 {
            font-family: Garamond,serif;
            font-size: 12.1px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: italic;
            text-decoration: none
        }

        span.cls_016 {
            font-family: Arial,serif;
            font-size: 14.1px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        div.cls_016 {
            font-family: Arial,serif;
            font-size: 14.1px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        span.cls_014 {
            font-family: Arial,serif;
            font-size: 9.6px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        div.cls_014 {
            font-family: Arial,serif;
            font-size: 9.6px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        span.cls_017 {
            font-family: Arial,serif;
            font-size: 12.1px;
            color: rgb(0,0,0);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        div.cls_017 {
            font-family: Arial,serif;
            font-size: 12.1px;
            color: rgb(0,0,0);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        span.cls_018 {
            font-family: Garamond,serif;
            font-size: 16.1px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: italic;
            text-decoration: none
        }

        div.cls_018 {
            font-family: Garamond,serif;
            font-size: 16.1px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: italic;
            text-decoration: none
        }

        span.cls_021 {
            font-family: Arial,serif;
            font-size: 11.1px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        div.cls_021 {
            font-family: Arial,serif;
            font-size: 11.1px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        span.cls_019 {
            font-family: Garamond,serif;
            font-size: 16.1px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: italic;
            text-decoration: none
        }

        div.cls_019 {
            font-family: Garamond,serif;
            font-size: 16.1px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: italic;
            text-decoration: none
        }

        span.cls_020 {
            font-family: Arial,serif;
            font-size: 11.1px;
            color: rgb(114,114,114);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        div.cls_020 {
            font-family: Arial,serif;
            font-size: 11.1px;
            color: rgb(114,114,114);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        span.cls_022 {
            font-family: Arial,serif;
            font-size: 9.1px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        div.cls_022 {
            font-family: Arial,serif;
            font-size: 9.1px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        span.cls_023 {
            font-family: Arial,serif;
            font-size: 10.1px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        div.cls_023 {
            font-family: Arial,serif;
            font-size: 10.1px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        span.cls_024 {
            font-family: Arial,serif;
            font-size: 9.5px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        div.cls_024 {
            font-family: Arial,serif;
            font-size: 9.5px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        span.cls_025 {
            font-family: Arial,serif;
            font-size: 12.1px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        div.cls_025 {
            font-family: Arial,serif;
            font-size: 12.1px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        span.cls_026 {
            font-family: Arial,serif;
            font-size: 9.6px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        div.cls_026 {
            font-family: Arial,serif;
            font-size: 9.6px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        span.cls_027 {
            font-family: Arial,serif;
            font-size: 6.0px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        div.cls_027 {
            font-family: Arial,serif;
            font-size: 6.0px;
            color: rgb(43,42,41);
            font-weight: bold;
            font-style: normal;
            text-decoration: none
        }

        span.cls_028 {
            font-family: Arial,serif;
            font-size: 8.6px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        div.cls_028 {
            font-family: Arial,serif;
            font-size: 8.6px;
            color: rgb(43,42,41);
            font-weight: normal;
            font-style: normal;
            text-decoration: none
        }

        div.input {
            border: 1px solid black;
        }

        #Checkbox7 {
            height: 20px;
        }
    </style>
    <script type="text/javascript" src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/wz_jsgraphics.js"></script>
</head>
<body>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 0px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background01.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 525.04px; top: 34.13px" class="cls_003"><span class="cls_003">Form</span></div>
        <div style="position: absolute; left: 230.81px; top: 46.73px" class="cls_005"><span class="cls_005">Application for a student visa</span></div>
        <div style="position: absolute; left: 506.59px; top: 44.33px" class="cls_004"><span class="cls_004">157A</span></div>
        <div style="position: absolute; left: 32.00px; top: 123.53px" class="cls_002"><span class="cls_002">Applying online</span></div>
        <div style="position: absolute; left: 308.00px; top: 123.53px" class="cls_002"><span class="cls_002">Changing education provider</span></div>
        <div style="position: absolute; left: 32.00px; top: 141.03px" class="cls_006"><span class="cls_006">The Department of Immigration and Multicultural Affairs (the</span></div>
        <div style="position: absolute; left: 308.00px; top: 141.03px" class="cls_006"><span class="cls_006">If you hold a student visa and wish to change education</span></div>
        <div style="position: absolute; left: 32.00px; top: 152.03px" class="cls_006"><span class="cls_006">department) offers a number of convenient internet services</span></div>
        <div style="position: absolute; left: 308.00px; top: 152.03px" class="cls_006"><span class="cls_006">provider, you may need to seek the department’s permission</span></div>
        <div style="position: absolute; left: 32.00px; top: 163.03px" class="cls_006"><span class="cls_006">for student visa applicants. To find out whether you are eligible</span></div>
        <div style="position: absolute; left: 308.00px; top: 163.03px" class="cls_006"><span class="cls_006">first. You must seek permission if your visa is subject to</span></div>
        <div style="position: absolute; left: 32.00px; top: 174.03px" class="cls_006"><span class="cls_006">to apply online for a student visa, refer to the department’s</span></div>
        <div style="position: absolute; left: 308.00px; top: 174.03px" class="cls_006"><span class="cls_006">condition 8206 and you wish to change education provider</span></div>
        <div style="position: absolute; left: 32.00px; top: 185.03px" class="cls_006"><span class="cls_006">website </span><a href="http://www.immi.gov.au/e_visa/students.htm">www.immi.gov.au/e_visa/students.htm</a> </span></div>
        <div style="position: absolute; left: 308.00px; top: 185.03px" class="cls_006"><span class="cls_006">either:</span></div>
        <div style="position: absolute; left: 32.00px; top: 200.03px" class="cls_006"><span class="cls_006">If you wish to enter Australia or extend your stay as a student</span></div>
        <div style="position: absolute; left: 308.00px; top: 198.03px" class="cls_006"><span class="cls_006">• while studying any preliminary courses; or</span></div>
        <div style="position: absolute; left: 32.00px; top: 211.03px" class="cls_006"><span class="cls_006">and you are not eligible to apply online, complete this form in</span></div>
        <div style="position: absolute; left: 308.00px; top: 211.03px" class="cls_006"><span class="cls_006">• during the first 12 months of your principal course.</span></div>
        <div style="position: absolute; left: 32.00px; top: 222.03px" class="cls_006"><span class="cls_006">ENGLISH using BLOCK LETTERS.</span></div>
        <div style="position: absolute; left: 308.00px; top: 226.03px" class="cls_006"><span class="cls_006">If you wish to change education provider but continue studying</span></div>
        <div style="position: absolute; left: 32.00px; top: 237.03px" class="cls_006"><span class="cls_006">To complete this form you must first read these notes and</span></div>
        <div style="position: absolute; left: 308.00px; top: 237.03px" class="cls_006"><span class="cls_006">the same type of course, you must apply on form 157C</span></div>
        <div style="position: absolute; left: 32.00px; top: 248.04px" class="cls_006"><span class="cls_006">information form 1160i </span><span class="cls_008">Applying for a student visa</span><span class="cls_006">. Detailed</span></div>
        <div style="position: absolute; left: 308.00px; top: 248.03px" class="cls_008"><span class="cls_008">Application for a student visa with permission to change</span></div>
        <div style="position: absolute; left: 32.00px; top: 259.04px" class="cls_006"><span class="cls_006">information is also available on the department’s website</span></div>
        <div style="position: absolute; left: 308.00px; top: 259.03px" class="cls_008"><span class="cls_008">education provider</span><span class="cls_006">.</span></div>
        <div style="position: absolute; left: 32.00px; top: 270.04px" class="cls_007"><span class="cls_007"></span><a href="http://www.immi.gov.au/study/">www.immi.gov.au/study/</a> </div>
        <div style="position: absolute; left: 308.00px; top: 274.03px" class="cls_006"><span class="cls_006">If you wish to change both your provider and the type of course</span></div>
        <div style="position: absolute; left: 308.00px; top: 285.03px" class="cls_006"><span class="cls_006">you are studying, you must apply for a new student visa using</span></div>
        <div style="position: absolute; left: 32.00px; top: 293.53px" class="cls_002"><span class="cls_002">Who can use this form?</span></div>
        <div style="position: absolute; left: 308.00px; top: 296.03px" class="cls_006"><span class="cls_006">this form (form 157A).</span></div>
        <div style="position: absolute; left: 32.00px; top: 311.03px" class="cls_006"><span class="cls_006">You should use this form if you wish to apply for a student visa</span></div>
        <div style="position: absolute; left: 308.00px; top: 311.03px" class="cls_006"><span class="cls_006">In either case, you must demonstrate that exceptional reasons</span></div>
        <div style="position: absolute; left: 32.00px; top: 322.03px" class="cls_006"><span class="cls_006">and be assessed against one of the following subclasses:</span></div>
        <div style="position: absolute; left: 308.00px; top: 322.03px" class="cls_006"><span class="cls_006">exist to justify your change in enrolment.</span></div>
        <div style="position: absolute; left: 32.00px; top: 335.03px" class="cls_006"><span class="cls_006">• Independent ELICOS visa (subclass 570);</span></div>
        <div style="position: absolute; left: 32.00px; top: 348.03px" class="cls_006"><span class="cls_006">• Schools visa (subclass 571);</span></div>
        <div style="position: absolute; left: 308.00px; top: 345.53px" class="cls_002"><span class="cls_002">Changing course type (education sector)</span></div>
        <div style="position: absolute; left: 32.00px; top: 361.03px" class="cls_006"><span class="cls_006">• Vocational Education and Training visa (subclass 572);</span></div>
        <div style="position: absolute; left: 308.00px; top: 363.03px" class="cls_006"><span class="cls_006">Your student visa is linked to the type of course you are</span></div>
        <div style="position: absolute; left: 32.00px; top: 374.03px" class="cls_006"><span class="cls_006">• Higher Education visa (subclass 573);</span></div>
        <div style="position: absolute; left: 308.00px; top: 374.03px" class="cls_006"><span class="cls_006">studying. Each student visa subclass covers specific types of</span></div>
        <div style="position: absolute; left: 32.00px; top: 387.03px" class="cls_006"><span class="cls_006">• Postgraduate Research visa (subclass 574);</span></div>
        <div style="position: absolute; left: 308.00px; top: 385.03px" class="cls_006"><span class="cls_006">course only. If you wish to change your principal course at any</span></div>
        <div style="position: absolute; left: 308.00px; top: 396.03px" class="cls_006"><span class="cls_006">time to a course in a different education sector, you must first</span></div>
        <div style="position: absolute; left: 32.00px; top: 400.03px" class="cls_006"><span class="cls_006">• Non-Award visa (subclass 575);</span></div>
        <div style="position: absolute; left: 308.00px; top: 407.03px" class="cls_006"><span class="cls_006">apply for a new student visa using this form (form 157A).</span></div>
        <div style="position: absolute; left: 32.00px; top: 413.03px" class="cls_006"><span class="cls_006">• AusAID or Defence visa (subclass 576).</span></div>
        <div style="position: absolute; left: 308.00px; top: 422.03px" class="cls_006"><span class="cls_006">For information on course types and their relationship to the</span></div>
        <div style="position: absolute; left: 32.00px; top: 428.03px" class="cls_006"><span class="cls_006">Each subclass is linked to the type of course you intend to</span></div>
        <div style="position: absolute; left: 308.00px; top: 433.03px" class="cls_006"><span class="cls_006">different student visa subclasses, refer to the department’s</span></div>
        <div style="position: absolute; left: 32.00px; top: 439.03px" class="cls_006"><span class="cls_006">undertake in Australia as your main course of study.</span></div>
        <div style="position: absolute; left: 308.00px; top: 444.03px" class="cls_006"><span class="cls_006">website </span><a href="http://www.immi.gov.au/study/">www.immi.gov.au/study/</a> </span></div>
        <div style="position: absolute; left: 32.00px; top: 454.03px" class="cls_006"><span class="cls_006">You are not able to use this form to apply for a Student Guardian</span></div>
        <div style="position: absolute; left: 32.00px; top: 465.03px" class="cls_006"><span class="cls_006">visa (subclass 580). Form 157G </span><span class="cls_008">Application for a Student</span></div>
        <div style="position: absolute; left: 308.00px; top: 467.53px" class="cls_002"><span class="cls_002">Applying for a student visa</span></div>
        <div style="position: absolute; left: 32.00px; top: 476.03px" class="cls_008"><span class="cls_008">Guardian visa</span><span class="cls_006"> is the only valid form for a Student Guardian</span></div>
        <div style="position: absolute; left: 32.00px; top: 487.03px" class="cls_006"><span class="cls_006">visa application.</span></div>
        <div style="position: absolute; left: 308.00px; top: 485.03px" class="cls_006"><span class="cls_006">To help you lodge your application and communicate with the</span></div>
        <div style="position: absolute; left: 308.00px; top: 496.03px" class="cls_006"><span class="cls_006">department while your application is being processed you</span></div>
        <div style="position: absolute; left: 32.00px; top: 502.03px" class="cls_006"><span class="cls_006">If you are applying for a visa that can be granted in Australia</span></div>
        <div style="position: absolute; left: 308.00px; top: 507.03px" class="cls_006"><span class="cls_006">should read information form 1025i </span><span class="cls_008">Making and processing</span></div>
        <div style="position: absolute; left: 32.00px; top: 513.03px" class="cls_006"><span class="cls_006">and you are making this application in Australia, this form also</span></div>
        <div style="position: absolute; left: 308.00px; top: 518.03px" class="cls_008"><span class="cls_008">visa applications</span><span class="cls_006">, which is available from your nearest</span></div>
        <div style="position: absolute; left: 32.00px; top: 524.03px" class="cls_006"><span class="cls_006">serves as an application form for any class of bridging visa</span></div>
        <div style="position: absolute; left: 308.00px; top: 529.03px" class="cls_006"><span class="cls_006">Australian Government office or the department’s website.</span></div>
        <div style="position: absolute; left: 32.00px; top: 535.03px" class="cls_006"><span class="cls_006">(classes A, C or E) for which you may be eligible to apply - see</span></div>
        <div style="position: absolute; left: 32.00px; top: 546.03px" class="cls_006"><span class="cls_006">the information form 1024i </span><span class="cls_008">Bridging visas</span><span class="cls_006">, which is available</span></div>
        <div style="position: absolute; left: 308.00px; top: 544.03px" class="cls_006"><span class="cls_006">All student visa applicants must satisfy the criteria for grant of</span></div>
        <div style="position: absolute; left: 32.00px; top: 557.03px" class="cls_006"><span class="cls_006">on the department’s website </span><a href="http://www.immi.gov.au/allforms/">www.immi.gov.au/allforms/</a> </span></div>
        <div style="position: absolute; left: 308.00px; top: 555.03px" class="cls_006"><span class="cls_006">one of the student visa subclasses. These criteria include (but</span></div>
        <div style="position: absolute; left: 308.00px; top: 566.04px" class="cls_006"><span class="cls_006">are not limited to) financial ability, English language proficiency,</span></div>
        <div style="position: absolute; left: 32.00px; top: 572.03px" class="cls_006"><span class="cls_006">Please refer to information form 1160i </span><span class="cls_008">Applying for a student</span></div>
        <div style="position: absolute; left: 308.00px; top: 577.04px" class="cls_006"><span class="cls_006">intention to comply with visa conditions and other relevant</span></div>
        <div style="position: absolute; left: 32.00px; top: 583.03px" class="cls_008"><span class="cls_008">visa</span><span class="cls_006"> for further information about Australia’s student visa</span></div>
        <div style="position: absolute; left: 308.00px; top: 588.04px" class="cls_006"><span class="cls_006">matters. Information on these criteria and the conditions that</span></div>
        <div style="position: absolute; left: 32.00px; top: 594.03px" class="cls_006"><span class="cls_006">program.</span></div>
        <div style="position: absolute; left: 308.00px; top: 599.04px" class="cls_006"><span class="cls_006">may be attached to your visa can be found in the information</span></div>
        <div style="position: absolute; left: 308.00px; top: 610.04px" class="cls_006"><span class="cls_006">form 1160i </span><span class="cls_008">Applying for a student visa</span><span class="cls_006"> and on the department’s</span></div>
        <div style="position: absolute; left: 32.00px; top: 617.53px" class="cls_002"><span class="cls_002">Working while studying</span></div>
        <div style="position: absolute; left: 308.00px; top: 621.04px" class="cls_006"><span class="cls_006">website.</span></div>
        <div style="position: absolute; left: 32.00px; top: 635.03px" class="cls_006"><span class="cls_006">If you already hold a student visa and now want permission to</span></div>
        <div style="position: absolute; left: 308.00px; top: 636.04px" class="cls_007"><span class="cls_007">Note</span><span class="cls_006">: If you are required to provide the results of an English</span></div>
        <div style="position: absolute; left: 32.00px; top: 646.03px" class="cls_006"><span class="cls_006">work, you and your family members can apply online</span></div>
        <div style="position: absolute; left: 308.00px; top: 647.04px" class="cls_006"><span class="cls_006">language test, </span><span class="cls_007">you must sit the test before you lodge your</span></div>
        <div style="position: absolute; left: 32.00px; top: 657.03px" class="cls_007"><span class="cls_007"></span><a href="http://www.immi.gov.au/e_visa/students.htm">www.immi.gov.au/e_visa/students.htm</a> </div>
        <div style="position: absolute; left: 308.00px; top: 658.04px" class="cls_007"><span class="cls_007">visa application</span><span class="cls_006">. If you sit a test after you have lodged your</span></div>
        <div style="position: absolute; left: 308.00px; top: 669.04px" class="cls_006"><span class="cls_006">application, the results of this test cannot be taken into account.</span></div>
        <div style="position: absolute; left: 32.00px; top: 672.03px" class="cls_006"><span class="cls_006">To be eligible for permission to work while studying in Australia,</span></div>
        <div style="position: absolute; left: 32.00px; top: 683.03px" class="cls_006"><span class="cls_006">you must first have commenced your course. More information</span></div>
        <div style="position: absolute; left: 308.00px; top: 684.04px" class="cls_006"><span class="cls_006">If you wish to study in Australia, your application will be assessed</span></div>
        <div style="position: absolute; left: 32.00px; top: 694.04px" class="cls_006"><span class="cls_006">about permission to work while studying is available on the</span></div>
        <div style="position: absolute; left: 308.00px; top: 695.04px" class="cls_006"><span class="cls_006">against one of 5 assessment levels for each visa subclass. Before</span></div>
        <div style="position: absolute; left: 32.00px; top: 705.04px" class="cls_006"><span class="cls_006">department’s website </span><a href="http://www.immi.gov.au/study/working/">www.immi.gov.au/study/working/</a> </span></div>
        <div style="position: absolute; left: 308.00px; top: 706.04px" class="cls_006"><span class="cls_006">completing this form, you must refer to information form</span></div>
        <div style="position: absolute; left: 308.00px; top: 717.04px" class="cls_006"><span class="cls_006">1219i </span><span class="cls_008">Overseas Student Program - Assessment Levels</span><span class="cls_006"> for</span></div>
        <div style="position: absolute; left: 308.00px; top: 728.04px" class="cls_006"><span class="cls_006">information on which Assessment Level applies to you.</span></div>
        <div style="position: absolute; left: 308.00px; top: 739.04px" class="cls_006"><span class="cls_006">Information on assessment levels can be found on the</span></div>
        <div style="position: absolute; left: 308.00px; top: 750.04px" class="cls_006"><span class="cls_006">department’s website.</span></div>
        <div style="position: absolute; left: 459.55px; top: 768.03px" class="cls_009"><span class="cls_009">Continued on the next page</span></div>
        <div style="position: absolute; left: 245.98px; top: 820.73px" class="cls_010"><span class="cls_010">© COMMONWEALTH OF AUSTRALIA, 2006</span></div>
        <div style="position: absolute; left: 499.13px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 1</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 852px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background02.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 32.00px; top: 32.03px" class="cls_006"><span class="cls_006">In certain circumstances you may be requested to complete a</span></div>
        <div style="position: absolute; left: 308.00px; top: 32.04px" class="cls_006"><span class="cls_006">commenced your course of study. If you are in Australia and</span></div>
        <div style="position: absolute; left: 32.00px; top: 43.03px" class="cls_006"><span class="cls_006">supplementary information form. You will be advised by the</span></div>
        <div style="position: absolute; left: 308.00px; top: 43.04px" class="cls_006"><span class="cls_006">your family members intend to apply to join you after you have</span></div>
        <div style="position: absolute; left: 32.00px; top: 54.03px" class="cls_006"><span class="cls_006">visa processing office if this is necessary.</span></div>
        <div style="position: absolute; left: 308.00px; top: 54.04px" class="cls_006"><span class="cls_006">commenced your course, you will need to complete form 919</span></div>
        <div style="position: absolute; left: 308.00px; top: 65.04px" class="cls_008"><span class="cls_008">Nomination of student dependant(s)</span><span class="cls_006">. You must send this form</span></div>
        <div style="position: absolute; left: 32.00px; top: 69.03px" class="cls_006"><span class="cls_006">Your application may be decided solely on the basis of</span></div>
        <div style="position: absolute; left: 308.00px; top: 76.04px" class="cls_006"><span class="cls_006">and other necessary documentary evidence to your family</span></div>
        <div style="position: absolute; left: 32.00px; top: 80.03px" class="cls_006"><span class="cls_006">information provided in this application. Failure to answer a</span></div>
        <div style="position: absolute; left: 308.00px; top: 87.04px" class="cls_006"><span class="cls_006">members for them to lodge at the relevant Australian</span></div>
        <div style="position: absolute; left: 32.00px; top: 91.03px" class="cls_006"><span class="cls_006">question may result in your application being refused if the</span></div>
        <div style="position: absolute; left: 308.00px; top: 98.04px" class="cls_006"><span class="cls_006">Government office.</span></div>
        <div style="position: absolute; left: 32.00px; top: 102.03px" class="cls_006"><span class="cls_006">decision-maker cannot be satisfied that you meet all of the</span></div>
        <div style="position: absolute; left: 32.00px; top: 113.03px" class="cls_006"><span class="cls_006">criteria for grant of the visa. The provision of information to the</span></div>
        <div style="position: absolute; left: 308.00px; top: 113.04px" class="cls_007"><span class="cls_007">Note</span><span class="cls_006">: If you are processed at Assessment Level 3, 4 or 5 and</span></div>
        <div style="position: absolute; left: 32.00px; top: 124.03px" class="cls_006"><span class="cls_006">department that is incorrect may result in cancellation of your</span></div>
        <div style="position: absolute; left: 308.00px; top: 124.04px" class="cls_006"><span class="cls_006">intend to undertake a course of 12 months or less in duration,</span></div>
        <div style="position: absolute; left: 32.00px; top: 135.03px" class="cls_006"><span class="cls_006">visa if it is granted. If you need more space to answer any</span></div>
        <div style="position: absolute; left: 308.00px; top: 135.04px" class="cls_006"><span class="cls_006">members of the family unit </span><span class="cls_007">are not</span><span class="cls_006"> permitted to accompany</span></div>
        <div style="position: absolute; left: 32.00px; top: 146.03px" class="cls_006"><span class="cls_006">question, write the details on a separate sheet, sign it and attach</span></div>
        <div style="position: absolute; left: 308.00px; top: 146.04px" class="cls_006"><span class="cls_006">you to Australia on a student visa.</span></div>
        <div style="position: absolute; left: 32.00px; top: 157.03px" class="cls_006"><span class="cls_006">it to the application form.</span></div>
        <div style="position: absolute; left: 308.00px; top: 161.04px" class="cls_007"><span class="cls_007">All members of your family unit must be declared on</span></div>
        <div style="position: absolute; left: 32.00px; top: 172.03px" class="cls_006"><span class="cls_006">You must provide all of the documentation necessary to support</span></div>
        <div style="position: absolute; left: 308.00px; top: 172.04px" class="cls_007"><span class="cls_007">your application form</span><span class="cls_006">, whether or not they intend to travel</span></div>
        <div style="position: absolute; left: 32.00px; top: 183.03px" class="cls_006"><span class="cls_006">your application (originals or certified or notarised copies) and</span></div>
        <div style="position: absolute; left: 308.00px; top: 183.04px" class="cls_006"><span class="cls_006">to Australia with you. A member who is not declared will not be</span></div>
        <div style="position: absolute; left: 32.00px; top: 194.04px" class="cls_006"><span class="cls_006">you must declare that you have done so. Failure to do so may</span></div>
        <div style="position: absolute; left: 308.00px; top: 194.04px" class="cls_006"><span class="cls_006">eligible for entry to Australia as a family unit member, unless</span></div>
        <div style="position: absolute; left: 32.00px; top: 205.04px" class="cls_006"><span class="cls_006">result in your application being refused. The documentation</span></div>
        <div style="position: absolute; left: 308.00px; top: 205.04px" class="cls_006"><span class="cls_006">they were not your spouse or child at the time you lodged your</span></div>
        <div style="position: absolute; left: 32.00px; top: 216.04px" class="cls_006"><span class="cls_006">required may vary depending on your Assessment Level and</span></div>
        <div style="position: absolute; left: 308.00px; top: 216.04px" class="cls_006"><span class="cls_006">application but have since become so.</span></div>
        <div style="position: absolute; left: 32.00px; top: 227.04px" class="cls_006"><span class="cls_006">the subclass appropriate to your course of study. Information</span></div>
        <div style="position: absolute; left: 308.00px; top: 231.04px" class="cls_006"><span class="cls_006">A school-age family unit member joining you in Australia is</span></div>
        <div style="position: absolute; left: 32.00px; top: 238.04px" class="cls_006"><span class="cls_006">on documentation required is available on the department’s</span></div>
        <div style="position: absolute; left: 308.00px; top: 242.04px" class="cls_006"><span class="cls_006">expected to attend school in Australia. You must provide</span></div>
        <div style="position: absolute; left: 32.00px; top: 249.04px" class="cls_006"><span class="cls_006">website. A decision on your application will be made on the</span></div>
        <div style="position: absolute; left: 308.00px; top: 253.04px" class="cls_006"><span class="cls_006">evidence of enrolment for them if you wish them to be granted</span></div>
        <div style="position: absolute; left: 32.00px; top: 260.04px" class="cls_006"><span class="cls_006">basis of all the information you provide, your circumstances</span></div>
        <div style="position: absolute; left: 308.00px; top: 264.04px" class="cls_006"><span class="cls_006">a student visa as a family unit member. You are responsible for</span></div>
        <div style="position: absolute; left: 32.00px; top: 271.04px" class="cls_006"><span class="cls_006">and the legal requirements that apply. If your circumstances</span></div>
        <div style="position: absolute; left: 308.00px; top: 275.04px" class="cls_006"><span class="cls_006">their education costs in accordance with the charging policy of</span></div>
        <div style="position: absolute; left: 32.00px; top: 282.04px" class="cls_006"><span class="cls_006">change in any way after you make your application you must</span></div>
        <div style="position: absolute; left: 308.00px; top: 286.04px" class="cls_006"><span class="cls_006">the relevant Australian state or territory.</span></div>
        <div style="position: absolute; left: 32.00px; top: 293.04px" class="cls_006"><span class="cls_006">inform the department immediately. Failure to do so can lead</span></div>
        <div style="position: absolute; left: 308.00px; top: 301.04px" class="cls_006"><span class="cls_006">Your spouse will have a condition placed on their visa that limits</span></div>
        <div style="position: absolute; left: 32.00px; top: 304.04px" class="cls_006"><span class="cls_006">to cancellation of your visa (if it is granted).</span></div>
        <div style="position: absolute; left: 308.00px; top: 312.04px" class="cls_006"><span class="cls_006">their period of study in Australia to a maximum of 3 months.</span></div>
        <div style="position: absolute; left: 32.00px; top: 319.04px" class="cls_007"><span class="cls_007">Applicants who provide false or misleading information</span></div>
        <div style="position: absolute; left: 308.00px; top: 323.04px" class="cls_006"><span class="cls_006">If they wish to undertake study beyond this period they must</span></div>
        <div style="position: absolute; left: 32.00px; top: 330.04px" class="cls_007"><span class="cls_007">may either have their applications refused, or their visa</span></div>
        <div style="position: absolute; left: 308.00px; top: 334.04px" class="cls_006"><span class="cls_006">apply for a student visa in their own right.</span></div>
        <div style="position: absolute; left: 32.00px; top: 341.04px" class="cls_007"><span class="cls_007">permitting them to remain in Australia cancelled.</span></div>
        <div style="position: absolute; left: 308.00px; top: 349.04px" class="cls_006"><span class="cls_006">If you are an AusAID or Defence-sponsored student, members</span></div>
        <div style="position: absolute; left: 32.00px; top: 356.04px" class="cls_006"><span class="cls_006">If you:</span></div>
        <div style="position: absolute; left: 308.00px; top: 360.04px" class="cls_006"><span class="cls_006">of your family unit must provide evidence of support by the</span></div>
        <div style="position: absolute; left: 32.00px; top: 369.03px" class="cls_006"><span class="cls_006">• are applying in Australia;</span></div>
        <div style="position: absolute; left: 308.00px; top: 371.04px" class="cls_006"><span class="cls_006">relevant Minister for them to be granted a visa as your</span></div>
        <div style="position: absolute; left: 32.00px; top: 382.03px" class="cls_006"><span class="cls_006">• do not already hold a student visa; and</span></div>
        <div style="position: absolute; left: 308.00px; top: 382.04px" class="cls_006"><span class="cls_006">dependant.</span></div>
        <div style="position: absolute; left: 32.00px; top: 395.03px" class="cls_006"><span class="cls_006">• you are in Assessment Level 2, 3, 4 or 5</span></div>
        <div style="position: absolute; left: 32.00px; top: 410.03px" class="cls_006"><span class="cls_006">you must provide exceptional reasons for the grant of your visa</span></div>
        <div style="position: absolute; left: 308.00px; top: 405.53px" class="cls_002"><span class="cls_002">‘No further stay’ conditions</span></div>
        <div style="position: absolute; left: 32.00px; top: 421.03px" class="cls_006"><span class="cls_006">in Australia.</span></div>
        <div style="position: absolute; left: 308.00px; top: 423.03px" class="cls_006"><span class="cls_006">Your visa will be subject to a number of visa conditions.</span></div>
        <div style="position: absolute; left: 308.00px; top: 434.03px" class="cls_006"><span class="cls_006">Information on these conditions can be found in the</span></div>
        <div style="position: absolute; left: 32.00px; top: 444.53px" class="cls_002"><span class="cls_002">Photographs</span></div>
        <div style="position: absolute; left: 308.00px; top: 445.03px" class="cls_006"><span class="cls_006">information form 1160i</span><span class="cls_008"> Applying for a student visa</span><span class="cls_006"> and on the</span></div>
        <div style="position: absolute; left: 308.00px; top: 456.03px" class="cls_006"><span class="cls_006">department’s website.</span></div>
        <div style="position: absolute; left: 32.00px; top: 462.03px" class="cls_007"><span class="cls_007">Applying outside Australia</span><span class="cls_008"> - </span><span class="cls_006">enclose 4 recent passport-sized</span></div>
        <div style="position: absolute; left: 32.00px; top: 473.03px" class="cls_006"><span class="cls_006">photographs of yourself and all family members included in this</span></div>
        <div style="position: absolute; left: 308.00px; top: 471.03px" class="cls_006"><span class="cls_006">In certain circumstances, your visa may be subject to the ‘no</span></div>
        <div style="position: absolute; left: 32.00px; top: 484.03px" class="cls_006"><span class="cls_006">application.</span></div>
        <div style="position: absolute; left: 308.00px; top: 482.03px" class="cls_006"><span class="cls_006">further stay’ condition 8534 or 8535.</span></div>
        <div style="position: absolute; left: 32.00px; top: 499.03px" class="cls_007"><span class="cls_007">Applying in Australia</span><span class="cls_008"> - </span><span class="cls_006">enclose one recent passport-sized</span></div>
        <div style="position: absolute; left: 308.00px; top: 497.03px" class="cls_007"><span class="cls_007">Condition 8534</span></div>
        <div style="position: absolute; left: 32.00px; top: 510.03px" class="cls_006"><span class="cls_006">photograph of yourself and all family members included in this</span></div>
        <div style="position: absolute; left: 308.00px; top: 512.03px" class="cls_006"><span class="cls_006">If you are an Assessment Level 3, 4 or 5 student whose overall</span></div>
        <div style="position: absolute; left: 32.00px; top: 521.03px" class="cls_006"><span class="cls_006">application.</span></div>
        <div style="position: absolute; left: 308.00px; top: 523.03px" class="cls_006"><span class="cls_006">intended period of study is 10 months or less, you will usually</span></div>
        <div style="position: absolute; left: 308.00px; top: 534.03px" class="cls_006"><span class="cls_006">be subject to this ‘no further stay’ condition. This means that</span></div>
        <div style="position: absolute; left: 32.00px; top: 544.53px" class="cls_002"><span class="cls_002">Health requirements</span></div>
        <div style="position: absolute; left: 308.00px; top: 545.03px" class="cls_006"><span class="cls_006">after entering Australia, you may not be granted any other visa</span></div>
        <div style="position: absolute; left: 308.00px; top: 556.03px" class="cls_006"><span class="cls_006">while you remain in Australia, other than a further student visa</span></div>
        <div style="position: absolute; left: 32.00px; top: 562.03px" class="cls_006"><span class="cls_006">All applicants must meet Australia’s health requirements. You</span></div>
        <div style="position: absolute; left: 308.00px; top: 566.53px" class="cls_006"><span class="cls_006">with permission to work or a Graduate - Skilled visa</span><span class="cls_011"><sup>1</sup></span><span class="cls_006">. If you are</span></div>
        <div style="position: absolute; left: 32.00px; top: 573.03px" class="cls_006"><span class="cls_006">and any family members included in this application may be</span></div>
        <div style="position: absolute; left: 308.00px; top: 578.03px" class="cls_006"><span class="cls_006">an Assessment Level 3 student you may be exempt from the</span></div>
        <div style="position: absolute; left: 32.00px; top: 584.03px" class="cls_006"><span class="cls_006">required to undergo a chest x-ray and medical examination.</span></div>
        <div style="position: absolute; left: 308.00px; top: 589.03px" class="cls_006"><span class="cls_006">mandatory imposition of the ‘no further stay’ if you can show</span></div>
        <div style="position: absolute; left: 32.00px; top: 595.03px" class="cls_006"><span class="cls_006">Refer to form 1163i </span><span class="cls_008">Health requirement for temporary entry</span></div>
        <div style="position: absolute; left: 308.00px; top: 600.03px" class="cls_006"><span class="cls_006">an additional A$12,000 and funds to cover living and school</span></div>
        <div style="position: absolute; left: 32.00px; top: 606.03px" class="cls_008"><span class="cls_008">to Australia</span><span class="cls_006"> for further details.</span></div>
        <div style="position: absolute; left: 308.00px; top: 611.03px" class="cls_006"><span class="cls_006">costs for a 12-month period in addition to the period of your</span></div>
        <div style="position: absolute; left: 32.00px; top: 621.03px" class="cls_006"><span class="cls_006">If applying outside Australia under Assessment Level 3, 4 or 5,</span></div>
        <div style="position: absolute; left: 308.00px; top: 622.03px" class="cls_006"><span class="cls_006">intended study in Australia.</span></div>
        <div style="position: absolute; left: 32.00px; top: 632.03px" class="cls_006"><span class="cls_006">you should not undertake your medical or x-ray examinations</span></div>
        <div style="position: absolute; left: 308.00px; top: 637.03px" class="cls_006"><span class="cls_006">A ‘no further stay’ condition may also be imposed on your visa,</span></div>
        <div style="position: absolute; left: 32.00px; top: 643.03px" class="cls_006"><span class="cls_006">until advised to do so by the Australian Government office</span></div>
        <div style="position: absolute; left: 308.00px; top: 648.03px" class="cls_006"><span class="cls_006">irrespective of your Assessment Level or period of study, if the</span></div>
        <div style="position: absolute; left: 32.00px; top: 654.03px" class="cls_006"><span class="cls_006">processing your visa application.</span></div>
        <div style="position: absolute; left: 308.00px; top: 659.03px" class="cls_006"><span class="cls_006">decision maker considers this appropriate.</span></div>
        <div style="position: absolute; left: 308.00px; top: 674.03px" class="cls_007"><span class="cls_007">Condition 8535</span></div>
        <div style="position: absolute; left: 32.00px; top: 677.53px" class="cls_002"><span class="cls_002">Members of your family unit</span></div>
        <div style="position: absolute; left: 308.00px; top: 689.03px" class="cls_006"><span class="cls_006">If you are sponsored by the Australian Government or the</span></div>
        <div style="position: absolute; left: 32.00px; top: 695.03px" class="cls_006"><span class="cls_006">The term ‘members of the family unit’ covers your spouse</span></div>
        <div style="position: absolute; left: 308.00px; top: 700.03px" class="cls_006"><span class="cls_006">government of your home country, you may be subject to this</span></div>
        <div style="position: absolute; left: 32.00px; top: 706.03px" class="cls_006"><span class="cls_006">(including a de facto spouse) and dependent children of you</span></div>
        <div style="position: absolute; left: 308.00px; top: 711.03px" class="cls_006"><span class="cls_006">‘no further stay’ condition. This means that after entering</span></div>
        <div style="position: absolute; left: 32.00px; top: 717.03px" class="cls_006"><span class="cls_006">or your spouse, who are unmarried and have not turned</span></div>
        <div style="position: absolute; left: 308.00px; top: 722.03px" class="cls_006"><span class="cls_006">Australia, you will not be entitled to be granted any other visa</span></div>
        <div style="position: absolute; left: 32.00px; top: 728.03px" class="cls_006"><span class="cls_006">18 years of age. School-age dependants are unmarried</span></div>
        <div style="position: absolute; left: 308.00px; top: 733.03px" class="cls_006"><span class="cls_006">while you remain in Australia apart from a further student visa</span></div>
        <div style="position: absolute; left: 32.00px; top: 739.03px" class="cls_006"><span class="cls_006">dependent children of you or your spouse who have turned 5,</span></div>
        <div style="position: absolute; left: 308.00px; top: 744.03px" class="cls_006"><span class="cls_006">with permission to work or a further student visa with the</span></div>
        <div style="position: absolute; left: 32.00px; top: 750.03px" class="cls_006"><span class="cls_006">but have not yet turned 18.</span></div>
        <div style="position: absolute; left: 308.00px; top: 754.53px" class="cls_006"><span class="cls_006">consent of your sponsor</span><span class="cls_011"><sup>1</sup></span><span class="cls_006">.</span></div>
        <div style="position: absolute; left: 32.00px; top: 765.03px" class="cls_006"><span class="cls_006">Members of your family unit may apply for visas that will allow</span></div>
        <div style="position: absolute; left: 32.00px; top: 776.04px" class="cls_006"><span class="cls_006">them to join you in Australia. They may apply for visas at the</span></div>
        <div style="position: absolute; left: 308.00px; top: 780.33px" class="cls_011"><span class="cls_011">1</span><span class="cls_012"><sup> </sup></span><span class="cls_013">Or to engage Australia’s protection obligation under the 1951 UN</span></div>
        <div style="position: absolute; left: 32.00px; top: 787.04px" class="cls_006"><span class="cls_006">same time as you, or after you have arrived in Australia and</span></div>
        <div style="position: absolute; left: 308.00px; top: 794.33px" class="cls_013"><span class="cls_013">convention relating to the status of refugees.</span></div>
        <div style="position: absolute; left: 16.00px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 2</span></div>
        <div style="position: absolute; left: 245.94px; top: 820.73px" class="cls_010"><span class="cls_010">© COMMONWEALTH OF AUSTRALIA, 2006</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 1704px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background03.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 32.00px; top: 31.53px" class="cls_002"><span class="cls_002">Visa application charge</span></div>
        <div style="position: absolute; left: 308.00px; top: 31.53px" class="cls_002"><span class="cls_002">Authorisation of a migration agent to act on your behalf</span></div>
        <div style="position: absolute; left: 32.00px; top: 49.03px" class="cls_006"><span class="cls_006">Your completed application form, together with the correct visa</span></div>
        <div style="position: absolute; left: 308.00px; top: 49.03px" class="cls_006"><span class="cls_006">If you have a migration agent acting on your behalf in relation</span></div>
        <div style="position: absolute; left: 32.00px; top: 60.03px" class="cls_006"><span class="cls_006">application charge, can be lodged at the nearest Australian</span></div>
        <div style="position: absolute; left: 308.00px; top: 60.03px" class="cls_006"><span class="cls_006">to your application for a student visa, you need to complete</span></div>
        <div style="position: absolute; left: 32.00px; top: 71.04px" class="cls_006"><span class="cls_006">Government office if applying outside Australia, or at the nearest</span></div>
        <div style="position: absolute; left: 308.00px; top: 71.03px" class="cls_006"><span class="cls_006">Question 73 </span><span class="cls_008">Options for receiving written communications</span></div>
        <div style="position: absolute; left: 32.00px; top: 82.04px" class="cls_006"><span class="cls_006">office of the department if applying in Australia. You can check</span></div>
        <div style="position: absolute; left: 308.00px; top: 82.03px" class="cls_006"><span class="cls_006">and Question 78 </span><span class="cls_008">Agent details</span><span class="cls_006">. The migration agent will need</span></div>
        <div style="position: absolute; left: 32.00px; top: 93.04px" class="cls_006"><span class="cls_006">the visa application charge with your nearest office of the</span></div>
        <div style="position: absolute; left: 308.00px; top: 93.03px" class="cls_006"><span class="cls_006">to sign at Question 80 </span><span class="cls_008">Agent consent</span><span class="cls_006">.</span></div>
        <div style="position: absolute; left: 32.00px; top: 104.04px" class="cls_006"><span class="cls_006">department, or from form 990i </span><span class="cls_008">Charges,</span><span class="cls_006"> which is available in</span></div>
        <div style="position: absolute; left: 308.00px; top: 108.03px" class="cls_006"><span class="cls_006">Appointing a migration agent to act on your behalf includes</span></div>
        <div style="position: absolute; left: 32.00px; top: 115.04px" class="cls_006"><span class="cls_006">the Forms section of the department’s website</span></div>
        <div style="position: absolute; left: 308.00px; top: 119.03px" class="cls_006"><span class="cls_006">authorising the department to:</span></div>
        <div style="position: absolute; left: 32.00px; top: 126.04px" class="cls_007"><span class="cls_007"></span><a href="http://www.immi.gov.au/allforms/">www.immi.gov.au/allforms/</a> </div>
        <div style="position: absolute; left: 308.00px; top: 134.03px" class="cls_006"><span class="cls_006">• discuss your student visa application with the migration agent</span></div>
        <div style="position: absolute; left: 32.00px; top: 141.04px" class="cls_006"><span class="cls_006">Payment must accompany your application and is generally not</span></div>
        <div style="position: absolute; left: 318.00px; top: 145.03px" class="cls_006"><span class="cls_006">and seek further information from them; and</span></div>
        <div style="position: absolute; left: 32.00px; top: 152.04px" class="cls_006"><span class="cls_006">refunded if the application is unsuccessful. If you have paid</span></div>
        <div style="position: absolute; left: 308.00px; top: 160.03px" class="cls_006"><span class="cls_006">• send your migration agent written communications about</span></div>
        <div style="position: absolute; left: 32.00px; top: 163.04px" class="cls_006"><span class="cls_006">enrolment or tuition fees, it is your responsibility to get a refund</span></div>
        <div style="position: absolute; left: 318.00px; top: 171.03px" class="cls_006"><span class="cls_006">your student visa application that would otherwise have been</span></div>
        <div style="position: absolute; left: 32.00px; top: 174.04px" class="cls_006"><span class="cls_006">of these fees.</span></div>
        <div style="position: absolute; left: 318.00px; top: 182.03px" class="cls_006"><span class="cls_006">sent to you.</span></div>
        <div style="position: absolute; left: 32.00px; top: 189.04px" class="cls_006"><span class="cls_006">To make a payment in Australia, please pay by credit card, debit</span></div>
        <div style="position: absolute; left: 308.00px; top: 197.03px" class="cls_007"><span class="cls_007">Note</span><span class="cls_006">: Your migration agent will be your authorised recipient</span></div>
        <div style="position: absolute; left: 32.00px; top: 200.04px" class="cls_006"><span class="cls_006">card or by bank cheque or money order made payable to the</span></div>
        <div style="position: absolute; left: 308.00px; top: 208.03px" class="cls_006"><span class="cls_006">for written communication under section 494D of the Act and,</span></div>
        <div style="position: absolute; left: 32.00px; top: 211.04px" class="cls_006"><span class="cls_006">Department of Immigration and Multicultural Affairs. </span><span class="cls_007">Please</span></div>
        <div style="position: absolute; left: 308.00px; top: 219.03px" class="cls_006"><span class="cls_006">in accordance with that same provision, you will be taken to</span></div>
        <div style="position: absolute; left: 32.00px; top: 222.04px" class="cls_007"><span class="cls_007">do not pay by cash or personal cheque</span><span class="cls_006">.</span></div>
        <div style="position: absolute; left: 308.00px; top: 230.03px" class="cls_006"><span class="cls_006">have received any documents sent to them.</span></div>
        <div style="position: absolute; left: 32.00px; top: 237.04px" class="cls_006"><span class="cls_006">For clients outside Australia, before you make a payment, please</span></div>
        <div style="position: absolute; left: 308.00px; top: 245.03px" class="cls_006"><span class="cls_006">If you change your migration agent or end his/her appointment,</span></div>
        <div style="position: absolute; left: 32.00px; top: 248.04px" class="cls_006"><span class="cls_006">contact the Australian Government office to find out what</span></div>
        <div style="position: absolute; left: 308.00px; top: 256.03px" class="cls_006"><span class="cls_006">after you have lodged this application, you must promptly</span></div>
        <div style="position: absolute; left: 32.00px; top: 259.04px" class="cls_006"><span class="cls_006">methods of payment can be accepted at that office.</span></div>
        <div style="position: absolute; left: 308.00px; top: 267.03px" class="cls_006"><span class="cls_006">advise the department in writing, preferably by using form 956</span></div>
        <div style="position: absolute; left: 308.00px; top: 278.04px" class="cls_008"><span class="cls_008">Appointment of a migration agent</span><span class="cls_006">, which is available on the</span></div>
        <div style="position: absolute; left: 32.00px; top: 282.53px" class="cls_002"><span class="cls_002">Authorisation of a person to only receive written</span></div>
        <div style="position: absolute; left: 308.00px; top: 289.04px" class="cls_006"><span class="cls_006">department’s website </span><a href="http://www.immi.gov.au/allforms/">www.immi.gov.au/allforms/</a> </span><span class="cls_006"> or from</span></div>
        <div style="position: absolute; left: 32.00px; top: 296.53px" class="cls_002"><span class="cls_002">communications</span></div>
        <div style="position: absolute; left: 308.00px; top: 300.04px" class="cls_006"><span class="cls_006">your migration agent.</span></div>
        <div style="position: absolute; left: 32.00px; top: 314.03px" class="cls_006"><span class="cls_006">You may authorise another person to only receive all written</span></div>
        <div style="position: absolute; left: 308.00px; top: 315.03px" class="cls_006"><span class="cls_006">The department will communicate with your migration agent</span></div>
        <div style="position: absolute; left: 32.00px; top: 325.03px" class="cls_006"><span class="cls_006">communications about your application for a student visa with</span></div>
        <div style="position: absolute; left: 308.00px; top: 326.04px" class="cls_006"><span class="cls_006">about your application, including your personal information</span></div>
        <div style="position: absolute; left: 32.00px; top: 336.03px" class="cls_006"><span class="cls_006">the department. That person will be known as your authorised</span></div>
        <div style="position: absolute; left: 308.00px; top: 337.04px" class="cls_006"><span class="cls_006">such as health, police checks, financial viability and personal</span></div>
        <div style="position: absolute; left: 32.00px; top: 347.03px" class="cls_006"><span class="cls_006">recipient. To do this, you will need to complete Question 73</span></div>
        <div style="position: absolute; left: 308.00px; top: 348.04px" class="cls_006"><span class="cls_006">relationships. If your agent authorises it at Question 79 this</span></div>
        <div style="position: absolute; left: 32.00px; top: 358.03px" class="cls_008"><span class="cls_008">Options for receiving written communications</span><span class="cls_006"> and</span></div>
        <div style="position: absolute; left: 308.00px; top: 359.04px" class="cls_006"><span class="cls_006">communication may take place by e-mail or fax.</span></div>
        <div style="position: absolute; left: 32.00px; top: 369.03px" class="cls_006"><span class="cls_006">Question 75</span><span class="cls_007"> </span><span class="cls_008">Authorised recipient details</span><span class="cls_006"> in this form. The</span></div>
        <div style="position: absolute; left: 308.00px; top: 374.04px" class="cls_006"><span class="cls_006">The department will send to your migration agent only</span></div>
        <div style="position: absolute; left: 32.00px; top: 380.03px" class="cls_006"><span class="cls_006">authorised recipient will need to sign at Question 77</span><span class="cls_007"> </span><span class="cls_008">Authorised</span></div>
        <div style="position: absolute; left: 308.00px; top: 385.04px" class="cls_006"><span class="cls_006">information which you are entitled to receive. For example, if</span></div>
        <div style="position: absolute; left: 32.00px; top: 391.03px" class="cls_008"><span class="cls_008">recipient consent</span><span class="cls_006">. You can only appoint one authorised</span></div>
        <div style="position: absolute; left: 308.00px; top: 396.04px" class="cls_006"><span class="cls_006">you are a visa applicant and have a sponsor, your agent will not</span></div>
        <div style="position: absolute; left: 32.00px; top: 402.03px" class="cls_006"><span class="cls_006">recipient at any time. The department will communicate with</span></div>
        <div style="position: absolute; left: 308.00px; top: 407.04px" class="cls_006"><span class="cls_006">receive personal information about your sponsor, unless your</span></div>
        <div style="position: absolute; left: 32.00px; top: 413.03px" class="cls_006"><span class="cls_006">the most recently appointed authorised recipient.</span></div>
        <div style="position: absolute; left: 308.00px; top: 418.04px" class="cls_006"><span class="cls_006">sponsor has also appointed the same migration agent.</span></div>
        <div style="position: absolute; left: 32.00px; top: 428.03px" class="cls_006"><span class="cls_006">The department is required under section 494D of the</span></div>
        <div style="position: absolute; left: 308.00px; top: 433.04px" class="cls_006"><span class="cls_006">In some situations, departmental staff will need to speak with</span></div>
        <div style="position: absolute; left: 32.00px; top: 439.03px" class="cls_008"><span class="cls_008">Migration Act 1958</span><span class="cls_006"> (the Act) to send your authorised recipient</span></div>
        <div style="position: absolute; left: 308.00px; top: 444.04px" class="cls_006"><span class="cls_006">you directly rather than with your migration agent. For example,</span></div>
        <div style="position: absolute; left: 32.00px; top: 450.03px" class="cls_006"><span class="cls_006">any written communications relating to your application that</span></div>
        <div style="position: absolute; left: 308.00px; top: 455.04px" class="cls_006"><span class="cls_006">if you are applying for a visa the department may interview you.</span></div>
        <div style="position: absolute; left: 32.00px; top: 461.03px" class="cls_006"><span class="cls_006">would otherwise have been sent to you (but a copy of that</span></div>
        <div style="position: absolute; left: 308.00px; top: 466.04px" class="cls_006"><span class="cls_006">In some situations, the department will also send documents</span></div>
        <div style="position: absolute; left: 32.00px; top: 472.03px" class="cls_006"><span class="cls_006">communication may also be sent to you). If your authorised</span></div>
        <div style="position: absolute; left: 308.00px; top: 477.04px" class="cls_006"><span class="cls_006">to you directly (for example, your passport) instead of to your</span></div>
        <div style="position: absolute; left: 32.00px; top: 483.03px" class="cls_006"><span class="cls_006">recipient agrees to it at Question 76, this communication may</span></div>
        <div style="position: absolute; left: 308.00px; top: 488.04px" class="cls_006"><span class="cls_006">migration agent, but it will inform your migration agent that it</span></div>
        <div style="position: absolute; left: 32.00px; top: 494.03px" class="cls_006"><span class="cls_006">take place by fax or e-mail.</span></div>
        <div style="position: absolute; left: 308.00px; top: 499.04px" class="cls_006"><span class="cls_006">has done so.</span></div>
        <div style="position: absolute; left: 32.00px; top: 509.03px" class="cls_006"><span class="cls_006">The department will send your authorised recipient only</span></div>
        <div style="position: absolute; left: 308.00px; top: 514.04px" class="cls_006"><span class="cls_006">If you have appointed a migration agent to act for you, you are</span></div>
        <div style="position: absolute; left: 32.00px; top: 520.03px" class="cls_006"><span class="cls_006">information which you are entitled to receive. For example, if</span></div>
        <div style="position: absolute; left: 308.00px; top: 525.04px" class="cls_006"><span class="cls_006">still responsible for the accuracy of information and supporting</span></div>
        <div style="position: absolute; left: 32.00px; top: 531.03px" class="cls_006"><span class="cls_006">you are a visa applicant and have a sponsor, your authorised</span></div>
        <div style="position: absolute; left: 308.00px; top: 536.04px" class="cls_006"><span class="cls_006">documentation that you give to your migration agent to forward</span></div>
        <div style="position: absolute; left: 32.00px; top: 542.03px" class="cls_006"><span class="cls_006">recipient will not receive personal information about your</span></div>
        <div style="position: absolute; left: 308.00px; top: 547.04px" class="cls_006"><span class="cls_006">to the department.</span></div>
        <div style="position: absolute; left: 32.00px; top: 553.03px" class="cls_006"><span class="cls_006">sponsor, unless your sponsor also appointed the same</span></div>
        <div style="position: absolute; left: 32.00px; top: 564.03px" class="cls_006"><span class="cls_006">authorised recipient.</span></div>
        <div style="position: absolute; left: 308.00px; top: 562.04px" class="cls_006"><span class="cls_006">When you provide the details of your migration agent, please</span></div>
        <div style="position: absolute; left: 308.00px; top: 573.04px" class="cls_006"><span class="cls_006">make sure you include their 7-digit:</span></div>
        <div style="position: absolute; left: 32.00px; top: 579.03px" class="cls_006"><span class="cls_006">If you decide to change your nominated authorised recipient,</span></div>
        <div style="position: absolute; left: 32.00px; top: 590.03px" class="cls_006"><span class="cls_006">after you have lodged this application, you must promptly</span></div>
        <div style="position: absolute; left: 308.00px; top: 588.03px" class="cls_006"><span class="cls_006">• migration agent registration number (if they are a registered</span></div>
        <div style="position: absolute; left: 32.00px; top: 601.04px" class="cls_006"><span class="cls_006">advise the department in writing. You may use form 1231</span></div>
        <div style="position: absolute; left: 318.00px; top: 599.03px" class="cls_006"><span class="cls_006">migration agent); or</span></div>
        <div style="position: absolute; left: 32.00px; top: 612.04px" class="cls_008"><span class="cls_008">Appointment of authorised recipient</span><span class="cls_006"> for this purpose, which is</span></div>
        <div style="position: absolute; left: 308.00px; top: 614.03px" class="cls_006"><span class="cls_006">• offshore agent ID number (if they have been allocated one</span></div>
        <div style="position: absolute; left: 32.00px; top: 623.04px" class="cls_006"><span class="cls_006">available from the department’s website</span></div>
        <div style="position: absolute; left: 318.00px; top: 625.03px" class="cls_006"><span class="cls_006">by the department).</span></div>
        <div style="position: absolute; left: 32.00px; top: 634.04px" class="cls_007"><span class="cls_007"></span><a href="http://www.immi.gov.au/allforms/">www.immi.gov.au/allforms/</a> <span class="cls_006">or from any office of the</span></div>
        <div style="position: absolute; left: 308.00px; top: 640.03px" class="cls_007"><span class="cls_007">Note</span><span class="cls_006">: Migration agents who operate overseas do not need to</span></div>
        <div style="position: absolute; left: 32.00px; top: 645.04px" class="cls_006"><span class="cls_006">department or Australian mission.</span></div>
        <div style="position: absolute; left: 308.00px; top: 651.03px" class="cls_006"><span class="cls_006">be registered. However, they may have been allocated an ID</span></div>
        <div style="position: absolute; left: 308.00px; top: 662.03px" class="cls_006"><span class="cls_006">number by the department.</span></div>
        <div style="position: absolute; left: 459.55px; top: 792.03px" class="cls_009"><span class="cls_009">Continued on the next page</span></div>
        <div style="position: absolute; left: 245.98px; top: 820.73px" class="cls_010"><span class="cls_010">© COMMONWEALTH OF AUSTRALIA, 2006</span></div>
        <div style="position: absolute; left: 499.13px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 3</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 2556px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background04.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 32.00px; top: 31.53px" class="cls_002"><span class="cls_002">Using a migration agent</span></div>
        <div style="position: absolute; left: 308.00px; top: 31.53px" class="cls_002"><span class="cls_002">Notification of giving immigration assistance</span></div>
        <div style="position: absolute; left: 32.00px; top: 49.03px" class="cls_006"><span class="cls_006">You are not required to use a migration agent. However, if you</span></div>
        <div style="position: absolute; left: 308.00px; top: 49.03px" class="cls_006"><span class="cls_006">Under section 312A of the Act, a registered agent has a duty to</span></div>
        <div style="position: absolute; left: 32.00px; top: 60.03px" class="cls_006"><span class="cls_006">use a migration agent, the department encourages you to use</span></div>
        <div style="position: absolute; left: 308.00px; top: 60.03px" class="cls_006"><span class="cls_006">notify the department when lodging an application on behalf</span></div>
        <div style="position: absolute; left: 32.00px; top: 71.04px" class="cls_006"><span class="cls_006">a registered migration agent. Registered migration agents are</span></div>
        <div style="position: absolute; left: 308.00px; top: 71.03px" class="cls_006"><span class="cls_006">of a client, or within 28 days of commencing to act on behalf of</span></div>
        <div style="position: absolute; left: 32.00px; top: 82.04px" class="cls_006"><span class="cls_006">bound by the Migration Agents Code of Conduct, which requires</span></div>
        <div style="position: absolute; left: 308.00px; top: 82.03px" class="cls_006"><span class="cls_006">a visa applicant. This notification can be done by completing,</span></div>
        <div style="position: absolute; left: 32.00px; top: 93.04px" class="cls_006"><span class="cls_006">them to act in the lawful best interests of their clients and act</span></div>
        <div style="position: absolute; left: 308.00px; top: 93.03px" class="cls_006"><span class="cls_006">and your agent signing, the relevant sections of this application</span></div>
        <div style="position: absolute; left: 32.00px; top: 104.04px" class="cls_006"><span class="cls_006">professionally.</span></div>
        <div style="position: absolute; left: 308.00px; top: 104.03px" class="cls_006"><span class="cls_006">form.</span></div>
        <div style="position: absolute; left: 32.00px; top: 119.04px" class="cls_006"><span class="cls_006">A list of registered migration agents is available from the</span></div>
        <div style="position: absolute; left: 32.00px; top: 130.04px" class="cls_006"><span class="cls_006">Migration Agents Registration Authority (MARA) website</span></div>
        <div style="position: absolute; left: 308.00px; top: 127.53px" class="cls_002"><span class="cls_002">Residential address</span></div>
        <div style="position: absolute; left: 32.00px; top: 141.04px" class="cls_006"><span class="cls_006"></span><a href="http://www.themara.com.au/">www.themara.com.au</a> </div>
        <div style="position: absolute; left: 308.00px; top: 145.03px" class="cls_006"><span class="cls_006">You must tell the department where you intend to live while</span></div>
        <div style="position: absolute; left: 32.00px; top: 156.04px" class="cls_006"><span class="cls_006">You can contact the MARA at:</span></div>
        <div style="position: absolute; left: 308.00px; top: 156.03px" class="cls_006"><span class="cls_006">your application is being dealt with. Failure to give a residential</span></div>
        <div style="position: absolute; left: 308.00px; top: 167.03px" class="cls_006"><span class="cls_006">address will result in your application being invalid. A post office</span></div>
        <div style="position: absolute; left: 32.00px; top: 171.04px" class="cls_006"><span class="cls_006">E-mail:</span></div>
        <div style="position: absolute; left: 88.00px; top: 171.04px" class="cls_006"><span class="cls_006">themara@themara.com.au</span></div>
        <div style="position: absolute; left: 308.00px; top: 178.03px" class="cls_006"><span class="cls_006">box address will not be accepted as your residential address.</span></div>
        <div style="position: absolute; left: 32.00px; top: 186.04px" class="cls_006"><span class="cls_006">PO Box Q1551</span></div>
        <div style="position: absolute; left: 32.00px; top: 197.04px" class="cls_006"><span class="cls_006">QVB  NSW  1230</span></div>
        <div style="position: absolute; left: 308.00px; top: 201.53px" class="cls_002"><span class="cls_002">Consent to communicate electronically</span></div>
        <div style="position: absolute; left: 32.00px; top: 208.04px" class="cls_006"><span class="cls_006">AUSTRALIA</span></div>
        <div style="position: absolute; left: 308.00px; top: 219.03px" class="cls_006"><span class="cls_006">The department may use a range of means to communicate</span></div>
        <div style="position: absolute; left: 32.00px; top: 223.04px" class="cls_006"><span class="cls_006">Telephone:</span></div>
        <div style="position: absolute; left: 88.00px; top: 223.04px" class="cls_006"><span class="cls_006">61 2 9299 5446</span></div>
        <div style="position: absolute; left: 308.00px; top: 230.03px" class="cls_006"><span class="cls_006">with you. However, electronic means such as fax or e-mail will</span></div>
        <div style="position: absolute; left: 32.00px; top: 238.04px" class="cls_006"><span class="cls_006">Fax:</span></div>
        <div style="position: absolute; left: 88.00px; top: 238.04px" class="cls_006"><span class="cls_006">61 2 9299 8448</span></div>
        <div style="position: absolute; left: 308.00px; top: 241.03px" class="cls_006"><span class="cls_006">only be used if you indicate your agreement to receiving</span></div>
        <div style="position: absolute; left: 32.00px; top: 253.04px" class="cls_006"><span class="cls_006">The MARA investigates complaints against registered migration</span></div>
        <div style="position: absolute; left: 308.00px; top: 252.03px" class="cls_006"><span class="cls_006">communication in this way.</span></div>
        <div style="position: absolute; left: 32.00px; top: 264.04px" class="cls_006"><span class="cls_006">agents and may take disciplinary action against them. If you</span></div>
        <div style="position: absolute; left: 308.00px; top: 267.03px" class="cls_006"><span class="cls_006">To process your application the department may need to</span></div>
        <div style="position: absolute; left: 32.00px; top: 275.04px" class="cls_006"><span class="cls_006">have a concern about a registered migration agent, you should</span></div>
        <div style="position: absolute; left: 308.00px; top: 278.03px" class="cls_006"><span class="cls_006">communicate with you about sensitive information, for example,</span></div>
        <div style="position: absolute; left: 32.00px; top: 286.04px" class="cls_006"><span class="cls_006">contact the MARA. A copy of the complaint form is available</span></div>
        <div style="position: absolute; left: 308.00px; top: 289.03px" class="cls_006"><span class="cls_006">health, police checks, financial viability and personal</span></div>
        <div style="position: absolute; left: 32.00px; top: 297.04px" class="cls_006"><span class="cls_006">from the MARA website.</span></div>
        <div style="position: absolute; left: 308.00px; top: 300.03px" class="cls_006"><span class="cls_006">relationships. Electronic communications, unless adequately</span></div>
        <div style="position: absolute; left: 308.00px; top: 311.04px" class="cls_006"><span class="cls_006">encrypted, are not secure and may be viewed by others or</span></div>
        <div style="position: absolute; left: 32.00px; top: 320.53px" class="cls_002"><span class="cls_002">Restrictions on giving immigration assistance</span></div>
        <div style="position: absolute; left: 308.00px; top: 322.04px" class="cls_006"><span class="cls_006">interfered with. If you agree to the department communicating</span></div>
        <div style="position: absolute; left: 308.00px; top: 333.04px" class="cls_006"><span class="cls_006">with you by electronic means, the details you provide will only</span></div>
        <div style="position: absolute; left: 32.00px; top: 338.03px" class="cls_006"><span class="cls_006">In Australia, anyone (including a lawyer) who uses knowledge</span></div>
        <div style="position: absolute; left: 308.00px; top: 344.04px" class="cls_006"><span class="cls_006">be used by the department for the purpose for which you have</span></div>
        <div style="position: absolute; left: 32.00px; top: 349.03px" class="cls_006"><span class="cls_006">of migration procedure to offer immigration assistance to a visa</span></div>
        <div style="position: absolute; left: 308.00px; top: 355.04px" class="cls_006"><span class="cls_006">provided them, unless there is a legal obligation or necessity to</span></div>
        <div style="position: absolute; left: 32.00px; top: 360.03px" class="cls_006"><span class="cls_006">or cancellation review applicant, sponsor or nominator, must</span></div>
        <div style="position: absolute; left: 308.00px; top: 366.04px" class="cls_006"><span class="cls_006">use them for another purpose, or you have consented to use</span></div>
        <div style="position: absolute; left: 32.00px; top: 371.03px" class="cls_006"><span class="cls_006">be registered, unless exempted from registration requirements</span></div>
        <div style="position: absolute; left: 308.00px; top: 377.04px" class="cls_006"><span class="cls_006">for another purpose. They will not be added to any mailing list.</span></div>
        <div style="position: absolute; left: 32.00px; top: 382.04px" class="cls_006"><span class="cls_006">by law. There are serious criminal penalties under Part 3 of the</span></div>
        <div style="position: absolute; left: 32.00px; top: 393.04px" class="cls_006"><span class="cls_006">Act for breaching the law, including possible imprisonment if</span></div>
        <div style="position: absolute; left: 308.00px; top: 392.04px" class="cls_006"><span class="cls_006">The Australian Government accepts no responsibility for the</span></div>
        <div style="position: absolute; left: 32.00px; top: 404.04px" class="cls_006"><span class="cls_006">the unregistered person asks for, or receives, a fee or reward</span></div>
        <div style="position: absolute; left: 308.00px; top: 403.04px" class="cls_006"><span class="cls_006">security or integrity of any information sent to the department</span></div>
        <div style="position: absolute; left: 32.00px; top: 415.04px" class="cls_006"><span class="cls_006">for their services.</span></div>
        <div style="position: absolute; left: 308.00px; top: 414.04px" class="cls_006"><span class="cls_006">over the internet or by other electronic means.</span></div>
        <div style="position: absolute; left: 308.00px; top: 429.04px" class="cls_006"><span class="cls_006">If you authorise another person to receive documents on your</span></div>
        <div style="position: absolute; left: 32.00px; top: 438.53px" class="cls_002"><span class="cls_002">Using an agent exempted from registration</span></div>
        <div style="position: absolute; left: 308.00px; top: 440.04px" class="cls_006"><span class="cls_006">behalf and they wish to be contacted electronically, their</span></div>
        <div style="position: absolute; left: 308.00px; top: 451.04px" class="cls_006"><span class="cls_006">signature is required on the form to indicate their consent to</span></div>
        <div style="position: absolute; left: 32.00px; top: 456.03px" class="cls_006"><span class="cls_006">Certain people, such as officials, parliamentarians, diplomats,</span></div>
        <div style="position: absolute; left: 308.00px; top: 462.04px" class="cls_006"><span class="cls_006">this form of communication.</span></div>
        <div style="position: absolute; left: 32.00px; top: 467.03px" class="cls_006"><span class="cls_006">close family members (that is, only your spouse, child, adopted</span></div>
        <div style="position: absolute; left: 32.00px; top: 478.03px" class="cls_006"><span class="cls_006">child, parent, brother or sister), sponsors and nominators, are</span></div>
        <div style="position: absolute; left: 32.00px; top: 489.04px" class="cls_006"><span class="cls_006">able to provide you with immigration assistance as long as they</span></div>
        <div style="position: absolute; left: 308.00px; top: 485.53px" class="cls_002"><span class="cls_002">About the information you give to the department</span></div>
        <div style="position: absolute; left: 32.00px; top: 500.04px" class="cls_006"><span class="cls_006">do not ask or receive a fee or reward. If you wish to appoint an</span></div>
        <div style="position: absolute; left: 308.00px; top: 503.03px" class="cls_006"><span class="cls_006">The department is authorised to collect information provided</span></div>
        <div style="position: absolute; left: 32.00px; top: 511.04px" class="cls_006"><span class="cls_006">‘exempted agent’, you must complete form 956 </span><span class="cls_008">Appointment</span></div>
        <div style="position: absolute; left: 308.00px; top: 514.03px" class="cls_006"><span class="cls_006">on this form under Part 2 of the </span><span class="cls_008">Migration Act 1958</span><span class="cls_006">. The</span></div>
        <div style="position: absolute; left: 32.00px; top: 522.04px" class="cls_008"><span class="cls_008">of a migration agent</span><span class="cls_006">, which is available from the department’s</span></div>
        <div style="position: absolute; left: 308.00px; top: 525.03px" class="cls_006"><span class="cls_006">information collected will be used for assessing your eligibility</span></div>
        <div style="position: absolute; left: 32.00px; top: 533.04px" class="cls_006"><span class="cls_006">website </span><a href="http://www.immi.gov.au/allforms/">www.immi.gov.au/allforms/</a> </span><span class="cls_006"> and attach it to this</span></div>
        <div style="position: absolute; left: 308.00px; top: 536.03px" class="cls_006"><span class="cls_006">for a student visa to travel to and enter and/or remain in</span></div>
        <div style="position: absolute; left: 32.00px; top: 544.04px" class="cls_006"><span class="cls_006">application form.</span></div>
        <div style="position: absolute; left: 308.00px; top: 547.03px" class="cls_006"><span class="cls_006">Australia, to monitor the conduct of migration agents, and for</span></div>
        <div style="position: absolute; left: 308.00px; top: 558.03px" class="cls_006"><span class="cls_006">other purposes relating to the administration of the Migration</span></div>
        <div style="position: absolute; left: 32.00px; top: 567.53px" class="cls_002"><span class="cls_002">Applications for multiple visas</span></div>
        <div style="position: absolute; left: 308.00px; top: 569.03px" class="cls_006"><span class="cls_006">Act.</span></div>
        <div style="position: absolute; left: 32.00px; top: 585.03px" class="cls_006"><span class="cls_006">If you are a dependant applicant (for example, the spouse of a</span></div>
        <div style="position: absolute; left: 308.00px; top: 584.03px" class="cls_006"><span class="cls_006">The information collected might also be disclosed to agencies</span></div>
        <div style="position: absolute; left: 32.00px; top: 596.03px" class="cls_006"><span class="cls_006">primary applicant) and you wish to appoint a different migration</span></div>
        <div style="position: absolute; left: 308.00px; top: 595.03px" class="cls_006"><span class="cls_006">who are authorised to receive information relating to adoption,</span></div>
        <div style="position: absolute; left: 32.00px; top: 607.03px" class="cls_006"><span class="cls_006">agent to the primary applicant, you must fill out a separate</span></div>
        <div style="position: absolute; left: 308.00px; top: 606.03px" class="cls_006"><span class="cls_006">border control, business skills, citizenship, education, health</span></div>
        <div style="position: absolute; left: 32.00px; top: 618.03px" class="cls_006"><span class="cls_006">form 956 </span><span class="cls_008">Appointment of a migration agent</span><span class="cls_006">, which is available</span></div>
        <div style="position: absolute; left: 308.00px; top: 617.04px" class="cls_006"><span class="cls_006">assessment, health insurance, health services, law enforcement,</span></div>
        <div style="position: absolute; left: 32.00px; top: 629.03px" class="cls_006"><span class="cls_006">from the department’s website </span><a href="http://www.immi.gov.au/allforms/">www.immi.gov.au/allforms/</a> </span></div>
        <div style="position: absolute; left: 308.00px; top: 628.04px" class="cls_006"><span class="cls_006">payment of pensions and benefits, taxation, review of decisions</span></div>
        <div style="position: absolute; left: 32.00px; top: 640.03px" class="cls_006"><span class="cls_006">or advise the department in writing. Otherwise, the migration</span></div>
        <div style="position: absolute; left: 308.00px; top: 639.04px" class="cls_006"><span class="cls_006">and registration of migration agents. It will also be disclosed to</span></div>
        <div style="position: absolute; left: 32.00px; top: 651.03px" class="cls_006"><span class="cls_006">agent appointed by the principal applicant will have the</span></div>
        <div style="position: absolute; left: 308.00px; top: 650.04px" class="cls_006"><span class="cls_006">any agency of the Australian Government, or of a state or</span></div>
        <div style="position: absolute; left: 32.00px; top: 662.03px" class="cls_006"><span class="cls_006">authority to act for all persons included in the application.</span></div>
        <div style="position: absolute; left: 308.00px; top: 661.04px" class="cls_006"><span class="cls_006">territory, that is responsible for or otherwise concerned with</span></div>
        <div style="position: absolute; left: 308.00px; top: 672.04px" class="cls_006"><span class="cls_006">the regulation of education providers.</span></div>
        <div style="position: absolute; left: 308.00px; top: 687.04px" class="cls_006"><span class="cls_006">Relevant information about you will be disclosed to federal,</span></div>
        <div style="position: absolute; left: 308.00px; top: 698.04px" class="cls_006"><span class="cls_006">state and territory police to assist in your location and possible</span></div>
        <div style="position: absolute; left: 308.00px; top: 709.04px" class="cls_006"><span class="cls_006">detention in the event that you become an unlawful non-citizen.</span></div>
        <div style="position: absolute; left: 308.00px; top: 720.04px" class="cls_006"><span class="cls_006">You will become an unlawful non-citizen if your visa ceases (for</span></div>
        <div style="position: absolute; left: 308.00px; top: 731.04px" class="cls_006"><span class="cls_006">example, by cancellation for breach of visa condition) or expires</span></div>
        <div style="position: absolute; left: 308.00px; top: 742.04px" class="cls_006"><span class="cls_006">and you do not hold another visa authorising you to remain in</span></div>
        <div style="position: absolute; left: 308.00px; top: 753.04px" class="cls_006"><span class="cls_006">Australia.</span></div>
        <div style="position: absolute; left: 16.00px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 4</span></div>
        <div style="position: absolute; left: 245.98px; top: 820.73px" class="cls_010"><span class="cls_010">© COMMONWEALTH OF AUSTRALIA, 2006</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 3408px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background05.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 32.00px; top: 32.03px" class="cls_006"><span class="cls_006">The information on this form, including the results of any tests</span></div>
        <div style="position: absolute; left: 32.00px; top: 43.03px" class="cls_006"><span class="cls_006">for Human Immunodeficiency Virus (HIV), will be used to</span></div>
        <div style="position: absolute; left: 32.00px; top: 54.03px" class="cls_006"><span class="cls_006">assess your health for an Australian visa. A positive HIV </span><span class="cls_007">or other</span></div>
        <div style="position: absolute; left: 32.00px; top: 65.03px" class="cls_006"><span class="cls_006">test result will not necessarily lead to a visa being denied. Your</span></div>
        <div style="position: absolute; left: 32.00px; top: 76.03px" class="cls_006"><span class="cls_006">result(s) may be disclosed to the relevant Australian</span></div>
        <div style="position: absolute; left: 32.00px; top: 87.03px" class="cls_006"><span class="cls_006">Government state and territory health agencies.</span></div>
        <div style="position: absolute; left: 32.00px; top: 102.03px" class="cls_006"><span class="cls_006">In addition, the relevant registered education provider(s) may</span></div>
        <div style="position: absolute; left: 32.00px; top: 113.03px" class="cls_006"><span class="cls_006">be told whether or not your visa has been granted. The</span></div>
        <div style="position: absolute; left: 32.00px; top: 124.03px" class="cls_006"><span class="cls_006">collection, access, storage, use and disclosure by the department</span></div>
        <div style="position: absolute; left: 32.00px; top: 135.03px" class="cls_006"><span class="cls_006">of the information you provide in this form is governed by the</span></div>
        <div style="position: absolute; left: 32.00px; top: 146.03px" class="cls_008"><span class="cls_008">Privacy Act 1988</span><span class="cls_006"> and, in particular, by the 11 Information</span></div>
        <div style="position: absolute; left: 32.00px; top: 157.03px" class="cls_006"><span class="cls_006">Privacy Principles. The information form 993i </span><span class="cls_008">Safeguarding</span></div>
        <div style="position: absolute; left: 32.00px; top: 168.03px" class="cls_008"><span class="cls_008">your personal information </span><span class="cls_006">gives details of agencies to which</span></div>
        <div style="position: absolute; left: 32.00px; top: 179.04px" class="cls_006"><span class="cls_006">your personal information might be disclosed. This form is</span></div>
        <div style="position: absolute; left: 32.00px; top: 190.04px" class="cls_006"><span class="cls_006">available from the department’s website</span></div>
        <div style="position: absolute; left: 32.00px; top: 201.04px" class="cls_007"><span class="cls_007"></span><a href="http://www.immi.gov.au/allforms/">www.immi.gov.au/allforms/</a> <span class="cls_006">or from any departmental office</span></div>
        <div style="position: absolute; left: 32.00px; top: 212.04px" class="cls_006"><span class="cls_006">or Australian mission overseas.</span></div>
        <div style="position: absolute; left: 32.00px; top: 227.04px" class="cls_006"><span class="cls_006">The department has authority under the </span><span class="cls_008">Migration Act 1958</span><span class="cls_006"> to</span></div>
        <div style="position: absolute; left: 32.00px; top: 238.04px" class="cls_006"><span class="cls_006">collect a range of personal identifiers from non-citizens,</span></div>
        <div style="position: absolute; left: 32.00px; top: 249.04px" class="cls_006"><span class="cls_006">including visa applicants, in certain circumstances. For more</span></div>
        <div style="position: absolute; left: 32.00px; top: 260.04px" class="cls_006"><span class="cls_006">detailed information you should read information form 1243i</span></div>
        <div style="position: absolute; left: 32.00px; top: 271.04px" class="cls_008"><span class="cls_008">Your personal identifying information</span><span class="cls_006">. This form is available</span></div>
        <div style="position: absolute; left: 32.00px; top: 282.04px" class="cls_006"><span class="cls_006">from the department’s website </span><a href="http://www.immi.gov.au/allforms/">www.immi.gov.au/allforms/</a> </span></div>
        <div style="position: absolute; left: 32.00px; top: 293.04px" class="cls_006"><span class="cls_006">or from any departmental office or Australian mission overseas.</span></div>
        <div style="position: absolute; left: 32.00px; top: 308.04px" class="cls_006"><span class="cls_006">The </span><span class="cls_008">Freedom of Information Act 1982</span><span class="cls_006"> (FOI Act) also relates to</span></div>
        <div style="position: absolute; left: 32.00px; top: 319.04px" class="cls_006"><span class="cls_006">your personal information. Under the FOI Act you can apply for</span></div>
        <div style="position: absolute; left: 32.00px; top: 330.04px" class="cls_006"><span class="cls_006">access to documents containing your personal information. You</span></div>
        <div style="position: absolute; left: 32.00px; top: 341.04px" class="cls_006"><span class="cls_006">or someone authorised by you to access information on your</span></div>
        <div style="position: absolute; left: 32.00px; top: 352.04px" class="cls_006"><span class="cls_006">behalf can apply to do this at any departmental office in</span></div>
        <div style="position: absolute; left: 32.00px; top: 363.04px" class="cls_006"><span class="cls_006">Australia. There is no fee for accessing your own information.</span></div>
        <div style="position: absolute; left: 32.00px; top: 374.04px" class="cls_006"><span class="cls_006">If you are overseas, you must also provide the Australian mission</span></div>
        <div style="position: absolute; left: 32.00px; top: 385.04px" class="cls_006"><span class="cls_006">with an address in Australia to which copies of personal records</span></div>
        <div style="position: absolute; left: 32.00px; top: 396.04px" class="cls_006"><span class="cls_006">can be sent. More information on how to make a request under</span></div>
        <div style="position: absolute; left: 32.00px; top: 407.04px" class="cls_006"><span class="cls_006">the FOI Act is given on form 424A </span><span class="cls_008">Request for access to</span></div>
        <div style="position: absolute; left: 32.00px; top: 418.04px" class="cls_008"><span class="cls_008">documents under the Freedom of Information Act 1982 </span><span class="cls_006">which</span></div>
        <div style="position: absolute; left: 32.00px; top: 429.04px" class="cls_006"><span class="cls_006">is available from the department’s website</span></div>
        <div style="position: absolute; left: 32.00px; top: 440.04px" class="cls_007"><span class="cls_007"></span><a href="http://www.immi.gov.au/allforms/">www.immi.gov.au/allforms/</a> <span class="cls_006">or from any departmental office</span></div>
        <div style="position: absolute; left: 32.00px; top: 451.04px" class="cls_006"><span class="cls_006">or Australian mission overseas.</span></div>
        <div style="position: absolute; left: 32.00px; top: 474.53px" class="cls_002"><span class="cls_002">Review rights</span></div>
        <div style="position: absolute; left: 32.00px; top: 492.03px" class="cls_006"><span class="cls_006">If you apply for a student visa in Australia and you are refused</span></div>
        <div style="position: absolute; left: 32.00px; top: 503.03px" class="cls_006"><span class="cls_006">the visa, you may apply for a review of the decision. You will be</span></div>
        <div style="position: absolute; left: 32.00px; top: 514.03px" class="cls_006"><span class="cls_006">notified of your review rights in writing and the time limits for</span></div>
        <div style="position: absolute; left: 32.00px; top: 525.03px" class="cls_006"><span class="cls_006">lodging such an appeal.</span></div>
        <div style="position: absolute; left: 32.00px; top: 540.03px" class="cls_006"><span class="cls_006">There are no review rights for decisions to refuse a student visa</span></div>
        <div style="position: absolute; left: 32.00px; top: 551.03px" class="cls_006"><span class="cls_006">where the application is made outside Australia.</span></div>
        <div style="position: absolute; left: 60.28px; top: 713.79px" class="cls_015"><span class="cls_015">Home page</span><span class="cls_016">  <a href="http://www.immi.gov.au/">www.immi.gov.au</a> </span></div>
        <div style="position: absolute; left: 120.00px; top: 736.70px" class="cls_009"><span class="cls_009">Telephone</span><span class="cls_014"> 131 881 </span><span class="cls_009">during business hours</span></div>
        <div style="position: absolute; left: 74.18px; top: 734.00px" class="cls_015"><span class="cls_015">General</span></div>
        <div style="position: absolute; left: 55.55px; top: 746.00px" class="cls_015"><span class="cls_015">enquiry line</span><span class="cls_009">  in Australia to speak to an operator (recorded</span></div>
        <div style="position: absolute; left: 120.00px; top: 759.70px" class="cls_009"><span class="cls_009">information available outside these hours).</span></div>
        <div style="position: absolute; left: 120.00px; top: 771.20px" class="cls_009"><span class="cls_009">If you are outside Australia, please contact</span></div>
        <div style="position: absolute; left: 120.00px; top: 782.70px" class="cls_009"><span class="cls_009">your nearest Australian mission.</span></div>
        <div style="position: absolute; left: 245.98px; top: 820.73px" class="cls_010"><span class="cls_010">© COMMONWEALTH OF AUSTRALIA, 2006</span></div>
        <div style="position: absolute; left: 499.13px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 5</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 4260px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background06.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 191.20px; top: 184.00px" class="cls_017"><span class="cls_017">This page is intentionally blank</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 5112px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background07.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 525.04px; top: 34.13px" class="cls_003"><span class="cls_003">Form</span></div>
        <div style="position: absolute; left: 230.81px; top: 46.73px" class="cls_005"><span class="cls_005">Application for a student visa</span></div>
        <div style="position: absolute; left: 506.59px; top: 44.33px" class="cls_004"><span class="cls_004">157A</span></div>
        <div style="position: absolute; left: 44.00px; top: 118.73px" class="cls_018"><span class="cls_018">Part A - To be completed by</span></div>
        <div style="position: absolute; left: 494.40px; top: 131.73px" class="cls_021"><span class="cls_021">PHOTOGRAPH</span></div>
        <div style="position: absolute; left: 44.00px; top: 136.73px" class="cls_018"><span class="cls_018">all applicants</span></div>
        <div style="position: absolute; left: 484.00px; top: 157.23px" class="cls_009"><span class="cls_009">Please attach required</span></div>
        <div style="position: absolute; left: 44.00px; top: 162.73px" class="cls_019"><span class="cls_019">Application details</span></div>
        <div style="position: absolute; left: 484.00px; top: 169.23px" class="cls_009"><span class="cls_009">photographs of yourself</span></div>
        <div style="position: absolute; left: 484.00px; top: 185.23px" class="cls_009"><span class="cls_009">AND</span></div>
        <div style="position: absolute; left: 27.36px; top: 194.53px" class="cls_020"><span class="cls_020">1</span></div>
        <div style="position: absolute; left: 44.00px; top: 196.03px" class="cls_009"><span class="cls_009">How many people are included in this application?</span>&nbsp;&nbsp;<span style="border: 1px solid black; width: 25px;"><%=noofpeopleincluded %></span></div>
        <div style="position: absolute; left: 484.00px; top: 201.23px" class="cls_009"><span class="cls_009">all members of your</span></div>
        <div style="position: absolute; left: 484.00px; top: 213.23px" class="cls_009"><span class="cls_009">family unit included in</span></div>
        <div style="position: absolute; left: 27.36px; top: 222.53px" class="cls_020"><span class="cls_020">2</span></div>
        <div style="position: absolute; left: 44.00px; top: 224.03px" class="cls_009"><span class="cls_009">Are you applying</span></div>
        <div style="position: absolute; left: 484.00px; top: 225.23px" class="cls_009"><span class="cls_009">this application</span></div>
        <div style="position: absolute; left: 46.91px; top: 240.03px" class="cls_009"><span class="cls_009">for yourself as a student?</span></div>
        <div style="position: absolute; left: 160.00px; top: 240.03px" class="cls_009">
            <span class="cls_009">
                <input type="checkbox" id="chkyourself" runat="server">
                Complete Parts A, B and D</span>
        </div>
        <div style="position: absolute; left: 53.57px; top: 256.03px" class="cls_009"><span class="cls_009">for yourself and family?</span></div>
        <div style="position: absolute; left: 160.00px; top: 256.03px" class="cls_009">
            <span class="cls_009">
                <input type="checkbox" id="chkwithfamily" runat="server">Complete Parts A, B and D</span>
        </div>
        <div style="position: absolute; left: 72.76px; top: 272.03px" class="cls_009"><span class="cls_009">as a member of a</span></div>
        <div style="position: absolute; left: 160.00px; top: 280.03px" class="cls_009">
            <span class="cls_009">
                <input type="checkbox" id="chkfamily" runat="server">Complete Parts A, C and D</span>
        </div>
        <div style="position: absolute; left: 60.65px; top: 284.03px" class="cls_009"><span class="cls_009">student’s family unit?</span></div>
        <div style="position: absolute; left: 44.00px; top: 310.73px" class="cls_019"><span class="cls_019">Your personal details</span></div>
        <div style="position: absolute; left: 27.36px; top: 338.53px" class="cls_020"><span class="cls_020">3</span></div>
        <div style="position: absolute; left: 44.00px; top: 340.03px" class="cls_009"><span class="cls_009">Your full name in English</span></div>
        <div style="position: absolute; left: 308.72px; top: 338.53px" class="cls_020"><span class="cls_020">10</span></div>
        <div style="position: absolute; left: 328.00px; top: 340.03px" class="cls_009"><span class="cls_009">Your present country of citizenship</span>&nbsp;&nbsp;<span style="border: 1px solid black; width: 25px;"><%=countryofcitizenship %></span></div>
        <div style="position: absolute; left: 44.00px; top: 360.03px" class="cls_009"><span class="cls_009">Family name</span>&nbsp;&nbsp;<span style="border: 1px solid black; width: 25px;"><%=familyname %></span></div>
        <div style="position: absolute; left: 44.00px; top: 380.03px" class="cls_009"><span class="cls_009">Given names</span>&nbsp;&nbsp;<span style="border: 1px solid black; width: 25px;"><%=givenname %></span></div>
        <div style="position: absolute; left: 308.72px; top: 382.53px" class="cls_020"><span class="cls_020">11</span></div>
        <div style="position: absolute; left: 328.00px; top: 384.03px" class="cls_009"><span class="cls_009">Do you hold any other citizenship?</span></div>
        <div style="position: absolute; left: 328.00px; top: 400.03px" class="cls_009">
            <span class="cls_009">No</span>
            <input type="checkbox" id="chkAnotherCitizenNo" runat="server">
        </div>
        <div style="position: absolute; left: 328.00px; top: 416.03px" class="cls_009">
            <span class="cls_009">Yes</span>
            <input type="checkbox" id="chkAnotherCitizenYes" runat="server">
        </div>
        <div style="position: absolute; left: 368.00px; top: 416.03px" class="cls_009"><span class="cls_009">Which countries?</span>&nbsp;&nbsp;<span style="border: 1px solid black; width: 25px;"><%=anothercountryofcitizenship %></span></div>
        <div style="position: absolute; left: 27.36px; top: 422.53px" class="cls_020"><span class="cls_020">4</span></div>
        <div style="position: absolute; left: 44.00px; top: 424.03px" class="cls_009"><span class="cls_009">Name in your own language or script (if applicable)</span></div>
        <div style="position: absolute; left: 44.00px; top: 440.03px" class="cls_009">&nbsp;&nbsp;<span style="border: 1px solid black; width: 25px;"><%=ownlanguagename1 %></span></div>
        <div style="position: absolute; left: 44.00px; top: 450.03px" class="cls_009">&nbsp;&nbsp;<span style="border: 1px solid black; width: 25px;"><%=ownlanguagename2 %></span></div>

        <div style="position: absolute; left: 308.72px; top: 458.53px" class="cls_020"><span class="cls_020">12</span></div>
        <div style="position: absolute; left: 328.00px; top: 460.03px" class="cls_009"><span class="cls_009">Do you have a passport?</span></div>
        <div style="position: absolute; left: 328.00px; top: 476.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkPassposrtNo" runat="server"></div>
        <div style="position: absolute; left: 27.36px; top: 482.53px" class="cls_020"><span class="cls_020">5</span></div>
        <div style="position: absolute; left: 44.00px; top: 484.03px" class="cls_009"><span class="cls_009">Have you been known by any other names?</span></div>
        <div style="position: absolute; left: 328.00px; top: 492.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkPassposrtYes" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 492.03px" class="cls_009"><span class="cls_009">Details from your passport</span></div>
        <div style="position: absolute; left: 44.00px; top: 496.03px" class="cls_009"><span class="cls_009">(including name at birth, previous married names, aliases)</span></div>
        <div style="position: absolute; left: 368.00px; top: 508.03px" class="cls_009"><span class="cls_009">Passport number</span>&nbsp;&nbsp;<span style="border: 1px solid black; width: 25px;"><%=passportno %></span></div>
        <div style="position: absolute; left: 44.00px; top: 512.03px" class="cls_009">
            <span class="cls_009">No
            <input type="checkbox" id="chkAnotherNameNo" runat="server"></span>
        </div>
        <div style="position: absolute; left: 44.00px; top: 528.03px" class="cls_009">
            <span class="cls_009">Yes
            <input type="checkbox" id="chkAnotherNameYes" runat="server"></span>
        </div>
        <div style="position: absolute; left: 84.00px; top: 528.03px" class="cls_009"><span class="cls_009">Give details and provide supporting evidence eg. birth</span></div>
        <div style="position: absolute; left: 84.00px; top: 540.03px" class="cls_009"><span class="cls_009">certificate/marriage certificate</span></div>
        <div style="position: absolute; left: 368.00px; top: 540.03px" class="cls_009"><span class="cls_009">Country of passport</span><span style="border: 1px solid black; width: 25px;"><%=countryofpassport %></span></div>
        <div style="position: absolute; left: 44.00px; top: 556.03px" class="cls_009"><span class="cls_009">Family name</span><span style="border: 1px solid black; width: 25px;"><%=anotherfamilyname %></span></div>
        <div style="position: absolute; left: 447.72px; top: 574.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 469.78px; top: 574.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 504.34px; top: 574.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 44.00px; top: 576.03px" class="cls_009"><span class="cls_009">Given names</span><span style="border: 1px solid black; width: 25px;"><%=anothergivenname %></span></div>
        <div style="position: absolute; left: 368.00px; top: 584.03px" class="cls_009"><span class="cls_009">Date of issue</span><span style="border: 1px solid black;"> <%= dateofissue.Day + "/" + dateofissue.Month  + "/" + dateofissue.Year.ToString() %></span></div>
        <div style="position: absolute; left: 368.00px; top: 604.03px" class="cls_009"><span class="cls_009">Date of expiry</span><span style="border: 1px solid black;"> <%= dateofexpiry.Day + "/" + dateofexpiry.Month  + "/" + dateofexpiry.Year.ToString() %></span></div>
        <div style="position: absolute; left: 27.36px; top: 618.53px" class="cls_020"><span class="cls_020">6</span></div>
        <div style="position: absolute; left: 44.00px; top: 620.03px" class="cls_009"><span class="cls_009">Sex</span></div>
        <div style="position: absolute; left: 75.65px; top: 620.03px" class="cls_009">
            <span class="cls_009">Male
            </span>
            <input type="checkbox" id="chkMale" runat="server">
        </div>
        <div style="position: absolute; left: 123.57px; top: 620.03px" class="cls_009">
            <span class="cls_009">Female
            </span>
            <input type="checkbox" id="chkFemale" runat="server">
        </div>
        <div style="position: absolute; left: 368.00px; top: 620.03px" class="cls_009"><span class="cls_009">Issuing authority/Place of issue as shown in your passport</span><span style="border: 1px solid black; width: 25px;"><%=placeofissue %></span></div>
        <div style="position: absolute; left: 103.72px; top: 642.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 125.78px; top: 642.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 160.34px; top: 642.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 27.36px; top: 650.53px" class="cls_020"><span class="cls_020">7</span></div>
        <div style="position: absolute; left: 44.00px; top: 652.03px" class="cls_009"><span class="cls_009">Date of birth</span><span style="border: 1px solid black;"> <%= dateofbirth.Day + "/" + dateofbirth.Month  + "/" + dateofbirth.Year.ToString() %></span></div>
        <div style="position: absolute; left: 27.36px; top: 678.53px" class="cls_020"><span class="cls_020">8</span></div>
        <div style="position: absolute; left: 44.00px; top: 680.03px" class="cls_009"><span class="cls_009">Place of birth</span></div>
        <div style="position: absolute; left: 308.72px; top: 678.53px" class="cls_020"><span class="cls_020">13</span></div>
        <div style="position: absolute; left: 328.00px; top: 680.03px" class="cls_009"><span class="cls_009">Where applicable, give your identification number</span><span style="border: 1px solid black;"> <%= applicableidentificationno %></span></div>
        <div style="position: absolute; left: 44.00px; top: 700.03px" class="cls_009"><span class="cls_009">Town/city</span>&nbsp;&nbsp;<span style="border: 1px solid black;"> <%= cityofbirth %></span></div>
        <div style="position: absolute; left: 44.00px; top: 720.03px" class="cls_009"><span class="cls_009">Country</span>&nbsp;&nbsp;<span style="border: 1px solid black;"> <%= countryofbirth %></span></div>
        <div style="position: absolute; left: 475.55px; top: 724.03px" class="cls_009"><span class="cls_009">Continued on the next page</span></div>
        <div style="position: absolute; left: 27.36px; top: 746.53px" class="cls_020"><span class="cls_020">9</span></div>
        <div style="position: absolute; left: 44.00px; top: 748.03px" class="cls_009"><span class="cls_009">Marital status</span></div>
        <div style="position: absolute; left: 66.16px; top: 764.03px" class="cls_009"><span class="cls_009">Married</span><input type="checkbox" id="chkMarried" runat="server"></div>
        <div style="position: absolute; left: 145.87px; top: 764.03px" class="cls_009"><span class="cls_009">Separated</span><input type="checkbox" id="chkSeparated" runat="server"></div>
        <div style="position: absolute; left: 237.26px; top: 764.03px" class="cls_009"><span class="cls_009">Widowed</span><input type="checkbox" id="chkWidowed" runat="server"></div>
        <div style="position: absolute; left: 62.80px; top: 780.03px" class="cls_009"><span class="cls_009">Engaged</span><input type="checkbox" id="chkEngaged" runat="server"></div>
        <div style="position: absolute; left: 150.84px; top: 780.03px" class="cls_009"><span class="cls_009">Divorced</span><input type="checkbox" id="chkDivorced" runat="server"></div>
        <div style="position: absolute; left: 220.55px; top: 780.03px" class="cls_009"><span class="cls_009">Never married</span><input type="checkbox" id="chkNever" runat="server"></div>
        <div style="position: absolute; left: 64.05px; top: 796.03px" class="cls_009"><span class="cls_009">De facto</span><input type="checkbox" id="chkDefacto" runat="server"></div>
        <div style="position: absolute; left: 245.98px; top: 820.73px" class="cls_010"><span class="cls_010">© COMMONWEALTH OF AUSTRALIA, 2006</span></div>
        <div style="position: absolute; left: 499.13px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 7</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 5964px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background08.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 328.00px; top: 14.73px" class="cls_019"><span class="cls_019">About your family</span></div>
        <div style="position: absolute; left: 24.72px; top: 22.53px" class="cls_020"><span class="cls_020">14</span></div>
        <div style="position: absolute; left: 44.00px; top: 24.03px" class="cls_009"><span class="cls_009">If you have any other identity numbers required by your</span></div>
        <div style="position: absolute; left: 44.00px; top: 36.03px" class="cls_009"><span class="cls_009">government, give details:</span></div>
        <div style="position: absolute; left: 308.72px; top: 42.53px" class="cls_020"><span class="cls_020">22</span></div>
        <div style="position: absolute; left: 328.00px; top: 44.03px" class="cls_009"><span class="cls_009">Give details of all members of your family unit whether or not they intend</span></div>
        <div style="position: absolute; left: 71.81px; top: 52.03px" class="cls_009"><span class="cls_009">Type of number</span>&nbsp;&nbsp;<span style="border: 1px solid black;"> <%= anotherIdentitytype1 %></span></div>
        <div style="position: absolute; left: 328.00px; top: 56.03px" class="cls_009"><span class="cls_009">to accompany you to Australia.</span></div>
        <div style="position: absolute; left: 81.29px; top: 68.03px" class="cls_009"><span class="cls_009">Your number</span>&nbsp;&nbsp;<span style="border: 1px solid black;"> <%= anotherIdentityNo1 %></span></div>
        <div style="position: absolute; left: 328.00px; top: 72.03px" class="cls_009"><span class="cls_009">Members of the family unit are your spouse (including a de facto spouse)</span></div>
        <div style="position: absolute; left: 328.00px; top: 84.03px" class="cls_009"><span class="cls_009">and any unmarried dependent children of you or your spouse who have</span></div>
        <div style="position: absolute; left: 71.81px; top: 88.03px" class="cls_009"><span class="cls_009">Type of number</span>&nbsp;&nbsp;<span style="border: 1px solid black;"> <%= anotherIdentitytype2 %></span></div>
        <div style="position: absolute; left: 328.00px; top: 96.03px" class="cls_009"><span class="cls_009">not yet turned 18 years of age.</span></div>
        <div style="position: absolute; left: 81.29px; top: 104.03px" class="cls_009"><span class="cls_009">Your number</span>&nbsp;&nbsp;<span style="border: 1px solid black;"> <%= anotherIdentityNo2 %></span></div>
        <div style="position: absolute; left: 328.00px; top: 124.03px" class="cls_009"><span class="cls_009">1.  Family name</span>&nbsp;&nbsp;<span style="border: 1px solid black;"> <%= aboutfamilyname1 %></span></div>
        <div style="position: absolute; left: 24.72px; top: 130.53px" class="cls_020"><span class="cls_020">15</span></div>
        <div style="position: absolute; left: 44.00px; top: 132.03px" class="cls_009"><span class="cls_009">Your country of usual residence</span>&nbsp;&nbsp;<span style="border: 1px solid black;"> <%= residencecountry %></span></div>
        <div style="position: absolute; left: 328.00px; top: 144.03px" class="cls_009"><span class="cls_009">Given names</span>&nbsp;&nbsp;<span style="border: 1px solid black;"> <%= aboutfamilygivenname1 %></span></div>
        <div style="position: absolute; left: 24.72px; top: 174.53px" class="cls_020"><span class="cls_020">16</span></div>
        <div style="position: absolute; left: 44.00px; top: 176.03px" class="cls_009"><span class="cls_009">Your residential address in your home country</span></div>
        <div style="position: absolute; left: 328.00px; top: 176.03px" class="cls_009"><span class="cls_009">Relationship</span>&nbsp;&nbsp;<span style="border: 1px solid black;"> <%= relationshiptoyou1 %></span></div>
        <div style="position: absolute; left: 44.00px; top: 188.03px" class="cls_014"><span class="cls_014">Note</span><span class="cls_009">: A post office box address is not acceptable as a residential</span></div>
        <div style="position: absolute; left: 328.00px; top: 185.53px" class="cls_009"><span class="cls_009">to you</span></div>
        <div style="position: absolute; left: 44.00px; top: 200.03px" class="cls_009"><span class="cls_009">address. Failure to give a residential address will result in your</span></div>
        <div style="position: absolute; left: 328.00px; top: 200.03px" class="cls_009"><span class="cls_009">Citizenship(s)</span>&nbsp;&nbsp;<span style="border: 1px solid black;"> <%= citizenship1 %></span></div>
        <div style="position: absolute; left: 44.00px; top: 212.03px" class="cls_009"><span class="cls_009">application being invalid.</span></div>

        <div style="position: absolute; left: 44.00px; top: 225.03px" class="cls_009"><span style="border: 1px solid black;"><%=residenceaddressLine1 + " " +residenceaddressLine2 %></span></div>
        <div style="position: absolute; left: 399.72px; top: 218.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 421.78px; top: 218.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 456.34px; top: 218.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 328.00px; top: 228.03px" class="cls_009"><span class="cls_009">Date of birth</span><span style="border: 1px solid black;"> <%= dobfamilymember1.Day + "/" +dobfamilymember1.Month + "/" +dobfamilymember1.Year  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 248.03px" class="cls_009"><span class="cls_009">Is this person included in this application?</span></div>
        <div style="position: absolute; left: 192.00px; top: 264.73px" class="cls_010"><span class="cls_010">POSTAL CODE</span>&nbsp;&nbsp;<span style="border: 1px solid black;"><%=residenceaddresspostalcode %></span></div>
        <div style="position: absolute; left: 328.00px; top: 264.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkfamily1No" runat="server"></div>
        <div style="position: absolute; left: 328.00px; top: 280.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkfamily1Yes" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 280.03px" class="cls_009"><span class="cls_009">Details from passport</span></div>
        <div style="position: absolute; left: 24.72px; top: 286.53px" class="cls_020"><span class="cls_020">17</span></div>
        <div style="position: absolute; left: 44.00px; top: 288.03px" class="cls_009"><span class="cls_009">Your telephone numbers outside Australia</span></div>
        <div style="position: absolute; left: 102.68px; top: 301.73px" class="cls_010"><span class="cls_010">COUNTRY CODE</span></div>
        <div style="position: absolute; left: 151.28px; top: 301.73px" class="cls_010"><span class="cls_010">AREA CODE</span></div>
        <div style="position: absolute; left: 222.50px; top: 301.73px" class="cls_010"><span class="cls_010">NUMBER</span></div>
        <div style="position: absolute; left: 368.00px; top: 296.03px" class="cls_009"><span class="cls_009">Passport number</span>&nbsp;&nbsp;<span style="border: 1px solid black;"><%=familypassportno1 %></span></div>
        <div style="position: absolute; left: 44.00px; top: 312.03px" class="cls_009"><span class="cls_009">Office hours</span>&nbsp;&nbsp;<span style="border: 1px solid black;"><%=officehoursContactNoOutsideaustralia %></span></div>
        <div style="position: absolute; left: 100.00px; top: 315.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 138.77px; top: 315.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 144.00px; top: 315.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 182.77px; top: 315.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 368.00px; top: 328.03px" class="cls_009"><span class="cls_009">Country of passport</span>&nbsp;&nbsp;<span style="border: 1px solid black;"><%=familycountryofpassport1 %></span></div>
        <div style="position: absolute; left: 44.00px; top: 332.03px" class="cls_009"><span class="cls_009">After hours</span>&nbsp;&nbsp;<span style="border: 1px solid black;"><%=afterhoursContactNoOutsideaustralia %></span></div>
        <div style="position: absolute; left: 100.00px; top: 335.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 138.77px; top: 335.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 144.00px; top: 335.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 182.77px; top: 335.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 24.72px; top: 358.53px" class="cls_020"><span class="cls_020">18</span></div>
        <div style="position: absolute; left: 44.00px; top: 360.03px" class="cls_009"><span class="cls_009">Your residential address in Australia (if known)</span></div>
        <div style="position: absolute; left: 44.00px; top: 380.03px" class="cls_009"><span style="border: 1px solid black;"><%=australiaresidentialaddline1 + " " +australiaresidentialaddline2 %></span></div>
        <div style="position: absolute; left: 439.72px; top: 362.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 461.78px; top: 362.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 496.34px; top: 362.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 368.00px; top: 372.03px" class="cls_009"><span class="cls_009">Date of issue</span><span style="border: 1px solid black;"> <%= passportdateofissue1.Day + "/" +passportdateofissue1.Month + "/" +passportdateofissue1.Year  %></span></div>
        <div style="position: absolute; left: 368.00px; top: 392.03px" class="cls_009"><span class="cls_009">Date of expiry</span><span style="border: 1px solid black;"> <%= passportdateofexpiry1.Day + "/" +passportdateofexpiry1.Month + "/" +passportdateofexpiry1.Year  %></span></div>
        <div style="position: absolute; left: 192.00px; top: 411.53px" class="cls_010"><span class="cls_010">POSTCODE</span>&nbsp;&nbsp;<span style="border: 1px solid black;"><%=australiaresidentialpostalcode  %></span></div>
        <div style="position: absolute; left: 368.00px; top: 412.03px" class="cls_009"><span class="cls_009">Issuing authority/Place of issue as shown in passport</span>&nbsp;&nbsp;<span style="border: 1px solid black;"><%=passportplaceofissue1 %></div>
        <div style="position: absolute; left: 24.72px; top: 434.53px" class="cls_020"><span class="cls_020">19</span></div>
        <div style="position: absolute; left: 44.00px; top: 436.03px" class="cls_009"><span class="cls_009">Your telephone numbers in Australia (if known)</span></div>
        <div style="position: absolute; left: 44.00px; top: 452.03px" class="cls_009"><span class="cls_009">Office hours</span></div>
        <div style="position: absolute; left: 100.00px; top: 455.53px" class="cls_010"><span class="cls_010">(AREA CODE</span>&nbsp;&nbsp;<span style="border: 1px solid black;"><%=officehrContactNoInAustralia  %></span></div>
        <div style="position: absolute; left: 168.53px; top: 455.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 368.00px; top: 464.03px" class="cls_009"><span class="cls_009">Does this person intend to study in</span></div>
        <div style="position: absolute; left: 496.00px; top: 464.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkFamilyStudy1No" runat="server"></div>
        <div style="position: absolute; left: 540.00px; top: 464.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkFamilyStudy1Yes" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 472.03px" class="cls_009"><span class="cls_009">After hours</span></div>
        <div style="position: absolute; left: 100.00px; top: 475.53px" class="cls_010"><span class="cls_010">(AREA CODE</span>&nbsp;&nbsp;<span style="border: 1px solid black;"><%=afterhrContactNoInAustralia  %></span></div>
        <div style="position: absolute; left: 168.53px; top: 475.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 368.00px; top: 476.03px" class="cls_009"><span class="cls_009">Australia for more than 3 months?</span></div>
        <div style="position: absolute; left: 24.72px; top: 498.53px" class="cls_020"><span class="cls_020">20</span></div>
        <div style="position: absolute; left: 44.00px; top: 500.03px" class="cls_009"><span class="cls_009">Address for correspondence</span></div>
        <div style="position: absolute; left: 44.00px; top: 520.03px" class="cls_009"><span style="border: 1px solid black;"><%=correspondenceaddressline1 + " " +correspondenceaddressline2 %></span></div>
        <div style="position: absolute; left: 192.00px; top: 551.53px" class="cls_010"><span class="cls_010">POSTCODE</span>&nbsp;<span style="border: 1px solid black;"><%=correspondenceaddresspoastalcode  %></span></div>
        <div style="position: absolute; left: 24.72px; top: 574.53px" class="cls_020"><span class="cls_020">21</span></div>
        <div style="position: absolute; left: 44.00px; top: 576.03px" class="cls_009"><span class="cls_009">Do you agree to the department communicating with you by fax, e-mail</span></div>
        <div style="position: absolute; left: 44.00px; top: 588.03px" class="cls_009"><span class="cls_009">or other electronic means?</span></div>
        <div style="position: absolute; left: 44.00px; top: 608.03px" class="cls_009">
            <span class="cls_009">No</span>
            <input type="checkbox" id="chkagreetocommunicateNo" runat="server">
        </div>
        <div style="position: absolute; left: 44.00px; top: 624.03px" class="cls_009">
            <span class="cls_009">Yes</span>
            <input type="checkbox" id="chkagreetocommunicateYes" runat="server">
        </div>
        <div style="position: absolute; left: 84.00px; top: 624.03px" class="cls_009"><span class="cls_009">Give details</span></div>
        <div style="position: absolute; left: 102.68px; top: 641.73px" class="cls_010"><span class="cls_010">COUNTRY CODE</span></div>
        <div style="position: absolute; left: 151.28px; top: 641.73px" class="cls_010"><span class="cls_010">AREA CODE</span></div>
        <div style="position: absolute; left: 222.50px; top: 641.73px" class="cls_010"><span class="cls_010">NUMBER</span></div>
        <div style="position: absolute; left: 44.00px; top: 652.03px" class="cls_009"><span class="cls_009">Fax number</span>&nbsp;<span style="border: 1px solid black;"><%=faxno  %></span></div>
        <div style="position: absolute; left: 100.00px; top: 655.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 138.77px; top: 655.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 144.00px; top: 655.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 182.77px; top: 655.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 44.00px; top: 672.03px" class="cls_009"><span class="cls_009">E-mail address</span>&nbsp;<span style="border: 1px solid black;"><%=emailaddress  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 688.03px" class="cls_009"><span class="cls_009">Note: If this visa application is refused, you will be notified by mail</span></div>
        <div style="position: absolute; left: 16.00px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 8</span></div>
        <div style="position: absolute; left: 245.94px; top: 820.73px" class="cls_010"><span class="cls_010">© COMMONWEALTH OF AUSTRALIA, 2006</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 6816px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background09.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 328.00px; top: 14.73px" class="cls_019"><span class="cls_019">Dependants under 18 years of age</span></div>
        <div style="position: absolute; left: 44.00px; top: 28.03px" class="cls_009"><span class="cls_009">2.  Family name</span>&nbsp;<span style="border: 1px solid black;"><%=aboutfamilyname2  %></span></div>
        <div style="position: absolute; left: 308.72px; top: 42.53px" class="cls_020"><span class="cls_020">23</span></div>
        <div style="position: absolute; left: 328.00px; top: 44.03px" class="cls_009"><span class="cls_009">Have any school age dependants (that is, those who have turned 5 but</span></div>
        <div style="position: absolute; left: 44.00px; top: 48.03px" class="cls_009"><span class="cls_009">Given names</span>&nbsp;<span style="border: 1px solid black;"><%=aboutfamilygivenname2  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 56.03px" class="cls_009"><span class="cls_009">who have not yet turned 18 years of age) included in this application</span></div>
        <div style="position: absolute; left: 328.00px; top: 68.03px" class="cls_009"><span class="cls_009">been enrolled in a school in Australia?</span></div>
        <div style="position: absolute; left: 44.00px; top: 80.03px" class="cls_009"><span class="cls_009">Relationship</span>&nbsp;<span style="border: 1px solid black;"><%=relationshiptoyou2  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 84.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkEnrollNo" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 89.53px" class="cls_009"><span class="cls_009">to you</span></div>
        <div style="position: absolute; left: 328.00px; top: 100.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkEnrolYes" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 100.03px" class="cls_009"><span class="cls_009">You </span><span class="cls_014">must</span><span class="cls_009"> provide evidence (eg. enrolment advice,</span></div>
        <div style="position: absolute; left: 44.00px; top: 104.03px" class="cls_009"><span class="cls_009">Citizenship(s)</span>&nbsp;<span style="border: 1px solid black;"><%=citizenship2  %></span></div>
        <div style="position: absolute; left: 368.00px; top: 112.03px" class="cls_009"><span class="cls_009">offer letter)</span></div>
        <div style="position: absolute; left: 115.72px; top: 122.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 137.78px; top: 122.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 172.34px; top: 122.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 44.00px; top: 132.03px" class="cls_009"><span class="cls_009">Date of birth</span><span style="border: 1px solid black;"> <%= dobfamilymember2.Day + "/" +dobfamilymember2.Month + "/" +dobfamilymember2.Year  %></span></div>
        <div style="position: absolute; left: 308.72px; top: 134.53px" class="cls_020"><span class="cls_020">24</span></div>
        <div style="position: absolute; left: 328.00px; top: 136.03px" class="cls_009"><span class="cls_009">Do you have the sole legal right to determine where any dependants</span></div>
        <div style="position: absolute; left: 328.00px; top: 148.03px" class="cls_009"><span class="cls_009">under 18 years of age who are included in this application will live or to</span></div>
        <div style="position: absolute; left: 44.00px; top: 152.03px" class="cls_009"><span class="cls_009">Is this person included in this application?</span></div>
        <div style="position: absolute; left: 328.00px; top: 160.03px" class="cls_009"><span class="cls_009">remove each such dependant from their country of usual residence?</span></div>
        <div style="position: absolute; left: 44.00px; top: 168.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkfamily2No" runat="server"></div>
        <div style="position: absolute; left: 328.00px; top: 177.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkSoleRightNo" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 177.03px" class="cls_009"><span class="cls_009">Give details below</span></div>
        <div style="position: absolute; left: 44.00px; top: 184.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkfamily2Yes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 184.03px" class="cls_009"><span class="cls_009">Details from passport</span></div>
        <div style="position: absolute; left: 328.00px; top: 193.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkSoleRightYes" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 193.03px" class="cls_009"><span class="cls_009">Go to Question 25</span></div>
        <div style="position: absolute; left: 84.00px; top: 200.03px" class="cls_009"><span class="cls_009">Passport number</span>&nbsp;<span style="border: 1px solid black;"><%=familypassportno2  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 217.03px" class="cls_009"><span class="cls_009">Give details of ALL other people not included in this application who have</span></div>
        <div style="position: absolute; left: 328.00px; top: 229.03px" class="cls_009"><span class="cls_009">custody, access or guardianship rights in relation to the dependant(s).</span></div>
        <div style="position: absolute; left: 84.00px; top: 232.03px" class="cls_009"><span class="cls_009">Country of passport</span>&nbsp;<span style="border: 1px solid black;"><%=familycountryofpassport2  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 245.03px" class="cls_009"><span class="cls_009">Attach a statutory declaration from each of these people giving permission</span></div>
        <div style="position: absolute; left: 328.00px; top: 257.03px" class="cls_009"><span class="cls_009">for the dependant to accompany you to Australia.</span></div>
        <div style="position: absolute; left: 155.72px; top: 266.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 177.78px; top: 266.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 212.34px; top: 266.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 84.00px; top: 276.03px" class="cls_009"><span class="cls_009">Date of issue</span><span style="border: 1px solid black;"> <%= passportdateofissue2.Day + "/" +passportdateofissue2.Month + "/" +passportdateofissue2.Year  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 285.03px" class="cls_009"><span class="cls_009">Family name</span>&nbsp;<span style="border: 1px solid black;"><%=guardiansfamilyname  %></span></div>
        <div style="position: absolute; left: 84.00px; top: 296.03px" class="cls_009"><span class="cls_009">Date of expiry</span><span style="border: 1px solid black;"> <%= passportdateofissue2.Day + "/" +passportdateofissue2.Month + "/" +passportdateofissue2.Year  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 305.03px" class="cls_009"><span class="cls_009">Given names</span>&nbsp;<span style="border: 1px solid black;"><%=guardiansgivenname  %></span></div>
        <div style="position: absolute; left: 84.00px; top: 316.03px" class="cls_009"><span class="cls_009">Issuing authority/Place of issue as shown in passport</span></div>
        <div style="position: absolute; left: 84.00px; top: 325.03px" class="cls_009"><span style="border: 1px solid black;"><%= passportplaceofissue2  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 325.03px" class="cls_009"><span class="cls_009">Residential</span></div>
        <div style="position: absolute; left: 328.00px; top: 337.03px" class="cls_009"><span class="cls_009">address</span>&nbsp;<span style="border: 1px solid black;"><%=guardiansresidentialaddress  %></span></div>
        <div style="position: absolute; left: 476.00px; top: 361.73px" class="cls_010"><span class="cls_010">POSTAL CODE</span>&nbsp;<span style="border: 1px solid black;"><%=guardianspostalcode  %></span></div>
        <div style="position: absolute; left: 84.00px; top: 368.03px" class="cls_009"><span class="cls_009">Does this person intend to study in</span></div>
        <div style="position: absolute; left: 212.00px; top: 368.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkFamilyStudy2No" runat="server"></div>
        <div style="position: absolute; left: 256.00px; top: 368.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkFamilyStudy2Yes" runat="server"></div>
        <div style="position: absolute; left: 386.68px; top: 374.73px" class="cls_010"><span class="cls_010">COUNTRY CODE</span></div>
        <div style="position: absolute; left: 435.28px; top: 374.73px" class="cls_010"><span class="cls_010">AREA CODE</span></div>
        <div style="position: absolute; left: 506.50px; top: 374.73px" class="cls_010"><span class="cls_010">NUMBER</span></div>
        <div style="position: absolute; left: 84.00px; top: 380.03px" class="cls_009"><span class="cls_009">Australia for more than 3 months?</span></div>
        <div style="position: absolute; left: 328.00px; top: 385.03px" class="cls_009"><span class="cls_009">Telephone</span></div>
        <div style="position: absolute; left: 384.00px; top: 388.53px" class="cls_010"><span class="cls_010">(</span>&nbsp;<span style="border: 1px solid black;"><%=guardianscontactnumber  %></span></div>
        <div style="position: absolute; left: 422.77px; top: 388.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 428.00px; top: 388.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 466.77px; top: 388.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 328.00px; top: 405.03px" class="cls_009"><span class="cls_009">Relationship</span>&nbsp;<span style="border: 1px solid black;"><%=guardiansrealtionwithstudent  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 408.03px" class="cls_009"><span class="cls_009">3.  Family name</span>&nbsp;<span style="border: 1px solid black;"><%= passportplaceofissue3  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 414.53px" class="cls_009"><span class="cls_009">to dependant</span></div>
        <div style="position: absolute; left: 44.00px; top: 428.03px" class="cls_009"><span class="cls_009">Given names</span>&nbsp;<span style="border: 1px solid black;"><%= passportplaceofissue3  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 429.03px" class="cls_009"><span class="cls_009">Nature of</span></div>
        <div style="position: absolute; left: 328.00px; top: 438.53px" class="cls_009"><span class="cls_009">legal right</span>&nbsp;<span style="border: 1px solid black;"><%=guardiansnatureoflegalrights  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 453.03px" class="cls_009"><span class="cls_009">Statutory declaration attached?</span></div>
        <div style="position: absolute; left: 496.00px; top: 453.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkstatutory1No" runat="server"></div>
        <div style="position: absolute; left: 539.99px; top: 453.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkstatutory1Yes" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 460.03px" class="cls_009"><span class="cls_009">Relationship</span>&nbsp;<span style="border: 1px solid black;"><%= passportplaceofissue3  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 469.53px" class="cls_009"><span class="cls_009">to you</span></div>
        <div style="position: absolute; left: 44.00px; top: 484.03px" class="cls_009"><span class="cls_009">Citizenship(s)</span>&nbsp;<span style="border: 1px solid black;"><%= passportplaceofissue3  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 485.03px" class="cls_009"><span class="cls_009">Family name</span>&nbsp;<span style="border: 1px solid black;"><%=guardiansfamilyname1  %></span></div>
        <div style="position: absolute; left: 115.72px; top: 502.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 137.78px; top: 502.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 172.34px; top: 502.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 328.00px; top: 505.03px" class="cls_009"><span class="cls_009">Given names</span>&nbsp;<span style="border: 1px solid black;"><%=guardiansgivenname1  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 512.03px" class="cls_009"><span class="cls_009">Date of birth</span><span style="border: 1px solid black;"> <%= dobfamilymember3.Day + "/" +dobfamilymember3.Month + "/" +dobfamilymember3.Year  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 525.03px" class="cls_009"><span class="cls_009">Residential</span></div>
        <div style="position: absolute; left: 44.00px; top: 532.03px" class="cls_009"><span class="cls_009">Is this person included in this application?</span></div>
        <div style="position: absolute; left: 328.00px; top: 537.03px" class="cls_009"><span class="cls_009">address</span>&nbsp;<span style="border: 1px solid black;"><%=guardiansresidentialaddress1  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 548.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkfamily3No" runat="server"></div>
        <div style="position: absolute; left: 476.00px; top: 561.73px" class="cls_010"><span class="cls_010">POSTAL CODE</span>&nbsp;<span style="border: 1px solid black;"><%=guardianspostalcode1  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 564.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkfamily3Yes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 564.03px" class="cls_009"><span class="cls_009">Details from passport</span></div>
        <div style="position: absolute; left: 386.68px; top: 574.73px" class="cls_010"><span class="cls_010">COUNTRY CODE</span></div>
        <div style="position: absolute; left: 435.28px; top: 574.73px" class="cls_010"><span class="cls_010">AREA CODE</span></div>
        <div style="position: absolute; left: 506.50px; top: 574.73px" class="cls_010"><span class="cls_010">NUMBER</span></div>
        <div style="position: absolute; left: 84.00px; top: 580.03px" class="cls_009"><span class="cls_009">Passport number</span>&nbsp;<span style="border: 1px solid black;"><%= familypassportno3  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 585.03px" class="cls_009"><span class="cls_009">Telephone</span></div>
        <div style="position: absolute; left: 384.00px; top: 588.53px" class="cls_010"><span class="cls_010">(</span>&nbsp;<span style="border: 1px solid black;"><%=guardianscontactnumber1  %></span></div>
        <div style="position: absolute; left: 422.77px; top: 588.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 428.00px; top: 588.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 466.77px; top: 588.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 328.00px; top: 605.03px" class="cls_009"><span class="cls_009">Relationship</span>&nbsp;<span style="border: 1px solid black;"><%=guardiansrealtionwithstudent1  %></span></div>
        <div style="position: absolute; left: 84.00px; top: 612.03px" class="cls_009"><span class="cls_009">Country of passport</span>&nbsp;<span style="border: 1px solid black;"><%= familycountryofpassport3  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 614.53px" class="cls_009"><span class="cls_009">to dependant</span></div>
        <div style="position: absolute; left: 328.00px; top: 629.03px" class="cls_009"><span class="cls_009">Nature of</span></div>
        <div style="position: absolute; left: 328.00px; top: 638.53px" class="cls_009"><span class="cls_009">legal right</span>&nbsp;<span style="border: 1px solid black;"><%=guardiansnatureoflegalrights1  %></span></div>
        <div style="position: absolute; left: 155.72px; top: 646.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 177.78px; top: 646.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 212.34px; top: 646.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 328.00px; top: 653.03px" class="cls_009"><span class="cls_009">Statutory declaration attached?</span></div>
        <div style="position: absolute; left: 496.00px; top: 653.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkstatutory2No" runat="server"></div>
        <div style="position: absolute; left: 539.99px; top: 653.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkstatutory2Yes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 656.03px" class="cls_009"><span class="cls_009">Date of issue</span><span style="border: 1px solid black;"> <%= passportdateofissue3.Day + "/" +passportdateofissue3.Month + "/" +passportdateofissue3.Year  %></span></div>
        <div style="position: absolute; left: 84.00px; top: 676.03px" class="cls_009"><span class="cls_009">Date of expiry</span><span style="border: 1px solid black;"> <%= passportdateofissue3.Day + "/" +passportdateofissue3.Month + "/" +passportdateofissue3.Year  %></span></div>
        <div style="position: absolute; left: 308.72px; top: 683.53px" class="cls_020"><span class="cls_020">25</span></div>
        <div style="position: absolute; left: 328.00px; top: 685.03px" class="cls_009"><span class="cls_009">Are any of your dependants who are under 18 years of age, and who</span></div>
        <div style="position: absolute; left: 84.00px; top: 696.03px" class="cls_009"><span class="cls_009">Issuing authority/Place of issue as shown in passport</span></div>
        <div style="position: absolute; left: 84.00px; top: 710.03px" class="cls_009">&nbsp;<span style="border: 1px solid black;"><%= passportplaceofissue3  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 697.03px" class="cls_009"><span class="cls_009">are included in this application, the subject of a court order giving you:</span></div>
        <div style="position: absolute; left: 328.00px; top: 709.03px" class="cls_009"><span class="cls_009">• the sole legal right to determine where they will live; or</span></div>
        <div style="position: absolute; left: 328.00px; top: 721.03px" class="cls_009"><span class="cls_009">• the right to remove them from their country of usual residence?</span></div>
        <div style="position: absolute; left: 328.00px; top: 741.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkcourtorderNo" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 748.03px" class="cls_009"><span class="cls_009">Does this person intend to study in   No</span><input type="checkbox" id="chkFamilyStudy3No" runat="server"></div>
        <div style="position: absolute; left: 256.00px; top: 748.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkFamilyStudy3Yes" runat="server"></div>
        <div style="position: absolute; left: 328.00px; top: 757.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkcourtorderYes" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 757.03px" class="cls_009"><span class="cls_009">Attach a certified copy of the court order(s)</span></div>
        <div style="position: absolute; left: 84.00px; top: 760.03px" class="cls_009"><span class="cls_009">Australia for more than 3 months?</span></div>
        <div style="position: absolute; left: 475.55px; top: 776.03px" class="cls_009"><span class="cls_009">Continued on the next page</span></div>
        <div style="position: absolute; left: 245.98px; top: 820.73px" class="cls_010"><span class="cls_010">© COMMONWEALTH OF AUSTRALIA, 2006</span></div>
        <div style="position: absolute; left: 499.13px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 9</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 7668px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background10.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 328.00px; top: 14.73px" class="cls_018"><span class="cls_018">Part B - To be completed by</span></div>
        <div style="position: absolute; left: 44.00px; top: 14.73px" class="cls_019"><span class="cls_019">Previous visa applications</span></div>
        <div style="position: absolute; left: 328.00px; top: 32.73px" class="cls_018"><span class="cls_018">the student</span></div>
        <div style="position: absolute; left: 44.00px; top: 44.03px" class="cls_014"><span class="cls_014">Warning</span><span class="cls_009"> — In general, a person can only hold one visa at a time. If you</span></div>
        <div style="position: absolute; left: 44.00px; top: 56.03px" class="cls_009"><span class="cls_009">are granted a visa while you already have another, the first visa will cease</span></div>
        <div style="position: absolute; left: 44.00px; top: 68.03px" class="cls_009"><span class="cls_009">automatically when the new visa is granted.</span></div>
        <div style="position: absolute; left: 308.72px; top: 66.53px" class="cls_020"><span class="cls_020">28</span></div>
        <div style="position: absolute; left: 328.00px; top: 68.03px" class="cls_009"><span class="cls_009">Are you applying in Australia?</span></div>
        <div style="position: absolute; left: 328.00px; top: 88.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkapplyingNo" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 88.03px" class="cls_009"><span class="cls_009">Go to Question 30</span></div>
        <div style="position: absolute; left: 24.72px; top: 90.53px" class="cls_020"><span class="cls_020">26</span></div>
        <div style="position: absolute; left: 44.00px; top: 92.03px" class="cls_009"><span class="cls_009">Have you or any other person included</span></div>
        <div style="position: absolute; left: 44.00px; top: 104.03px" class="cls_009"><span class="cls_009">in this application previously applied</span></div>
        <div style="position: absolute; left: 328.00px; top: 104.03px; right: 222px;" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkapplyingYes" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 116.03px" class="cls_009"><span class="cls_009">for any type of Australian visa?</span></div>
        <div style="position: absolute; left: 212.00px; top: 116.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkappliesNo" runat="server"></div>
        <div style="position: absolute; left: 256.00px; top: 116.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkappliesYes" runat="server"></div>
        <div style="position: absolute; left: 308.72px; top: 130.53px" class="cls_020"><span class="cls_020">29</span></div>
        <div style="position: absolute; left: 328.00px; top: 132.03px" class="cls_009"><span class="cls_009">Do you currently hold a student visa?</span></div>
        <div style="position: absolute; left: 44.00px; top: 140.03px" class="cls_009"><span class="cls_009">Do you currently hold a visa?</span></div>
        <div style="position: absolute; left: 212.00px; top: 140.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkHoldNo" runat="server"></div>
        <div style="position: absolute; left: 255.99px; top: 140.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkHoldYes" runat="server"></div>
        <div style="position: absolute; left: 328.00px; top: 152.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkcurrentlyholdNo" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 152.03px" class="cls_009"><span class="cls_009">If you are in Assessment Level 2, 3, 4 or 5 you will be</span></div>
        <div style="position: absolute; left: 44.00px; top: 164.03px" class="cls_009"><span class="cls_009">Are you currently awaiting a decision</span></div>
        <div style="position: absolute; left: 368.00px; top: 164.03px" class="cls_009"><span class="cls_009">required at Question 43 to provide exceptional reasons why</span></div>
        <div style="position: absolute; left: 44.00px; top: 176.03px" class="cls_009"><span class="cls_009">on another visa application?</span></div>
        <div style="position: absolute; left: 212.00px; top: 176.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkAwaitingNo" runat="server"></div>
        <div style="position: absolute; left: 256.00px; top: 176.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkAwaitingYes" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 176.03px" class="cls_009"><span class="cls_009">you should be granted a student visa in Australia.</span></div>
        <div style="position: absolute; left: 328.00px; top: 192.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkcurrentlyholdYes" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 204.03px" class="cls_009"><span class="cls_009">If you answered </span><span class="cls_014">‘Yes’</span><span class="cls_009"> to any of the above</span></div>
        <div style="position: absolute; left: 44.00px; top: 216.03px" class="cls_009"><span class="cls_009">questions, give details below</span></div>
        <div style="position: absolute; left: 328.00px; top: 220.03px" class="cls_009"><span class="cls_009">Provide details of your highest qualification obtained outside Australia,</span></div>
        <div style="position: absolute; left: 308.72px; top: 218.53px" class="cls_020"><span class="cls_020">30</span></div>
        <div style="position: absolute; left: 328.00px; top: 232.03px" class="cls_009"><span class="cls_009">as well as all other studies and training obtained outside Australia.</span></div>
        <div style="position: absolute; left: 44.00px; top: 236.03px" class="cls_009"><span class="cls_009">Name</span>&nbsp;<span style="border: 1px solid black;"><%= nameonvisa  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 248.03px" class="cls_009"><span class="cls_009">You </span><span class="cls_014">must</span><span class="cls_009"> provide </span><span class="cls_014">evidence</span><span class="cls_009"> of your study and training, including</span></div>
        <div style="position: absolute; left: 44.00px; top: 256.03px" class="cls_009"><span class="cls_009">Type of visa</span>&nbsp;<span style="border: 1px solid black;"><%= typeofvisa  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 260.03px" class="cls_009"><span class="cls_009">academic records, if you are:</span></div>
        <div style="position: absolute; left: 44.00px; top: 276.03px" class="cls_009"><span class="cls_009">Place of issue</span>&nbsp;<span style="border: 1px solid black;"><%= placeofissuevisa  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 274.03px" class="cls_006"><span class="cls_006">•</span><span class="cls_009"> in Assessment Level 3, 4 or 5; or</span></div>
        <div style="position: absolute; left: 328.00px; top: 288.03px" class="cls_006"><span class="cls_006">•</span><span class="cls_009"> in Assessment Level 2 seeking to undertake studies in the</span></div>
        <div style="position: absolute; left: 103.72px; top: 294.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 125.78px; top: 294.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 160.34px; top: 294.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 340.00px; top: 300.03px" class="cls_009"><span class="cls_009">postgraduate research sector.</span></div>
        <div style="position: absolute; left: 44.00px; top: 304.03px" class="cls_009"><span class="cls_009">Date of issue</span>&nbsp;<span style="border: 1px solid black;"><%= dateissuevisa.Day + "/" + dateissuevisa.Month + "/" +dateissuevisa.Year %></span></div>
        <div style="position: absolute; left: 328.00px; top: 316.03px" class="cls_009"><span class="cls_009">All other applicants may be requested to provide evidence where</span></div>
        <div style="position: absolute; left: 44.00px; top: 324.03px" class="cls_009"><span class="cls_009">Application</span></div>
        <div style="position: absolute; left: 96.00px; top: 324.03px" class="cls_009"><span class="cls_009">Refused</span><input type="checkbox" id="chkvisa1refused" runat="server"></div>
        <div style="position: absolute; left: 328.00px; top: 328.03px" class="cls_009"><span class="cls_009">considered necessary.</span></div>
        <div style="position: absolute; left: 96.00px; top: 340.03px" class="cls_009"><span class="cls_009">Granted</span><input type="checkbox" id="chkvisa1granted" runat="server"></div>
        <div style="position: absolute; left: 152.00px; top: 340.03px" class="cls_009"><span class="cls_009">Visa label number</span></div>
        <div style="position: absolute; left: 328.00px; top: 344.03px" class="cls_009"><span class="cls_009">In certain limited circumstances, you may be requested to provide copies</span></div>
        <div style="position: absolute; left: 328.00px; top: 356.03px" class="cls_009"><span class="cls_009">of any published works written by you.</span></div>
        <div style="position: absolute; left: 101.01px; top: 360.50px" class="cls_022"><span class="cls_022">V</span>&nbsp;<span style="border: 1px solid black;"><%= grantedvisalabelno  %></span></div>
        <div style="position: absolute; left: 158.50px; top: 360.50px" class="cls_022"><span class="cls_022">&lt;</span>&nbsp;<span style="border: 1px solid black;"><%= visagrantnumber  %></span></div>
        <div style="position: absolute; left: 96.00px; top: 376.03px" class="cls_009"><span class="cls_009">If granted a visa without a label, provide the 13-digit visa</span></div>
        <div style="position: absolute; left: 328.00px; top: 380.03px" class="cls_009"><span class="cls_009">Highest qualification</span>&nbsp;<span style="border: 1px solid black;"><%= highestqualification  %></span></div>
        <div style="position: absolute; left: 96.00px; top: 388.03px" class="cls_009"><span class="cls_009">grant number (as shown on the letter notifying you of</span></div>
        <div style="position: absolute; left: 96.00px; top: 400.03px" class="cls_009"><span class="cls_009">visa grant).</span></div>
        <div style="position: absolute; left: 328.00px; top: 412.03px" class="cls_009"><span class="cls_009">Name of education provider or training body</span></div>
        <div style="position: absolute; left: 328.00px; top: 420.03px" class="cls_009"><span style="border: 1px solid black;"><%= nameofeducationprovider1  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 430.03px" class="cls_009"><span style="border: 1px solid black;"><%= nameofeducationprovider2  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 448.03px" class="cls_009"><span class="cls_009">Name</span>&nbsp;<span style="border: 1px solid black;"><%= nameonvisa1  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 460.03px" class="cls_009"><span class="cls_009">Address of education provider or training body</span></div>
        <div style="position: absolute; left: 328.00px; top: 480.03px" class="cls_009"><span style="border: 1px solid black;"><%= addressofeducationprovider  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 468.03px" class="cls_009"><span class="cls_009">Type of visa</span>&nbsp;<span style="border: 1px solid black;"><%= typeofvisa1  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 488.03px" class="cls_009"><span class="cls_009">Place of issue</span>&nbsp;<span style="border: 1px solid black;"><%= placeofissuevisa1  %></span></div>
        <div style="position: absolute; left: 103.72px; top: 506.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 125.78px; top: 506.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 160.34px; top: 506.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 476.00px; top: 511.53px" class="cls_010"><span class="cls_010">POSTAL CODE</span><span style="border: 1px solid black;"><%= educationproviderpostalcode  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 516.03px" class="cls_009"><span class="cls_009">Date of issue</span>&nbsp;<span style="border: 1px solid black;"><%= dateissuevisa1.Day + "/" + dateissuevisa1.Month + "/" +dateissuevisa1.Year %></span></div>
        <div style="position: absolute; left: 419.72px; top: 526.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 441.78px; top: 526.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 476.34px; top: 526.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 44.00px; top: 536.03px" class="cls_009"><span class="cls_009">Application</span></div>
        <div style="position: absolute; left: 96.00px; top: 536.03px" class="cls_009"><span class="cls_009">Refused</span><input type="checkbox" id="chkvisa2refused" runat="server"></div>
        <div style="position: absolute; left: 328.00px; top: 536.03px" class="cls_009"><span class="cls_009">Commencement date</span><span style="border: 1px solid black;"><%= commencementdate.Day + "/" +commencementdate.Month + "/" +commencementdate.Year   %></span></div>
        <div style="position: absolute; left: 96.00px; top: 552.03px" class="cls_009"><span class="cls_009">Granted</span><input type="checkbox" id="chkvisa2granted" runat="server"></div>
        <div style="position: absolute; left: 152.00px; top: 552.03px" class="cls_009"><span class="cls_009">Visa label number</span></div>
        <div style="position: absolute; left: 328.00px; top: 556.03px" class="cls_009"><span class="cls_009">Finish date</span><span style="border: 1px solid black;"><%= finishdate.Day + "/" +finishdate.Month + "/" +finishdate.Year   %></span></div>
        <div style="position: absolute; left: 101.01px; top: 572.50px" class="cls_022"><span class="cls_022">V</span>&nbsp;<span style="border: 1px solid black;"><%= visagrantnumber1  %></span></div>
        <div style="position: absolute; left: 158.50px; top: 572.50px" class="cls_022"><span class="cls_022">&lt;</span>&nbsp;<span style="border: 1px solid black;"><%= grantedvisalabelno1  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 580.03px" class="cls_009"><span class="cls_009">Documentation attached?</span></div>
        <div style="position: absolute; left: 496.00px; top: 580.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkeducationdocumentattachedNo" runat="server"></div>
        <div style="position: absolute; left: 539.99px; top: 580.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkeducationdocumentattachedYes" runat="server"></div>
        <div style="position: absolute; left: 96.00px; top: 588.03px" class="cls_009"><span class="cls_009">If granted a visa without a label, provide the 13-digit visa</span></div>
        <div style="position: absolute; left: 96.00px; top: 600.03px" class="cls_009"><span class="cls_009">grant number (as shown on the letter notifying you of</span></div>
        <div style="position: absolute; left: 96.00px; top: 612.03px" class="cls_009"><span class="cls_009">visa grant).</span></div>
        <div style="position: absolute; left: 24.72px; top: 654.53px" class="cls_020"><span class="cls_020">27</span></div>
        <div style="position: absolute; left: 44.00px; top: 656.03px" class="cls_009"><span class="cls_009">If you are applying:</span></div>
        <div style="position: absolute; left: 51.48px; top: 676.03px" class="cls_009"><span class="cls_009">as a member of the family unit of a student</span></div>
        <div style="position: absolute; left: 220.00px; top: 676.03px" class="cls_009"><span class="cls_009">Go to Part C</span><input type="checkbox" id="chkPartC" runat="server"></div>
        <div style="position: absolute; left: 136.15px; top: 696.03px" class="cls_009"><span class="cls_009">in all other cases</span></div>
        <div style="position: absolute; left: 220.00px; top: 696.03px" class="cls_009"><span class="cls_009">Go to Part B</span><input type="checkbox" id="chkPartB" runat="server"></div>
        <div style="position: absolute; left: 16.00px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 10</span></div>
        <div style="position: absolute; left: 245.94px; top: 820.73px" class="cls_010"><span class="cls_010">© COMMONWEALTH OF AUSTRALIA, 2006</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 8520px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background11.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 44.00px; top: 32.03px" class="cls_009"><span class="cls_009">Other course undertaken outside Australia</span></div>
        <div style="position: absolute; left: 44.00px; top: 42.03px" class="cls_009"><span style="border: 1px solid black;"><%= otherundertakcoursename1  %></span></div>
        <div style="position: absolute; left: 368.00px; top: 32.03px" class="cls_009"><span class="cls_009">Previous course in Australia</span><span style="border: 1px solid black;"><%= previouslycoursename1  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 64.03px" class="cls_009"><span class="cls_009">Name of education provider or training body</span></div>
        <div style="position: absolute; left: 368.00px; top: 64.03px" class="cls_009"><span class="cls_009">Name of education provider or training body</span></div>
        <div style="position: absolute; left: 368.00px; top: 70.03px" class="cls_009"><span style="border: 1px solid black;"><%= previouslycourseeducationproviderName1  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 70.03px" class="cls_009"><span style="border: 1px solid black;"><%= othernameofeducationprovider1  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 80.03px" class="cls_009"><span style="border: 1px solid black;"><%= othernameofeducationprovider2  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 112.03px" class="cls_009"><span class="cls_009">Address of education provider or training body</span></div>
        <div style="position: absolute; left: 44.00px; top: 126.03px" class="cls_009"><span style="border: 1px solid black;"><%= otheraddressofeducationprovider1  %></span></div>
        <div style="position: absolute; left: 368.00px; top: 112.03px" class="cls_009"><span class="cls_009">Period of study</span></div>
        <div style="position: absolute; left: 397.78px; top: 126.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 432.34px; top: 126.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 477.78px; top: 126.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 512.34px; top: 126.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 368.00px; top: 136.03px" class="cls_009"><span class="cls_009">From</span>&nbsp;<span style="border: 1px solid black;"><%= previouslycourseDateFrom1.Month + "/" +previouslycourseDateFrom1.Year  %></span></div>
        <div style="position: absolute; left: 460.84px; top: 136.03px" class="cls_009"><span class="cls_009">to</span>&nbsp;<span style="border: 1px solid black;"><%= previouslycourseDateTo1.Month + "/" +previouslycourseDateTo1.Year  %></span></div>
        <div style="position: absolute; left: 192.00px; top: 163.53px" class="cls_010"><span class="cls_010">POSTAL CODE</span>&nbsp;<span style="border: 1px solid black;"><%= othereduproviderpostalcode1  %></span></div>
        <div style="position: absolute; left: 368.00px; top: 164.03px" class="cls_009"><span class="cls_009">Previous course in Australia</span></div>
        <div style="position: absolute; left: 135.72px; top: 178.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 157.78px; top: 178.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 192.34px; top: 178.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 44.00px; top: 188.03px" class="cls_009"><span class="cls_009">Commencement date</span>&nbsp;<span style="border: 1px solid black;"><%= othercommencementdate1.Day + "/" +othercommencementdate1.Month + "/" +othercommencementdate1.Year %></span></div>
        <div style="position: absolute; left: 368.00px; top: 196.03px" class="cls_009"><span class="cls_009">Name of education provider or training body</span></div>
        <div style="position: absolute; left: 44.00px; top: 208.03px" class="cls_009"><span class="cls_009">Finish date</span>&nbsp;<span style="border: 1px solid black;"><%= otherfinishdate1.Day + "/" +otherfinishdate1.Month + "/" +otherfinishdate1.Year  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 232.03px" class="cls_009"><span class="cls_009">Documentation attached?</span></div>
        <div style="position: absolute; left: 212.00px; top: 232.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkotherdocumentattached1No" runat="server"></div>
        <div style="position: absolute; left: 255.99px; top: 232.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkotherdocumentattached1Yes" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 244.03px" class="cls_009"><span class="cls_009">Period of study</span></div>
        <div style="position: absolute; left: 397.78px; top: 258.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 432.34px; top: 258.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 477.78px; top: 258.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 512.34px; top: 258.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 44.00px; top: 260.03px" class="cls_009"><span class="cls_009">Other course undertaken outside Australia</span></div>
        <div style="position: absolute; left: 44.00px; top: 268.03px" class="cls_009">&nbsp;<span style="border: 1px solid black;"><%= otherundertakcoursename2  %></span></div>
        <div style="position: absolute; left: 368.00px; top: 268.03px" class="cls_009"><span class="cls_009">From</span></div>
        <div style="position: absolute; left: 460.84px; top: 268.03px" class="cls_009"><span class="cls_009">to</span></div>
        <div style="position: absolute; left: 44.00px; top: 292.03px" class="cls_009"><span class="cls_009">Name of education provider or training body</span></div>
        <div style="position: absolute; left: 44.00px; top: 310.03px" class="cls_009">&nbsp;<span style="border: 1px solid black;"><%= othernameofeducationprovider21  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 320.03px" class="cls_009">&nbsp;<span style="border: 1px solid black;"><%= othernameofeducationprovider22  %></span></div>
        <div style="position: absolute; left: 308.72px; top: 294.53px" class="cls_020"><span class="cls_020">32</span></div>
        <div style="position: absolute; left: 328.00px; top: 296.03px" class="cls_009"><span class="cls_009">Give details of your intended courses of study in Australia.</span></div>
        <div style="position: absolute; left: 328.00px; top: 312.03px" class="cls_009"><span class="cls_009">You must provide evidence of enrolment. Unless you are seeking to study</span></div>
        <div style="position: absolute; left: 328.00px; top: 324.03px" class="cls_009"><span class="cls_009">in Australia as a secondary school exchange student or as a student</span></div>
        <div style="position: absolute; left: 328.00px; top: 336.03px" class="cls_009"><span class="cls_009">sponsored by AusAID or the Australian Department of Defence, you </span><span class="cls_014">must</span></div>
        <div style="position: absolute; left: 44.00px; top: 340.03px" class="cls_009"><span class="cls_009">Address of education provider or training body</span></div>
        <div style="position: absolute; left: 44.00px; top: 350.03px" class="cls_009"><span class="cls_009">&nbsp;<span style="border: 1px solid black;"><%= otheraddressofeducationprovider2  %></span></span></div>
        <div style="position: absolute; left: 328.00px; top: 348.03px" class="cls_009"><span class="cls_009">attach:</span></div>
        <div style="position: absolute; left: 328.00px; top: 364.03px" class="cls_009"><span class="cls_009">•</span><span class="cls_014"> if applying in Australia, or outside Australia as an Assessment</span></div>
        <div style="position: absolute; left: 338.00px; top: 376.03px" class="cls_014"><span class="cls_014">Level 1 or 2 student</span><span class="cls_009">, the electronic confirmation of enrolment</span></div>
        <div style="position: absolute; left: 192.00px; top: 391.53px" class="cls_010"><span class="cls_010">POSTAL CODE</span>&nbsp;<span style="border: 1px solid black;"><%= othereduproviderpostalcode2  %></span></div>
        <div style="position: absolute; left: 338.00px; top: 388.03px" class="cls_009"><span class="cls_009">certificate from your education provider. If you propose to study more</span></div>
        <div style="position: absolute; left: 338.00px; top: 400.04px" class="cls_009"><span class="cls_009">than one course you must provide either an electronic confirmation</span></div>
        <div style="position: absolute; left: 135.72px; top: 406.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 157.78px; top: 406.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 192.34px; top: 406.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 338.00px; top: 412.04px" class="cls_009"><span class="cls_009">of enrolment certificate, or an original ‘offer of a place in a course’</span></div>
        <div style="position: absolute; left: 44.00px; top: 416.03px" class="cls_009"><span class="cls_009">Commencement date</span>&nbsp;<span style="border: 1px solid black;"><%= othercommencementdate2.Day + "/" +othercommencementdate2.Month + "/" +othercommencementdate2.Year  %></span></div>
        <div style="position: absolute; left: 338.00px; top: 424.04px" class="cls_009"><span class="cls_009">letter from your education provider for each additional course; or</span></div>
        <div style="position: absolute; left: 44.00px; top: 436.03px" class="cls_009"><span class="cls_009">Finish date</span>&nbsp;<span style="border: 1px solid black;"><%= otherfinishdate2.Day + "/" +otherfinishdate2.Month + "/" +otherfinishdate2.Year  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 440.04px" class="cls_009"><span class="cls_009">•</span><span class="cls_014"> if applying outside Australia as an Assessment Level 3 or 4</span></div>
        <div style="position: absolute; left: 338.00px; top: 452.04px" class="cls_014"><span class="cls_014">student</span><span class="cls_009">, the original ‘offer of a place in a course’ letter from your</span></div>
        <div style="position: absolute; left: 44.00px; top: 460.03px" class="cls_009"><span class="cls_009">Documentation attached?</span></div>
        <div style="position: absolute; left: 212.00px; top: 460.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkotherdocumentattached2No" runat="server"></div>
        <div style="position: absolute; left: 255.99px; top: 460.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkotherdocumentattached2Yes" runat="server"></div>
        <div style="position: absolute; left: 338.00px; top: 464.04px" class="cls_009"><span class="cls_009">education provider. If you are assessed as a genuine student, the</span></div>
        <div style="position: absolute; left: 338.00px; top: 476.04px" class="cls_009"><span class="cls_009">Australian Government office will provide you with a letter of</span></div>
        <div style="position: absolute; left: 24.72px; top: 486.53px" class="cls_020"><span class="cls_020">31</span></div>
        <div style="position: absolute; left: 44.00px; top: 488.03px" class="cls_009"><span class="cls_009">Have you previously studied in Australia?</span></div>
        <div style="position: absolute; left: 338.00px; top: 488.04px" class="cls_009"><span class="cls_009">genuineness. Only at this stage should you pay any tuition fees and</span></div>
        <div style="position: absolute; left: 338.00px; top: 500.04px" class="cls_009"><span class="cls_009">obtain an electronic Confirmation of Enrolment.</span></div>
        <div style="position: absolute; left: 44.00px; top: 508.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkispreviouslyNo" runat="server"></div>
        <div style="position: absolute; left: 328.00px; top: 516.04px" class="cls_009"><span class="cls_009">If you are seeking to study as an exchange student, you must attach to</span></div>
        <div style="position: absolute; left: 44.00px; top: 524.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkispreviouslyYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 524.03px" class="cls_009"><span class="cls_009">Give details below</span></div>
        <div style="position: absolute; left: 328.00px; top: 528.04px" class="cls_009"><span class="cls_009">this application the Acceptance Advice Secondary Exchange Student</span></div>
        <div style="position: absolute; left: 84.00px; top: 540.03px" class="cls_009"><span class="cls_009">You </span><span class="cls_014">must</span><span class="cls_009"> provide evidence of your studies and training,</span></div>
        <div style="position: absolute; left: 328.00px; top: 540.04px" class="cls_009"><span class="cls_009">(AASES) form as evidence of enrolment.</span></div>
        <div style="position: absolute; left: 84.00px; top: 552.03px" class="cls_009"><span class="cls_009">including academic records</span></div>
        <div style="position: absolute; left: 328.00px; top: 556.04px" class="cls_009"><span class="cls_009">If you wish to study in Australia as a student sponsored by AusAID or the</span></div>
        <div style="position: absolute; left: 328.00px; top: 568.04px" class="cls_009"><span class="cls_009">Australian Department of Defence, you must attach evidence of</span></div>
        <div style="position: absolute; left: 84.00px; top: 576.03px" class="cls_009"><span class="cls_009">Previous course in Australia</span>&nbsp;<span style="border: 1px solid black;"><%= previouslycoursename   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 580.04px" class="cls_009"><span class="cls_009">sponsorship from AusAID or the Department of Defence.</span></div>
        <div style="position: absolute; left: 328.00px; top: 604.04px" class="cls_009"><span class="cls_009">Intended course</span>&nbsp;<span style="border: 1px solid black;"><%= intendcoursename   %></span></div>
        <div style="position: absolute; left: 84.00px; top: 608.03px" class="cls_009"><span class="cls_009">Name of education provider or training body</span></div>
        <div style="position: absolute; left: 328.00px; top: 646.03px" class="cls_009"><span style="border: 1px solid black;"><%= intendedprovidername   %></span></div>
        <div style="position: absolute; left: 84.00px; top: 620.03px" class="cls_009">&nbsp;<span style="border: 1px solid black;"><%= previouslycourseeducationproviderName   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 636.04px" class="cls_009"><span class="cls_009">Name of education provider or training body</span></div>
        <div style="position: absolute; left: 84.00px; top: 656.03px" class="cls_009"><span class="cls_009">Period of study</span></div>
        <div style="position: absolute; left: 113.78px; top: 670.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 148.34px; top: 670.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 193.78px; top: 670.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 228.34px; top: 670.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 84.00px; top: 680.03px" class="cls_009"><span class="cls_009">From</span>&nbsp;<span style="border: 1px solid black;"><%= previouslycourseDateFrom.Month + "/" +previouslycourseDateFrom.Year  %></span></div>
        <div style="position: absolute; left: 176.84px; top: 680.03px" class="cls_009"><span class="cls_009">to</span>&nbsp;<span style="border: 1px solid black;"><%= previouslycourseDateTo.Month + "/" +previouslycourseDateTo.Year  %></span></div>
        <div style="position: absolute; left: 419.72px; top: 686.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 441.78px; top: 686.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 476.34px; top: 686.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 328.00px; top: 696.04px" class="cls_009"><span class="cls_009">Commencement date</span>&nbsp;<span style="border: 1px solid black;"><%= intendedcommencementdate.Day + "/" +intendedcommencementdate.Month + "/" +intendedcommencementdate.Year  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 716.03px" class="cls_009"><span class="cls_009">Finish date</span>&nbsp;<span style="border: 1px solid black;"><%= intendedfinishdate.Day + "/" +intendedfinishdate.Month + "/" +intendedfinishdate.Year  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 736.03px" class="cls_009"><span class="cls_009">Have you enrolled?</span></div>
        <div style="position: absolute; left: 328.00px; top: 752.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhaveenrolmentNo" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 752.03px" class="cls_009"><span class="cls_009">Attach letter of ‘offer of a place in a course’</span></div>
        <div style="position: absolute; left: 328.00px; top: 768.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhaveenrolmentYes" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 768.03px" class="cls_009"><span class="cls_009">Is evidence of enrolment attached?</span></div>
        <div style="position: absolute; left: 496.00px; top: 768.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhaveenrolmentevidenceNo" runat="server"></div>
        <div style="position: absolute; left: 540.00px; top: 768.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhaveenrolmentevidenceYes" runat="server"></div>
        <div style="position: absolute; left: 475.56px; top: 796.03px" class="cls_009"><span class="cls_009">Continued on the next page</span></div>
        <div style="position: absolute; left: 245.98px; top: 820.73px" class="cls_010"><span class="cls_010">© COMMONWEALTH OF AUSTRALIA, 2006</span></div>
        <div style="position: absolute; left: 496.25px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 11</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 9372px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background12.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 308.72px; top: 22.53px" class="cls_020"><span class="cls_020">35</span></div>
        <div style="position: absolute; left: 328.00px; top: 24.03px" class="cls_009"><span class="cls_009">Have you studied for at least 5 years (in the English language) in one or</span></div>
        <div style="position: absolute; left: 44.00px; top: 32.03px" class="cls_009"><span class="cls_009">Intended course</span>&nbsp;<span style="border: 1px solid black;"><%= intendcoursename1   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 36.03px" class="cls_009"><span class="cls_009">more of the following countries:</span></div>
        <div style="position: absolute; left: 328.00px; top: 50.03px" class="cls_009"><span class="cls_009">• Australia;</span></div>
        <div style="position: absolute; left: 428.00px; top: 50.03px" class="cls_009"><span class="cls_009">• the Republic of Ireland;</span></div>
        <div style="position: absolute; left: 44.00px; top: 64.03px" class="cls_009"><span class="cls_009">Name of education provider or training body</span></div>
        <div style="position: absolute; left: 44.00px; top: 72.03px" class="cls_009"><span style="border: 1px solid black;"><%= intendedprovidername1   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 64.03px" class="cls_009"><span class="cls_009">• Canada;</span></div>
        <div style="position: absolute; left: 428.00px; top: 64.03px" class="cls_009"><span class="cls_009">• the United Kingdom; or</span></div>
        <div style="position: absolute; left: 328.00px; top: 78.03px" class="cls_009"><span class="cls_009">• New Zealand;</span></div>
        <div style="position: absolute; left: 428.00px; top: 78.03px" class="cls_009"><span class="cls_009">• the United States of America?</span></div>
        <div style="position: absolute; left: 328.00px; top: 92.03px" class="cls_009"><span class="cls_009">• South Africa;</span></div>
        <div style="position: absolute; left: 135.72px; top: 114.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 157.78px; top: 114.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 192.33px; top: 114.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 328.00px; top: 112.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkstudiedmorethan5yrinothercountryNo" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 124.03px" class="cls_009"><span class="cls_009">Commencement date</span>&nbsp;<span style="border: 1px solid black;"><%= intendedcommencementdate1.Day + "/" +intendedcommencementdate1.Month + "/" +intendedcommencementdate1.Year  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 128.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkstudiedmorethan5yrinothercountryYes" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 128.03px" class="cls_009"><span class="cls_009">Attach evidence</span></div>
        <div style="position: absolute; left: 44.00px; top: 144.03px" class="cls_009"><span class="cls_009">Finish date</span>&nbsp;<span style="border: 1px solid black;"><%= intendedfinishdate1.Day + "/" +intendedfinishdate1.Month + "/" +intendedfinishdate1.Year  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 164.03px" class="cls_009"><span class="cls_009">Have you enrolled?</span></div>
        <div style="position: absolute; left: 328.00px; top: 162.73px" class="cls_019"><span class="cls_019">Your employment details</span></div>
        <div style="position: absolute; left: 44.00px; top: 180.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhaveenrolment1No" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 180.03px" class="cls_009"><span class="cls_009">Attach letter of ‘offer of a place in a course’</span></div>
        <div style="position: absolute; left: 308.72px; top: 190.53px" class="cls_020"><span class="cls_020">36</span></div>
        <div style="position: absolute; left: 328.00px; top: 192.03px" class="cls_009"><span class="cls_009">Give details of your employment history since leaving</span></div>
        <div style="position: absolute; left: 44.00px; top: 196.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhaveenrolment1Yes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 196.03px" class="cls_009"><span class="cls_009">Is evidence of enrolment attached?</span></div>
        <div style="position: absolute; left: 212.00px; top: 196.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhaveenrolmentevidence1No" runat="server"></div>
        <div style="position: absolute; left: 256.00px; top: 196.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhaveenrolmentevidence1Yes" runat="server"></div>
        <div style="position: absolute; left: 328.00px; top: 204.03px" class="cls_009"><span class="cls_009">school/college/university.</span></div>
        <div style="position: absolute; left: 44.00px; top: 224.03px" class="cls_009"><span class="cls_009">Intended course</span><span style="border: 1px solid black;"><%= intendcoursename2   %></span></div>
        <div style="position: absolute; left: 397.78px; top: 230.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 432.33px; top: 230.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 477.78px; top: 230.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 512.33px; top: 230.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 328.00px; top: 240.03px" class="cls_009"><span class="cls_009">Period:</span></div>
        <div style="position: absolute; left: 370.76px; top: 240.03px" class="cls_009"><span class="cls_009">From</span>&nbsp;<span style="border: 1px solid black;"><%= employmenthistoryFromDate.Month + "/" +employmenthistoryFromDate.Year  %></span></div>
        <div style="position: absolute; left: 460.83px; top: 240.03px" class="cls_009"><span class="cls_009">to</span>&nbsp;<span style="border: 1px solid black;"><%= employmenthistoryToDate.Month + "/" +employmenthistoryToDate.Year  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 256.03px" class="cls_009"><span class="cls_009">Name of education provider or training body</span></div>
        <div style="position: absolute; left: 44.00px; top: 270.03px" class="cls_009"><span style="border: 1px solid black;"><%= intendedprovidername1   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 256.03px" class="cls_009"><span class="cls_009">Name and Address of Employer</span></div>
        <div style="position: absolute; left: 328.00px; top: 270.03px" class="cls_009"><span style="border: 1px solid black;"><%= employerInfoL0   %></span></div>
        <div style="position: absolute; left: 135.72px; top: 306.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 157.78px; top: 306.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 192.33px; top: 306.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 476.00px; top: 307.53px" class="cls_010"><span class="cls_010">POSTAL CODE</span><span style="border: 1px solid black;"><%= employerInfoL1  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 316.03px" class="cls_009"><span class="cls_009">Commencement date</span>&nbsp;<span style="border: 1px solid black;"><%= intendedcommencementdate.Day + "/" +intendedcommencementdate.Month + "/" +intendedcommencementdate.Year  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 324.03px" class="cls_009"><span class="cls_009">Type of business</span>&nbsp;<span style="border: 1px solid black;"><%= typeofbusiness  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 336.03px" class="cls_009"><span class="cls_009">Finish date</span>&nbsp;<span style="border: 1px solid black;"><%= intendedcommencementdate.Day + "/" +intendedcommencementdate.Month + "/" +intendedcommencementdate.Year  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 344.03px" class="cls_009"><span class="cls_009">Occupation</span>&nbsp;<span style="border: 1px solid black;"><%= salarylevel  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 356.03px" class="cls_009"><span class="cls_009">Have you enrolled?</span></div>
        <div style="position: absolute; left: 328.00px; top: 364.03px" class="cls_009"><span class="cls_009">Salary level</span>&nbsp;<span style="border: 1px solid black;"><%= employeroccupation  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 372.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhaveenrolment2No" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 372.03px" class="cls_009"><span class="cls_009">Attach letter of ‘offer of a place in a course’</span></div>
        <div style="position: absolute; left: 328.00px; top: 384.03px" class="cls_009"><span class="cls_009">Documentation attached?</span></div>
        <div style="position: absolute; left: 496.00px; top: 384.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkleavingdocAttchNo" runat="server"></div>
        <div style="position: absolute; left: 539.98px; top: 384.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkleavingdocAttchYes" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 388.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhaveenrolment2Yes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 388.03px" class="cls_009"><span class="cls_009">Is evidence of enrolment attached?</span></div>
        <div style="position: absolute; left: 212.00px; top: 388.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhaveenrolmentevidence2No" runat="server"></div>
        <div style="position: absolute; left: 256.00px; top: 388.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhaveenrolmentevidence2Yes" runat="server"></div>
        <div style="position: absolute; left: 397.78px; top: 410.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 432.33px; top: 410.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 477.78px; top: 410.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 512.33px; top: 410.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 328.00px; top: 420.03px" class="cls_009"><span class="cls_009">Period:</span></div>
        <div style="position: absolute; left: 370.76px; top: 420.03px" class="cls_009"><span class="cls_009">From</span>&nbsp;<span style="border: 1px solid black;"><%= employmenthistoryFromDate1.Month + "/" +employmenthistoryFromDate1.Year  %></span></div>
        <div style="position: absolute; left: 460.83px; top: 420.03px" class="cls_009"><span class="cls_009">to</span>&nbsp;<span style="border: 1px solid black;"><%= employmenthistoryToDate1.Month + "/" +employmenthistoryToDate1.Year  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 418.73px" class="cls_019"><span class="cls_019">Your English language details</span></div>
        <div style="position: absolute; left: 328.00px; top: 436.03px" class="cls_009"><span class="cls_009">Name and address of employer</span></div>
        <div style="position: absolute; left: 328.00px; top: 446.03px" class="cls_009"><span style="border: 1px solid black;"><%= employerInfoL2   %></span></div>
        <div style="position: absolute; left: 24.72px; top: 446.53px" class="cls_020"><span class="cls_020">33</span></div>
        <div style="position: absolute; left: 44.00px; top: 448.03px" class="cls_009"><span class="cls_009">Are you an applicant in Assessment Level 1 or 2?</span></div>
        <div style="position: absolute; left: 44.00px; top: 468.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkapplicantassesmentlevelNo" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 484.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkapplicantassesmentlevelYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 484.03px" class="cls_009"><span class="cls_009">Go to Question 36</span></div>
        <div style="position: absolute; left: 476.00px; top: 487.53px" class="cls_010"><span class="cls_010">POSTAL CODE</span><span style="border: 1px solid black;"><%= employerInfoL3  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 504.03px" class="cls_009"><span class="cls_009">Type of business</span><span style="border: 1px solid black;"><%= typeofbusiness1  %></span></div>
        <div style="position: absolute; left: 24.72px; top: 510.53px" class="cls_020"><span class="cls_020">34</span></div>
        <div style="position: absolute; left: 44.00px; top: 512.03px" class="cls_009"><span class="cls_009">Have you undertaken an English language proficiency test within the last</span></div>
        <div style="position: absolute; left: 44.00px; top: 524.03px" class="cls_009"><span class="cls_009">24 months?</span></div>
        <div style="position: absolute; left: 328.00px; top: 524.03px" class="cls_009"><span class="cls_009">Occupation</span><span style="border: 1px solid black;"><%= employeroccupation1  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 540.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkenglishlangtestNo" runat="server"></div>
        <div style="position: absolute; left: 328.00px; top: 544.03px" class="cls_009"><span class="cls_009">Salary level</span><span style="border: 1px solid black;"><%= salarylevel1  %></span></div>
        <div style="position: absolute; left: 44.00px; top: 556.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkenglishlangtestYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 556.03px" class="cls_009"><span class="cls_009">Name of test</span>&nbsp;<span style="border: 1px solid black;"><%= englishlangtestname  %></span></div>
        <div style="position: absolute; left: 328.00px; top: 564.03px" class="cls_009"><span class="cls_009">Documentation attached?</span></div>
        <div style="position: absolute; left: 496.00px; top: 564.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkleavingdocAttch1No" runat="server"></div>
        <div style="position: absolute; left: 539.98px; top: 564.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkleavingdocAttch1Yes" runat="server"></div>
        <div style="position: absolute; left: 203.72px; top: 590.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 225.78px; top: 590.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 260.33px; top: 590.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 84.00px; top: 600.03px" class="cls_009"><span class="cls_009">Date of test</span>&nbsp;<span style="border: 1px solid black;"><%= englishlangtestDate.Day + "/" +englishlangtestDate.Month + "/" +englishlangtestDate.Year  %></span></div>
        <div style="position: absolute; left: 83.99px; top: 616.03px" class="cls_009"><span class="cls_009">Test certificate number</span>&nbsp;<span style="border: 1px solid black;"><%= englishlangtestcetificateno   %></span></div>
        <div style="position: absolute; left: 84.00px; top: 652.03px" class="cls_014"><span class="cls_014">Note</span><span class="cls_009">: You </span><span class="cls_014">must</span><span class="cls_009"> attach a certificate showing that you have</span></div>
        <div style="position: absolute; left: 84.00px; top: 664.03px" class="cls_009"><span class="cls_009">completed an English language proficiency test.</span></div>
        <div style="position: absolute; left: 16.00px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 12</span></div>
        <div style="position: absolute; left: 245.98px; top: 820.73px" class="cls_010"><span class="cls_010">© COMMONWEALTH OF AUSTRALIA, 2006</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 10224px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background13.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 328.00px; top: 14.73px" class="cls_019"><span class="cls_019">Other address details</span></div>
        <div style="position: absolute; left: 24.72px; top: 22.53px" class="cls_020"><span class="cls_020">37</span></div>
        <div style="position: absolute; left: 44.00px; top: 24.03px" class="cls_009"><span class="cls_009">Are you currently employed?</span></div>
        <div style="position: absolute; left: 44.00px; top: 44.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkcurrentlyemployedNo" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 44.03px" class="cls_009"><span class="cls_009">Are you</span></div>
        <div style="position: absolute; left: 128.72px; top: 44.03px" class="cls_009"><span class="cls_009">a student</span><input type="checkbox" id="chkStudent" runat="server"></div>
        <div style="position: absolute; left: 308.72px; top: 42.53px" class="cls_020"><span class="cls_020">39</span></div>
        <div style="position: absolute; left: 328.00px; top: 44.03px" class="cls_009"><span class="cls_009">Give details of any immediate relatives in Australia (ie. parent, spouse,</span></div>
        <div style="position: absolute; left: 328.00px; top: 56.03px" class="cls_009"><span class="cls_009">child, brother or sister)</span></div>
        <div style="position: absolute; left: 119.24px; top: 60.03px" class="cls_009"><span class="cls_009">unemployed</span><input type="checkbox" id="chkunemployed" runat="server"></div>
        <div style="position: absolute; left: 142.77px; top: 76.03px" class="cls_009"><span class="cls_009">other</span><input type="checkbox" id="chkOther" runat="server"></div>
        <div style="position: absolute; left: 188.00px; top: 76.03px" class="cls_009"><span class="cls_009">Please describe</span></div>
        <div style="position: absolute; left: 83.00px; top: 96.03px" class="cls_009"><span style="border: 1px solid black;"><%= otherdescription1   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 84.03px" class="cls_009"><span class="cls_009">Name</span><span style="border: 1px solid black;"><%= immediaterelativename   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 100.03px" class="cls_009"><span class="cls_009">Relationship</span><span style="border: 1px solid black;"><%= immediaterelativerelationship   %></span></div>
        <div style="position: absolute; left: 84.00px; top: 112.03px" class="cls_009"><span class="cls_009">Why do you wish to undertake the course of study you have</span></div>
        <div style="position: absolute; left: 328.00px; top: 109.53px" class="cls_009"><span class="cls_009">to you</span></div>
        <div style="position: absolute; left: 387.72px; top: 122.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 409.78px; top: 122.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 444.34px; top: 122.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 84.00px; top: 124.03px" class="cls_009"><span class="cls_009">nominated? If insufficient space, attach additional details.</span></div>
        <div style="position: absolute; left: 84.00px; top: 140.03px" class="cls_009"><span style="border: 1px solid black;"><%= otherdescription2   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 132.03px" class="cls_009"><span class="cls_009">Date of birth</span><span style="border: 1px solid black;"><%= immediaterelativeDob.Day + "/" + immediaterelativeDob.Month + "/" + immediaterelativeDob.Year    %></span></div>
        <div style="position: absolute; left: 328.00px; top: 148.03px" class="cls_009"><span class="cls_009">Address</span></div>
        <div style="position: absolute; left: 328.00px; top: 160.03px" class="cls_009"><span style="border: 1px solid black;"><%= immediaterelativeaddress   %></span></div>
        <div style="position: absolute; left: 476.00px; top: 199.53px" class="cls_010"><span class="cls_010">POSTCODE</span><span style="border: 1px solid black;"><%= immediaterelativepostalcode   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 212.03px" class="cls_009"><span class="cls_009">Immigration status in Australia (eg. temporary or permanent resident,</span></div>
        <div style="position: absolute; left: 100.00px; top: 220.03px" class="cls_009"><span class="cls_009">Now go to Question 39</span></div>
        <div style="position: absolute; left: 328.00px; top: 224.03px" class="cls_009"><span class="cls_009">Australian citizen)</span></div>
        <div style="position: absolute; left: 328.00px; top: 234.03px" class="cls_009"><span style="border: 1px solid black;"><%= immediaterelativeimmigrationstatus   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 248.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkcurrentlyemployedYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 248.03px" class="cls_009"><span class="cls_009">Your position</span><span style="border: 1px solid black;"><%= position   %></span></div>
        <div style="position: absolute; left: 387.72px; top: 258.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 409.78px; top: 258.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 444.34px; top: 258.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 328.00px; top: 268.03px" class="cls_009"><span class="cls_009">Date of arrival</span><span style="border: 1px solid black;"><%= immediaterelativeDateofarrival.Day + "/" + immediaterelativeDateofarrival.Month + "/" + immediaterelativeDateofarrival.Year    %></span></div>
        <div style="position: absolute; left: 84.00px; top: 280.03px" class="cls_009"><span class="cls_009">Name, address and telephone number of your employer</span></div>
        <div style="position: absolute; left: 84.00px; top: 295.03px" class="cls_009"><span style="border: 1px solid black;"><%= employername   %></span></div>
        <div style="position: absolute; left: 84.00px; top: 310.03px" class="cls_009"><span style="border: 1px solid black;"><%= employeraddress   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 300.03px" class="cls_009"><span class="cls_009">Name</span><span style="border: 1px solid black;"><%= immediaterelativename1   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 316.03px" class="cls_009"><span class="cls_009">Relationship</span><span style="border: 1px solid black;"><%= immediaterelativerelationship1   %></span></div>
        <div style="position: absolute; left: 192.00px; top: 331.53px" class="cls_010"><span class="cls_010">POSTAL CODE</span></div>
        <div style="position: absolute; left: 328.00px; top: 325.53px" class="cls_009"><span class="cls_009">to you</span></div>
        <div style="position: absolute; left: 387.72px; top: 338.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 409.78px; top: 338.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 444.34px; top: 338.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 90.68px; top: 345.73px" class="cls_010"><span class="cls_010">COUNTRY CODE</span></div>
        <div style="position: absolute; left: 139.28px; top: 345.73px" class="cls_010"><span class="cls_010">AREA CODE</span></div>
        <div style="position: absolute; left: 218.50px; top: 345.73px" class="cls_010"><span class="cls_010">NUMBER</span></div>
        <div style="position: absolute; left: 328.00px; top: 348.03px" class="cls_009"><span class="cls_009">Date of birth</span><span style="border: 1px solid black;"><%= immediaterelativeDob1.Day + "/" + immediaterelativeDob1.Month + "/" + immediaterelativeDob1.Year    %></span></div>
        <div style="position: absolute; left: 88.00px; top: 359.53px" class="cls_010"><span class="cls_010">(</span><span style="border: 1px solid black;"><%= employercontactno   %></span></div>
        <div style="position: absolute; left: 126.77px; top: 359.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 132.00px; top: 359.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 170.77px; top: 359.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 328.00px; top: 364.03px" class="cls_009"><span class="cls_009">Address</span></div>
        <div style="position: absolute; left: 328.00px; top: 380.03px" class="cls_009"><span style="border: 1px solid black;"><%= immediaterelativeaddress1   %></span></div>
        <div style="position: absolute; left: 84.00px; top: 372.03px" class="cls_009"><span class="cls_009">Have you attached evidence of your employment details?</span></div>
        <div style="position: absolute; left: 92.00px; top: 388.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkevidenceofemployementNo" runat="server"></div>
        <div style="position: absolute; left: 136.00px; top: 388.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkevidenceofemployementYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 404.03px" class="cls_009"><span class="cls_009">Are you currently a student in Australia?</span></div>
        <div style="position: absolute; left: 476.00px; top: 415.53px" class="cls_010"><span class="cls_010">POSTCODE</span><span style="border: 1px solid black;"><%= immediaterelativepostalcode1   %></span></div>
        <div style="position: absolute; left: 92.00px; top: 420.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkcurrentlystudentinaustraliaNo" runat="server"></div>
        <div style="position: absolute; left: 136.00px; top: 420.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkcurrentlystudentinaustraliaYes" runat="server"></div>
        <div style="position: absolute; left: 328.00px; top: 428.03px" class="cls_009"><span class="cls_009">Immigration status in Australia (eg. temporary or permanent resident,</span></div>
        <div style="position: absolute; left: 328.00px; top: 440.03px" class="cls_009"><span class="cls_009">Australian citizen)</span></div>
        <div style="position: absolute; left: 328.00px; top: 450.03px" class="cls_009"><span style="border: 1px solid black;"><%= immediaterelativeimmigrationstatus1   %></span></div>
        <div style="position: absolute; left: 24.72px; top: 446.53px" class="cls_020"><span class="cls_020">38</span></div>
        <div style="position: absolute; left: 44.00px; top: 448.03px" class="cls_009"><span class="cls_009">Have you been offered a job for when you return home at the completion</span></div>
        <div style="position: absolute; left: 44.00px; top: 460.03px" class="cls_009"><span class="cls_009">of your course?</span></div>
        <div style="position: absolute; left: 387.72px; top: 474.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 409.78px; top: 474.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 444.34px; top: 474.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 44.00px; top: 476.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkjobofferedNo" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 476.03px" class="cls_009"><span class="cls_009">What kind of employment will you be seeking on your</span></div>
        <div style="position: absolute; left: 328.00px; top: 484.03px" class="cls_009"><span class="cls_009">Date of arrival</span><span style="border: 1px solid black;"><%= immediaterelativedateofarrival1.Day + "/" + immediaterelativedateofarrival1.Month + "/" + immediaterelativedateofarrival1.Year    %></span></div>
        <div style="position: absolute; left: 84.00px; top: 488.03px" class="cls_009"><span class="cls_009">return to your home country?</span></div>
        <div style="position: absolute; left: 84.00px; top: 500.03px" class="cls_009"><span style="border: 1px solid black;"><%= kindofemployementseeking   %></span></div>
        <div style="position: absolute; left: 308.72px; top: 510.53px" class="cls_020"><span class="cls_020">40</span></div>
        <div style="position: absolute; left: 328.00px; top: 512.03px" class="cls_009"><span class="cls_009">Give details of your closest relative in your home country who is neither</span></div>
        <div style="position: absolute; left: 328.00px; top: 524.03px" class="cls_009"><span class="cls_009">accompanying nor joining you in Australia</span></div>
        <div style="position: absolute; left: 328.00px; top: 544.03px" class="cls_009"><span class="cls_009">Name</span><span style="border: 1px solid black;"><%= closestrelativename   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 560.03px" class="cls_009"><span class="cls_009">Relationship</span><span style="border: 1px solid black;"><%= closestrelativerelationship   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 569.53px" class="cls_009"><span class="cls_009">to you</span></div>
        <div style="position: absolute; left: 44.00px; top: 576.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkjobofferedYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 576.03px" class="cls_009"><span class="cls_009">Name, address and telephone number of your employer</span></div>
        <div style="position: absolute; left: 84.00px; top: 590.03px" class="cls_009"><span style="border: 1px solid black;"><%= jobofferedname   %></span></div>
        <div style="position: absolute; left: 84.00px; top: 605.03px" class="cls_009"><span style="border: 1px solid black;"><%= jobofferedaddress   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 588.03px" class="cls_009"><span class="cls_009">Address</span></div>
        <div style="position: absolute; left: 328.00px; top: 600.03px" class="cls_009"><span style="border: 1px solid black;"><%= closestrelativeaddress   %></span></div>
        <div style="position: absolute; left: 476.00px; top: 639.53px" class="cls_010"><span class="cls_010">POSTAL CODE</span><span style="border: 1px solid black;"><%= closestrelativepostalcode   %></span></div>
        <div style="position: absolute; left: 192.00px; top: 643.53px" class="cls_010"><span class="cls_010">POSTAL CODE</span></div>
        <div style="position: absolute; left: 386.68px; top: 657.73px" class="cls_010"><span class="cls_010">COUNTRY CODE</span></div>
        <div style="position: absolute; left: 435.28px; top: 657.73px" class="cls_010"><span class="cls_010">AREA CODE</span></div>
        <div style="position: absolute; left: 506.50px; top: 657.73px" class="cls_010"><span class="cls_010">NUMBER</span></div>
        <div style="position: absolute; left: 90.68px; top: 661.73px" class="cls_010"><span class="cls_010">COUNTRY CODE</span></div>
        <div style="position: absolute; left: 139.28px; top: 661.73px" class="cls_010"><span class="cls_010">AREA CODE</span></div>
        <div style="position: absolute; left: 210.50px; top: 661.73px" class="cls_010"><span class="cls_010">NUMBER</span></div>
        <div style="position: absolute; left: 328.00px; top: 668.03px" class="cls_009"><span class="cls_009">Telephone</span></div>
        <div style="position: absolute; left: 384.00px; top: 671.53px" class="cls_010"><span class="cls_010">(</span><span style="border: 1px solid black;"><%= closestrelativecontactnumber   %></span></div>
        <div style="position: absolute; left: 422.77px; top: 671.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 428.00px; top: 671.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 466.77px; top: 671.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 88.00px; top: 675.53px" class="cls_010"><span class="cls_010">(</span><span style="border: 1px solid black;"><%= jobofferedcontactno   %></span></div>
        <div style="position: absolute; left: 126.77px; top: 675.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 132.00px; top: 675.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 170.77px; top: 675.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 84.00px; top: 692.03px" class="cls_009"><span class="cls_009">Title of position offered</span><span style="border: 1px solid black;"><%= titleofpositionofferef   %></span></div>
        <div style="position: absolute; left: 245.98px; top: 820.73px" class="cls_010"><span class="cls_010">© COMMONWEALTH OF AUSTRALIA, 2006</span></div>
        <div style="position: absolute; left: 496.25px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 13</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 11076px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background14.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 44.00px; top: 14.73px" class="cls_019"><span class="cls_019">Financial details</span></div>
        <div style="position: absolute; left: 328.00px; top: 14.73px" class="cls_019"><span class="cls_019">Additional information</span></div>
        <div style="position: absolute; left: 24.72px; top: 42.53px" class="cls_020"><span class="cls_020">41</span></div>
        <div style="position: absolute; left: 44.00px; top: 44.03px" class="cls_009"><span class="cls_009">Are you applying to study in Australia as a secondary school exchange</span></div>
        <div style="position: absolute; left: 308.72px; top: 42.53px" class="cls_020"><span class="cls_020">43</span></div>
        <div style="position: absolute; left: 328.00px; top: 44.03px" class="cls_009"><span class="cls_009">If there is any other information or documentation you would like taken</span></div>
        <div style="position: absolute; left: 44.00px; top: 56.03px" class="cls_009"><span class="cls_009">student?</span></div>
        <div style="position: absolute; left: 328.00px; top: 56.03px" class="cls_009"><span class="cls_009">into consideration in assessing your application attach it to the application.</span></div>
        <div style="position: absolute; left: 44.00px; top: 72.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkapplyinaustraliaassecschoolNo" runat="server"></div>
        <div style="position: absolute; left: 328.00px; top: 72.03px" class="cls_009"><span class="cls_009">Remember that a decision may be based solely on the information you</span></div>
        <div style="position: absolute; left: 328.00px; top: 84.03px" class="cls_009"><span class="cls_009">provide in this application.</span></div>
        <div style="position: absolute; left: 44.00px; top: 88.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkapplyinaustraliaassecschoolYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 88.03px" class="cls_009"><span class="cls_009">Go to Question 43</span></div>
        <div style="position: absolute; left: 328.00px; top: 100.03px" class="cls_014"><span class="cls_014">Note</span><span class="cls_009">: If you are in Australia as the holder of a student subclass 570-576</span></div>
        <div style="position: absolute; left: 328.00px; top: 112.03px" class="cls_009"><span class="cls_009">visa and you wish to change your principal course within the first</span></div>
        <div style="position: absolute; left: 24.72px; top: 114.53px" class="cls_020"><span class="cls_020">42</span></div>
        <div style="position: absolute; left: 44.00px; top: 116.03px" class="cls_009"><span class="cls_009">Do you have access to sufficient funds to support you and your family</span></div>
        <div style="position: absolute; left: 328.00px; top: 124.03px" class="cls_009"><span class="cls_009">12 months of that course, and your new principal course will be in a</span></div>
        <div style="position: absolute; left: 44.00px; top: 128.03px" class="cls_009"><span class="cls_009">unit members for the TOTAL period of your stay in Australia (including</span></div>
        <div style="position: absolute; left: 328.00px; top: 136.03px" class="cls_009"><span class="cls_009">new education sector, then as part of this application you must provide</span></div>
        <div style="position: absolute; left: 44.00px; top: 140.03px" class="cls_009"><span class="cls_009">proposed course fees for you and any school-age family members, living</span></div>
        <div style="position: absolute; left: 328.00px; top: 148.03px" class="cls_009"><span class="cls_009">exceptional circumstances to justify the change of course.</span></div>
        <div style="position: absolute; left: 44.00px; top: 152.03px" class="cls_009"><span class="cls_009">costs and travel costs, regardless of whether your dependants intend to</span></div>
        <div style="position: absolute; left: 44.00px; top: 164.04px" class="cls_009"><span class="cls_009">accompany you to Australia)?</span></div>
        <div style="position: absolute; left: 328.00px; top: 164.03px" class="cls_009"><span class="cls_009">If you are applying in Australia as an Assessment Level 2-5 applicant</span></div>
        <div style="position: absolute; left: 328.00px; top: 176.03px" class="cls_009"><span class="cls_009">and do not hold a student visa, you must provide exceptional reasons to</span></div>
        <div style="position: absolute; left: 44.00px; top: 184.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkissufficientfundNo" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 184.03px" class="cls_009"><span class="cls_009">Go to Question 43</span></div>
        <div style="position: absolute; left: 328.00px; top: 188.04px" class="cls_009"><span class="cls_009">justify the grant of your visa.</span></div>
        <div style="position: absolute; left: 44.00px; top: 200.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkissufficientfundYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 200.03px" class="cls_009"><span class="cls_009">Please complete the declaration below</span></div>
        <div style="position: absolute; left: 342.00px; top: 216.03px" class="cls_009"><span class="cls_009">Now go to Part D</span></div>
        <div style="position: absolute; left: 92.00px; top: 224.03px" class="cls_009"><span class="cls_009">If you are under 18 years of age, this declaration must</span></div>
        <div style="position: absolute; left: 92.00px; top: 236.03px" class="cls_009"><span class="cls_009">be signed on your behalf by your parents or a person(s)</span></div>
        <div style="position: absolute; left: 92.00px; top: 248.03px" class="cls_009"><span class="cls_009">who has legal custody of you.</span></div>
        <div style="position: absolute; left: 92.00px; top: 264.03px" class="cls_009"><span class="cls_009">If you are in Assessment Level 2-5, you </span><span class="cls_014">must</span><span class="cls_009"> provide</span></div>
        <div style="position: absolute; left: 92.00px; top: 276.03px" class="cls_009"><span class="cls_009">documentary </span><span class="cls_014">evidence</span><span class="cls_009"> that you have sufficient funds</span></div>
        <div style="position: absolute; left: 92.00px; top: 288.03px" class="cls_009"><span class="cls_009">(unless you are a secondary school exchange student).</span></div>
        <div style="position: absolute; left: 92.00px; top: 300.03px" class="cls_009"><span class="cls_009">It is important that you refer to the department’s website</span></div>
        <div style="position: absolute; left: 92.00px; top: 312.04px" class="cls_014"><span class="cls_014"></span><a href="http://www.immi.gov.au/study/">www.immi.gov.au/study/</a> <span class="cls_009">for details regarding the</span></div>
        <div style="position: absolute; left: 92.00px; top: 324.04px" class="cls_009"><span class="cls_009">level of funds you are required to demonstrate, acceptable</span></div>
        <div style="position: absolute; left: 92.00px; top: 336.04px" class="cls_009"><span class="cls_009">sources of funds and of the length of time funds must</span></div>
        <div style="position: absolute; left: 92.00px; top: 348.04px" class="cls_009"><span class="cls_009">have been held.</span></div>
        <div style="position: absolute; left: 92.00px; top: 364.03px" class="cls_009"><span class="cls_009">I declare that I have access to sufficient funds to support</span></div>
        <div style="position: absolute; left: 92.00px; top: 376.03px" class="cls_009"><span class="cls_009">myself and my family unit members (regardless of</span></div>
        <div style="position: absolute; left: 92.00px; top: 388.03px" class="cls_009"><span class="cls_009">whether they are accompanying me to Australia) for the</span></div>
        <div style="position: absolute; left: 92.00px; top: 400.03px" class="cls_009"><span class="cls_009">total period of my stay in Australia.</span></div>
        <div style="position: absolute; left: 92.00px; top: 416.03px" class="cls_014"><span class="cls_014">Your signature</span></div>
        <div style="position: absolute; left: 127.72px; top: 474.39px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 149.78px; top: 474.39px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 184.34px; top: 474.39px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 92.00px; top: 484.03px" class="cls_009"><span class="cls_009">Date</span><span style="border: 1px solid black;"><%= declarationDate42.Day + "/" + declarationDate42.Month + "/" + declarationDate42.Year    %></span></div>
        <div style="position: absolute; left: 16.00px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 14</span></div>
        <div style="position: absolute; left: 245.94px; top: 820.73px" class="cls_010"><span class="cls_010">© COMMONWEALTH OF AUSTRALIA, 2006</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 11928px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background15.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 44.00px; top: 14.73px" class="cls_018"><span class="cls_018">Part C - To be completed only if you</span></div>
        <div style="position: absolute; left: 308.72px; top: 22.53px" class="cls_020"><span class="cls_020">48</span></div>
        <div style="position: absolute; left: 328.00px; top: 24.03px" class="cls_009"><span class="cls_009">Is the student you are joining:</span></div>
        <div style="position: absolute; left: 44.00px; top: 32.73px" class="cls_018"><span class="cls_018">are a family unit member joining a</span></div>
        <div style="position: absolute; left: 328.00px; top: 38.03px" class="cls_009"><span class="cls_009">• the holder of an International Postgraduate Research Scholarship;</span></div>
        <div style="position: absolute; left: 328.00px; top: 52.03px" class="cls_009"><span class="cls_009">• sponsored by AusAID or the Australian Department of Defence;</span></div>
        <div style="position: absolute; left: 44.00px; top: 50.73px" class="cls_018"><span class="cls_018">student in Australia</span></div>
        <div style="position: absolute; left: 328.00px; top: 66.03px" class="cls_009"><span class="cls_009">• fully sponsored by the federal, or a state or territory government of</span></div>
        <div style="position: absolute; left: 24.72px; top: 78.53px" class="cls_020"><span class="cls_020">44</span></div>
        <div style="position: absolute; left: 44.00px; top: 80.03px" class="cls_009"><span class="cls_009">Has the student you are joining, who is a member of your family unit,</span></div>
        <div style="position: absolute; left: 338.00px; top: 78.03px" class="cls_009"><span class="cls_009">Australia;</span></div>
        <div style="position: absolute; left: 44.00px; top: 92.03px" class="cls_009"><span class="cls_009">completed form 919 Nomination of student dependants?</span></div>
        <div style="position: absolute; left: 328.00px; top: 92.03px" class="cls_009"><span class="cls_009">• fully sponsored by the government of your home country, or by a state</span></div>
        <div style="position: absolute; left: 338.00px; top: 104.03px" class="cls_009"><span class="cls_009">or provincial government of your home country;</span></div>
        <div style="position: absolute; left: 44.00px; top: 112.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkFamilyunitcompletedformpartCNo" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 112.03px" class="cls_009"><span class="cls_009">If applying outside Australia, you </span><span class="cls_014">must</span><span class="cls_009"> provide a completed</span></div>
        <div style="position: absolute; left: 328.00px; top: 118.03px" class="cls_009"><span class="cls_009">• fully sponsored by a multilateral organisation eg. the United Nations,</span></div>
        <div style="position: absolute; left: 84.00px; top: 124.03px" class="cls_009"><span class="cls_009">form 919 with this application</span></div>
        <div style="position: absolute; left: 338.00px; top: 130.03px" class="cls_009"><span class="cls_009">World Bank?</span></div>
        <div style="position: absolute; left: 44.00px; top: 144.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkFamilyunitcompletedformpartCYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 144.03px" class="cls_009"><span class="cls_009">Attach the completed form 919 to this application</span></div>
        <div style="position: absolute; left: 328.00px; top: 148.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkisstudentjoiningsatisfiedconditionpartCNo" runat="server"></div>
        <div style="position: absolute; left: 328.00px; top: 164.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkisstudentjoiningsatisfiedconditionpartCYes" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 163.93px" class="cls_023"><span class="cls_023">If the student you are joining is in Assessment Level 2-5</span></div>
        <div style="position: absolute; left: 24.72px; top: 170.53px" class="cls_020"><span class="cls_020">45</span></div>
        <div style="position: absolute; left: 44.00px; top: 172.03px" class="cls_009"><span class="cls_009">Do you intend to study in Australia for more than 3 months?</span></div>
        <div style="position: absolute; left: 368.00px; top: 175.93px" class="cls_023"><span class="cls_023">and was granted their visa after 1 December 2003, there</span></div>
        <div style="position: absolute; left: 368.00px; top: 187.93px" class="cls_023"><span class="cls_023">are specific financial evidentiary requirements that you</span></div>
        <div style="position: absolute; left: 44.00px; top: 192.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkstudymorethanthreemonthpartCNo" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 199.93px" class="cls_023"><span class="cls_023">must meet. Please go to the department’s website for</span></div>
        <div style="position: absolute; left: 44.00px; top: 208.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkstudymorethanthreemonthpartCYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 208.03px" class="cls_009"><span class="cls_009">If you are 5 years up to 18 years of age, please provide</span></div>
        <div style="position: absolute; left: 368.00px; top: 211.93px" class="cls_023"><span class="cls_023">details on the levels of funds you are required to</span></div>
        <div style="position: absolute; left: 84.00px; top: 220.03px" class="cls_009"><span class="cls_009">documentary evidence of school enrolment in Australia.</span></div>
        <div style="position: absolute; left: 368.00px; top: 223.93px" class="cls_023"><span class="cls_023">demonstrate, acceptable sources of funds and the length</span></div>
        <div style="position: absolute; left: 84.00px; top: 236.03px" class="cls_009"><span class="cls_009">If you are 18 years of age or older and you intend to study</span></div>
        <div style="position: absolute; left: 368.00px; top: 235.93px" class="cls_023"><span class="cls_023">of time funds must be held.</span></div>
        <div style="position: absolute; left: 84.00px; top: 248.03px" class="cls_009"><span class="cls_009">in Australia for more than 3 months, you must apply for a</span></div>
        <div style="position: absolute; left: 384.00px; top: 256.03px" class="cls_009"><span class="cls_009">Now go to Part D</span></div>
        <div style="position: absolute; left: 84.00px; top: 260.03px" class="cls_009"><span class="cls_009">student visa as a principal applicant, rather than as a family</span></div>
        <div style="position: absolute; left: 84.00px; top: 272.03px" class="cls_009"><span class="cls_009">unit member.</span></div>
        <div style="position: absolute; left: 308.72px; top: 282.53px" class="cls_020"><span class="cls_020">49</span></div>
        <div style="position: absolute; left: 328.00px; top: 284.03px" class="cls_009"><span class="cls_009">Does the student you are joining have sufficient funds to financially</span></div>
        <div style="position: absolute; left: 328.00px; top: 296.03px" class="cls_009"><span class="cls_009">support themselves, you and any other family members included in this</span></div>
        <div style="position: absolute; left: 24.72px; top: 298.53px" class="cls_020"><span class="cls_020">46</span></div>
        <div style="position: absolute; left: 44.00px; top: 300.03px" class="cls_009"><span class="cls_009">Provide details of the student you are joining in Australia</span></div>
        <div style="position: absolute; left: 328.00px; top: 308.03px" class="cls_009"><span class="cls_009">application, for the remainder of his or her stay in Australia?</span></div>
        <div style="position: absolute; left: 44.00px; top: 320.03px" class="cls_009"><span class="cls_009">Name</span>&nbsp;<span style="border: 1px solid black;"><%= studentnamepartC   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 328.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chksuficientfundpartCNo" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 336.03px" class="cls_009"><span class="cls_009">Relationship</span>&nbsp;<span style="border: 1px solid black;"><%= relationshiptostudentpartC   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 345.53px" class="cls_009"><span class="cls_009">to you</span></div>
        <div style="position: absolute; left: 328.00px; top: 344.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chksuficientfundpartCYes" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 344.03px" class="cls_009"><span class="cls_009">You </span><span class="cls_014">must</span><span class="cls_009"> attach evidence of this financial support</span></div>
        <div style="position: absolute; left: 103.72px; top: 358.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 125.78px; top: 358.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 160.34px; top: 358.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 44.00px; top: 368.03px" class="cls_009"><span class="cls_009">Date of birth</span>&nbsp;<span style="border: 1px solid black;"><%= studentdobpartC.Day + "/" + studentdobpartC.Month + "/" + studentdobpartC.Year    %></span></div>
        <div style="position: absolute; left: 475.56px; top: 372.03px" class="cls_009"><span class="cls_009">Continued on the next page</span></div>
        <div style="position: absolute; left: 44.00px; top: 388.03px" class="cls_009"><span class="cls_009">Citizenship(s)</span>&nbsp;<span style="border: 1px solid black;"><%= citizenshipofstudentpartC %></span></div>
        <div style="position: absolute; left: 44.00px; top: 404.03px" class="cls_009"><span class="cls_009">Address</span>&nbsp;<span style="border: 1px solid black;"><%= studentaddresspartC   %></span></div>
        <div style="position: absolute; left: 192.00px; top: 455.53px" class="cls_010"><span class="cls_010">POSTCODE</span>&nbsp;<span style="border: 1px solid black;"><%= studentaddpostalcodepartC   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 472.03px" class="cls_009"><span class="cls_009">Type of student visa held</span>&nbsp;<span style="border: 1px solid black;"><%= typeofstudentvisaheldpartC   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 488.03px" class="cls_009"><span class="cls_009">What Assessment Level were they</span>&nbsp;<span style="border: 1px solid black;"><%= assessmentlevelpartC   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 497.53px" class="cls_009"><span class="cls_009">assessed against (if known)?</span></div>
        <div style="position: absolute; left: 103.72px; top: 514.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 125.78px; top: 514.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 160.34px; top: 514.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 44.00px; top: 524.03px" class="cls_009"><span class="cls_009">Date granted</span>&nbsp;<span style="border: 1px solid black;"><%= assessmentgrantdatepartC.Day + "/" + assessmentgrantdatepartC.Month + "/" + assessmentgrantdatepartC.Year    %></span></div>
        <div style="position: absolute; left: 44.00px; top: 544.03px" class="cls_009"><span class="cls_009">Expiry date</span>&nbsp;<span style="border: 1px solid black;"><%= assessmentexpirydatepartC.Day + "/" + assessmentexpirydatepartC.Month + "/" + assessmentexpirydatepartC.Year    %></span></div>
        <div style="position: absolute; left: 44.00px; top: 568.03px" class="cls_014"><span class="cls_014">Note</span><span class="cls_009">: You cannot join your family unit member in Australia on a student</span></div>
        <div style="position: absolute; left: 44.00px; top: 580.03px" class="cls_009"><span class="cls_009">visa if they are in Assessment Levels 3-5 unless the total duration of</span></div>
        <div style="position: absolute; left: 44.00px; top: 592.03px" class="cls_009"><span class="cls_009">the course(s) they are undertaking in Australia is at least 12 months or</span></div>
        <div style="position: absolute; left: 44.00px; top: 604.03px" class="cls_009"><span class="cls_009">more.</span></div>
        <div style="position: absolute; left: 24.72px; top: 625.53px" class="cls_020"><span class="cls_020">47</span></div>
        <div style="position: absolute; left: 44.00px; top: 627.03px" class="cls_009"><span class="cls_009">Did the student you are joining declare in their initial student visa</span></div>
        <div style="position: absolute; left: 44.00px; top: 639.03px" class="cls_009"><span class="cls_009">application you and other members of their family unit included in this</span></div>
        <div style="position: absolute; left: 44.00px; top: 651.03px" class="cls_009"><span class="cls_009">application?</span></div>
        <div style="position: absolute; left: 44.00px; top: 671.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkisstudentjoiningdeclarepartCNo" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 687.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkisstudentjoiningdeclarepartCYes" runat="server"></div>
        <div style="position: absolute; left: 245.98px; top: 820.73px" class="cls_010"><span class="cls_010">© COMMONWEALTH OF AUSTRALIA, 2006</span></div>
        <div style="position: absolute; left: 496.25px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 15</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 12780px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background16.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 44.00px; top: 14.73px" class="cls_018"><span class="cls_018">Part D - To be completed by all</span></div>
        <div style="position: absolute; left: 308.72px; top: 22.53px" class="cls_020"><span class="cls_020">53</span></div>
        <div style="position: absolute; left: 328.00px; top: 24.03px" class="cls_009"><span class="cls_009">Have you, or any member of your family unit included in this application:</span></div>
        <div style="position: absolute; left: 328.00px; top: 36.03px" class="cls_009"><span class="cls_009">• ever had, or do you currently have, tuberculosis?</span></div>
        <div style="position: absolute; left: 44.00px; top: 32.73px" class="cls_018"><span class="cls_018">applicants</span></div>
        <div style="position: absolute; left: 328.00px; top: 48.03px" class="cls_009"><span class="cls_009">• been in close contact with a person who has, or has had, active</span></div>
        <div style="position: absolute; left: 44.00px; top: 54.73px" class="cls_019"><span class="cls_019">Health declaration</span></div>
        <div style="position: absolute; left: 338.00px; top: 60.03px" class="cls_009"><span class="cls_009">tuberculosis?</span></div>
        <div style="position: absolute; left: 328.00px; top: 72.03px" class="cls_009"><span class="cls_009">• ever had a chest x-ray which showed an abnormality?</span></div>
        <div style="position: absolute; left: 24.72px; top: 82.53px" class="cls_020"><span class="cls_020">50</span></div>
        <div style="position: absolute; left: 44.00px; top: 84.03px" class="cls_009"><span class="cls_009">In the last 5 years, have you, or has any member of your family unit</span></div>
        <div style="position: absolute; left: 328.00px; top: 92.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhaveanyhealthissueNo" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 96.03px" class="cls_009"><span class="cls_009">included in this application, visited or lived outside your country of usual</span></div>
        <div style="position: absolute; left: 44.00px; top: 108.03px" class="cls_009"><span class="cls_009">residence for more than 3 consecutive months?</span></div>
        <div style="position: absolute; left: 328.00px; top: 108.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhaveanyhealthissueYes" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 108.03px" class="cls_009"><span class="cls_009">Give full details</span></div>
        <div style="position: absolute; left: 328.00px; top: 118.03px" class="cls_009">&nbsp;<span style="border: 1px solid black;"><%= detailofhealthissue   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 128.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chklivedoutsidecountrycNo" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 144.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chklivedoutsidecountrycYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 144.03px" class="cls_009"><span class="cls_009">Give details</span></div>
        <div style="position: absolute; left: 44.00px; top: 176.03px" class="cls_009"><span class="cls_009">Name</span>&nbsp;<span style="border: 1px solid black;"><%= familymembername   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 196.03px" class="cls_009"><span class="cls_009">Countries</span>&nbsp;<span style="border: 1px solid black;"><%= familyresidencecountry   %></span></div>
        <div style="position: absolute; left: 103.72px; top: 214.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 125.78px; top: 214.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 160.34px; top: 214.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 203.72px; top: 214.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 225.78px; top: 214.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 260.34px; top: 214.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 44.00px; top: 224.03px" class="cls_009"><span class="cls_009">Date</span>&nbsp;<span style="border: 1px solid black;"><%= familyresidenceFromdate.Day + "/" + familyresidenceFromdate.Month + "/" + familyresidenceFromdate.Year    %></span></div>
        <div style="position: absolute; left: 186.83px; top: 224.03px" class="cls_009"><span class="cls_009">to</span>&nbsp;<span style="border: 1px solid black;"><%= familyresidenceTodate.Day + "/" + familyresidenceTodate.Month + "/" + familyresidenceTodate.Year    %></span></div>
        <div style="position: absolute; left: 308.72px; top: 234.53px" class="cls_020"><span class="cls_020">54</span></div>
        <div style="position: absolute; left: 328.00px; top: 236.03px" class="cls_009"><span class="cls_009">Do you require assistance with mobility and/or care?</span></div>
        <div style="position: absolute; left: 44.00px; top: 256.03px" class="cls_009"><span class="cls_009">Name</span>&nbsp;<span style="border: 1px solid black;"><%= familymembername2   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 256.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkrequireassistancewithmobilityNo" runat="server"></div>
        <div style="position: absolute; left: 328.00px; top: 272.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkrequireassistancewithmobilityYes" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 272.03px" class="cls_009"><span class="cls_009">Provide details of the mobility/care concerns that apply to</span></div>
        <div style="position: absolute; left: 44.00px; top: 276.03px" class="cls_009"><span class="cls_009">Countries</span>&nbsp;<span style="border: 1px solid black;"><%= familyresidencecountry1   %></span></div>
        <div style="position: absolute; left: 368.00px; top: 284.03px" class="cls_009"><span class="cls_009">you and how they are addressed</span></div>
        <div style="position: absolute; left: 328.00px; top: 284.03px" class="cls_009">&nbsp;<span style="border: 1px solid black;"><%= descriptionofmobility   %></span></div>
        <div style="position: absolute; left: 103.72px; top: 294.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 125.78px; top: 294.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 160.34px; top: 294.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 203.72px; top: 294.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 225.78px; top: 294.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 260.34px; top: 294.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 44.00px; top: 304.03px" class="cls_009"><span class="cls_009">Date</span>&nbsp;<span style="border: 1px solid black;"><%= familyresidenceFromdate1.Day + "/" + familyresidenceFromdate1.Month + "/" + familyresidenceFromdate1.Year    %></span></div>
        <div style="position: absolute; left: 186.83px; top: 304.03px" class="cls_009"><span class="cls_009">to</span>&nbsp;<span style="border: 1px solid black;"><%= familyresidenceTodate1.Day + "/" + familyresidenceTodate1.Month + "/" + familyresidenceTodate1.Year    %></span></div>
        <div style="position: absolute; left: 44.00px; top: 336.03px" class="cls_009"><span class="cls_009">Name</span>&nbsp;<span style="border: 1px solid black;"><%= familymembername2   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 356.03px" class="cls_009"><span class="cls_009">Countries</span>&nbsp;<span style="border: 1px solid black;"><%= familyresidencecountry2   %></span></div>
        <div style="position: absolute; left: 103.72px; top: 374.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 125.78px; top: 374.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 160.34px; top: 374.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 203.72px; top: 374.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 225.78px; top: 374.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 260.34px; top: 374.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 44.00px; top: 384.03px" class="cls_009"><span class="cls_009">Date</span>&nbsp;<span style="border: 1px solid black;"><%= familyresidenceFromdate2.Day + "/" + familyresidenceFromdate2.Month + "/" + familyresidenceFromdate2.Year    %></span></div>
        <div style="position: absolute; left: 186.83px; top: 384.03px" class="cls_009"><span class="cls_009">to</span>&nbsp;<span style="border: 1px solid black;"><%= familyresidenceTodate2.Day + "/" + familyresidenceTodate2.Month + "/" + familyresidenceTodate2.Year    %></span></div>
        <div style="position: absolute; left: 308.72px; top: 406.53px" class="cls_020"><span class="cls_020">55</span></div>
        <div style="position: absolute; left: 328.00px; top: 408.03px" class="cls_009"><span class="cls_009">Do you intend performing medical procedures (eg. as a practising/trainee</span></div>
        <div style="position: absolute; left: 24.72px; top: 410.53px" class="cls_020"><span class="cls_020">51</span></div>
        <div style="position: absolute; left: 44.00px; top: 412.03px" class="cls_009"><span class="cls_009">Do you, or any member of your family unit included in this application,</span></div>
        <div style="position: absolute; left: 328.00px; top: 420.03px" class="cls_009"><span class="cls_009">doctor, dentist, nurse) during your stay in Australia?</span></div>
        <div style="position: absolute; left: 44.00px; top: 424.03px" class="cls_009"><span class="cls_009">intend entering an Australian hospital (including nursing homes) for work,</span></div>
        <div style="position: absolute; left: 44.00px; top: 436.03px" class="cls_009"><span class="cls_009">training, treatment or visiting?</span></div>
        <div style="position: absolute; left: 328.00px; top: 440.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhaevmedicalproceduresNo" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 456.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhaveworkforaustralianhospitalNo" runat="server"></div>
        <div style="position: absolute; left: 328.00px; top: 456.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhaevmedicalproceduresYes" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 456.03px" class="cls_009"><span class="cls_009">Provide details of the medical/dental/nursing procedures</span></div>
        <div style="position: absolute; left: 368.00px; top: 468.03px" class="cls_009"><span class="cls_009">you may be involved with in Australia</span></div>
        <div style="position: absolute; left: 328.00px; top: 488.03px" class="cls_009">&nbsp;<span style="border: 1px solid black;"><%= proceduresdescription   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 472.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhaveworkforaustralianhospitalYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 472.03px" class="cls_009"><span class="cls_009">Give full details</span></div>
        <div style="position: absolute; left: 44.00px; top: 485.03px" class="cls_009">&nbsp;<span style="border: 1px solid black;"><%= descriptionofhospitalwork   %></span></div>
        <div style="position: absolute; left: 24.72px; top: 598.53px" class="cls_020"><span class="cls_020">52</span></div>
        <div style="position: absolute; left: 44.00px; top: 600.03px" class="cls_009"><span class="cls_009">Do you, or any member of your family unit included in this application,</span></div>
        <div style="position: absolute; left: 44.00px; top: 612.03px" class="cls_009"><span class="cls_009">intend to work in an Australian preschool-aged child care centre (including</span></div>
        <div style="position: absolute; left: 44.00px; top: 624.03px" class="cls_009"><span class="cls_009">preschools and creches) as an employee or trainee?</span></div>
        <div style="position: absolute; left: 44.00px; top: 644.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhaveworkforaustralianpreschoolNo" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 660.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhaveworkforaustralianpreschoolYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 660.03px" class="cls_009"><span class="cls_009">Give full details</span></div>
        <div style="position: absolute; left: 44.00px; top: 680.03px" class="cls_009">&nbsp;<span style="border: 1px solid black;"><%= descriptionofpreschoolwork   %></span></div>
        <div style="position: absolute; left: 16.00px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 16</span></div>
        <div style="position: absolute; left: 245.94px; top: 820.73px" class="cls_010"><span class="cls_010">© COMMONWEALTH OF AUSTRALIA, 2006</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 13632px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background17.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 328.00px; top: 14.73px" class="cls_019"><span class="cls_019">Character declaration</span></div>
        <div style="position: absolute; left: 24.72px; top: 22.53px" class="cls_020"><span class="cls_020">56</span></div>
        <div style="position: absolute; left: 44.00px; top: 24.03px" class="cls_009"><span class="cls_009">During your proposed visit to Australia, do you, or any children included</span></div>
        <div style="position: absolute; left: 44.00px; top: 36.03px" class="cls_009"><span class="cls_009">in this application, expect to incur medical costs, or require treatment or</span></div>
        <div style="position: absolute; left: 308.72px; top: 42.53px" class="cls_020"><span class="cls_020">57</span></div>
        <div style="position: absolute; left: 328.00px; top: 44.03px" class="cls_009"><span class="cls_009">Have you, or any member of your family unit</span></div>
        <div style="position: absolute; left: 44.00px; top: 48.03px" class="cls_009"><span class="cls_009">medical follow up for:</span></div>
        <div style="position: absolute; left: 328.00px; top: 56.03px" class="cls_009"><span class="cls_009">included in this application, ever:</span></div>
        <div style="position: absolute; left: 44.00px; top: 60.03px" class="cls_009"><span class="cls_009">• blood disorder</span></div>
        <div style="position: absolute; left: 176.00px; top: 60.04px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 186.00px; top: 60.04px" class="cls_009"><span class="cls_009">mental illness</span></div>
        <div style="position: absolute; left: 44.00px; top: 72.03px" class="cls_009"><span class="cls_009">• cancer</span></div>
        <div style="position: absolute; left: 176.00px; top: 72.04px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 186.00px; top: 72.04px" class="cls_009"><span class="cls_009">pregnancy</span></div>
        <div style="position: absolute; left: 328.00px; top: 72.03px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 338.00px; top: 72.03px" class="cls_009"><span class="cls_009">been convicted of a crime or offence in any</span></div>
        <div style="position: absolute; left: 44.00px; top: 84.03px" class="cls_009"><span class="cls_009">• heart disease</span></div>
        <div style="position: absolute; left: 176.00px; top: 84.04px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 186.00px; top: 84.04px" class="cls_009"><span class="cls_009">respiratory disease that has</span></div>
        <div style="position: absolute; left: 338.00px; top: 84.03px" class="cls_009"><span class="cls_009">country (including any conviction which is</span></div>
        <div style="position: absolute; left: 500.00px; top: 92.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhaveconvictedofcrimeNo" runat="server"></div>
        <div style="position: absolute; left: 540.00px; top: 92.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhaveconvictedofcrimeYes" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 96.04px" class="cls_009"><span class="cls_009">• hepatitis</span></div>
        <div style="position: absolute; left: 186.00px; top: 96.04px" class="cls_009"><span class="cls_009">required hospital admission</span></div>
        <div style="position: absolute; left: 338.00px; top: 96.03px" class="cls_009"><span class="cls_009">now removed from official records)?</span></div>
        <div style="position: absolute; left: 44.00px; top: 108.04px" class="cls_009"><span class="cls_009">• HIV infection, including AIDS</span></div>
        <div style="position: absolute; left: 176.00px; top: 108.04px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 186.00px; top: 108.04px" class="cls_009"><span class="cls_009">any form of surgery</span></div>
        <div style="position: absolute; left: 328.00px; top: 112.03px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 338.00px; top: 112.03px" class="cls_009"><span class="cls_009">been charged with any offence that is</span></div>
        <div style="position: absolute; left: 44.00px; top: 120.04px" class="cls_009"><span class="cls_009">• kidney disease, including dialysis</span></div>
        <div style="position: absolute; left: 176.00px; top: 120.04px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 186.00px; top: 120.04px" class="cls_009"><span class="cls_009">any other health concerns?</span></div>
        <div style="position: absolute; left: 500.00px; top: 120.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhavechargeoffenceNo" runat="server"></div>
        <div style="position: absolute; left: 540.00px; top: 120.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhavechargeoffenceYes" runat="server"></div>
        <div style="position: absolute; left: 338.00px; top: 124.03px" class="cls_009"><span class="cls_009">currently awaiting legal action?</span></div>
        <div style="position: absolute; left: 44.00px; top: 132.04px" class="cls_009"><span class="cls_009">• liver disease</span></div>
        <div style="position: absolute; left: 328.00px; top: 140.03px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 338.00px; top: 140.03px" class="cls_009"><span class="cls_009">been acquitted of any criminal offence or</span></div>
        <div style="position: absolute; left: 44.00px; top: 152.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhavemedicalfollowupNo" runat="server"></div>
        <div style="position: absolute; left: 338.00px; top: 152.03px" class="cls_009"><span class="cls_009">other offence on the grounds of mental</span></div>
        <div style="position: absolute; left: 500.00px; top: 160.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhavecriminaloffenceNo" runat="server"></div>
        <div style="position: absolute; left: 540.00px; top: 160.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhavecriminaloffenceYes" runat="server"></div>
        <div style="position: absolute; left: 338.00px; top: 164.03px" class="cls_009"><span class="cls_009">illness, insanity or unsoundness of mind?</span></div>
        <div style="position: absolute; left: 44.00px; top: 168.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhavemedicalfollowupYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 168.03px" class="cls_009"><span class="cls_009">Give details</span></div>
        <div style="position: absolute; left: 44.00px; top: 188.03px" class="cls_009">&nbsp;<span style="border: 1px solid black;"><%= medicalfollowupdescription   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 180.03px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 338.00px; top: 180.03px" class="cls_009"><span class="cls_009">been removed or deported from any</span></div>
        <div style="position: absolute; left: 500.00px; top: 188.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhaveremovedfromcountryNo" runat="server"></div>
        <div style="position: absolute; left: 540.00px; top: 188.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhaveremovedfromcountryYes" runat="server"></div>
        <div style="position: absolute; left: 338.00px; top: 192.03px" class="cls_009"><span class="cls_009">country (including Australia)?</span></div>
        <div style="position: absolute; left: 328.00px; top: 208.03px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 338.00px; top: 208.03px" class="cls_009"><span class="cls_009">left any country to avoid being removed or</span></div>
        <div style="position: absolute; left: 500.00px; top: 216.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhavetoavoidbeingremovedNo" runat="server"></div>
        <div style="position: absolute; left: 540.00px; top: 216.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhavetoavoidbeingremovedYes" runat="server"></div>
        <div style="position: absolute; left: 338.00px; top: 220.03px" class="cls_009"><span class="cls_009">deported?</span></div>
        <div style="position: absolute; left: 328.00px; top: 236.03px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 338.00px; top: 236.03px" class="cls_009"><span class="cls_009">been excluded from or asked to leave any</span></div>
        <div style="position: absolute; left: 500.00px; top: 244.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhavebeenexcludedNo" runat="server"></div>
        <div style="position: absolute; left: 540.00px; top: 244.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhavebeenexcludedYes" runat="server"></div>
        <div style="position: absolute; left: 338.00px; top: 248.03px" class="cls_009"><span class="cls_009">country (including Australia)?</span></div>
        <div style="position: absolute; left: 328.00px; top: 264.03px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 338.00px; top: 264.03px" class="cls_009"><span class="cls_009">committed, or been involved in the</span></div>
        <div style="position: absolute; left: 338.00px; top: 276.03px" class="cls_009"><span class="cls_009">commission of war crimes or crimes</span></div>
        <div style="position: absolute; left: 500.00px; top: 284.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhavehumanrightscrimeNo" runat="server"></div>
        <div style="position: absolute; left: 540.00px; top: 284.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhavehumanrightscrimeYes" runat="server"></div>
        <div style="position: absolute; left: 338.00px; top: 288.03px" class="cls_009"><span class="cls_009">against humanity or human rights?</span></div>
        <div style="position: absolute; left: 328.00px; top: 304.03px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 338.00px; top: 304.03px" class="cls_009"><span class="cls_009">been involved in any activities that would</span></div>
        <div style="position: absolute; left: 338.00px; top: 316.03px" class="cls_009"><span class="cls_009">represent a risk to Australian national</span></div>
        <div style="position: absolute; left: 500.00px; top: 324.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhaverisktonationalsecurityNo" runat="server"></div>
        <div style="position: absolute; left: 540.00px; top: 324.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhaverisktonationalsecurityYes" runat="server"></div>
        <div style="position: absolute; left: 338.00px; top: 328.03px" class="cls_009"><span class="cls_009">security?</span></div>
        <div style="position: absolute; left: 328.00px; top: 344.03px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 338.00px; top: 344.03px" class="cls_009"><span class="cls_009">had any outstanding debts to the Australian</span></div>
        <div style="position: absolute; left: 338.00px; top: 356.03px" class="cls_009"><span class="cls_009">Government or any public authority in</span></div>
        <div style="position: absolute; left: 500.00px; top: 364.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhaveoutstandingdebetsNo" runat="server"></div>
        <div style="position: absolute; left: 540.00px; top: 364.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhaveoutstandingdebetsYes" runat="server"></div>
        <div style="position: absolute; left: 338.00px; top: 368.04px" class="cls_009"><span class="cls_009">Australia?</span></div>
        <div style="position: absolute; left: 328.00px; top: 384.03px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 338.00px; top: 384.03px" class="cls_009"><span class="cls_009">been involved in any activity, or been</span></div>
        <div style="position: absolute; left: 44.00px; top: 388.03px" class="cls_009"><span class="cls_009">You are strongly advised to carry certification of your vaccination status,</span></div>
        <div style="position: absolute; left: 338.00px; top: 396.03px" class="cls_009"><span class="cls_009">convicted of any offence, relating to the</span></div>
        <div style="position: absolute; left: 44.00px; top: 400.03px" class="cls_009"><span class="cls_009">especially for children attending Australian child care centres (including</span></div>
        <div style="position: absolute; left: 338.00px; top: 408.04px" class="cls_009"><span class="cls_009">illegal movement of people to any country</span></div>
        <div style="position: absolute; left: 44.00px; top: 412.03px" class="cls_009"><span class="cls_009">preschools and creches) and schools. Vaccination against polio, tetanus,</span></div>
        <div style="position: absolute; left: 500.00px; top: 416.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhaveconvictedoffenceNo" runat="server"></div>
        <div style="position: absolute; left: 540.00px; top: 416.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhaveconvictedoffenceYes" runat="server"></div>
        <div style="position: absolute; left: 338.00px; top: 420.04px" class="cls_009"><span class="cls_009">(including Australia)?</span></div>
        <div style="position: absolute; left: 44.00px; top: 424.03px" class="cls_009"><span class="cls_009">measles, mumps, rubella, diphtheria, pertussis (whooping cough),</span></div>
        <div style="position: absolute; left: 44.00px; top: 436.03px" class="cls_009"><span class="cls_009">Haemophilus influenzae hypo B (Hib), and Hepatitis B is recommended</span></div>
        <div style="position: absolute; left: 328.00px; top: 436.04px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 338.00px; top: 436.04px" class="cls_009"><span class="cls_009">served in a military force or state</span></div>
        <div style="position: absolute; left: 44.00px; top: 448.04px" class="cls_009"><span class="cls_009">for children, with certification sought at time of child care centre (including</span></div>
        <div style="position: absolute; left: 338.00px; top: 448.04px" class="cls_009"><span class="cls_009">sponsored/private militia, undergone any</span></div>
        <div style="position: absolute; left: 44.00px; top: 460.04px" class="cls_009"><span class="cls_009">preschool and creche) and school enrolment. Vaccination against rubella</span></div>
        <div style="position: absolute; left: 338.00px; top: 460.04px" class="cls_009"><span class="cls_009">military/paramilitary training, or been</span></div>
        <div style="position: absolute; left: 44.00px; top: 472.04px" class="cls_009"><span class="cls_009">is also recommended for women of child bearing age.</span></div>
        <div style="position: absolute; left: 338.00px; top: 472.04px" class="cls_009"><span class="cls_009">trained in weapons/explosives use</span></div>
        <div style="position: absolute; left: 500.00px; top: 480.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhaveservedinmilitaryforceNo" runat="server"></div>
        <div style="position: absolute; left: 540.00px; top: 480.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhaveservedinmilitaryforceYes" runat="server"></div>
        <div style="position: absolute; left: 338.00px; top: 484.04px" class="cls_009"><span class="cls_009">(however described)?</span></div>
        <div style="position: absolute; left: 328.00px; top: 508.03px" class="cls_009"><span class="cls_009">If you answered </span><span class="cls_014">‘Yes’</span><span class="cls_009"> to any of the above questions, you must state</span></div>
        <div style="position: absolute; left: 328.00px; top: 520.03px" class="cls_009"><span class="cls_009">who it applies to and give ALL relevant details. If the matter relates to</span></div>
        <div style="position: absolute; left: 328.00px; top: 532.03px" class="cls_009"><span class="cls_009">a criminal conviction, please give the nature of the offence, full details</span></div>
        <div style="position: absolute; left: 328.00px; top: 544.03px" class="cls_009"><span class="cls_009">of sentence and dates of any period of imprisonment or other detention.</span></div>
        <div style="position: absolute; left: 328.00px; top: 560.03px" class="cls_009"><span class="cls_009">If insufficient space, attach an additional statement.</span></div>
        <div style="position: absolute; left: 328.00px; top: 580.03px" class="cls_009"><span style="border: 1px solid black;"><%= descripofcharacterdeclaration   %></span></div>
        <div style="position: absolute; left: 245.98px; top: 820.73px" class="cls_010"><span class="cls_010">© COMMONWEALTH OF AUSTRALIA, 2006</span></div>
        <div style="position: absolute; left: 496.25px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 17</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 14484px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background18.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 44.00px; top: 14.73px" class="cls_019"><span class="cls_019">Accommodation/welfare arrangements</span></div>
        <div style="position: absolute; left: 328.00px; top: 24.03px" class="cls_009"><span class="cls_009">As the parent or a person who has legal custody of a student applicant</span></div>
        <div style="position: absolute; left: 308.72px; top: 22.53px" class="cls_020"><span class="cls_020">60</span></div>
        <div style="position: absolute; left: 328.00px; top: 36.03px" class="cls_009"><span class="cls_009">under 18 years of age, do you hold or have you applied for a visa</span></div>
        <div style="position: absolute; left: 44.00px; top: 32.73px" class="cls_019"><span class="cls_019">for students under 18 years of age</span></div>
        <div style="position: absolute; left: 328.00px; top: 48.03px" class="cls_009"><span class="cls_009">(eg. Student Guardian visa - subclass 580) to accompany your child</span></div>
        <div style="position: absolute; left: 328.00px; top: 60.03px" class="cls_009"><span class="cls_009">during their stay in Australia?</span></div>
        <div style="position: absolute; left: 24.72px; top: 62.53px" class="cls_020"><span class="cls_020">58</span></div>
        <div style="position: absolute; left: 44.00px; top: 64.03px" class="cls_009"><span class="cls_009">Are you under 18 years of age?</span></div>
        <div style="position: absolute; left: 44.00px; top: 80.03px" class="cls_014"><span class="cls_014">Note</span><span class="cls_009">: Depending on your Assessment Level, you may need to meet a</span></div>
        <div style="position: absolute; left: 328.00px; top: 80.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkholdorappliedVisaNo" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 92.03px" class="cls_009"><span class="cls_009">minimum age or education standard requirement. Refer to information</span></div>
        <div style="position: absolute; left: 328.00px; top: 96.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkholdorappliedVisaYes" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 96.03px" class="cls_009"><span class="cls_009">Please give your details below, then go to Question 65</span></div>
        <div style="position: absolute; left: 44.00px; top: 104.03px" class="cls_009"><span class="cls_009">form 1219i Overseas Student Program - Assessment Levels and the</span></div>
        <div style="position: absolute; left: 44.00px; top: 116.03px" class="cls_009"><span class="cls_009">department’s website for more details.</span></div>
        <div style="position: absolute; left: 328.00px; top: 124.03px" class="cls_009"><span class="cls_009">Family name</span>&nbsp;<span style="border: 1px solid black;"><%= parentfamilynamePartD   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 136.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkunder18ageNo" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 136.04px" class="cls_009"><span class="cls_009">Go to Question 68</span></div>
        <div style="position: absolute; left: 328.00px; top: 144.03px" class="cls_009"><span class="cls_009">Given names</span>&nbsp;<span style="border: 1px solid black;"><%= parentgivennamePartD   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 152.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkunder18ageYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 152.03px" class="cls_009"><span class="cls_009">Questions 59 (and either question 60, 61, 63 or 64) and the</span></div>
        <div style="position: absolute; left: 84.00px; top: 164.03px" class="cls_009"><span class="cls_009">declaration at 65 must be completed on your behalf by your</span></div>
        <div style="position: absolute; left: 84.00px; top: 176.03px" class="cls_009"><span class="cls_009">parents or a person(s) who has legal custody of you, as you</span></div>
        <div style="position: absolute; left: 387.72px; top: 178.38px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 409.78px; top: 178.38px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 444.34px; top: 178.38px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 84.00px; top: 188.03px" class="cls_009"><span class="cls_009">are under 18 years of age. If your parents or a person(s) who</span></div>
        <div style="position: absolute; left: 328.00px; top: 188.03px" class="cls_009"><span class="cls_009">Date of birth</span>&nbsp;<span style="border: 1px solid black;"><%= parentDateofBirthpartD.Day + "/" +parentDateofBirthpartD.Month + "/" + parentDateofBirthpartD.Year    %></span></div>
        <div style="position: absolute; left: 84.00px; top: 200.04px" class="cls_009"><span class="cls_009">has legal custody of you have not made adequate</span></div>
        <div style="position: absolute; left: 328.00px; top: 208.03px" class="cls_009"><span class="cls_009">Your intended address in Australia</span><span style="border: 1px solid black;"><%= parentaddresspartD   %></span></div>
        <div style="position: absolute; left: 84.00px; top: 212.04px" class="cls_009"><span class="cls_009">arrangements for your accommodation, support and general</span></div>
        <div style="position: absolute; left: 84.00px; top: 224.04px" class="cls_009"><span class="cls_009">welfare while in Australia, a student visa cannot be granted.</span></div>
        <div style="position: absolute; left: 84.00px; top: 236.04px" class="cls_009"><span class="cls_009">Evidence of their relationship to you must be provided.</span></div>
        <div style="position: absolute; left: 476.00px; top: 259.53px" class="cls_010"><span class="cls_010">POSTCODE</span></div>
        <div style="position: absolute; left: 24.72px; top: 258.39px" class="cls_020"><span class="cls_020">59</span></div>
        <div style="position: absolute; left: 44.00px; top: 260.04px" class="cls_009"><span class="cls_009">This question, and other questions as indicated, </span><span class="cls_014">must be completed</span></div>
        <div style="position: absolute; left: 44.00px; top: 272.04px" class="cls_014"><span class="cls_014">by the parents, or person(s) who has legal custody of the</span></div>
        <div style="position: absolute; left: 328.00px; top: 272.03px" class="cls_009"><span class="cls_009">Application:</span></div>
        <div style="position: absolute; left: 44.00px; top: 284.04px" class="cls_014"><span class="cls_014">applicant under 18 years of age</span><span class="cls_009">.</span></div>
        <div style="position: absolute; left: 328.00px; top: 288.03px" class="cls_009"><span class="cls_009">Granted</span><input type="checkbox" id="chkparentvisastatusPartDYes" runat="server"></div>
        <div style="position: absolute; left: 396.00px; top: 288.03px" class="cls_009"><span class="cls_009">Visa label number</span></div>
        <div style="position: absolute; left: 44.00px; top: 300.04px" class="cls_009"><span class="cls_009">Which statement best explains your situation?</span></div>
        <div style="position: absolute; left: 397.39px; top: 304.50px" class="cls_022"><span class="cls_022">V</span></div>
        <div style="position: absolute; left: 446.89px; top: 304.50px" class="cls_022"><span class="cls_022">&lt;</span>&nbsp;<span style="border: 1px solid black;"><%= parentvisalabelno   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 320.04px" class="cls_009"><span class="cls_009">I am a parent or person who has legal</span></div>
        <div style="position: absolute; left: 396.00px; top: 320.03px" class="cls_009"><span class="cls_009">If granted a visa without a label, provide the 13-digit</span></div>
        <div style="position: absolute; left: 44.00px; top: 332.04px" class="cls_009"><span class="cls_009">custody of the student applicant and I am</span></div>
        <div style="position: absolute; left: 396.00px; top: 332.03px" class="cls_009"><span class="cls_009">visa grant number (as shown on the letter notifying</span></div>
        <div style="position: absolute; left: 396.00px; top: 342.03px" class="cls_009"><span style="border: 1px solid black;"><%= parentvisadigitno   %></span></div>
        <div style="position: absolute; left: 224.00px; top: 340.04px" class="cls_009"><span class="cls_009"><input type="checkbox" id="chkparentsituationNo" runat="server">Go to Question 60</span></div>
        <div style="position: absolute; left: 44.00px; top: 344.04px" class="cls_009"><span class="cls_009">going to accompany the child to Australia.</span></div>
        <div style="position: absolute; left: 396.00px; top: 344.03px" class="cls_009"><span class="cls_009">you of visa grant).</span></div>
        <div style="position: absolute; left: 44.00px; top: 368.03px" class="cls_009"><span class="cls_009">I am a parent or person who has legal</span></div>
        <div style="position: absolute; left: 396.00px; top: 376.03px" class="cls_009"><span class="cls_009">Period of stay</span>&nbsp;<span style="border: 1px solid black;"><%= parentvisaperiodofstay   %></span></div>
        <div style="position: absolute; left: 486.46px; top: 376.03px" class="cls_009"><span class="cls_009">Expiry date </span><span class="cls_010">(DAY/MONTH/YEAR)</span></div>
        <div style="position: absolute; left: 44.00px; top: 380.03px" class="cls_009"><span class="cls_009">custody of the student applicant and have</span></div>
        <div style="position: absolute; left: 44.00px; top: 392.03px" class="cls_009"><span class="cls_009">made arrangements for the child to stay</span></div>
        <div style="position: absolute; left: 449.54px; top: 395.53px" class="cls_010"><span class="cls_010">MONTHS</span>&nbsp;<span style="border: 1px solid black;"><%= parentvisaexpirydate.Day + "/" +parentvisaexpirydate.Month + "/" + parentvisaexpirydate.Year    %></span></div>
        <div style="position: absolute; left: 44.00px; top: 404.03px" class="cls_009"><span class="cls_009">in Australia with a relative* who is 21 years</span></div>
        <div style="position: absolute; left: 224.00px; top: 404.03px" class="cls_009"><span class="cls_009"><input type="checkbox" id="chkparentsituationYes" runat="server">Go to Question 61</span></div>
        <div style="position: absolute; left: 328.00px; top: 412.03px" class="cls_009"><span class="cls_009">Not yet</span></div>
        <div style="position: absolute; left: 396.00px; top: 412.03px" class="cls_009"><span class="cls_009">Australian Government office where application</span></div>
        <div style="position: absolute; left: 396.00px; top: 445.03px" class="cls_009"><span style="border: 1px solid black;"><%= parentvisaappliedgovtofficename   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 416.04px" class="cls_009"><span class="cls_009">of age or older.</span></div>
        <div style="position: absolute; left: 328.00px; top: 424.03px" class="cls_009"><span class="cls_009">decided</span><input type="checkbox" id="chkparentvisastatusPartDNo" runat="server"></div>
        <div style="position: absolute; left: 396.00px; top: 424.03px" class="cls_009"><span class="cls_009">lodged</span></div>
        <div style="position: absolute; left: 44.00px; top: 436.03px" class="cls_009"><span class="cls_009">* A relative is defined under the Migration Regulations as a spouse,</span></div>
        <div style="position: absolute; left: 44.00px; top: 448.03px" class="cls_009"><span class="cls_009">child, adopted child, parent, brother, sister, step-child, step-parent,</span></div>
        <div style="position: absolute; left: 44.00px; top: 460.03px" class="cls_009"><span class="cls_009">step-brother, step-sister, grandparent, grandchild, aunt, uncle, niece</span></div>
        <div style="position: absolute; left: 344.00px; top: 460.03px" class="cls_009"><span class="cls_009">Now go to Question 65</span></div>
        <div style="position: absolute; left: 44.00px; top: 472.03px" class="cls_009"><span class="cls_009">or nephew, or a step-grandparent, step-grandchild, step-aunt,</span></div>
        <div style="position: absolute; left: 44.00px; top: 484.03px" class="cls_009"><span class="cls_009">step-uncle, step-niece or step-nephew.</span></div>
        <div style="position: absolute; left: 328.00px; top: 488.03px" class="cls_009"><span class="cls_009">As the parents or a person(s) who has legal custody of a student applicant</span></div>
        <div style="position: absolute; left: 308.72px; top: 486.53px" class="cls_020"><span class="cls_020">61</span></div>
        <div style="position: absolute; left: 328.00px; top: 500.03px" class="cls_009"><span class="cls_009">under 18 years of age, have you made arrangements with a relative who</span></div>
        <div style="position: absolute; left: 44.00px; top: 508.03px" class="cls_009"><span class="cls_009">The student applicant will not be</span></div>
        <div style="position: absolute; left: 328.00px; top: 512.03px" class="cls_009"><span class="cls_009">is at least 21 years of age and of good character with whom your child</span></div>
        <div style="position: absolute; left: 44.00px; top: 520.03px" class="cls_009"><span class="cls_009">accompanied by either a parent or a</span></div>
        <div style="position: absolute; left: 328.00px; top: 524.03px" class="cls_009"><span class="cls_009">will stay in Australia?</span></div>
        <div style="position: absolute; left: 44.00px; top: 532.04px" class="cls_009"><span class="cls_009">person who has legal custody, and will</span></div>
        <div style="position: absolute; left: 44.00px; top: 544.04px" class="cls_009"><span class="cls_009">not stay in Australia with a relative who</span></div>
        <div style="position: absolute; left: 224.00px; top: 544.04px" class="cls_009"><span class="cls_009"><input type="checkbox" id="chparentsituationNot" runat="server">Go to Question 64</span></div>
        <div style="position: absolute; left: 328.00px; top: 544.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhavearrangementwithrelativeNo" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 556.04px" class="cls_009"><span class="cls_009">is 21 years of age or older.</span></div>
        <div style="position: absolute; left: 328.00px; top: 560.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhavearrangementwithrelativeYes" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 560.03px" class="cls_009"><span class="cls_009">Please give details of the relative</span></div>
        <div style="position: absolute; left: 328.00px; top: 580.03px" class="cls_009"><span class="cls_009">Family name</span>&nbsp;<span style="border: 1px solid black;"><%= familyNameofrelative   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 600.03px" class="cls_009"><span class="cls_009">Given names</span>&nbsp;<span style="border: 1px solid black;"><%= givenNameofrelative   %></span></div>
        <div style="position: absolute; left: 387.72px; top: 634.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 409.78px; top: 634.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 444.34px; top: 634.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 328.00px; top: 644.03px" class="cls_009"><span class="cls_009">Date of birth</span>&nbsp;<span style="border: 1px solid black;"><%= dateOfBirthofrelative.Day + "/" +dateOfBirthofrelative.Month + "/" + dateOfBirthofrelative.Year    %></span></div>
        <div style="position: absolute; left: 328.00px; top: 664.03px" class="cls_009"><span class="cls_009">Address of relative in Australia</span><span style="border: 1px solid black;"><%= addressofRelative   %></span></div>
        <div style="position: absolute; left: 476.00px; top: 715.53px" class="cls_010"><span class="cls_010">POSTCODE</span></div>
        <div style="position: absolute; left: 328.00px; top: 732.03px" class="cls_009"><span class="cls_009">Relationship of relative to the child</span><span style="border: 1px solid black;"><%= relationshipofrelative   %></span></div>
        <div style="position: absolute; left: 16.00px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 18</span></div>
        <div style="position: absolute; left: 245.94px; top: 820.73px" class="cls_010"><span class="cls_010">© COMMONWEALTH OF AUSTRALIA, 2006</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 15336px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background19.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 24.72px; top: 22.53px" class="cls_020"><span class="cls_020">62</span></div>
        <div style="position: absolute; left: 44.00px; top: 24.03px" class="cls_009"><span class="cls_009">Will your relative reside in Australia as:</span></div>
        <div style="position: absolute; left: 328.00px; top: 24.03px" class="cls_009"><span class="cls_009">I am satisfied with the reception, care and support arrangements</span></div>
        <div style="position: absolute; left: 308.72px; top: 22.53px" class="cls_020"><span class="cls_020">65</span></div>
        <div style="position: absolute; left: 328.00px; top: 36.03px" class="cls_009"><span class="cls_009">that have been made in Australia for my dependent child under</span></div>
        <div style="position: absolute; left: 44.00px; top: 44.03px" class="cls_009"><span class="cls_009">an Australian citizen</span></div>
        <div style="position: absolute; left: 328.00px; top: 48.03px" class="cls_009"><span class="cls_009">18 years of age.</span></div>
        <div style="position: absolute; left: 44.00px; top: 56.03px" class="cls_009"><span class="cls_009">or permanent resident</span><input type="checkbox" id="chkrelativeresideasstatusPerm" runat="server"></div>
        <div style="position: absolute; left: 328.00px; top: 64.03px" class="cls_014"><span class="cls_014">Note: Both parents must sign this declaration.</span></div>
        <div style="position: absolute; left: 44.00px; top: 72.03px" class="cls_009"><span class="cls_009">a Temporary resident</span><input type="checkbox" id="chkrelativeresideasstatusTemp" runat="server"></div>
        <div style="position: absolute; left: 144.00px; top: 72.03px" class="cls_009"><span class="cls_009">How long are they permitted to stay in</span></div>
        <div style="position: absolute; left: 144.00px; top: 84.03px" class="cls_009"><span class="cls_009">Australia?</span></div>
                <div style="position: absolute; left: 144.00px; top: 98.03px" class="cls_009"><span style="border: 1px solid black;"><%= permitedtostayfor   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 84.03px" class="cls_014"><span class="cls_014">Signature of</span>&nbsp;<span style="border: 1px solid black;"><%= permitedtostayfor   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 96.03px" class="cls_014"><span class="cls_014">parent/person</span></div>
        <div style="position: absolute; left: 328.00px; top: 108.03px" class="cls_014"><span class="cls_014">who has legal</span></div>
        <div style="position: absolute; left: 203.72px; top: 118.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 225.78px; top: 118.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 260.34px; top: 118.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 328.00px; top: 120.03px" class="cls_014"><span class="cls_014">custody</span></div>
        <div style="position: absolute; left: 144.00px; top: 128.03px" class="cls_009"><span class="cls_009">OR until</span>&nbsp;<span style="border: 1px solid black;"><%= permitedtostayDate.Day + "/" +permitedtostayDate.Month + "/" + permitedtostayDate.Year    %></span></div>
        <div style="position: absolute; left: 395.72px; top: 130.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 417.78px; top: 130.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 452.34px; top: 130.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 367.13px; top: 141.54px" class="cls_009"><span class="cls_009">Date</span>&nbsp;<span style="border: 1px solid black;"><%= parentsignatureDate.Day + "/" +parentsignatureDate.Month + "/" + parentsignatureDate.Year    %></span></div>
        <div style="position: absolute; left: 44.00px; top: 148.03px" class="cls_009"><span class="cls_009">You </span><span class="cls_014">must</span><span class="cls_009"> attach evidence:</span></div>
        <div style="position: absolute; left: 328.00px; top: 160.03px" class="cls_009"><span class="cls_009">Full name (print in English)</span>&nbsp;<span style="border: 1px solid black;"><%= parentFullname   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 164.03px" class="cls_009"><span class="cls_009">• that your relative is of good character eg. police clearance; and</span></div>
        <div style="position: absolute; left: 44.00px; top: 180.03px" class="cls_009"><span class="cls_009">• of your relative’s residence status in Australia.</span></div>
        <div style="position: absolute; left: 328.00px; top: 192.03px" class="cls_009"><span class="cls_009">Relationship to student applicant</span>&nbsp;<span style="border: 1px solid black;"><%= parentRelationshipwithstudent   %></span></div>
        <div style="position: absolute; left: 24.72px; top: 206.53px" class="cls_020"><span class="cls_020">63</span></div>
        <div style="position: absolute; left: 44.00px; top: 208.03px" class="cls_009"><span class="cls_009">Give details of your relative’s Student Guardian visa application?</span></div>
        <div style="position: absolute; left: 44.00px; top: 228.03px" class="cls_009"><span class="cls_009">Granted</span><input type="checkbox" id="chkguardianvisasatusGranted" runat="server"></div>
        <div style="position: absolute; left: 112.00px; top: 228.03px" class="cls_009"><span class="cls_009">Visa label number</span></div>
        <div style="position: absolute; left: 328.00px; top: 232.03px" class="cls_014"><span class="cls_014">Signature of</span></div>
        <div style="position: absolute; left: 113.39px; top: 244.50px" class="cls_022"><span class="cls_022">V</span></div>
        <div style="position: absolute; left: 162.89px; top: 244.50px" class="cls_022"><span class="cls_022">&lt;</span><span style="border: 1px solid black;"><%= guardianvisano   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 244.03px" class="cls_014"><span class="cls_014">parent/person</span>&nbsp;<span style="border: 1px solid black;"><%= parentsignature1   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 256.03px" class="cls_014"><span class="cls_014">who has legal</span></div>
        <div style="position: absolute; left: 112.00px; top: 260.03px" class="cls_009"><span class="cls_009">Period of stay</span><span style="border: 1px solid black;"><%= guardianvisaperiodofstay   %></span></div>
        <div style="position: absolute; left: 202.46px; top: 260.03px" class="cls_009"><span class="cls_009">Expiry date </span><span class="cls_010">(DAY/MONTH/YEAR)</span></div>
        <div style="position: absolute; left: 328.00px; top: 268.03px" class="cls_014"><span class="cls_014">custody</span></div>
        <div style="position: absolute; left: 164.00px; top: 279.53px" class="cls_010"><span class="cls_010">MONTHS</span>&nbsp;<span style="border: 1px solid black;"><%= guardianvisaperiodofstayDate.Day + "/" +guardianvisaperiodofstayDate.Month + "/" + guardianvisaperiodofstayDate.Year    %></span></div>
        <div style="position: absolute; left: 395.72px; top: 278.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 417.78px; top: 278.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 452.34px; top: 278.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 367.13px; top: 289.53px" class="cls_009"><span class="cls_009">Date</span>&nbsp;<span style="border: 1px solid black;"><%= parentsignatureDate1.Day + "/" +parentsignatureDate1.Month + "/" + parentsignatureDate1.Year    %></span></div>
        <div style="position: absolute; left: 44.00px; top: 296.03px" class="cls_009"><span class="cls_009">Not yet</span></div>
        <div style="position: absolute; left: 112.00px; top: 296.03px" class="cls_009"><span class="cls_009">Australian Government office where application</span></div>
        <div style="position: absolute; left: 44.00px; top: 308.03px" class="cls_009"><span class="cls_009">decided</span><input type="checkbox" id="chkguardianvisasatusNot" runat="server"></div>
        <div style="position: absolute; left: 112.00px; top: 308.03px" class="cls_009"><span class="cls_009">lodged</span></div>
        <div style="position: absolute; left: 112.00px; top: 325.03px" class="cls_009"><span style="border: 1px solid black;"><%= govermentoffName   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 308.03px" class="cls_009"><span class="cls_009">Full name (print in English)</span>&nbsp;<span style="border: 1px solid black;"><%= parentFullname1   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 340.03px" class="cls_009"><span class="cls_009">Relationship to student applicant</span>&nbsp;<span style="border: 1px solid black;"><%= parentRelationshipwithstudent1   %></span></div>
        <div style="position: absolute; left: 112.00px; top: 344.03px" class="cls_009"><span class="cls_009">Period of stay sought</span>&nbsp;<span style="border: 1px solid black;"><%= periodofstayofguardian   %></span></div>
        <div style="position: absolute; left: 260.00px; top: 347.53px" class="cls_010"><span class="cls_010">MONTHS</span></div>
        <div style="position: absolute; left: 60.00px; top: 368.03px" class="cls_009"><span class="cls_009">Now go to Question 65</span></div>
        <div style="position: absolute; left: 475.55px; top: 384.03px" class="cls_009"><span class="cls_009">Continued on the next page</span></div>
        <div style="position: absolute; left: 24.72px; top: 391.53px" class="cls_020"><span class="cls_020">64</span></div>
        <div style="position: absolute; left: 44.00px; top: 393.03px" class="cls_009"><span class="cls_009">As the parents or a person(s) who has legal custody of a student applicant</span></div>
        <div style="position: absolute; left: 44.00px; top: 405.03px" class="cls_009"><span class="cls_009">under 18 years of age, who is neither being accompanied by you nor</span></div>
        <div style="position: absolute; left: 44.00px; top: 417.03px" class="cls_009"><span class="cls_009">staying with a relative who is at least 21 years of age, have you obtained</span></div>
        <div style="position: absolute; left: 44.00px; top: 429.03px" class="cls_009"><span class="cls_009">a written statement from your child’s education provider(s) that</span></div>
        <div style="position: absolute; left: 44.00px; top: 441.03px" class="cls_009"><span class="cls_009">accommodation, support and general welfare arrangements for your child</span></div>
        <div style="position: absolute; left: 44.00px; top: 453.03px" class="cls_009"><span class="cls_009">are appropriate?</span></div>
        <div style="position: absolute; left: 44.00px; top: 469.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhavewelfarearrangementsNo" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 485.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhavewelfarearrangementsYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 485.03px" class="cls_009"><span class="cls_009">Please attach the original signed undertaking from the</span></div>
        <div style="position: absolute; left: 84.00px; top: 497.03px" class="cls_009"><span class="cls_009">education provider</span></div>
        <div style="position: absolute; left: 245.98px; top: 820.73px" class="cls_010"><span class="cls_010">© COMMONWEALTH OF AUSTRALIA, 2006</span></div>
        <div style="position: absolute; left: 496.26px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 19</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 16188px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background20.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 44.00px; top: 14.73px" class="cls_019"><span class="cls_019">Custody arrangements for students</span></div>
        <div style="position: absolute; left: 44.00px; top: 32.73px" class="cls_019"><span class="cls_019">under 18 years of age</span></div>
        <div style="position: absolute; left: 24.72px; top: 61.53px" class="cls_020"><span class="cls_020">66</span></div>
        <div style="position: absolute; left: 44.00px; top: 63.03px" class="cls_009"><span class="cls_009">Do you have the </span><span class="cls_014">sole legal right</span><span class="cls_009"> to determine where the applicant will</span></div>
        <div style="position: absolute; left: 308.72px; top: 62.53px" class="cls_020"><span class="cls_020">67</span></div>
        <div style="position: absolute; left: 328.00px; top: 64.03px" class="cls_014"><span class="cls_014">Declaration by the parent(s) or person(s) with legal custody</span></div>
        <div style="position: absolute; left: 44.00px; top: 75.03px" class="cls_009"><span class="cls_009">live or to remove the applicant from their country of usual residence?</span></div>
        <div style="position: absolute; left: 328.00px; top: 76.03px" class="cls_014"><span class="cls_014">of a student visa applicant under 18 years of age</span></div>
        <div style="position: absolute; left: 328.00px; top: 88.03px" class="cls_009"><span class="cls_009">I am not aware of any reason why the visa applicant should not travel to</span></div>
        <div style="position: absolute; left: 44.00px; top: 91.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhavesolelegalrightsNo" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 91.03px" class="cls_009"><span class="cls_009">Provide details of ALL other people who have custody,</span></div>
        <div style="position: absolute; left: 328.00px; top: 100.03px" class="cls_009"><span class="cls_009">Australia (the custody/access/guardianship rights of another person are</span></div>
        <div style="position: absolute; left: 84.00px; top: 103.03px" class="cls_009"><span class="cls_009">access or guardianship rights in relation to the applicant</span></div>
        <div style="position: absolute; left: 328.00px; top: 112.03px" class="cls_009"><span class="cls_009">not affected).</span></div>
        <div style="position: absolute; left: 84.00px; top: 119.03px" class="cls_009"><span class="cls_009">If there is more than one person, please attach details.</span></div>
        <div style="position: absolute; left: 328.00px; top: 128.03px" class="cls_014"><span class="cls_014">Signature of</span></div>
        <div style="position: absolute; left: 84.00px; top: 136.03px" class="cls_009"><span class="cls_009">Name</span>&nbsp;<span style="border: 1px solid black;"><%= personname   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 140.03px" class="cls_014"><span class="cls_014">parent/person</span>&nbsp;<span style="border: 1px solid black;"><%= parentsignatur67   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 152.03px" class="cls_014"><span class="cls_014">who has legal</span></div>
        <div style="position: absolute; left: 328.00px; top: 164.03px" class="cls_014"><span class="cls_014">custody</span></div>
        <div style="position: absolute; left: 84.00px; top: 168.03px" class="cls_009"><span class="cls_009">Residential address</span>&nbsp;<span style="border: 1px solid black;"><%= personaddress   %></span></div>
        <div style="position: absolute; left: 395.72px; top: 174.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 417.78px; top: 174.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 452.34px; top: 174.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 364.00px; top: 184.03px" class="cls_009"><span class="cls_009">Date</span>&nbsp;<span style="border: 1px solid black;"><%= signDate.Day + "/" +signDate.Month + "/" + signDate.Year    %></span></div>
        <div style="position: absolute; left: 328.00px; top: 204.03px" class="cls_009"><span class="cls_009">Full name (print in English)</span>&nbsp;<span style="border: 1px solid black;"><%= fullname67   %></span></div>
        <div style="position: absolute; left: 207.00px; top: 220.73px" class="cls_010"><span class="cls_010">POSTAL CODE</span></div>
        <div style="position: absolute; left: 84.00px; top: 232.03px" class="cls_009"><span class="cls_009">Telephone number</span></div>
        <div style="position: absolute; left: 328.00px; top: 236.03px" class="cls_009"><span class="cls_009">Relationship to student applicant</span>&nbsp;<span style="border: 1px solid black;"><%= relationship67   %></span></div>
        <div style="position: absolute; left: 90.68px; top: 245.73px" class="cls_010"><span class="cls_010">COUNTRY CODE</span></div>
        <div style="position: absolute; left: 139.28px; top: 245.73px" class="cls_010"><span class="cls_010">AREA CODE</span></div>
        <div style="position: absolute; left: 210.50px; top: 245.73px" class="cls_010"><span class="cls_010">NUMBER</span></div>
        <div style="position: absolute; left: 88.00px; top: 259.53px" class="cls_010"><span class="cls_010">(</span>&nbsp;<span style="border: 1px solid black;"><%= personcontactno   %></span></div>
        <div style="position: absolute; left: 126.77px; top: 259.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 132.00px; top: 259.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 170.77px; top: 259.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 84.00px; top: 272.03px" class="cls_009"><span class="cls_009">Relationship to student visa applicant</span>&nbsp;<span style="border: 1px solid black;"><%= personrelationship   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 280.03px" class="cls_014"><span class="cls_014">Signature of</span></div>
        <div style="position: absolute; left: 328.00px; top: 292.03px" class="cls_014"><span class="cls_014">parent/person</span>&nbsp;<span style="border: 1px solid black;"><%= parentsignatur671   %></span></div>
        <div style="position: absolute; left: 84.00px; top: 304.03px" class="cls_009"><span class="cls_009">Nature of legal right</span>&nbsp;<span style="border: 1px solid black;"><%= personnatureoflegalrights   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 304.03px" class="cls_014"><span class="cls_014">who has legal</span></div>
        <div style="position: absolute; left: 328.00px; top: 316.03px" class="cls_014"><span class="cls_014">custody</span></div>
        <div style="position: absolute; left: 395.72px; top: 326.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 417.78px; top: 326.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 452.34px; top: 326.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 364.00px; top: 336.03px" class="cls_009"><span class="cls_009">Date</span>&nbsp;<span style="border: 1px solid black;"><%= signDate1.Day + "/" +signDate1.Month + "/" + signDate1.Year    %></span></div>
        <div style="position: absolute; left: 84.00px; top: 340.03px" class="cls_009"><span class="cls_009">You must sign the declaration at Question 67.</span></div>
        <div style="position: absolute; left: 84.00px; top: 356.03px" class="cls_009"><span class="cls_009">All other people who have custody, access or guardianship</span></div>
        <div style="position: absolute; left: 328.00px; top: 356.03px" class="cls_009"><span class="cls_009">Full name (print in English)</span>&nbsp;<span style="border: 1px solid black;"><%= fullname671   %></span></div>
        <div style="position: absolute; left: 84.00px; top: 368.03px" class="cls_009"><span class="cls_009">rights in relation to the applicant must also sign the</span></div>
        <div style="position: absolute; left: 84.00px; top: 380.03px" class="cls_009"><span class="cls_009">declaration at Question 67.</span></div>
        <div style="position: absolute; left: 328.00px; top: 388.03px" class="cls_009"><span class="cls_009">Relationship to student applicant</span>&nbsp;<span style="border: 1px solid black;"><%= relationship671   %></span></div>
        <div style="position: absolute; left: 84.00px; top: 396.03px" class="cls_009"><span class="cls_009">If any of these people are unable to complete the declaration</span></div>
        <div style="position: absolute; left: 84.00px; top: 408.03px" class="cls_009"><span class="cls_009">at Question 67 for any reason, you must attach a statutory</span></div>
        <div style="position: absolute; left: 84.00px; top: 420.03px" class="cls_009"><span class="cls_009">declaration from them giving permission for the applicant to</span></div>
        <div style="position: absolute; left: 328.00px; top: 424.03px" class="cls_009"><span class="cls_009">If more than 2 people have custody, access or guardianship rights in</span></div>
        <div style="position: absolute; left: 84.00px; top: 432.03px" class="cls_009"><span class="cls_009">travel to Australia as a student.</span></div>
        <div style="position: absolute; left: 328.00px; top: 436.03px" class="cls_009"><span class="cls_009">relation to the applicant, please attach a statutory declaration from them</span></div>
        <div style="position: absolute; left: 328.00px; top: 448.03px" class="cls_009"><span class="cls_009">giving permission for the applicant to travel to Australia as a student.</span></div>
        <div style="position: absolute; left: 44.00px; top: 456.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhavesolelegalrightsYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 456.03px" class="cls_009"><span class="cls_009">Complete the declaration at Question 67</span></div>
        <div style="position: absolute; left: 16.00px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 20</span></div>
        <div style="position: absolute; left: 245.98px; top: 820.73px" class="cls_010"><span class="cls_010">©</span></div>
        <div style="position: absolute; left: 252.22px; top: 820.73px" class="cls_010"><span class="cls_010">COMMONWEALTH OF AUSTRALIA, 2006</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 17040px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background21.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 44.00px; top: 14.73px" class="cls_019"><span class="cls_019">Assistance with this form</span></div>
        <div style="position: absolute; left: 308.72px; top: 22.53px" class="cls_020"><span class="cls_020">72</span></div>
        <div style="position: absolute; left: 328.00px; top: 24.03px" class="cls_009"><span class="cls_009">Did you pay the person and/or give a gift for this assistance?</span></div>
        <div style="position: absolute; left: 328.00px; top: 40.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhavepaytoassistanceNo" runat="server"></div>
        <div style="position: absolute; left: 24.72px; top: 42.53px" class="cls_020"><span class="cls_020">68</span></div>
        <div style="position: absolute; left: 44.00px; top: 44.03px" class="cls_009"><span class="cls_009">Did you receive assistance in completing this form?</span></div>
        <div style="position: absolute; left: 328.00px; top: 56.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhavepaytoassistanceYes" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 56.03px" class="cls_009"><span class="cls_009">How much did you pay?</span></div>
        <div style="position: absolute; left: 44.00px; top: 60.03px" class="cls_009"><span class="cls_009">No</span></div>
        <div style="position: absolute; left: 84.00px; top: 60.03px" class="cls_009"><span class="cls_009">Go to Question 73</span></div>
        <div style="position: absolute; left: 372.04px; top: 72.03px" class="cls_009"><span class="cls_009">A$</span>&nbsp;<span style="border: 1px solid black;"><%= howmuchyoupay   %></span></div>
        <div style="position: absolute; left: 488.00px; top: 72.03px" class="cls_009"><span class="cls_009">AND/OR</span></div>
        <div style="position: absolute; left: 44.00px; top: 76.03px" class="cls_009"><span class="cls_009">Yes</span></div>
        <div style="position: absolute; left: 84.00px; top: 76.03px" class="cls_009"><span class="cls_009">Please give details of the person who assisted you</span></div>
        <div style="position: absolute; left: 368.00px; top: 88.03px" class="cls_009"><span class="cls_009">What kind of gift did you give? (eg. jewellery)</span></div>
                <div style="position: absolute; left: 368.00px; top: 100.03px" class="cls_009">&nbsp;<span style="border: 1px solid black;"><%= giftgiven   %></span></div>
        <div style="position: absolute; left: 43.82px; top: 96.03px" class="cls_009"><span class="cls_009">Title:</span></div>
        <div style="position: absolute; left: 70.85px; top: 96.03px" class="cls_009"><span class="cls_009">Mr</span></div>
        <div style="position: absolute; left: 103.16px; top: 96.03px" class="cls_009"><span class="cls_009">Mrs</span></div>
        <div style="position: absolute; left: 140.36px; top: 96.03px" class="cls_009"><span class="cls_009">Miss</span></div>
        <div style="position: absolute; left: 181.80px; top: 96.03px" class="cls_009"><span class="cls_009">Ms</span></div>
        <div style="position: absolute; left: 217.54px; top: 96.03px" class="cls_009"><span class="cls_009">Other</span></div>
        <div style="position: absolute; left: 44.00px; top: 117.35px" class="cls_009"><span class="cls_009">Family name</span></div>
        <div style="position: absolute; left: 368.00px; top: 120.03px" class="cls_009"><span class="cls_009">Value of gift (approximately)</span></div>
        <div style="position: absolute; left: 44.00px; top: 137.35px" class="cls_009"><span class="cls_009">Given names</span></div>
        <div style="position: absolute; left: 372.04px; top: 136.03px" class="cls_009"><span class="cls_009">A$</span>&nbsp;<span style="border: 1px solid black;"><%= valueofgift   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 156.03px" class="cls_009"><span class="cls_009">Address</span></div>
        <div style="position: absolute; left: 328.00px; top: 166.73px" class="cls_019"><span class="cls_019">Options for receiving written</span></div>
        <div style="position: absolute; left: 328.00px; top: 184.73px" class="cls_019"><span class="cls_019">communications</span></div>
        <div style="position: absolute; left: 208.00px; top: 206.73px" class="cls_010"><span class="cls_010">POSTCODE</span></div>
        <div style="position: absolute; left: 308.72px; top: 214.53px" class="cls_020"><span class="cls_020">73</span></div>
        <div style="position: absolute; left: 328.00px; top: 216.03px" class="cls_009"><span class="cls_009">All written communications about this application should be sent to:</span></div>
        <div style="position: absolute; left: 44.00px; top: 224.03px" class="cls_009"><span class="cls_009">Telephone number or daytime contact</span></div>
        <div style="position: absolute; left: 328.00px; top: 228.03px" class="cls_009"><span class="cls_009">(Tick one box only)</span></div>
        <div style="position: absolute; left: 103.18px; top: 241.73px" class="cls_010"><span class="cls_010">COUNTRY CODE</span></div>
        <div style="position: absolute; left: 151.78px; top: 241.73px" class="cls_010"><span class="cls_010">AREA CODE</span></div>
        <div style="position: absolute; left: 211.00px; top: 241.73px" class="cls_010"><span class="cls_010">NUMBER</span></div>
        <div style="position: absolute; left: 374.21px; top: 244.03px" class="cls_009"><span class="cls_009">Myself</span><input type="checkbox" id="chkhavewrittencommunicationsMyself" runat="server"></div>
        <div style="position: absolute; left: 424.00px; top: 244.03px" class="cls_009"><span class="cls_009">All written communications will be sent to</span></div>
        <div style="position: absolute; left: 44.00px; top: 252.03px" class="cls_009"><span class="cls_009">Office hours</span></div>
        <div style="position: absolute; left: 100.50px; top: 255.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 139.27px; top: 255.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 144.50px; top: 255.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 183.27px; top: 255.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 424.00px; top: 256.03px" class="cls_009"><span class="cls_009">the address for communications that you</span></div>
        <div style="position: absolute; left: 424.00px; top: 268.03px" class="cls_009"><span class="cls_009">have provided in this form.</span></div>
        <div style="position: absolute; left: 44.00px; top: 272.03px" class="cls_009"><span class="cls_009">Mobile phone</span></div>
        <div style="position: absolute; left: 424.00px; top: 280.03px" class="cls_009"><span class="cls_009">Go to Question 81</span></div>
        <div style="position: absolute; left: 328.64px; top: 292.03px" class="cls_009"><span class="cls_009">Australian registered</span></div>
        <div style="position: absolute; left: 24.72px; top: 298.53px" class="cls_020"><span class="cls_020">69</span></div>
        <div style="position: absolute; left: 44.00px; top: 300.03px" class="cls_009"><span class="cls_009">Is your agent registered with the Migration Agents Registration</span></div>
        <div style="position: absolute; left: 344.68px; top: 302.53px" class="cls_009"><span class="cls_009">migration agent</span><input type="checkbox" id="chkhaveauthorisedpersonMigrationagent" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 312.03px" class="cls_009"><span class="cls_009">Authority (MARA)?</span></div>
        <div style="position: absolute; left: 424.00px; top: 314.03px" class="cls_009"><span class="cls_009">Go to Question 78</span></div>
        <div style="position: absolute; left: 385.97px; top: 316.03px" class="cls_009"><span class="cls_009">OR</span></div>
        <div style="position: absolute; left: 44.00px; top: 328.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkisregisteredwithMARANo" runat="server"></div>
        <div style="position: absolute; left: 346.35px; top: 332.03px" class="cls_009"><span class="cls_009">Offshore agent</span><input type="checkbox" id="chkhaveauthorisedpersonOffshoreagent" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 344.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkisregisteredwithMARAYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 344.03px" class="cls_009"><span class="cls_009">Go to Question 73</span></div>
        <div style="position: absolute; left: 341.33px; top: 352.03px" class="cls_009"><span class="cls_009">Agent exempted</span><input type="checkbox" id="chkhaveauthorisedpersonAgentExmpted" runat="server"></div>
        <div style="position: absolute; left: 424.00px; top: 356.03px" class="cls_009"><span class="cls_009">You must complete form 956 Appointment</span></div>
        <div style="position: absolute; left: 340.57px; top: 362.53px" class="cls_009"><span class="cls_009">from registration</span></div>
        <div style="position: absolute; left: 24.72px; top: 366.53px" class="cls_020"><span class="cls_020">70</span></div>
        <div style="position: absolute; left: 44.00px; top: 368.03px" class="cls_009"><span class="cls_009">Is the person an education agent?</span></div>
        <div style="position: absolute; left: 424.00px; top: 368.03px" class="cls_009"><span class="cls_009">of a migration agent and attach it to this</span></div>
        <div style="position: absolute; left: 424.00px; top: 380.03px" class="cls_009"><span class="cls_009">application form. Go to Question 81</span></div>
        <div style="position: absolute; left: 44.00px; top: 384.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhaveeducationagentNo" runat="server"></div>
        <div style="position: absolute; left: 360.16px; top: 396.03px" class="cls_009"><span class="cls_009">Authorised</span><input type="checkbox" id="chkhaveauthorisedpersonAuthorised" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 400.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhaveeducationagentYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 400.03px" class="cls_009"><span class="cls_009">Please give details below</span></div>
        <div style="position: absolute; left: 424.00px; top: 400.03px" class="cls_009"><span class="cls_009">This is a person authorised to only receive</span></div>
        <div style="position: absolute; left: 367.20px; top: 406.53px" class="cls_009"><span class="cls_009">recipient</span></div>
        <div style="position: absolute; left: 424.00px; top: 412.03px" class="cls_009"><span class="cls_009">written communications. All written</span></div>
        <div style="position: absolute; left: 84.00px; top: 416.03px" class="cls_009"><span class="cls_009">Education Agency Business Name</span></div>
        <div style="position: absolute; left: 84.00px; top: 426.03px" class="cls_009"> &nbsp;<span style="border: 1px solid black;"><%= businessname   %></span></div>
 
        <div style="position: absolute; left: 424.00px; top: 424.03px" class="cls_009"><span class="cls_009">communications that would otherwise</span></div>
        <div style="position: absolute; left: 424.00px; top: 436.03px" class="cls_009"><span class="cls_009">have been sent to you in relation to this</span></div>
        <div style="position: absolute; left: 84.00px; top: 448.03px" class="cls_009"><span class="cls_009">Education Agent Registration Number (if known)</span></div>
        <div style="position: absolute; left: 84.00px; top: 458.03px" class="cls_009">&nbsp;<span style="border: 1px solid black;"><%= registrationno   %></span></div>
        <div style="position: absolute; left: 424.00px; top: 448.03px" class="cls_009"><span class="cls_009">application will be sent to that person.</span></div>
        <div style="position: absolute; left: 308.72px; top: 470.53px" class="cls_020"><span class="cls_020">74</span></div>
        <div style="position: absolute; left: 328.00px; top: 472.03px" class="cls_009"><span class="cls_009">Do you want the authorised person to receive health and/or character</span></div>
        <div style="position: absolute; left: 84.00px; top: 480.03px" class="cls_009"><span class="cls_009">Address (if different from address given in Question 68)</span></div>
        <div style="position: absolute; left: 84.00px; top: 490.03px" class="cls_009"> &nbsp;<span style="border: 1px solid black;"><%= educationagentaddress   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 484.03px" class="cls_009"><span class="cls_009">information about you, your spouse or your dependants, that may arise,</span></div>
        <div style="position: absolute; left: 328.00px; top: 496.03px" class="cls_009"><span class="cls_009">or be revealed, in the course of this application (for example, requests</span></div>
        <div style="position: absolute; left: 328.00px; top: 508.03px" class="cls_009"><span class="cls_009">for medical investigation, other health information about you, or the</span></div>
        <div style="position: absolute; left: 328.00px; top: 520.03px" class="cls_009"><span class="cls_009">results of criminal history checks)?</span></div>
        <div style="position: absolute; left: 192.00px; top: 531.53px" class="cls_010"><span class="cls_010">POSTCODE</span></div>
        <div style="position: absolute; left: 328.00px; top: 536.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhaveauthorisedpersonNo" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 544.03px" class="cls_009"><span class="cls_009">E-mail address</span></div>
                <div style="position: absolute; left: 84.00px; top: 554.03px" class="cls_009">&nbsp;<span style="border: 1px solid black;"><%= educationagentemail   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 552.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhaveauthorisedpersonYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 576.03px" class="cls_009"><span class="cls_009">Telephone number or daytime contact</span></div>
        <div style="position: absolute; left: 84.00px; top: 592.03px" class="cls_009"><span class="cls_009">Office hours</span></div>
        <div style="position: absolute; left: 91.18px; top: 605.73px" class="cls_010"><span class="cls_010">COUNTRY CODE</span></div>
        <div style="position: absolute; left: 139.78px; top: 605.73px" class="cls_010"><span class="cls_010">AREA CODE</span></div>
        <div style="position: absolute; left: 199.00px; top: 605.73px" class="cls_010"><span class="cls_010">NUMBER</span></div>
        <div style="position: absolute; left: 88.50px; top: 619.53px" class="cls_010"><span class="cls_010">(</span>&nbsp;<span style="border: 1px solid black;"><%= educationagentofficeno   %></span></div>
        <div style="position: absolute; left: 127.27px; top: 619.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 132.50px; top: 619.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 171.27px; top: 619.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 84.00px; top: 632.03px" class="cls_009"><span class="cls_009">Mobile phone</span></div>
        <div style="position: absolute; left: 84.00px; top: 642.03px" class="cls_009">&nbsp;<span style="border: 1px solid black;"><%= educationagentphoneno   %></span></div>
        <div style="position: absolute; left: 84.00px; top: 664.03px" class="cls_009"><span class="cls_009">Fax number</span></div>
        <div style="position: absolute; left: 91.18px; top: 677.73px" class="cls_010"><span class="cls_010">COUNTRY CODE</span></div>
        <div style="position: absolute; left: 139.78px; top: 677.73px" class="cls_010"><span class="cls_010">AREA CODE</span></div>
        <div style="position: absolute; left: 199.00px; top: 677.73px" class="cls_010"><span class="cls_010">NUMBER</span></div>
        <div style="position: absolute; left: 88.50px; top: 691.53px" class="cls_010"><span class="cls_010">(</span>&nbsp;<span style="border: 1px solid black;"><%= educationagentfaxno   %></span></div>
        <div style="position: absolute; left: 127.27px; top: 691.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 132.50px; top: 691.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 171.27px; top: 691.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 24.72px; top: 714.53px" class="cls_020"><span class="cls_020">71</span></div>
        <div style="position: absolute; left: 44.00px; top: 716.03px" class="cls_009"><span class="cls_009">Is your agent in Australia?</span></div>
        <div style="position: absolute; left: 44.00px; top: 732.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhaveagentinaustraliaNo" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 732.03px" class="cls_009"><span class="cls_009">Go to Question 73</span></div>
        <div style="position: absolute; left: 44.00px; top: 748.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkhaveagentinaustraliaYes" runat="server"></div>
        <div style="position: absolute; left: 245.98px; top: 820.73px" class="cls_010"><span class="cls_010">© COMMONWEALTH OF AUSTRALIA, 2006</span></div>
        <div style="position: absolute; left: 496.26px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 21</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 17892px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background22.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 44.69px; top: 14.73px" class="cls_019"><span class="cls_019">Authorised recipient details</span></div>
        <div style="position: absolute; left: 328.00px; top: 14.73px" class="cls_019"><span class="cls_019">Agent details</span></div>
        <div style="position: absolute; left: 44.00px; top: 36.03px" class="cls_014"><span class="cls_014">Note:</span><span class="cls_009"> Do </span><span class="cls_014">NOT</span><span class="cls_009"> complete this section if you are acting as a</span></div>
        <div style="position: absolute; left: 308.72px; top: 42.53px" class="cls_020"><span class="cls_020">78</span></div>
        <div style="position: absolute; left: 328.00px; top: 44.03px" class="cls_009"><span class="cls_009">Provide the details requested below about the agent who is</span></div>
        <div style="position: absolute; left: 44.00px; top: 48.03px" class="cls_009"><span class="cls_009">migration agent, go to Question 78</span></div>
        <div style="position: absolute; left: 328.00px; top: 56.03px" class="cls_009"><span class="cls_009">authorised to act on your behalf and to receive all written</span></div>
        <div style="position: absolute; left: 328.00px; top: 68.03px" class="cls_009"><span class="cls_009">communications about this application.</span></div>
        <div style="position: absolute; left: 24.72px; top: 70.53px" class="cls_020"><span class="cls_020">75</span></div>
        <div style="position: absolute; left: 44.00px; top: 72.03px" class="cls_009"><span class="cls_009">Provide details of the person who is authorised on your behalf to</span></div>
        <div style="position: absolute; left: 502.75px; top: 81.73px" class="cls_010"><span class="cls_010">7 DIGITS</span></div>
        <div style="position: absolute; left: 44.00px; top: 84.03px" class="cls_009"><span class="cls_009">receive all written communications about this application.</span></div>
        <div style="position: absolute; left: 328.00px; top: 88.03px" class="cls_009"><span class="cls_009">Migration Agent Registration</span></div>
        <div style="position: absolute; left: 471.00px; top: 92.03px" class="cls_009"><span class="cls_009">:</span>&nbsp;<span style="border: 1px solid black;"><%= migratioagentNo   %></span></div>
        <div style="position: absolute; left: 503.00px; top: 92.03px" class="cls_009"><span class="cls_009">:</span></div>
        <div style="position: absolute; left: 519.00px; top: 92.03px" class="cls_009"><span class="cls_009">:</span></div>
        <div style="position: absolute; left: 535.00px; top: 92.03px" class="cls_009"><span class="cls_009">:</span></div>
        <div style="position: absolute; left: 551.00px; top: 92.03px" class="cls_009"><span class="cls_009">:</span></div>
        <div style="position: absolute; left: 328.00px; top: 98.53px" class="cls_009"><span class="cls_009">Number (MARN)</span></div>
        <div style="position: absolute; left: 44.00px; top: 104.03px" class="cls_009"><span class="cls_009">Title:</span></div>
        <div style="position: absolute; left: 71.03px; top: 104.03px" class="cls_009"><span class="cls_009">Mr</span></div>
        <div style="position: absolute; left: 103.34px; top: 104.03px" class="cls_009"><span class="cls_009">Mrs</span></div>
        <div style="position: absolute; left: 140.54px; top: 104.03px" class="cls_009"><span class="cls_009">Miss</span></div>
        <div style="position: absolute; left: 181.98px; top: 104.03px" class="cls_009"><span class="cls_009">Ms</span></div>
        <div style="position: absolute; left: 217.72px; top: 104.03px" class="cls_009"><span class="cls_009">Other</span></div>
        <div style="position: absolute; left: 328.00px; top: 116.03px" class="cls_009"><span class="cls_009">OR</span></div>
        <div style="position: absolute; left: 44.00px; top: 124.03px" class="cls_009"><span class="cls_009">Family name</span>&nbsp;<span style="border: 1px solid black;"><%= authorisedpersofamilynname   %></span></div>
        <div style="position: absolute; left: 502.75px; top: 125.73px" class="cls_010"><span class="cls_010">7 DIGITS</span></div>
        <div style="position: absolute; left: 328.00px; top: 132.03px" class="cls_009"><span class="cls_009">Offshore Agent ID Number</span></div>
        <div style="position: absolute; left: 471.00px; top: 136.03px" class="cls_009"><span class="cls_009">:</span>&nbsp;<span style="border: 1px solid black;"><%= offshoreagentId   %></span></div>
        <div style="position: absolute; left: 503.00px; top: 136.03px" class="cls_009"><span class="cls_009">:</span></div>
        <div style="position: absolute; left: 519.00px; top: 136.03px" class="cls_009"><span class="cls_009">:</span></div>
        <div style="position: absolute; left: 535.00px; top: 136.03px" class="cls_009"><span class="cls_009">:</span></div>
        <div style="position: absolute; left: 551.00px; top: 136.03px" class="cls_009"><span class="cls_009">:</span></div>
        <div style="position: absolute; left: 44.00px; top: 144.03px" class="cls_009"><span class="cls_009">Given names</span>&nbsp;<span style="border: 1px solid black;"><%= authorisedpersongivenname   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 142.53px" class="cls_009"><span class="cls_009">(if allocated by the department)</span></div>
        <div style="position: absolute; left: 44.00px; top: 164.03px" class="cls_009"><span class="cls_009">Authorised recipient’s postal address</span></div>
                <div style="position: absolute; left: 44.00px; top: 180.03px" class="cls_009">&nbsp;<span style="border: 1px solid black;"><%= authorisedpersonaddress   %></span></div>
        <div style="position: absolute; left: 327.96px; top: 164.13px" class="cls_009"><span class="cls_009">Title:</span></div>
        <div style="position: absolute; left: 354.85px; top: 164.03px" class="cls_009"><span class="cls_009">Mr</span></div>
        <div style="position: absolute; left: 387.67px; top: 164.13px" class="cls_009"><span class="cls_009">Mrs</span></div>
        <div style="position: absolute; left: 424.87px; top: 164.13px" class="cls_009"><span class="cls_009">Miss</span></div>
        <div style="position: absolute; left: 466.30px; top: 164.13px" class="cls_009"><span class="cls_009">Ms</span></div>
        <div style="position: absolute; left: 503.27px; top: 164.13px" class="cls_009"><span class="cls_009">Other</span></div>
        <div style="position: absolute; left: 328.00px; top: 184.03px" class="cls_009"><span class="cls_009">Family name</span>&nbsp;<span style="border: 1px solid black;"><%= agentfamilyname   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 204.03px" class="cls_009"><span class="cls_009">Given names</span>&nbsp;<span style="border: 1px solid black;"><%= agentgivenname   %></span></div>
        <div style="position: absolute; left: 208.00px; top: 215.73px" class="cls_010"><span class="cls_010">POSTCODE</span></div>
        <div style="position: absolute; left: 328.00px; top: 224.03px" class="cls_009"><span class="cls_009">Business or</span></div>
        <div style="position: absolute; left: 44.00px; top: 232.03px" class="cls_009"><span class="cls_009">Telephone number or daytime contact</span></div>
        <div style="position: absolute; left: 328.00px; top: 234.13px" class="cls_024"><span class="cls_024">company name</span>&nbsp;<span style="border: 1px solid black;"><%= agentcompanyname   %></span></div>
        <div style="position: absolute; left: 103.18px; top: 249.73px" class="cls_010"><span class="cls_010">COUNTRY CODE</span></div>
        <div style="position: absolute; left: 151.78px; top: 249.73px" class="cls_010"><span class="cls_010">AREA CODE</span></div>
        <div style="position: absolute; left: 211.00px; top: 249.73px" class="cls_010"><span class="cls_010">NUMBER</span></div>
        <div style="position: absolute; left: 328.00px; top: 252.03px" class="cls_009"><span class="cls_009">Postal address</span>&nbsp;<span style="border: 1px solid black;"><%= agenntaddress   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 260.03px" class="cls_009"><span class="cls_009">Office hours</span></div>
        <div style="position: absolute; left: 100.50px; top: 263.53px" class="cls_010"><span class="cls_010">(</span>&nbsp;<span style="border: 1px solid black;"><%= authorisedpersonofficeno   %></span></div>
        <div style="position: absolute; left: 139.27px; top: 263.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 144.50px; top: 263.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 183.27px; top: 263.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 44.00px; top: 280.03px" class="cls_009"><span class="cls_009">Mobile phone</span>&nbsp;<span style="border: 1px solid black;"><%= authorisedpersonmobileno   %></span></div>
        <div style="position: absolute; left: 492.00px; top: 303.73px" class="cls_010"><span class="cls_010">POSTCODE</span></div>
        <div style="position: absolute; left: 44.69px; top: 310.73px" class="cls_019"><span class="cls_019">Authorised recipient consent</span></div>
        <div style="position: absolute; left: 328.00px; top: 320.03px" class="cls_009"><span class="cls_009">Telephone number or daytime contact</span></div>
        <div style="position: absolute; left: 386.68px; top: 337.73px" class="cls_010"><span class="cls_010">COUNTRY CODE</span></div>
        <div style="position: absolute; left: 435.28px; top: 337.73px" class="cls_010"><span class="cls_010">AREA CODE</span></div>
        <div style="position: absolute; left: 494.50px; top: 337.73px" class="cls_010"><span class="cls_010">NUMBER</span></div>
        <div style="position: absolute; left: 24.72px; top: 338.53px" class="cls_020"><span class="cls_020">76</span></div>
        <div style="position: absolute; left: 44.00px; top: 340.03px" class="cls_009"><span class="cls_009">As the authorised recipient named on this form, do you agree to the</span></div>
        <div style="position: absolute; left: 328.00px; top: 348.03px" class="cls_009"><span class="cls_009">Office hours</span></div>
        <div style="position: absolute; left: 384.50px; top: 351.53px" class="cls_010"><span class="cls_010">(</span>&nbsp;<span style="border: 1px solid black;"><%= agentofficeno   %></span></div>
        <div style="position: absolute; left: 423.27px; top: 351.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 428.50px; top: 351.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 467.27px; top: 351.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 44.00px; top: 352.03px" class="cls_009"><span class="cls_009">department communicating with you by fax, e-mail or other electronic</span></div>
        <div style="position: absolute; left: 44.00px; top: 364.03px" class="cls_009"><span class="cls_009">means?</span></div>
        <div style="position: absolute; left: 328.00px; top: 368.03px" class="cls_009"><span class="cls_009">Mobile phone</span>&nbsp;<span style="border: 1px solid black;"><%= agentmobileno   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 380.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkhaveagreetocommunicateNo" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 396.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chhaveagreetocommunicateYes" runat="server"></div>
        <div style="position: absolute; left: 84.00px; top: 396.03px" class="cls_009"><span class="cls_009">Give details</span></div>
        <div style="position: absolute; left: 328.00px; top: 398.73px" class="cls_019"><span class="cls_019">Agent consent</span></div>
        <div style="position: absolute; left: 102.68px; top: 413.73px" class="cls_010"><span class="cls_010">COUNTRY CODE</span></div>
        <div style="position: absolute; left: 151.28px; top: 413.73px" class="cls_010"><span class="cls_010">AREA CODE</span></div>
        <div style="position: absolute; left: 216.50px; top: 413.73px" class="cls_010"><span class="cls_010">NUMBER</span></div>
        <div style="position: absolute; left: 44.00px; top: 424.03px" class="cls_009"><span class="cls_009">Fax number</span></div>
        <div style="position: absolute; left: 100.00px; top: 427.53px" class="cls_010"><span class="cls_010">(</span>&nbsp;<span style="border: 1px solid black;"><%= Faxnumber   %></span></div>
        <div style="position: absolute; left: 138.77px; top: 427.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 144.00px; top: 427.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 182.77px; top: 427.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 308.72px; top: 426.53px" class="cls_020"><span class="cls_020">79</span></div>
        <div style="position: absolute; left: 327.96px; top: 428.03px" class="cls_009"><span class="cls_009">As the agent named on this form, do you agree to the department</span></div>
        <div style="position: absolute; left: 327.96px; top: 440.03px" class="cls_009"><span class="cls_009">communicating with you by fax, e-mail or other electronic means?</span></div>
        <div style="position: absolute; left: 44.00px; top: 444.03px" class="cls_009"><span class="cls_009">E-mail address</span>&nbsp;<span style="border: 1px solid black;"><%= authorizedpersonEmailaddress   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 456.03px" class="cls_009"><span class="cls_009">No</span><input type="checkbox" id="chkagentagreetocommunicateNo" runat="server"></div>
        <div style="position: absolute; left: 24.72px; top: 470.53px" class="cls_020"><span class="cls_020">77</span></div>
        <div style="position: absolute; left: 44.00px; top: 472.03px" class="cls_009"><span class="cls_009">I understand and accept that I am the person appointed by the</span></div>
        <div style="position: absolute; left: 328.00px; top: 472.03px" class="cls_009"><span class="cls_009">Yes</span><input type="checkbox" id="chkagentagreetocommunicateYes" runat="server"></div>
        <div style="position: absolute; left: 368.00px; top: 472.03px" class="cls_009"><span class="cls_009">Give details</span></div>
        <div style="position: absolute; left: 44.00px; top: 484.03px" class="cls_009"><span class="cls_009">applicant to receive all written communications.</span></div>
        <div style="position: absolute; left: 386.68px; top: 489.73px" class="cls_010"><span class="cls_010">COUNTRY CODE</span></div>
        <div style="position: absolute; left: 435.28px; top: 489.73px" class="cls_010"><span class="cls_010">AREA CODE</span></div>
        <div style="position: absolute; left: 500.50px; top: 489.73px" class="cls_010"><span class="cls_010">NUMBER</span></div>
        <div style="position: absolute; left: 44.00px; top: 500.03px" class="cls_014"><span class="cls_014">Signature of</span>&nbsp;<span style="border: 1px solid black;"><%= signatureauthorizedperson   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 500.03px" class="cls_009"><span class="cls_009">Fax number</span></div>
        <div style="position: absolute; left: 384.00px; top: 503.53px" class="cls_010"><span class="cls_010">(</span>&nbsp;<span style="border: 1px solid black;"><%= agentfaxno   %></span></div>
        <div style="position: absolute; left: 422.77px; top: 503.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 428.00px; top: 503.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 466.77px; top: 503.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 44.00px; top: 512.03px" class="cls_014"><span class="cls_014">authorised</span></div>
        <div style="position: absolute; left: 328.00px; top: 520.03px" class="cls_009"><span class="cls_009">E-mail address</span>&nbsp;<span style="border: 1px solid black;"><%= agentemailaddress   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 524.03px" class="cls_014"><span class="cls_014">recipient</span></div>
        <div style="position: absolute; left: 103.72px; top: 546.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 125.78px; top: 546.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 160.34px; top: 546.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 308.72px; top: 546.53px" class="cls_020"><span class="cls_020">80</span></div>
        <div style="position: absolute; left: 328.00px; top: 548.03px" class="cls_009"><span class="cls_009">I understand and accept that I am the person appointed by the applicant</span></div>
        <div style="position: absolute; left: 76.48px; top: 556.03px" class="cls_009"><span class="cls_009">Date</span><span style="border: 1px solid black;"><%= dateofsign.Day + "/" +dateofsign.Month + "/" +dateofsign.Year   %></span></div>
        <div style="position: absolute; left: 328.00px; top: 560.03px" class="cls_009"><span class="cls_009">to receive all written communications and act as his/her agent.</span></div>
        <div style="position: absolute; left: 328.00px; top: 580.03px" class="cls_014"><span class="cls_014">Signature of</span>&nbsp;<span style="border: 1px solid black;"><%= agentsignature   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 584.03px" class="cls_009"><span class="cls_009">Now go to Question 81</span></div>
        <div style="position: absolute; left: 328.00px; top: 592.03px" class="cls_014"><span class="cls_014">agent</span></div>
        <div style="position: absolute; left: 387.72px; top: 622.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 409.78px; top: 622.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 444.34px; top: 622.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 360.49px; top: 632.03px" class="cls_009"><span class="cls_009">Date</span><span style="border: 1px solid black;"><%= agentsigndate.Day + "/" +agentsigndate.Month + "/" +agentsigndate.Year   %></span></div>
        <div style="position: absolute; left: 475.55px; top: 660.03px" class="cls_009"><span class="cls_009">Continued on the next page</span></div>
        <div style="position: absolute; left: 16.00px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 22</span></div>
        <div style="position: absolute; left: 245.98px; top: 820.73px" class="cls_010"><span class="cls_010">©</span></div>
        <div style="position: absolute; left: 252.22px; top: 820.73px" class="cls_010"><span class="cls_010">COMMONWEALTH OF AUSTRALIA, 2006</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 18744px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background23.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 44.00px; top: 14.73px" class="cls_019"><span class="cls_019">Payment details</span></div>
        <div style="position: absolute; left: 24.72px; top: 42.53px" class="cls_020"><span class="cls_020">81</span></div>
        <div style="position: absolute; left: 44.00px; top: 44.03px" class="cls_009"><span class="cls_009">How will you pay your application charge? (If applying in Australia, debit</span></div>
        <div style="position: absolute; left: 44.00px; top: 56.03px" class="cls_009"><span class="cls_009">card or credit card are the preferred methods of payment.)</span></div>
        <div style="position: absolute; left: 56.25px; top: 76.03px" class="cls_009"><span class="cls_009">Bank cheque</span><input type="checkbox" id="chkpaymentmethodBankCheque" runat="server"></div>
        <div style="position: absolute; left: 127.98px; top: 76.03px" class="cls_009"><span class="cls_009">If applying outside Australia, please check with</span></div>
        <div style="position: absolute; left: 128.00px; top: 88.03px" class="cls_009"><span class="cls_009">the Australian Government office where you</span></div>
        <div style="position: absolute; left: 128.00px; top: 100.03px" class="cls_009"><span class="cls_009">intend to lodge your application that you may</span></div>
        <div style="position: absolute; left: 128.00px; top: 112.03px" class="cls_009"><span class="cls_009">pay by cheque.</span></div>
        <div style="position: absolute; left: 57.77px; top: 128.03px" class="cls_009"><span class="cls_009">Money order</span><input type="checkbox" id="chkpaymentmethodMoneyOrder" runat="server"></div>
        <div style="position: absolute; left: 65.57px; top: 148.03px" class="cls_009"><span class="cls_009">Debit card</span><input type="checkbox" id="chkpaymentmethodDC" runat="server"></div>
        <div style="position: absolute; left: 128.02px; top: 148.03px" class="cls_009"><span class="cls_009">This option is available in Australia only. It is</span></div>
        <div style="position: absolute; left: 128.00px; top: 160.03px" class="cls_009"><span class="cls_009">not available for mailed applications.</span></div>
        <div style="position: absolute; left: 63.10px; top: 180.03px" class="cls_009"><span class="cls_009">Credit card</span><input type="checkbox" id="chkpaymentmethodCC" runat="server"></div>
        <div style="position: absolute; left: 128.00px; top: 180.03px" class="cls_009"><span class="cls_009">Give details below.</span></div>
        <div style="position: absolute; left: 128.00px; top: 192.03px" class="cls_014"><span class="cls_014">Note</span><span class="cls_009">: This option is available where applications</span></div>
        <div style="position: absolute; left: 128.00px; top: 204.03px" class="cls_009"><span class="cls_009">are made in Australia. If you are making the</span></div>
        <div style="position: absolute; left: 128.00px; top: 216.03px" class="cls_009"><span class="cls_009">application outside Australia and wish to pay</span></div>
        <div style="position: absolute; left: 128.00px; top: 228.03px" class="cls_009"><span class="cls_009">by credit card, please check with the Australian</span></div>
        <div style="position: absolute; left: 128.00px; top: 240.03px" class="cls_009"><span class="cls_009">Government office about the availability of this</span></div>
        <div style="position: absolute; left: 128.00px; top: 252.03px" class="cls_009"><span class="cls_009">option.</span></div>
        <div style="position: absolute; left: 44.00px; top: 280.03px" class="cls_009"><span class="cls_009">Payment by (tick one box)</span></div>
        <div style="position: absolute; left: 196.00px; top: 280.03px" class="cls_009"><span class="cls_009">Australian Dollars</span>&nbsp;<span style="border: 1px solid black;"><%= amountinaustraliandollars   %></span></div>
        <div style="position: absolute; left: 68.96px; top: 300.03px" class="cls_009"><span class="cls_009">MasterCard</span><input type="checkbox" id="chkpaymentbyMC" runat="server"></div>
        <div style="position: absolute; left: 158.13px; top: 300.03px" class="cls_009"><span class="cls_009">Visa</span><input type="checkbox" id="chkpaymentVI" runat="server"></div>
        <div style="position: absolute; left: 76.36px; top: 316.03px" class="cls_009"><span class="cls_009">Bankcard</span><input type="checkbox" id="chkpaymentbyBC" runat="server"></div>
        <div style="position: absolute; left: 133.19px; top: 316.03px" class="cls_009"><span class="cls_009">Diners Club</span><input type="checkbox" id="chkpaymentbyDC" runat="server"></div>
        <div style="position: absolute; left: 204.54px; top: 316.03px" class="cls_009"><span class="cls_009">A$</span></div>
        <div style="position: absolute; left: 47.90px; top: 332.03px" class="cls_009"><span class="cls_009">American Express</span><input type="checkbox" id="chkpaymentbyAM" runat="server"></div>
        <div style="position: absolute; left: 158.46px; top: 332.03px" class="cls_009"><span class="cls_009">JCB</span><input type="checkbox" id="chkpaymentbyJCB" runat="server"></div>
        <div style="position: absolute; left: 44.00px; top: 352.03px" class="cls_009"><span class="cls_009">Credit card number</span>&nbsp;<span style="border: 1px solid black;"><%= creditcardno   %></span></div>
        <div style="position: absolute; left: 101.28px; top: 386.23px" class="cls_010"><span class="cls_010">MONTH</span><span style="border: 1px solid black;"><%= creditcardexpirydate.Month + "/" +creditcardexpirydate.Year   %></span></div>
        <div style="position: absolute; left: 140.84px; top: 386.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 44.00px; top: 396.03px" class="cls_009"><span class="cls_009">Expiry date</span></div>
        <div style="position: absolute; left: 109.00px; top: 396.03px" class="cls_009"><span class="cls_009">:</span></div>
        <div style="position: absolute; left: 145.00px; top: 396.03px" class="cls_009"><span class="cls_009">:</span></div>
        <div style="position: absolute; left: 44.00px; top: 412.03px" class="cls_009"><span class="cls_009">Cardholder’s name</span>&nbsp;<span style="border: 1px solid black;"><%= cardholdarname   %></span></div>
        <div style="position: absolute; left: 102.68px; top: 449.73px" class="cls_010"><span class="cls_010">COUNTRY CODE</span></div>
        <div style="position: absolute; left: 151.28px; top: 449.73px" class="cls_010"><span class="cls_010">AREA CODE</span></div>
        <div style="position: absolute; left: 222.50px; top: 449.73px" class="cls_010"><span class="cls_010">NUMBER</span></div>
        <div style="position: absolute; left: 44.00px; top: 460.03px" class="cls_009"><span class="cls_009">Telephone</span></div>
        <div style="position: absolute; left: 100.00px; top: 463.53px" class="cls_010"><span class="cls_010">(</span>&nbsp;<span style="border: 1px solid black;"><%= contactnumber   %></span></div>
        <div style="position: absolute; left: 138.77px; top: 463.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 144.00px; top: 463.53px" class="cls_010"><span class="cls_010">(</span></div>
        <div style="position: absolute; left: 182.77px; top: 463.53px" class="cls_010"><span class="cls_010">)</span></div>
        <div style="position: absolute; left: 44.00px; top: 476.03px" class="cls_009"><span class="cls_009">Address</span>&nbsp;<span style="border: 1px solid black;"><%= addressofcardholder   %></span></div>
        <div style="position: absolute; left: 192.00px; top: 527.53px" class="cls_010"><span class="cls_010">POSTCODE</span></div>
        <div style="position: absolute; left: 44.00px; top: 548.03px" class="cls_014"><span class="cls_014">Signature of</span></div>
        <div style="position: absolute; left: 44.00px; top: 560.03px" class="cls_014"><span class="cls_014">cardholder</span>&nbsp;<span style="border: 1px solid black;"><%= signatureofcardholder   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 588.03px" class="cls_009"><span class="cls_009">Credit card information will be used for charge paying purposes only.</span></div>
        <div style="position: absolute; left: 191.55px; top: 612.03px" class="cls_009"><span class="cls_009">Continued on the next page</span></div>
        <div style="position: absolute; left: 24.00px; top: 727.53px" class="cls_025"><span class="cls_025">Office use only</span></div>
        <div style="position: absolute; left: 24.00px; top: 752.03px" class="cls_009"><span class="cls_009">Name of education provider</span></div>
        <div style="position: absolute; left: 24.00px; top: 792.03px" class="cls_009"><span class="cls_009">Transaction Reference Number</span></div>
        <div style="position: absolute; left: 245.98px; top: 820.73px" class="cls_010"><span class="cls_010">© COMMONWEALTH OF AUSTRALIA, 2006</span></div>
        <div style="position: absolute; left: 496.26px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 23</span></div>
    </div>
    <div style="position: absolute; left: 50%; margin-left: -297px; top: 19596px; width: 595px; height: 842px; border-style: outset; overflow: hidden">
        <div style="position: absolute; left: 0px; top: 0px">
            <img src="8a2595a2-bd92-11e9-9d71-0cc47a792c0a_id_8a2595a2-bd92-11e9-9d71-0cc47a792c0a_files/background24.jpg" width="595" height="842">
        </div>
        <div style="position: absolute; left: 44.00px; top: 14.73px" class="cls_019"><span class="cls_019">Declaration</span></div>
        <div style="position: absolute; left: 44.00px; top: 44.03px" class="cls_014"><span class="cls_014">Before signing the declaration refer to the department’s website</span></div>
        <div style="position: absolute; left: 44.00px; top: 56.03px" class="cls_014"><span class="cls_014">to ensure that you have attached all documentation listed for</span></div>
        <div style="position: absolute; left: 44.00px; top: 68.03px" class="cls_014"><span class="cls_014">your Assessment Level and Education Sector visa subclass.</span></div>
        <div style="position: absolute; left: 24.72px; top: 86.53px" class="cls_020"><span class="cls_020">82</span></div>
        <div style="position: absolute; left: 44.00px; top: 88.03px" class="cls_009"><span class="cls_009">The following declaration must be signed and dated by all people over</span></div>
        <div style="position: absolute; left: 320.00px; top: 88.03px" class="cls_014"><span class="cls_014">Signature</span>&nbsp;<span style="border: 1px solid black;"><%= declarationsignature   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 100.03px" class="cls_009"><span class="cls_009">18 years of age included in this application.</span></div>
        <div style="position: absolute; left: 44.00px; top: 116.03px" class="cls_009"><span class="cls_009">Both parents or any person who has legal custody must complete the</span></div>
        <div style="position: absolute; left: 387.72px; top: 118.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 409.78px; top: 118.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 444.34px; top: 118.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 44.00px; top: 128.03px" class="cls_009"><span class="cls_009">declaration on behalf of any children under 18 years of age or any person</span></div>
        <div style="position: absolute; left: 359.13px; top: 129.53px" class="cls_009"><span class="cls_009">Date</span><span style="border: 1px solid black;"><%= declarationdate.Day + "/" +declarationdate.Month + "/" +declarationdate.Year   %></span></div>
        <div style="position: absolute; left: 44.00px; top: 140.03px" class="cls_009"><span class="cls_009">who lacks the legal capacity to sign on their own behalf.</span></div>
        <div style="position: absolute; left: 44.00px; top: 156.03px" class="cls_026"><span class="cls_026">•</span><span class="cls_009"> I certify the information supplied on or with this form is correct.</span></div>
        <div style="position: absolute; left: 44.00px; top: 172.03px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 54.00px; top: 172.03px" class="cls_009"><span class="cls_009">If granted a visa, I acknowledge that I am required to abide by its</span></div>
        <div style="position: absolute; left: 320.00px; top: 176.03px" class="cls_014"><span class="cls_014">Signature</span>&nbsp;<span style="border: 1px solid black;"><%= declarationsignature   %></span></div>
        <div style="position: absolute; left: 54.00px; top: 184.03px" class="cls_009"><span class="cls_009">conditions as outlined in the information form 1160i Applying for a</span></div>
        <div style="position: absolute; left: 54.00px; top: 196.03px" class="cls_009"><span class="cls_009">student visa.</span></div>
        <div style="position: absolute; left: 387.72px; top: 206.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 409.78px; top: 206.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 444.34px; top: 206.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 44.00px; top: 212.03px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 54.00px; top: 212.03px" class="cls_009"><span class="cls_009">I declare that I have made adequate arrangements for health insurance</span></div>
        <div style="position: absolute; left: 359.13px; top: 217.53px" class="cls_009"><span class="cls_009">Date</span><span style="border: 1px solid black;"><%= declarationdate.Day + "/" +declarationdate.Month + "/" +declarationdate.Year   %></span></div>
        <div style="position: absolute; left: 54.00px; top: 224.03px" class="cls_009"><span class="cls_009">for the period of my stay in Australia and I acknowledge that I am</span></div>
        <div style="position: absolute; left: 54.00px; top: 236.03px" class="cls_009"><span class="cls_009">required to maintain these arrangements while in Australia as the</span></div>
        <div style="position: absolute; left: 54.00px; top: 248.03px" class="cls_009"><span class="cls_009">holder of a student visa.</span></div>
        <div style="position: absolute; left: 44.00px; top: 264.03px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 54.00px; top: 264.03px" class="cls_009"><span class="cls_009">I have attached all documentary evidence as specified on the</span></div>
        <div style="position: absolute; left: 320.00px; top: 264.03px" class="cls_014"><span class="cls_014">Signature</span>&nbsp;<span style="border: 1px solid black;"><%= declarationsignature   %></span></div>
        <div style="position: absolute; left: 54.00px; top: 276.03px" class="cls_009"><span class="cls_009">department’s website for my Assessment Level and the visa subclass</span></div>
        <div style="position: absolute; left: 54.00px; top: 288.03px" class="cls_009"><span class="cls_009">under which I am applying.</span></div>
        <div style="position: absolute; left: 387.72px; top: 294.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 409.78px; top: 294.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 444.34px; top: 294.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 44.00px; top: 304.03px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 54.00px; top: 304.03px" class="cls_009"><span class="cls_009">I acknowledge that I understand that if the 8534 visa condition is</span></div>
        <div style="position: absolute; left: 359.13px; top: 305.53px" class="cls_009"><span class="cls_009">Date</span><span style="border: 1px solid black;"><%= declarationdate.Day + "/" +declarationdate.Month + "/" +declarationdate.Year   %></span></div>
        <div style="position: absolute; left: 54.00px; top: 316.03px" class="cls_009"><span class="cls_009">imposed on my visa, it will be indicated by the condition code ‘8534’</span></div>
        <div style="position: absolute; left: 54.00px; top: 328.04px" class="cls_009"><span class="cls_009">and by the short description ‘No Further Stay’. I acknowledge that this</span></div>
        <div style="position: absolute; left: 54.00px; top: 340.04px" class="cls_009"><span class="cls_009">means that the 8534 condition has been imposed on my visa and</span></div>
        <div style="position: absolute; left: 54.00px; top: 352.04px" class="cls_009"><span class="cls_009">that I will not, while in Australia, be entitled to the grant of any other</span></div>
        <div style="position: absolute; left: 320.00px; top: 352.03px" class="cls_014"><span class="cls_014">Signature</span>&nbsp;<span style="border: 1px solid black;"><%= declarationsignature   %></span></div>
        <div style="position: absolute; left: 54.00px; top: 363.53px" class="cls_009"><span class="cls_009">visa </span><span class="cls_027"><sup>1</sup></span><span class="cls_009">, apart from:</span></div>
        <div style="position: absolute; left: 54.00px; top: 380.03px" class="cls_009"><span class="cls_009">- a further student visa with permission to work, the application for</span></div>
        <div style="position: absolute; left: 387.72px; top: 382.23px" class="cls_010"><span class="cls_010">DAY</span></div>
        <div style="position: absolute; left: 409.78px; top: 382.23px" class="cls_010"><span class="cls_010">MONTH</span></div>
        <div style="position: absolute; left: 444.34px; top: 382.23px" class="cls_010"><span class="cls_010">YEAR</span></div>
        <div style="position: absolute; left: 64.00px; top: 392.03px" class="cls_009"><span class="cls_009">which was made on form 157P; or</span></div>
        <div style="position: absolute; left: 359.13px; top: 393.53px" class="cls_009"><span class="cls_009">Date</span><span style="border: 1px solid black;"><%= declarationdate.Day + "/" +declarationdate.Month + "/" +declarationdate.Year   %></span></div>
        <div style="position: absolute; left: 54.00px; top: 408.03px" class="cls_009"><span class="cls_009">- a subclass 497 (Graduate-Skilled) visa.</span></div>
        <div style="position: absolute; left: 44.00px; top: 424.03px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 54.00px; top: 424.03px" class="cls_009"><span class="cls_009">I understand that the effect of the 8534 visa condition is that it will</span></div>
        <div style="position: absolute; left: 54.00px; top: 436.03px" class="cls_009"><span class="cls_009">not be possible for me to apply to remain in Australia beyond the date</span></div>
        <div style="position: absolute; left: 54.00px; top: 447.53px" class="cls_009"><span class="cls_009">authorised by my visa</span><span class="cls_027"><sup>1</sup></span><span class="cls_009"> and that I will be required to depart Australia</span></div>
        <div style="position: absolute; left: 54.00px; top: 460.03px" class="cls_009"><span class="cls_009">on or before that date. I agree to having this condition included on</span></div>
        <div style="position: absolute; left: 54.00px; top: 472.03px" class="cls_009"><span class="cls_009">any visa issued to me as a result of this application if the department</span></div>
        <div style="position: absolute; left: 54.00px; top: 484.03px" class="cls_009"><span class="cls_009">decides to impose it as a condition of grant of a visa.</span></div>
        <div style="position: absolute; left: 44.00px; top: 500.03px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 54.00px; top: 500.03px" class="cls_009"><span class="cls_009">I acknowledge that I understand that if the 8535 visa condition is</span></div>
        <div style="position: absolute; left: 54.00px; top: 512.03px" class="cls_009"><span class="cls_009">imposed on my visa, it will be indicated by the condition code ‘8535’</span></div>
        <div style="position: absolute; left: 54.00px; top: 524.03px" class="cls_009"><span class="cls_009">and by the short description ‘No Further Stay’. I acknowledge that</span></div>
        <div style="position: absolute; left: 54.00px; top: 536.04px" class="cls_009"><span class="cls_009">this means that the 8535 condition has been imposed on my visa</span></div>
        <div style="position: absolute; left: 54.00px; top: 548.04px" class="cls_009"><span class="cls_009">and that I will not, while in Australia, be entitled to be granted any</span></div>
        <div style="position: absolute; left: 54.00px; top: 559.53px" class="cls_009"><span class="cls_009">other visa </span><span class="cls_027"><sup>1</sup></span><span class="cls_009">, apart from:</span></div>
        <div style="position: absolute; left: 54.00px; top: 576.03px" class="cls_009"><span class="cls_009">- a further student visa with permission to work, the application for</span></div>
        <div style="position: absolute; left: 63.50px; top: 588.03px" class="cls_009"><span class="cls_009">which was made on form 157P; or</span></div>
        <div style="position: absolute; left: 54.00px; top: 604.03px" class="cls_009"><span class="cls_009">- a further student visa, with the consent of my sponsor.</span></div>
        <div style="position: absolute; left: 44.00px; top: 620.03px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 54.00px; top: 620.03px" class="cls_009"><span class="cls_009">I understand that the effect of the 8535 visa condition is that it will</span></div>
        <div style="position: absolute; left: 54.00px; top: 632.03px" class="cls_009"><span class="cls_009">not be possible for me to remain in Australia beyond the date</span></div>
        <div style="position: absolute; left: 54.00px; top: 643.53px" class="cls_009"><span class="cls_009">authorised by my visa</span><span class="cls_027"><sup>1</sup></span><span class="cls_009">, unless I am applying for a further student visa</span></div>
        <div style="position: absolute; left: 54.00px; top: 656.03px" class="cls_009"><span class="cls_009">with the consent of my sponsor, and that I will be required to depart</span></div>
        <div style="position: absolute; left: 54.00px; top: 668.03px" class="cls_009"><span class="cls_009">Australia on or before the authorised date. I agree to having this</span></div>
        <div style="position: absolute; left: 54.00px; top: 680.03px" class="cls_009"><span class="cls_009">condition included on any visa issued to me as a result of this</span></div>
        <div style="position: absolute; left: 54.00px; top: 692.03px" class="cls_009"><span class="cls_009">application if the department decides to impose it as a condition of</span></div>
        <div style="position: absolute; left: 54.00px; top: 704.04px" class="cls_009"><span class="cls_009">grant of a visa.</span></div>
        <div style="position: absolute; left: 44.00px; top: 720.03px" class="cls_009"><span class="cls_009">•</span></div>
        <div style="position: absolute; left: 54.00px; top: 720.03px" class="cls_009"><span class="cls_009">I am aware that I must immediately advise the department if I become</span></div>
        <div style="position: absolute; left: 54.00px; top: 732.03px" class="cls_009"><span class="cls_009">aware that any information provided in this form is incorrect or if there</span></div>
        <div style="position: absolute; left: 54.00px; top: 744.04px" class="cls_009"><span class="cls_009">is a change in my circumstances that are relevant to this application</span></div>
        <div style="position: absolute; left: 54.00px; top: 756.04px" class="cls_009"><span class="cls_009">at any time.</span></div>
        <div style="position: absolute; left: 44.00px; top: 784.03px" class="cls_027"><span class="cls_027"><sup>1</sup></span><span class="cls_009"> </span><span class="cls_028">To engage Australia’s protection obligation under the 1951 UN convention</span></div>
        <div style="position: absolute; left: 44.00px; top: 795.03px" class="cls_028"><span class="cls_028">relating to the status of refugees.</span></div>
        <div style="position: absolute; left: 16.00px; top: 820.73px" class="cls_010"><span class="cls_010">157A (Design date 07/06)  - Page 24</span></div>
        <div style="position: absolute; left: 245.98px; top: 820.73px" class="cls_010"><span class="cls_010">©</span></div>
        <div style="position: absolute; left: 252.22px; top: 820.73px" class="cls_010"><span class="cls_010">COMMONWEALTH OF AUSTRALIA, 2006</span></div>
    </div>

</body>
</html>

