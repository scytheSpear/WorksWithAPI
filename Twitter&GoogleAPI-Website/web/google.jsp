<%@page import="java.util.ArrayList"%>
<%@page import="entity.Google"%>
<%@page import="API.GoogleSearch"%>
<%@page import="entity.Coreconf"%>
<%@page import="java.util.List"%>
<%@page import="client.CoREClient"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Google Search & Twitter</title>
        <link rel="stylesheet" type="text/css" href="resources/cssfile.css">
    </head>
    <body>
        <div id="header">
            <header>
                <h1>Google & Twitter</h1>
            </header>
        </div>
        <article>
            <a href="index.jsp"> <h1>Back to Index</h1></a>
            <br/>
            <hr class="myHr"/>
            <h2>Conference Detail</h2>

            <%CoREClient restClient = new CoREClient();
                String id = request.getParameter("id");
                try {
                    Coreconf coreconf = restClient.getCoreconf(id);

                    StringBuilder buf = new StringBuilder();
                    buf.append("<table class=\"myTable\" styleClass=\"outerTable\" headerClass=\"listTable\" footerClass=\"listTable\" "
                            + "columnClasses=\"checkBoxStyle,custNameStyle,notesStyle\" width=\"90%\"   "
                            + "cellspacing=\"0\" rowClasses=\"listContentEven,listContentOdd\" border=\"1\"align=\"center\">");
                    buf.append("<tr><th>ID</th><th>Title</th><th>Acronym</th><th>Rank</th><th>Changed</th><th>Forcode</th></tr>");
                    buf.append("<tr><td>");
                    buf.append(coreconf.getConfId());
                    buf.append("</td><td>");
                    buf.append("<ul class=\"myList\"><a href=conf.jsp?id=" + coreconf.getConfId() + ">");
                    buf.append(coreconf.getConfTitle());
                    buf.append("</ul></a>");
                    buf.append("</td><td>");
                    buf.append(coreconf.getAcronym());
                    buf.append("</td><td>");
                    buf.append(coreconf.getRank());
                    buf.append("</td><td>");
                    buf.append(restClient.check(coreconf.isChanged()));
                    buf.append("</td><td>");
                    buf.append(coreconf.getForcode());
                    buf.append("</td></tr></table><br/><hr class=\"myHr\"/> <h2>Google Search</h2> ");
                    out.println(buf.toString());

                } catch (Exception e) {
                    out.println(e.getMessage());
                }
                
                
                GoogleSearch search1 = new GoogleSearch();
                try {
                    Coreconf coreconf = restClient.getCoreconf(id);
                    
                    StringBuilder gbuf = new StringBuilder();
                   
                    String data =  "2013"+ coreconf.getConfTitle().replaceAll("\\s+","+");
                    List<Google> gresults = search1.search(data);

                    gbuf.append("<table class=\"myTable\" styleClass=\"outerTable\" headerClass=\"listTable\" footerClass=\"listTable\" "
                            + "columnClasses=\"checkBoxStyle,custNameStyle,notesStyle\" width=\"90%\"   "
                            + "cellspacing=\"0\" rowClasses=\"listContentEven,listContentOdd\" border=\"1\"align=\"center\">");
                    gbuf.append("<tr><th>Title</th><th>Snippet</th><th>Link</th></tr>");
                    for (Google gresult : gresults) {
                        gbuf.append("<tr><td>" + gresult.getTitle() + "</td>");
                        gbuf.append("<td>" + gresult.getSnippet() + "</td>");
                        gbuf.append("<td><a href=\"" + gresult.getLink() + "\">" + gresult.getLink() + "</a></td></tr>");

                    }
                    gbuf.append("</table>");

                    out.println(gbuf.toString());

                } catch (Exception e) {
                    out.println(e.getMessage());
                }
            %>
        </article>

    </body>
</html>
