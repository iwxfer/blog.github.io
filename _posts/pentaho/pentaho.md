!External articles

    * [[Retail example|http://philip.greenspun.com/sql/data-warehousing.html]]
    * [[Star vs Snowflake|http://www.simple-talk.com/content/print.aspx?article=592]]

    *[[Download|http://sourceforge.net/projects/pentaho/files/]]
    *[[Dashboard Tools - Webdetails|http://www.webdetails.pt/]]
    *[[Pentaho HTML5 Integration|http://forums.pentaho.com/archive/index.php/t-78268.html]]
    *[[Classic dashboards|http://wiki.pentaho.com/display/COM/A+Dashboard+Framework+for+the+Pentaho+BI+Platform]]
    *[[Run Kettle Job for each Row|http://type-exit.org/adventures-with-open-source-bi/2010/06/run-kettle-job-for-each-row/]]
    *[[Loops in Kettle Jobs|http://type-exit.org/adventures-with-open-source-bi/2010/06/kettle-quick-hint-loops-in-kettle-jobs/]]
    *[[Develop Dashboards with CDE|http://www.tikalk.com/incubator/blog/creating-bugzilla-dashboard-%E2%80%93-hands-cde-tutorial-%E2%80%93-fuse-day-3-session-summary]]

    !My cheat sheets
    [[Install-Pentaho|install-pentaho-server]]
    [[Manual configuration Hibernate|pentaho-hibernate-configuration]]
    [[Publish Mondrian Schemas|publish-pentaho-mondrian-schemes]]
    [[Change Password in Admin Console|change-pentaho-password-admin-console]]

# getting started #
Set your directories of work `/opt/pentaho/administration-console/resource/config/console.xml`

    <console>
      <solution-path>../biserver-ce/pentaho-solutions</solution-path>
      <war-path>../biserver-ce/tomcat/webapps/pentaho</war-path>
      ...

Add your IP server in /opt/pentaho/biserver-ce/tomcat/webapps/pentaho/WEB-INF/web.xml

    <param-name>solution-path</param-name>
    <param-value>/opt/pentaho/biserver-ce/pentaho-solutions/</param-value>
    ...
    <param-name>fully-qualified-server-url</param-name>
    <param-value>http://localhost:8080/pentaho/</param-value>
    ...
    <param-name>TrustedIpAddrs</param-name>
    <param-value>10.0.0.138,127.0.0.1</param-value>
    ...

You have to login with the same user/pass on both bi-server and admin-console

Config MySQL Driver/URL in `/opt/pentaho/biserver-ce/pentaho-solutions/system/applicationContext-spring-security-jdbc.xml`

    org.hsqldb.jdbcDriver  --> com.mysql.jdbc.Driver
    jdbc:hsqldb:hsql://localhost:9001/hibernate  --> jdbc:mysql://localhost:3306/hibernate

At the end it should look like this:

    <!--  This is only for Hypersonic. Please update this section for any other database you are using -->
    <bean id="dataSource"
                class="org.springframework.jdbc.datasource.DriverManagerDataSource">
                <property name="driverClassName" value="com.mysql.jdbc.Driver" />
                <property name="url"
                        value="jdbc:mysql://localhost:3306/hibernate" />
                <property name="username" value="hibuser" />
                <property name="password" value="password" />
    </bean>

Change the file `/opt/pentaho/biserver-ce/pentaho-solutions/system/applicationContext-spring-security-hibernate.properties`

    jdbc.driver==com.mysql.jdbc.Driver
    jdbc.url=jdbc:mysql://localhost:3306/hibernate
    jdbc.username=hibuser
    jdbc.password=password
    hibernate.dialect=org.hibernate.dialect.MySQLDialect

Change to MySQL driver in `/opt/pentaho/biserver-ce/pentaho-solutions/system/hibernate/hibernate-settings.xml`

    <config-file>system/hibernate/mysql5.hibernate.cfg.xml</config-file>

Change `/opt/pentaho/biserver-ce/tomcat/webapps/pentaho/META-INF/context.xml`

    <?xml version="1.0" encoding="UTF-8"?>
    <Context path="/pentaho" docbase="webapps/pentaho/">
            <Resource name="jdbc/Hibernate" auth="Container" type="javax.sql.DataSource"
                    factory="org.apache.commons.dbcp.BasicDataSourceFactory" maxActive="20" maxIdle="5"
                    maxWait="10000" username="hibuser" password="password"
                    driverClassName="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/hibernate"
                    validationQuery="select 1" />

            <Resource name="jdbc/Quartz" auth="Container" type="javax.sql.DataSource"
                    factory="org.apache.commons.dbcp.BasicDataSourceFactory" maxActive="20" maxIdle="5"
                    maxWait="10000" username="pentaho_user" password="password"
                    driverClassName="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/quartz"
                    validationQuery="select 1"/>
    </Context>

Config Email in `/opt/pentaho/bi-server/pentaho-solutions/system/smtp-email/email_config.xml`

Disable HSQLDB: Comment in `/opt/pentaho/biserver-ce/tomcat/webapps/pentaho/WEB-INF/web.xml`

    <context-param>
      <param-name>hsqldb-databases</param-name>
      <param-value>sampledata@../../data/hsqldb/sampledata,hibernate@../../data/hsqldb/hibernate,quartz@../../data/hsqldb/quartz</param-value>
    </context-param>
    ...
    <listener>
      <listener-class>org.pentaho.platform.web.http.context.HsqldbStartupListener</listener-class>
    </listener>
    ...

* Disable Login List
1. In the file `/opt/pentaho/biserver-ce/tomcat/webapps/pentaho/mantleLogin/loginsettings.properties`
2. Change `#showUsersList=true` to `showUsersList=false`
