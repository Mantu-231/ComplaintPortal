# ComplaintPortal

A web-based complaint management system built with Java, JSP, Servlets, JDBC and MySQL. Users register, log in, submit complaints and track their status. Administrators manage all complaints from a role-based dashboard, where they can view, filter, resolve and delete them.

## Screenshots

| Login | Dashboard |
|---|---|
| ![Login](docs/screenshots/login.png) | ![Dashboard](docs/screenshots/dashboard.png) |

## Features

**User**
- Registration, login, logout and session management
- Submit complaints and track their status
- View and search personal complaints

**Admin**
- Admin login with role-based access
- View, filter, resolve and delete all complaints
- Complaint management dashboard

## Tech Stack

| Category | Tools |
|---|---|
| Backend | Java, JSP, Servlets, JDBC |
| Frontend | HTML5, CSS3, JavaScript, React (search component) |
| Database | MySQL |
| Server | Apache Tomcat 10 |

## Access Control

- Session-based authentication
- Role-based access control: users see only their own complaints, admins manage all
- JDBC prepared statements for database access

## Run Locally

1. Clone the repository:
   ```bash
   git clone https://github.com/Mantu-231/ComplaintPortal.git
   ```
2. Create a MySQL database named `complaintportal` and import `complaintportal.sql`.
3. In Eclipse, import the project as a Dynamic Web Project, add the MySQL Connector/J library, configure Apache Tomcat 10 and run on the server.

Demo admin account (local use only):

```
Email:    admin@gmail.com
Password: admin123
```

## Future Enhancements

- Password hashing (BCrypt)
- Email notifications
- File attachments
- Complaint priority levels
- OTP-based authentication

## Author

**Mantu Kumar**, CSE student at GITAM University (Class of 2027)
