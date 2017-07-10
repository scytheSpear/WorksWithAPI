<%@page import="API.Analyse"%>
<%@page import="API.GoogleSearch"%>
<%@page import="entity.Twitter"%>
<%@page import="API.TwitterCaller"%>
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
                    buf.append("</td></tr></table>");
                    out.println(buf.toString());

                } catch (Exception e) {
                    out.println(e.getMessage());
                }
            %>
            <br/>
            <hr class="myHr"/>
            <h2>Tweets</h2>

            <%TwitterCaller twitterAPI = new TwitterCaller();

                Analyse ana = new Analyse();
                try {
                    Coreconf coreconf = restClient.getCoreconf(id);
                    List<Twitter> tweets = twitterAPI.TwitterResponse(coreconf.getAcronym());
                    List<Twitter> negtw = ana.getNegTweets(coreconf.getAcronym());
                    List<Twitter> postw = ana.getPosTweets(coreconf.getAcronym());
                    int[] analysedata = ana.analisy((coreconf.getAcronym()));

                    StringBuilder twbuf = new StringBuilder();
                    twbuf.append("<table class=\"myTable\" styleClass=\"outerTable\" headerClass=\"listTable\" footerClass=\"listTable\" "
                            + "columnClasses=\"checkBoxStyle,custNameStyle,notesStyle\" width=\"90%\"   "
                            + "cellspacing=\"0\" rowClasses=\"listContentEven,listContentOdd\" border=\"1\"align=\"center\">");
                    twbuf.append("<tr><th></th><th>Name</th><th>Create Time</th><th>Tweet</th><th>Language</th><th>Location</th></tr>");
                    for (Twitter tweet : tweets) {
                        twbuf.append("<tr><td> <img src=" + tweet.getUser().getProfile_image_url() + "/></td>");
                        twbuf.append("<td>" + tweet.getUser().getName() + "</td>");
                        twbuf.append("<td>" + tweet.getCreated_at() + "</td>");
                        twbuf.append("<td>" + tweet.getText() + "</td>");
                        twbuf.append("<td>" + tweet.getMetadata().getIso_language_code() + "</td>");
                        twbuf.append("<td>" + tweet.getUser().getLocation() + "</td></tr>");
                    }
                    twbuf.append("</table>");

                    int neg = analysedata[0];
                    int neu = analysedata[1];
                    int pos = analysedata[2];
                    int noen = analysedata[3];
                    int tot = analysedata[4];
                    float negp = (neg * 100 / tot);
                    float neup = (neu * 100 / tot);
                    float posp = (pos * 100 / tot);
                    float noenp = (noen * 100 / tot);

                    twbuf.append("<h2>Sentiment analysis</h2>"); 
                    twbuf.append("<table class=\"myTable\" styleClass=\"outerTable\" headerClass=\"listTable\" footerClass=\"listTable\" "
                            + "columnClasses=\"checkBoxStyle,custNameStyle,notesStyle\" width=\"50%\"   "
                            + "cellspacing=\"0\" rowClasses=\"listContentEven,listContentOdd\" border=\"1\"align=\"center\">");
                    twbuf.append("<tr><th>Data Type</th><th>Negative</th><th>Neutral</th><th>Positive</th><th>Not English</th><th>Tweets in Total</th></tr>");
                    twbuf.append("<tr><td>Count Number</td>");
                    twbuf.append("<td>" + neg + "</td>");
                    twbuf.append("<td>" + neu + "</td>");
                    twbuf.append("<td>" + pos + "</td>");
                    twbuf.append("<td>" + noen + "</td>");
                    twbuf.append("<td>" + tot + "</td></tr>");
                    twbuf.append("<tr><td>Count Number</td>");
                    twbuf.append("<td>" + negp + "%</td>");
                    twbuf.append("<td>" + neup + "%</td>");
                    twbuf.append("<td>" + posp + "%</td>");
                    twbuf.append("<td>" + noenp + "%</td>");
                    twbuf.append("</tr>");
                    twbuf.append("</table>");

                    twbuf.append("<h2><a href=chart.jsp?negp=" + negp + "&neup=" + neup + "&posp=" + posp + "&noenp=" + noenp + ">Check percentage pie chart</a></h2>");

                    twbuf.append("<br/><hr class=\"myHr\"/><br/>");
                    out.println(twbuf.toString());

                    //Print Positive tweets
                    StringBuilder twpbuf = new StringBuilder();
                    twpbuf.append("<h2>Positive Tweets</h2>");
                    twpbuf.append("<table class=\"myTable\" styleClass=\"outerTable\" headerClass=\"listTable\" footerClass=\"listTable\" "
                            + "columnClasses=\"checkBoxStyle,custNameStyle,notesStyle\" width=\"90%\"   "
                            + "cellspacing=\"0\" rowClasses=\"listContentEven,listContentOdd\" border=\"1\"align=\"center\">");
                    twpbuf.append("<tr><th></th><th>Name</th><th>Create Time</th><th>Tweet</th><th>Language</th><th>Location</th></tr>");
                    if (postw.size() < 3) {
                        for (Twitter tweet : postw) {
                            twpbuf.append("<tr><td> <img src=" + tweet.getUser().getProfile_image_url() + "/></td>");
                            twpbuf.append("<td>" + tweet.getUser().getName() + "</td>");
                            twpbuf.append("<td>" + tweet.getCreated_at() + "</td>");
                            twpbuf.append("<td>" + tweet.getText() + "</td>");
                            twpbuf.append("<td>" + tweet.getMetadata().getIso_language_code() + "</td>");
                            twpbuf.append("<td>" + tweet.getUser().getLocation() + "</td></tr>");
                        }
                    } else {
                        for (int i = 0; i < 3; i++) {
                            Twitter tweet = postw.get(i);
                            twpbuf.append("<tr><td> <img src=" + tweet.getUser().getProfile_image_url() + "/></td>");
                            twpbuf.append("<td>" + tweet.getUser().getName() + "</td>");
                            twpbuf.append("<td>" + tweet.getCreated_at() + "</td>");
                            twpbuf.append("<td>" + tweet.getText() + "</td>");
                            twpbuf.append("<td>" + tweet.getMetadata().getIso_language_code() + "</td>");
                            twpbuf.append("<td>" + tweet.getUser().getLocation() + "</td></tr>");
                        }
                    }

                    twpbuf.append("</table><br/>");

                    out.println(twpbuf.toString());

                    //Print negative tweets
                    StringBuilder twnbuf = new StringBuilder();
                    twnbuf.append("<h2>Negative Tweets</h2>");
                    twnbuf.append("<table class=\"myTable\" styleClass=\"outerTable\" headerClass=\"listTable\" footerClass=\"listTable\" "
                            + "columnClasses=\"checkBoxStyle,custNameStyle,notesStyle\" width=\"90%\"   "
                            + "cellspacing=\"0\" rowClasses=\"listContentEven,listContentOdd\" border=\"1\"align=\"center\">");
                    twnbuf.append("<tr><th></th><th>Name</th><th>Create Time</th><th>Tweet</th><th>Language</th><th>Location</th></tr>");
                    if (negtw.size() < 3) {
                        for (Twitter tweet : negtw) {
                            twnbuf.append("<tr><td> <img src=" + tweet.getUser().getProfile_image_url() + "/></td>");
                            twnbuf.append("<td>" + tweet.getUser().getName() + "</td>");
                            twnbuf.append("<td>" + tweet.getCreated_at() + "</td>");
                            twnbuf.append("<td>" + tweet.getText() + "</td>");
                            twnbuf.append("<td>" + tweet.getMetadata().getIso_language_code() + "</td>");
                            twnbuf.append("<td>" + tweet.getUser().getLocation() + "</td></tr>");
                        }
                    } else {
                        for (int i = 0; i < 3; i++) {
                            Twitter tweet = negtw.get(i);

                            twnbuf.append("<tr><td> <img src=" + tweet.getUser().getProfile_image_url() + "/></td>");
                            twnbuf.append("<td>" + tweet.getUser().getName() + "</td>");
                            twnbuf.append("<td>" + tweet.getCreated_at() + "</td>");
                            twnbuf.append("<td>" + tweet.getText() + "</td>");
                            twnbuf.append("<td>" + tweet.getMetadata().getIso_language_code() + "</td>");
                            twnbuf.append("<td>" + tweet.getUser().getLocation() + "</td></tr>");

                        }
                    }

                    twnbuf.append("</table>");
                    out.println(twnbuf.toString());

                } catch (Exception e) {
                    out.println(e.getMessage());

                    restClient.close();
                }%>
            <br/><br/><br/><br/>
        </article>
        <footer>
            <h2>This website Copyright by TLI</h2>
        </footer>
    </body>
</html>
