<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <title>Start Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <style>
            td{
                padding: 20px;
            }
            .serif {
              font-family: "Times New Roman", Times, serif;
              font-size: 80px;
              color: white;
            }
            .f {
              font-family: "Times New Roman", Times, serif;
              font-size: 20px;
              color: red;
            }
            div.a{
                width: 100%;
                border: 0px solid darkblue;
                border-radius: 0px;
                background-color: rgb(200,20,10);
         
            }
            div.c{
                height: 80px;
                padding-right: 25px;
            }
            div.d{
                height: 40px;
         
            }
            div.q{
           
                width:65%;
                border-radius: 5px;
                background-color: lightgrey;
            }
        </style>
    </head>
    <body>
    <div class="a"> <center><p class="serif"  >SaveLife Blood Bank</p></center> </div>
    <div class="c" align="right"><input class = "btn btn-danger" onclick="window.location.href='http://localhost:8080/Bbms/index.jsp'" type="submit" value="Home"></div>
    <center>
      
        <%
            String warn1 = (String)session.getAttribute("warning1");
            session.setAttribute("warning1",null);
                    
            if(warn1!=null){
        %>
        <p class="f"> <%=warn1%></p>
        <% } %>
  
        <h1>ENTER YOUR MEDICAL DETAILS</h1></center>
    <center>
        <div class="q">
            <form action="medical_f.jsp" >
                <table >
                 <colgroup>
                    <col span="3">
                  
                  </colgroup>
                        <tr>
                            <td>Age</td>
                            <td ><input type="text" class="form-control" name="age" placeholder="age in years"></td>
                        </tr>
                        <tr>
                            
                            <td> <label for="bl_gr">Choose your blood group:</label> </td>
                            <td>
                            <select name="bl_gr" class="form-control">
                              <option value="a+">A+ (A positive)</option>
                              <option value="a-">A- (A negative)</option>
                               <option value="b+">B+ (B positive)</option>
                              <option value="b-">B- (B negative)</option>
                               <option value="ab+">AB+ (AB positive)</option>
                              <option value="ab-">AB- (AB negative)</option>
                               <option value="o+">O+ (O positive)</option>
                              <option value="o-">O- (O negative)</option>
                              <option value="nots">Not Sure</option>
                              
                            </select></td>
                        </tr>
                        <tr>
                            
                            <td> <label for="donated_before">Have you donated before and when did you donate last time:</label> </td>
                            <td>
                            <select name="donated_before" class="form-control">
                              <option value="no">No</option>
                              <option value="y_3b">Yes, more than 3 months ago</option>
                               <option value="y_3a">Yes, in recent three months</option>
                              
                              
                            </select></td>
                        </tr>
                        <tr>
                            <td>Did you suffer from malaria jaundice in past (also mention when)</td>
                            <td><input type="text" class="form-control" name="mal_jau" placeholder="name of disease and time"></td>
                        </tr>
                        <tr>
                            <td>Did you undergo any surgery in past (mention time)</td>
                            <td><input type="text" class="form-control" name="surgery" placeholder="if yes mention time"></td>
                        </tr>
                        <tr>
                            <td>Do you take any medications or have any other disease</td>
                            <td><input type="text" class="form-control" name="med_dis" placeholder="name of medication or disease suffered"></td>
                        </tr>
                        <tr>

                            <td colspan="2" style = "text-align: center" ><input class = "btn btn-success" type="submit" value="Submit for approval"></td>
                        </tr>
                </table>
            </form>
        </div>
    </center>
    <div class="d"></div>
    <center>
        <div>
            <p>Do not have an account?   </p>
            <input class = "btn btn-primary" onclick="window.location.href='http://localhost:8080/Bbms/logged_in.jsp'" type="submit" value="Return to dashboard">
        </div>
    </center>
<div class="d"></div>
    </body>
</html>