<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%! Connection con=null; %>
<%! Statement st= null; %>
<%! ResultSet rs= null; %>
 
<%
 
        String username = request.getParameter("username");
        String password = request.getParameter("password");
       
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            }
        catch(ClassNotFoundException ce){out.println(ce);}
        try{
 
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/19526","root","");
            st = con.createStatement();
            int i=st.executeUpdate("update login_check set password='"+password+"' where username = '"+username+"'");
            out.println("Data is updated successfully!");
            response.sendRedirect("login26.html");
        }
        catch(SQLException e)
        {
            out.println(e);
        }
%>