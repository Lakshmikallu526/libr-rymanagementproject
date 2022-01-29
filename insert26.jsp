<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%! Connection con=null; %>
<%! Statement st= null; %>
<%! ResultSet rs= null; %>
 
<%
 
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String pass = request.getParameter("password");
        String gen = request.getParameter("gender");
        String phoneno = request.getParameter("phoneno");
        String email = request.getParameter("email");
       
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            }
        catch(ClassNotFoundException ce){out.println(ce);}
        try{
 
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/19526","root",""); //Connection created
            st = con.createStatement();
            int i=st.executeUpdate("insert into user values('"+firstname+"','"+lastname+"','"+username+"','"+pass+"','"+gen+"','"+phoneno+"','"+email+"')");
            out.println("Data is successfully inserted!");
            response.sendRedirect("login26.html");
        }
        catch(SQLException e)
        {
           out.print(e);
            e.printStackTrace();
        }
%>
