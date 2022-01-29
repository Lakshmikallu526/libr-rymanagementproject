<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%! Connection con=null; %>
<%! Statement st= null; %>
<%! ResultSet rs= null; %>

<%

        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            }
        catch(ClassNotFoundException ce){out.println(ce);}
        try{

            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/19526","root","");
            st = con.createStatement();
            rs=st.executeQuery("select * from user_information where user_name = '"+user+"' and password='"+pass+"'");
            if(rs.next())
            {
                response.sendRedirect("bookout.html");
            }
            else
              response.sendRedirect("error26.html");
        }
        catch(SQLException e) 
        {
                                response.sendRedirect("error26.html");
        }
%>