# ComplaintPortal

A web-based Complaint Management System developed using Java, JSP, Servlets, JDBC, and MySQL. The application enables users to register, log in, submit complaints, and track their complaint status. Administrators can efficiently manage complaints by viewing, filtering, resolving, and deleting them through a secure role-based dashboard.

---

## Overview

ComplaintPortal is designed to simplify the complaint management process within an organization or educational institution. The system provides separate access for users and administrators, ensuring secure complaint handling through Role-Based Access Control (RBAC).

---

## Features

### User Features

- User Registration
- Secure Login & Logout
- Session Management
- Submit New Complaint
- View Personal Complaints
- Track Complaint Status
- Search Complaints

### Admin Features

- Secure Admin Login
- View All Complaints
- Filter Complaints by Role
- Resolve Complaints
- Delete Complaints
- Complaint Management Dashboard

---

## Technologies Used

### Backend

- Java
- JSP
- Servlets
- JDBC

### Frontend

- HTML5
- CSS3
- JavaScript
- React (Search Component)

### Database

- MySQL

### Server

- Apache Tomcat 10

### Development Environment

- Eclipse IDE

---

## System Modules

### Authentication Module

- User Registration
- Login Validation
- Session Handling
- Logout

### Complaint Module

- Add Complaint
- View Complaint
- Complaint Status Tracking

### Administration Module

- Dashboard
- Complaint Filtering
- Complaint Resolution
- Complaint Deletion

---

## Project Structure

```
ComplaintPortal/
│
├── src/
│   └── com/
│       └── project/
│           ├── db/
│           └── servlet/
│
├── WebContent/
│   ├── css/
│   ├── images/
│   ├── login.jsp
│   ├── register.jsp
│   ├── dashboard.jsp
│   ├── addComplaint.jsp
│   └── logout.jsp
│
├── database/
│   └── complaintportal.sql
│
├── screenshots/
│
├── README.md
└── .gitignore
```

---

## Database

### Database Name

```
complaintportal
```

### Tables

- users
- complaints

---

## User Roles

### User

- Register
- Login
- Submit Complaint
- View Only Own Complaints

### Admin

- View All Complaints
- Resolve Complaints
- Delete Complaints
- Filter Complaints

---

## Security Features

- Session-Based Authentication
- Role-Based Access Control (RBAC)
- JDBC Prepared Statements
- Restricted Admin Operations
- User-Specific Complaint Access

---

## Installation

### Clone Repository

```bash
git clone https://github.com/your-username/ComplaintPortal.git
```

### Configure Database

1. Create a MySQL database named:

```
complaintportal
```

2. Import:

```
complaintportal.sql
```

### Configure Eclipse

- Import Dynamic Web Project
- Add MySQL Connector/J
- Configure Apache Tomcat
- Run on Server

---

## Default Admin Account

Email

```
admin@gmail.com
```

Password

```
admin123
```

---

## Future Enhancements

- Email Notifications
- Password Encryption
- File Attachment Support
- Complaint Priority Levels
- Dashboard Analytics
- OTP-Based Authentication
- Responsive Mobile Interface

---

## Author

**Mantu Kumar**

B.Tech Computer Science and Engineering

GITAM University
