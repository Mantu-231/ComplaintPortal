<!DOCTYPE html>
<html>
<head>
    <title>Add Complaint</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="auth-container">
    <div class="auth-box">
        <h2>Add Complaint</h2>
        <form action="AddComplaintServlet" method="post">
            <div class="form-group">
                <label>Your Name</label>
                <input type="text" name="name" placeholder="Enter your name" required>
            </div>
            <div class="form-group">
                <label>Role</label>
                <select name="role" required>
                    <option>Student</option>
                    <option>Teacher</option>
                    <option>Workers</option>
                    <option>Examination</option>
                </select>
            </div>
            <div class="form-group">
                <label>Category</label>
                <input type="text" name="category" placeholder="Enter category">
            </div>
            <div class="form-group">
                <label>Complaint Details</label>
                <textarea name="description" placeholder="Enter complaint details" required></textarea>
            </div>
            <button type="submit">Submit</button>
        </form>
    </div>
</div>

</body>
</html>