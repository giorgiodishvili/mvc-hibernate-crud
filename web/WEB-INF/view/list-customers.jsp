<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html>

<head>
    <title>List Customers</title>

    <!-- reference our style sheet -->

    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css"/>
    <style>
        html, body {
            margin-left: 15px;
            margin-right: 15px;
            padding: 0px;
            font-family: Verdana, Arial, Helvetica, sans-serif;
        }

        table {
            border-collapse: collapse;
            border-bottom: 1px solid gray;
            font-family: Tahoma, Verdana, Segoe, sans-serif;
            width: 72%;
        }

        th {
            border-bottom: 1px solid gray;
            background: none repeat scroll 0 0 #09c332;
            padding: 10px;
            color: #FFFFFF;
        }

        tr {
            border-top: 1px solid gray;
            text-align: center;
        }

        tr:nth-child(even) {
            background: #FFFFFF
        }

        tr:nth-child(odd) {
            background: #BBBBBB
        }

        #wrapper {
            width: 100%;
            margin-top: 0px;
        }

        #header {
            width: 70%;
            background: #09c332;
            margin-top: 0px;
            padding: 15px 0px 15px 15px;
        }

        #header h2 {
            width: 100%;
            margin: auto;
            color: #FFFFFF;
        }

        #container {
            width: 100%;
            margin: auto
        }

        #container h3 {
            color: #000;
        }

        #container #content {
            margin-top: 20px;
        }

        .add-button {
            border: 1px solid #666;
            border-radius: 5px;
            padding: 4px;
            font-size: 12px;
            font-weight: bold;
            width: 120px;
            padding: 5px 10px;

            margin-bottom: 15px;
            background: #cccccc;
        }
    </style>
</head>

<body>

<div id="wrapper">
    <div id="header">
        <h2>CRM - Customer Relationship Manager</h2>
    </div>
</div>

<div id="container">

    <div id="content">

        <input type="button" value="Add Customer"
               onclick="window.location.href='showFormForAdd'; return false;"
               class="add-button"
        />


        <!--  add our html table here -->
        <!--  add a search box -->
        <form:form action="search" method="GET">
            Search customer: <input type="text" name="theSearchName"/>

            <input type="submit" value="Search" class="add-button"/>
        </form:form>


        <table>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Action</th>
            </tr>

            <!-- loop over and print our customers -->
            <c:forEach var="tempCustomer" items="${customers}">
                <!-- construct update link with costumer id -->
                <c:url var="updateLink" value="/customer/showFormForUpdate">
                    <c:param name="customerId" value="${tempCustomer.id}"/>
                </c:url>
                <c:url var="deleteLink" value="/customer/delete">
                    <c:param name="customerId" value="${tempCustomer.id}"/>
                </c:url>
                <tr>
                    <td> ${tempCustomer.firstName} </td>
                    <td> ${tempCustomer.lastName} </td>
                    <td> ${tempCustomer.email} </td>
                    <td>
                        <!-- display the update link -->
                        <a href="${updateLink}">Update</a>
                        |
                        <a href="${deleteLink}"
                           onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
                    </td>
                </tr>

            </c:forEach>

        </table>

    </div>

</div>


</body>

</html>