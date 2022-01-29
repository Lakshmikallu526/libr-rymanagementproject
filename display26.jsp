<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%! Connection con=null; %>
<%! Statement st= null; %>
<%! ResultSet rs= null; %>


<html>
<head><title>This is a Jdbc Example</title></head>
<body>

<%
out.println("data base");


try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
}catch(ClassNotFoundException ce){out.println(ce);}

try{
con = DriverManager.getConnection("jdbc:mysql://localhost/19545","root", "");
st = con.createStatement();

rs = st.executeQuery("SELECT username, email, firstname, lastname FROM user");
while(rs.next()) {

String username = rs.getString(1);
String email = rs.getString(2);
String firstname = rs.getString(3);
String lastname = rs.getString(4);
out.println("<br>"+username+ " || " +email+ "  || " +firstname+ "  || " +lastname+ "</br>");

} // end of while
rs.close();
st.close();
con.close();

}catch(SQLException exception){
out.println("<!--");
StringWriter sw = new StringWriter();
PrintWriter pw = new PrintWriter(sw);
exception.printStackTrace(pw);
out.print(sw);
sw.close();
pw.close();
out.println("-->");
out.println("ERROR:"+exception);
}



%>
</body>
</html> 