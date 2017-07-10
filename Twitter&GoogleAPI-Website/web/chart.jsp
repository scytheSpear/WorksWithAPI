<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import ="org.jfree.data.general.*"%>

<%
    double negp = Double.parseDouble(request.getParameter("negp"));
    double neup = Double.parseDouble(request.getParameter("neup"));
    double posp = Double.parseDouble(request.getParameter("posp"));
    double noenp = Double.parseDouble(request.getParameter("noenp"));

    final DefaultPieDataset data = new DefaultPieDataset();
    data.setValue("Negative Tweets", negp);
    data.setValue("Neutral Tweets", neup);
    data.setValue("Positive Tweets", posp);
    data.setValue("Tweets Not in English", noenp);

    JFreeChart chart = ChartFactory.createPieChart("Tweets Sentiment analysis ", data, true, true, false);
    final File file1 = new File("E:\\Workplacew\\Twitter&GoogleAPI-Website\\web\\resources\\piechart.png");
    try {
        final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
        ChartUtilities.saveChartAsPNG(
                file1, chart, 600, 400, info);
    } catch (Exception e) {
        out.println(e);
    }
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="resources/cssfile.css">
        <title>Tweets Sentiment analysis</title>
    </head>
    <body>
        <div id="header">
            <header>
                <h1>Tweets Sentiment analysis</h1>
            </header>
        </div>
    <article>
        <a href="search.jsp"> <h1>Search for CoREconf information</h1></a>
        <a href="index.jsp"> <h1>Back to Index</h1></a>
        <br/>
        <hr class ="myHr">
        <IMG SRC="resources/piechart.png" WIDTH="600" HEIGHT="400" 
             BORDER="0" USEMAP="#chart">
        <br/><br/><br/><br/>
    </article>
    <footer>
        <h2>This website Copyright by TLI</h2>
    </footer>
</body>
</html>