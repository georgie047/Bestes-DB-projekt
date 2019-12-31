<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <head>
        <c:set var="contextPath" value="${pageContext.request.contextPath}"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${contextPath}/css/main.css" />
        <title>Futurama</title>
    </head>
    <body>

        <div class="Headline">
            <h3>Headline</h3>
        </div>
        
        <div class="Main">                
            <h2>Tutorial</h2>
            
            <br>
            <h4>Re/Deploy Database</h4>
            <a>
                Deploy Database:
            <br>
                    &emsp;Im GitRepo ist das neueste DB File  pfad: Bestes-DB-projekt/Webpage and Database Design/Database Design/DB.sql
            <br>
                    &emsp;Öffen des DB.sql file via SQL Workbench und ausführen
            <br>
                Redeploy Database:
            <br>
                    &emsp;Drop database in  SQL Workbench
            <br>
                    &emsp;Öffen des DB.sql file via SQL Workbench und ausführen
            </a>

            <br>
            <br>
            
            <h4>Erste Configuration (wird gebraucht):</h4>
                In das configfile einfügen (wie bei der Vorbereitung) pfad: .../apache-tomcat-x.xx./conf/context.xml
                
                <pre>           
                    &#60;Resource name="jdbc/FluegeDB" auth="Container" type="javax.sql.DataSource"
                    username="root" password="yourDBpassword" 
                    driverClassName="com.mysql.jdbc.Driver"
                    url="jdbc:mysql://localhost/dbs_spacetravel?useSSL=false&amp;allowPublicKeyRetrieval=true&amp;serverTimezone=CET" 
                    maxTotal="8" maxIdle="4"
                    testOnBorrow="true" validationQuery="SELECT 1 FROM flug LIMIT 1"/&#62;

                    &#60;Resource name="jdbc/WeineDB" auth="Container" type="javax.sql.DataSource"
                        username="root" password="yourDBpassword" 
                        driverClassName="com.mysql.jdbc.Driver"
                        url="jdbc:mysql://localhost/dbs_weine?useSSL=false&amp;allowPublicKeyRetrieval=true&amp;serverTimezone=CET" 
                        maxTotal="8" maxIdle="4"
                    testOnBorrow="true" validationQuery="SELECT 1 FROM Weine LIMIT 1"/&#62;
                </pre>
            
            <br>
            <br>            
            <h4>Jsp template:</h4>
            <pre>           
                &#60;&#37;@page contentType="text/html" pageEncoding="UTF-8"&#37;&#62;
                &#60;!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
                "http://www.w3.org/TR/html4/loose.dtd"&#62;
                &#60;&#37;@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" &#37;&#62;

                &#60;html&#62;
                    &#60;head&#62;
                        &#60;c:set var="contextPath" value="${pageContext.request.contextPath}"/&#62;
                        &#60;meta http-equiv="Content-Type" content="text/html; charset=UTF-8"&#62;
                        &#60;link rel="stylesheet" href="${contextPath}/css/main.css" /&#62;
                    &#60;title&#62;Futurama&#60;/title&#62;
                    &#60;/head&#62;
                    
                    &#60;body&#62;

                        &#60;div class="Headline"&#62;
                            &#60;h3&#62;Headline&#60;/h3&#62;
                        &#60;/div&#62;

                        &#60;div class="Main"&#62;                
                            &#60;h2&#62;Content&#60;/h2&#62;           
                        &#60;/div&#62;
                    &#60;/body&#62;
                &#60;/html&#62;
            </pre>
                    
            <br>
            <br>            
            <h4>Java Servlet Erstellen:</h4>
            Servlet mapping Herstellen: <br> 
            Foldende zeilen zu /Web Pages/WEB-INF/web.xml hinzufügen und anpassen
            <pre>
                &#60;servlet&#62;
                  &#60;servlet-name>Servlet&#60;/servlet-name&#62;
                  &#60;servlet-class&#62;net.froihofer.dbs.fulege.Servlet&#60;/servlet-class&#62;
                &#60;/servlet&#62;
                &#60;servlet-mapping&#62;
                  &#60;servlet-name&#62;Servlet&#60;/servlet-name&#62;
                  &#60;url-pattern&#62;<font color="red">/Servlet</font>&#60;/url-pattern&#62;
                &#60;/servlet-mapping&#62;                
            </pre>
            Verbindung in jsp Herstellen: <br>
            <pre>
                &#60;from method="POST" action="&#36;&#123;contextPath&#125;<font color="red">/Servlet</font>"&#62;
                    Diverse Html/JSTL inputs
                &#60;/form&#62;
            </pre>
            Verbindung in java Herstellen: <br>
            <pre>
                req.getRequestDispatcher("/<font color="red">JSPPartofServlet.jsp</font>").forward(req, resp);
            </pre>
            Die doPost / doGet function wird automatisch bei dem aufruf ausgefürht

            <br>
            <br>            
            <h4>SQL Verwenden</h4>
            SQL Abfragen in jsp Files: <br>
                &emsp; Im header Hinzufügen:
            <pre>
               &#60;&#37;@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" &#37;&#62;
            </pre>
               &emsp; Code im Body:
            <pre>
               &#60;sql:setDataSource dataSource="jdbc/FluegeDB" /&#62;
               &#60;sql:query var="fluege" sql="SELECT * FROM flug" /&#62;
               &#60;c:forEach var="flug" items="${fluege.rows}"&#62;

            </pre>
            Wenn man daten in die Datenbank einfügen will: <br>
                &emsp; Überprüfen ob die entity klasse im persistence.xml vorhanden ist pfad: /OtherSources/src/main/resources/META-INF &emsp; dann Tap Source wählen
            <pre>
               &#60;class&#62;net.froihofer.dbs.fluege.entities.<font color="red">xxx</font>&#60;/class&#62;
            </pre>
        </div>
    </body>
</html>
