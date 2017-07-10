<%@page import="entity.Coreconf"%>
<%@page import="java.util.List"%>
<%@page import="client.CoREClient"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="resources/cssfile.css">
        <title>Search</title>
        <base href="<%=basePath%>">
        <script type="text/javascript">
            function search() {
                var url = document.getElementById("stype").value + document.getElementById("stext").value;
                sendRequest(url);
            }

            function confid() {
                var url = "getDataTitle.jsp?title=" + document.getElementById("confid").value;
                sendRequest(url);
            }
            function title1() {
                var url = "getDataTitle.jsp?title=" + document.getElementById("title").value;
                sendRequest(url);
            }
            function acronym() {
                var url = "getDataAcronym.jsp?acronym=" + document.getElementById("acronym").value;
                sendRequest(url);
            }
            function rank() {
                var url = "getDataRank.jsp?rank=" + document.getElementById("rank").value;
                sendRequest(url);
            }
            function forcode() {
                var url = "getDataForcode.jsp?forcode=" + document.getElementById("forcode").value;
                sendRequest(url);
            }
            var XMLHttpReq = false;
            function createXMLHttpRequest() {
                if (window.XMLHttpRequest) {
                    XMLHttpReq = new XMLHttpRequest();
                }
                else if (window.ActiveXObject) {
                    try {
                        XMLHttpReq = new ActiveXObject("Msxml2.XMLHTTP");
                    } catch (e) {
                        try {
                            XMLHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
                        } catch (e) {
                        }
                    }
                }
            }

            function sendRequest(url) {
                createXMLHttpRequest();
                XMLHttpReq.open("GET", url, true);
                XMLHttpReq.onreadystatechange = processResponse;
                XMLHttpReq.send(null);
            }

            function processResponse() {
                if (XMLHttpReq.readyState == 4) {
                    if (XMLHttpReq.status == 200) {
                        var result = XMLHttpReq.responseText;
                        document.getElementById("data").innerHTML = result;
                    } else {
                        window.alert("error on page");
                    }
                }
            }
        </script>
    </head> 
    <body>
        <div id="header">
            <header>
                <h1>Search for Conference</h1>
            </header>
        </div>

        <article>
            <a href="index.jsp"> <h1>Back to Index</h1></a>
            <hr class="myHr"/>

            <form name="SearchForm" >
            <table id="searchtable" class="myTable" cellspacing="0" border="0" >
                <tr><th>Search by </th>
                <th><select id="stype" name="stype" >
                    <option value="getDataId.jsp?confid=">Conf ID</option>
                    <option value="getDataTitle.jsp?title=">Title</option>
                    <option value="getDataAcronym.jsp?acronym=">Acronym</option>
                    <option value="getDataRank.jsp?rank=">Rank</option>
                    <option value="getDataForcode.jsp?forcode=">Forcode</option>
                </select>
                </th></tr>
                </table>
                <label id="l1">Search value: </label>
                    <input type="text" name="stext" id="stext"/>
                    <input type="button" value="Search" onclick="search()"/>
            
            </form>

            <!--  
          <table id="searchid" class="myTable" cellspacing="0" border="0" >
              <tr><th>Search by Id :</th></tr>
              <tr><td><input type="text" name="confid" id="confid"/></td>
                  <td><input class="myButton" type="button" value="submit" onclick="confid()"/></td></tr>
          </table>
          <table id="searchtitle" class="myTable" cellspacing="0" border="0" >
              <tr><th>Search by Title :</th></tr>
              <tr><td><input type="text" name="title" id="title"/></td>
                  <td><input class="myButton" type="button" value="submit" onclick="title1()"/></td></tr>
          </table>
          <table id="searchacronym" class="myTable" cellspacing="0" border="0" >
              <tr><th>Search by Acronym :</th></tr>
              <tr><td><input type="text" name="acronym" id="acronym"/></td>
                  <td><input type="button" value="submit" onclick="acronym()"/></td></tr>
          </table>
          <table id="searchrank" class="myTable" cellspacing="0" border="0" >
              <tr><th>Search by Rank :</th></tr>
              <tr><td><input type="text" name="rank" id="rank"/></td>
                  <td><input type="button" value="submit" onclick="rank()"/></td></tr>
          </table>
          <table id="searchforcode" class="myTable" cellspacing="0" border="0" >
              <tr><th>Search by Forcode :</th></tr>
              <tr><td><input type="text" name="forcode" id="forcode"/></td>
                  <td><input type="button" value="submit" onclick="forcode()"/></td></tr>
          </table>
            -->

            <div id="data"><h2>Press search button for result.</h2></div>
            <br/><br/><br/><br/>
        </article>

        <footer>
            <h2>This website Copyright by TLI</h2>
        </footer>
    </body>
</html>