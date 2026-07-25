<%@ page import="java.sql.*,com.project.db.DBConnection" %>
<%
String user = (String) session.getAttribute("user");
if(user == null) response.sendRedirect("login.jsp");
%>

<!DOCTYPE html>
<html ng-app="complaintApp">
<head>
    <title>AngularJS Dashboard</title>
    <link rel="stylesheet" href="css/style.css">

    <!-- AngularJS CDN -->
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.8.2/angular.min.js"></script>
</head>
<body>

<div class="dashboard-container" ng-controller="complaintCtrl">

    <h2>AngularJS Dashboard</h2>

    <!-- Search box using AngularJS -->
    <input type="text" ng-model="searchText" placeholder="Search complaints..." style="padding:8px; width:100%; margin-bottom:15px;">

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Role</th>
            <th>Status</th>
        </tr>
        <tr ng-repeat="c in complaints | filter:searchText">
            <td>{{c.id}}</td>
            <td>{{c.name}}</td>
            <td>{{c.role}}</td>
            <td>{{c.status}}</td>
        </tr>
    </table>

</div>

<script>
angular.module('complaintApp', [])
.controller('complaintCtrl', function($scope) {
    $scope.complaints = [];

    // Fetch data from backend (optional)
    // You can use JSP to generate JSON directly into the page
    <% 
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBConnection.getConnection();
            ps = con.prepareStatement("SELECT * FROM complaints");
            rs = ps.executeQuery();
            while(rs.next()){
    %>
        $scope.complaints.push({
            id: <%= rs.getInt("id") %>,
            name: "<%= rs.getString("name") %>",
            role: "<%= rs.getString("role") %>",
            status: "<%= rs.getString("status") %>"
        });
    <% 
            }
        } catch(Exception e){ e.printStackTrace(); }
        finally {
            try{ if(rs!=null) rs.close(); } catch(Exception e){}
            try{ if(ps!=null) ps.close(); } catch(Exception e){}
            try{ if(con!=null) con.close(); } catch(Exception e){}
        }
    %>
});
</script>

</body>
</html>