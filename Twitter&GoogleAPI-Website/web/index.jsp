<%@page import="entity.Coreconf"%>
<%@page import="java.util.List"%>
<%@page import="client.CoREClient"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/cssfile.css">
        <title>CoRE conf</title>
    </head>
    <body>
        <div id="header">
            <header>
                <h1>CoRE</h1>
            </header>
        </div>
        <article>
            <a href="search.jsp"> <h1>Search for CoREconf information</h1></a>
            <br/>
            <hr class ="myHr">
            <h2>CoRE conf</h2>
            <%CoREClient restClient = new CoREClient();
                try {
                    List<Coreconf> cores = restClient.getList();
                    StringBuilder buf = new StringBuilder();
                    buf.append("<table class=\"myTable\" styleClass=\"outerTable\" headerClass=\"listTable\" footerClass=\"listTable\" "
                            + "columnClasses=\"checkBoxStyle,custNameStyle,notesStyle\" width=\"90%\"   "
                            + "cellspacing=\"0\" rowClasses=\"listContentEven,listContentOdd\" border=\"1\"align=\"center\"> ");
                    buf.append("<tr><th>ID</th><th>Title</th><th>Acronym</th><th>Rank</th><th>Changed</th><th>Forcode</th></tr>");

                    for (Coreconf coreconf : cores) {
                        buf.append("<tr><td>");
                        buf.append(coreconf.getConfId());
                        buf.append("</td><td>");
                        buf.append("<ul class=\"myList\"><a href=conf.jsp?id=" + coreconf.getConfId() + ">" );
                        buf.append(coreconf.getConfTitle());
                        buf.append("</a> <a href=google.jsp?id=" + coreconf.getConfId()+"></a></ul>");
                        buf.append("</td><td>");
                        buf.append(coreconf.getAcronym());
                        buf.append("</td><td>");
                        buf.append(coreconf.getRank());
                        buf.append("</td><td>");
                        buf.append(restClient.check(coreconf.isChanged()));
                        buf.append("</td><td>");
                        buf.append(coreconf.getForcode());
                        buf.append("</tr>");
                    }
                    buf.append("</td></tr></table>");
                    out.println(buf.toString());

                } catch (Exception e) {
                    out.println(e.getMessage());
                }
                restClient.close();
            %>

            <br/><br/><br/><br/>
        </article>
        <footer>
            <h2>This website Copyright by TLI</h2>
        </footer>
    </body>
</html>