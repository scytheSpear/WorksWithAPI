<%-- 
    Document   : index
    Created on : Mar 26, 2014, 11:47:20 PM
    Author     : user
--%>

<%@page import="TwitterAPI.TwitterCaller"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:h="http://java.sun.com/jsf/html"
      xmlns:ui="http://java.sun.com/jsf/facelets"
      xmlns:f="http://java.sun.com/jsf/core"
      xmlns:c="http://xmlns.jcp.org/jsp/jstl/core">
    <head>

        <title>JSP Page</title>
    </head>
    <body>
        <%TwitterCaller responser = new TwitterCaller();
            try {
                String gresponse = responser.TwitterResponse();
                System.out.println("ers " + gresponse);
                StringBuilder buf = new StringBuilder();
                buf.append("<table border=\"1\">");
                buf.append("<tr><td>Json message:</td><td>");
                buf.append(gresponse);
                buf.append("</td></tr></table>");
                out.println(buf.toString());
            } catch (Exception e) {
                out.println(e.getMessage());
            }
        %>

    </body>
</html>
