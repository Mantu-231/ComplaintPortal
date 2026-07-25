<%@ page import="java.sql.*,com.project.db.DBConnection" %>
<%
String user = (String) session.getAttribute("user");
String email = (String) session.getAttribute("email");
String userRole = (String) session.getAttribute("role");

if(user == null){
    response.sendRedirect("login.jsp");
    return;
}

String role = request.getParameter("role");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/style.css">

    <!-- ✅ React CDN -->
    <script src="https://unpkg.com/react@18/umd/react.development.js"></script>
    <script src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
    <script src="https://unpkg.com/babel-standalone@6/babel.min.js"></script>
</head>
<body>

<div class="dashboard-container">
    <h2>
<%= "Admin".equalsIgnoreCase(userRole) ? "Admin Dashboard" : "My Complaints" %>
<%= (role!=null ? " - " + role : "") %>
</h2>

    <% if("Admin".equalsIgnoreCase(userRole)){ %>

<div class="role-links">
    <a href="dashboard.jsp" class="<%= (role==null?"active":"") %>">All</a>
    <a href="dashboard.jsp?role=Student" class="<%= ("Student".equals(role)?"active":"") %>">Student</a>
    <a href="dashboard.jsp?role=Teacher" class="<%= ("Teacher".equals(role)?"active":"") %>">Teacher</a>
    <a href="dashboard.jsp?role=Workers" class="<%= ("Workers".equals(role)?"active":"") %>">Workers</a>
    <a href="dashboard.jsp?role=Examination" class="<%= ("Examination".equals(role)?"active":"") %>">Examination</a>
</div>

<% } %>

    <a href="addComplaint.jsp" class="btn">+ New Complaint</a>
    <a href="logout.jsp" class="btn">Logout</a>

    <!-- 🔥 React Search UI -->
    <div id="reactRoot"></div>

    <!-- ✅ TABLE WITH ID -->
    <table id="complaintTable">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Role</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <%
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = DBConnection.getConnection();
            if(con != null) {
            	if("Admin".equalsIgnoreCase(userRole)){

            	    if(role != null){
            	        ps = con.prepareStatement("SELECT * FROM complaints WHERE role=?");
            	        ps.setString(1, role);
            	    }else{
            	        ps = con.prepareStatement("SELECT * FROM complaints");
            	    }

            	}else{

            	    if(role != null){
            	        ps = con.prepareStatement(
            	                "SELECT * FROM complaints WHERE email=? AND role=?");
            	        ps.setString(1, email);
            	        ps.setString(2, role);
            	    }else{
            	        ps = con.prepareStatement(
            	                "SELECT * FROM complaints WHERE email=?");
            	        ps.setString(1, email);
            	    }

            	}
                rs = ps.executeQuery();
                while(rs.next()){
        %>

        <tr>
            <td><%=rs.getInt("id")%></td>
            <td><%=rs.getString("name")%></td>
            <td><%=rs.getString("role")%></td>
            <td><span class="status"><%=rs.getString("status")%></span></td>
            <td>

<% if("Admin".equalsIgnoreCase(userRole)){ %>

    <a href="UpdateServlet?id=<%=rs.getInt("id")%>" class="action-btn resolve-btn">Resolve</a>
    <a href="DeleteServlet?id=<%=rs.getInt("id")%>" class="action-btn delete-btn">Delete</a>

<% } else { %>

    <span style="color:green;">View Only</span>

<% } %>

</td>
        </tr>

        <%      
                }
            }
        } catch(Exception e){
            e.printStackTrace();
        } finally {
            try { if(rs!=null) rs.close(); } catch(Exception e){}
            try { if(ps!=null) ps.close(); } catch(Exception e){}
            try { if(con!=null) con.close(); } catch(Exception e){}
        }
        %>

    </table>
</div>

<!-- ✅ React Search Script -->
<script type="text/babel">
function DashboardInfo() {

    function handleSearch(e) {
        let filter = e.target.value.toLowerCase();
        let rows = document.querySelectorAll("#complaintTable tr");

        rows.forEach((row, index) => {
            if(index === 0) return;

            let text = row.innerText.toLowerCase();
            row.style.display = text.includes(filter) ? "" : "none";
        });
    }

    return (
        <div style={{
            margin: "20px 0",
            padding: "15px",
            background: "#f0f8ff",
            borderRadius: "8px",
            border: "1px solid #ccc"
        }}>
            <h3>Search Complaints 🔍</h3>
            <input 
                type="text" 
                placeholder="Search by name, role, status..."
                onChange={handleSearch}
                style={{
                    padding: "8px",
                    width: "100%",
                    marginTop: "10px"
                }}
            />
        </div>
    );
}

ReactDOM.createRoot(document.getElementById("reactRoot")).render(<DashboardInfo />);
</script>

</body>
</html>