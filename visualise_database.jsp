<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
 
<%
    try{ 
                 Class.forName("org.apache.derby.jdbc.ClientDriver");
            
            }
            catch(ClassNotFoundException e){
               
                 System.out.println(e);
                 
            }
            int op=0,om=0,ap=0,am=0,bp=0,bm=0,abp=0,abmm=0;
            try{
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/proj", "nikp", "nikp");
                Statement stmt = con.createStatement();
                String query = "SELECT * FROM blood_packet WHERE is_available=1" ;
                ResultSet rs = stmt.executeQuery(query);

                //String u = rs.getString("username");
                
                while(rs.next())
                {
                    String bg=rs.getString("bl_gr");
                   if(bg.equals("a+"))
                       ap++;
                   if(bg.equals("a-"))
                       am++;
                   if(bg.equals("ab+"))
                       abp++;
                   if(bg.equals("ab-"))
                       abmm++;
                   if(bg.equals("o+"))
                       op++;
                   if(bg.equals("o-"))
                       om++;
                   if(bg.equals("b+"))
                       bp++;
                   if(bg.equals("b-"))
                       bm++;

                }
            }  
            catch(SQLException e){
            System.err.println(e);
            }  
    
    
    

    
    
    
    
    
    
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
 
map = new HashMap<Object,Object>(); map.put("label", "A+"); map.put("y", ap); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "A-"); map.put("y", am); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "B+"); map.put("y", bp); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "B-"); map.put("y", bm); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "AB+"); map.put("y", abp); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "AB-"); map.put("y",abmm); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "O+"); map.put("y",op); list.add(map);
map = new HashMap<Object,Object>(); map.put("label", "O-"); map.put("y", om); list.add(map);
 
String dataPoints = gsonObj.toJson(list);
%>
 
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2",
	
	axisY: {
		title: "Number of Packets",
		labelFormatter: addSymbols
	},
	data: [{
		type: "bar",
		indexLabel: "{y}",
		indexLabelFontColor: "#444",
		indexLabelPlacement: "inside",
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();
 
function addSymbols(e) {
	var suffixes = ["", "K", "M", "B"];
 
	var order = Math.max(Math.floor(Math.log(e.value) / Math.log(1000)), 0);
	if(order > suffixes.length - 1)
	order = suffixes.length - 1;
 
	var suffix = suffixes[order];
	return CanvasJS.formatNumber(e.value / Math.pow(1000, order)) + suffix;
}
 
}
</script>
</head>
<body>
<center>
<div id="chartContainer" style="height: 370px; width: 85%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
</center>
</body>
</html>   