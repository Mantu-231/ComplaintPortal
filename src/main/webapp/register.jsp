<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="auth-container">
    <div class="auth-box">
        <h2>Create Account</h2>
        <form action="RegisterServlet" method="post">
            <div class="form-group">
                <label>Name</label>
                <input type="text" name="name" placeholder="Enter your name" required>
            </div>
            <div class="form-group">
                <label>Email</label>
                <input type="email" name="email" placeholder="Enter your email" required>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" name="password" placeholder="Enter password" required>
            </div>
            <div class="form-group">
                <label>Role</label>
                <select name="role">
                    <option>Student</option>
                    <option>Teacher</option>
                    <option>Workers</option>
                    <option>Examination</option>
                </select>
            </div>
            <button type="submit">Register</button>
            <p class="register-link">Already have an account? <a href="login.jsp">Login</a></p>
        </form>
    </div>
</div>

</body>
</html>