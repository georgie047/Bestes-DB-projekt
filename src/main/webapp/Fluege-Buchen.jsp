<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
  "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="net.froihofer.dbs.fluege.FluegeBuchen" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<html>
    <head>
        <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${contextPath}/css/main.css" />
        <title>Futurama</title>
    </head>
    <body>
        <div class="Headline">
            <h3>Flüge Buchen</h3>
        </div>
        
        <% if (request.getAttribute(FluegeBuchen.ERROR_MSG_PARAM) != null) { %>
            <p style="color: red"><%=request.getAttribute(FluegeBuchen.ERROR_MSG_PARAM)%></p>
        <% } %>
        <% if (request.getAttribute(FluegeBuchen.SUCCESS_MSG_PARAM) != null) { %>
            <p style="color: blue"><%=request.getAttribute(FluegeBuchen.SUCCESS_MSG_PARAM)%></p>
        <% } %>

        <div class="Main">                

            <!-- Save Buchung -->
            <c:if test="${param.Submit == 1}">
                
                
                
                
               <!-- c:redirect url = "./index.jsp"/> -->
            </c:if>            
        
        <sql:setDataSource dataSource="jdbc/FluegeDB" />   
        <sql:query var="weine" sql="SELECT * FROM bucht" />  
        <c:if test="${weine.rowCount == 0}">
          <p style="color: red;">Keine Einträge gefunden!</p>
        </c:if>
            
            <!-- Set Amount -->    
            <c:set var="Amount" value="${param.Amount}" scope = "page"/>
            <c:if test="${empty Amount}">
                <c:set var="Amount" value="1" scope = "page" />
            </c:if>

            
        
        
            <form method="POST" action="${contextPath}/FluegeBuchen">
                <p>Anzahl der Tickets: ${Amount} &emsp;
                    <button class="btn btn-primary" formmethod="post" name="Amount" value="${Amount+1}"> + </button>
                    <c:if test="${Amount > 1}">
                        <button class="btn btn-primary" formmethod="post" name="Amount" value="${Amount-1}"> - </button>
                    </c:if>                
                </p>
                
                <c:forEach var="i" begin="1" end="${Amount}" >
                    <div class="BuchenForm">
                        <p>Vorname:  &emsp;&emsp;                       <input name="Vorname" type="text" value="${param.Vorname}" placeholder="Vornname"/></p>
                        <p>Nachname: &emsp;&nbsp;                       <input name="Nachname" type="text" value="${param.Nachname}" placeholder="Nachname"/></p>
                        <p>SVNR:     &emsp;&emsp;&emsp;&nbsp;&nbsp;     <input name="SVNr" type="text" value="${param.SVNR}" placeholder="SVNR"/></p>
                    </div>
                </c:forEach>
                
                <button class="btn btn-primary" formmethod="post" name="Submit" value="1">Submit</button>

                   
                 <input type="hidden" name="Amount" value="${Amount}">
            </form>
        </div>
    </body>
</html>