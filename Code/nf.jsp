<%-- 
    Document   : nf
    Created on : 24 Apr, 2020, 12:47:52 PM
    Author     : nikp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <title>SaveLife Blood Bank</title>
        <style>
            .serif {
              font-family: "Times New Roman", Times, serif;
              font-size: 80px;
              color: white;
            }

            .sansserif {
              font-family: Arial, Helvetica, sans-serif;
              font-size: 30px;
            }

            .monospace {
              font-family: "Lucida Console", Courier, monospace;
            }
            div.a{
                width: 100%;
                border: 0px solid darkblue;
                border-radius: 0px;
                background-color: rgb(200,20,10);
         
            }
            div.b{
                width: 100%;
                padding-right: 25px;
                borde: 0px;
                background-color: rgba(255,0,0,0.2);
            }
        </style>
        <meta charset="utf-8">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <meta name="description" content="">

            <link rel="shortcut icon" type="image/x-icon" href="logo.png">
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
            <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

            <link rel="stylesheet" type="text/css" href="./style.css">
            <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
            <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css">
            <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css">

<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    </head> 
    <body>
        <div class="a"> <center><p class="serif"  >SaveLife Blood Bank</p></center> </div>
        <div class="b" align="right">
            <table >
                       
                        <tr>

                            <td colspan="2" style = "text-align: center" ><input class = "btn btn-primary" type="button" onclick="window.location.href='http://localhost:8080/Bbms/login.jsp'" value="Login" ></td>
                            <td colspan="2" style = "text-align: center" ><input class = "btn btn-primary" type="button" onclick="window.location.href='http://localhost:8080/Bbms/signup.jsp'" value="Signup"></td>
                        </tr>
            </table>
        </div>
       <%
        String warn2= (String)session.getAttribute("message1");
        session.setAttribute("message1",null);
        if(warn2!=null)
        if(warn2.length()!=0){
        %>
    <center>
        <p class="sansserif"><%=warn2%></p>
        <%}%>
    </center>
    
		<header class="main-head">

    </header>
    <div >
	    <img class="logo-img" src="img1.jpg" width="800" height="180" ALT="align box" ALIGN=CENTER>
		</div>
		  <div class="container">

		<div>
			<h2 class="impact">Why Should you donate blood?</h2>
			<div class="info-text">
				A blood donation truly is a “gift of life” that a healthy individual can give to others in their community who are sick or injured. In one hour’s time, a person can donate one unit of blood that can be separated into four individual components that could help save multiple lives.

From one unit of blood, red blood cells can be extracted for use in trauma or surgical patients. Plasma, the liquid part of blood, is administered to patients with clotting problems. The third component of blood, platelets, clot the blood when cuts or other open wounds occur, and are often used in cancer and transplant patients. Cryoprecipitated anti-hemophilic factor (AHF) is also used for clotting factors.

In a recent study supported by the National Blood Foundation (TRANSFUSION 2002;42:122S), more than 5,000 individuals who were current blood donors at the time or who had given blood in the past were asked why they donate blood. Nearly three-quarters of the respondents said that they give blood to help others. Respondents also said that giving blood makes them feel good about themselves; supports their local communities and hospitals; supports their community culture; and “pays back” society for the times when they or their families have needed blood transfusions in the past.
				</div>

			<hr>
				<br>
				<br>

				<h2 class="impact">Who Can Donate Blood?</h2>
				<div class="info-text">
					Most people can give blood if they are in good health. There are some basic requirements one  need to fulfill in order to become a blood donor.  Below are some basic eligibility guidelines:
<ul>
	<li>You are aged between 18 and 65.</li>
 <li>In some countries national legislation permits 16–17 year-olds to donate provided that they fulfil the physical and hematological criteria required and that appropriate consent is obtained.</li>
 <li>In some countries, regular donors over the age of 65 may be accepted at the discretion of the responsible physician. The upper age limit in some countries are 60.</li>
  <li>You weigh at least 50 kg.</li>
  <li>In some countries, donors of whole blood donations should weigh at least 45 kg to donate 350 ml ± 10%.</li>
<li>You must be in good health at the time you donate.</li>

<li>You cannot donate if you have a cold, flu, sore throat, cold sore, stomach bug or any other infection.</li>

<li>If you have recently had a tattoo or body piercing you cannot donate for 6 months from the date of the procedure.  If the body piercing was performed by a registered health professional and any inflammation has settled completely, you can donate blood after 12 hours.</li>

<li>If you have visited the dentist for a minor procedure you must wait 24 hours before donating; for major work wait a month.</li>

<li>You must not donate blood If you do not meet the minimum haemoglobin level for blood donation:<li>

    A test will be administered at the donation site. In many countries, a haemoglobin level of not less than 12.0 g/dl for females and not less than 13.0 g/dl for males as the threshold.

Travel

Travel to areas where mosquito-borne infections are endemic, e.g. malaria, dengue and Zika virus infections, may result in a temporary deferral.

Many countries also implemented the policy to defer blood donors with a history of travel or residence for defined cumulative exposure periods in specified countries or areas, as a measure to reduce the risk of transmitting variant Creutzfeldt-Jakob Disease (vCJD) by blood transfusion.
Behaviours

You must not give blood:

    If you engaged in “at risk” sexual activity in the past 12 months
    Individuals with behaviours below will be deferred permanently:
    Have ever had a positive test for HIV (AIDS virus)
    Have ever injected recreational drugs.

In the national blood donor selection guidelines, there are more behavior eligibility criteria. Criteria could be different in different countries.
Pregnancy and breastfeeding

Following pregnancy, the deferral period should last as many months as the duration of the pregnancy.

It is not advisable to donate blood while breast-feeding. Following childbirth, the deferral period is at least 9 months (as for pregnancy) and until 3 months after your baby is significantly weaned (i.e. getting most of his/her nutrition from solids or bottle feeding).
More information on eligibility to donate

National  eligibility guidelines must be followed when people donate blood in the blood service in specific countries.  To find out whether any health conditions, medications, professions or travel history to could affect your ability to give blood, please search for detailed information in the national/local blood services
				</div>
				</div>
	</div>
		<br>
</body>
   
</html>
