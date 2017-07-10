<%@page  language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="entity.Coreconf"%>
<%@page import="java.util.List"%>
<%@page import="client.CoREClient"%>

<%CoREClient restClient = new CoREClient();
    try {
        String title = request.getParameter("title");
        List<Coreconf> cores = restClient.getListFromTitle(title);
        StringBuilder buf = new StringBuilder();
        buf.append("<table class=\"myTable\" styleClass=\"outerTable\" headerClass=\"listTable\" footerClass=\"listTable\" "
                + "columnClasses=\"checkBoxStyle,custNameStyle,notesStyle\" width=\"90%\"   "
                + "cellspacing=\"0\" rowClasses=\"listContentEven,listContentOdd\" border=\"1\"align=\"center\"> ");
        buf.append("<tr><th>ID</th><th>Title</th><th>Acronym</th><th>Rank</th><th>Changed</th><th>Forcode</th></tr>");

        for (Coreconf coreconf : cores) {
            buf.append("<tr><td>");
            buf.append(coreconf.getConfId());
            buf.append("</td><td>");
            buf.append("<ul class=\"myList\"><a href=conf.jsp?id=" + coreconf.getConfId() + ">");
            buf.append(coreconf.getConfTitle());
            buf.append("</a> <a href=google.jsp?id=" + coreconf.getConfId() + "></a></ul>");
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