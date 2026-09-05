# ComplaintPortal

A web-based Complaint Management System built with Java, JSP, Servlets, JDBC, and MySQL. Users can register, log in, submit complaints, and track status. Administrators manage complaints through a secure, role-based dashboard — viewing, filtering, resolving, and deleting as needed.

## Overview

ComplaintPortal simplifies complaint handling within an organization or educational institution, with separate access for users and administrators secured via Role-Based Access Control (RBAC).

## Features

**User**
- Registration, secure login/logout, session management
- Submit new complaints
- View personal complaints & track status
- Search complaints

**Admin**
- Secure admin login
- View all complaints
- Filter complaints by role
- Resolve or delete complaints
- Complaint management dashboard

## Tech Stack

| Category | Tools |
|---|---|
| Backend | Java, JSP, Servlets, JDBC |
| Frontend | HTML5, CSS3, JavaScript, React (search component) |
| Database | MySQL |
| Server | Apache Tomcat 10 |
| IDE | Eclipse |

## System Modules

| Module | Responsibilities |
|---|---|
| Authentication | Registration, login validation, session handling, logout |
| Complaint | Add, view, and track complaint status |
| Administration | Dashboard, filtering, resolution, deletion |

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

## Database

**Database name:** `complaintportal`

**Tables:** `users`, `complaints`

## User Roles

| Role | Permissions |
|---|---|
| User | Register, log in, submit complaints, view own complaints only |
| Admin | View all complaints, filter, resolve, delete |

## Security Features

- Session-based authentication
- Role-Based Access Control (RBAC)
- JDBC prepared statements
- Restricted admin operations
- User-specific complaint access

## Installation

**1. Clone the repository**

```bash
git clone https://github.com/your-username/ComplaintPortal.git
```

**2. Configure the database**

Create a MySQL database named `complaintportal`, then import the schema:

```
database/complaintportal.sql
```

**3. Configure Eclipse**

- Import as a Dynamic Web Project
- Add the MySQL Connector/J library
- Configure Apache Tomcat
- Run on Server

## Default Admin Account

```
Email:    admin@gmail.com
Password: admin123
```

> ⚠️ **Demo credentials only.** Change these before deploying anywhere beyond local development — see [Future Enhancements](#future-enhancements) for planned password encryption.

## Future Enhancements

- Email notifications
- Password encryption
- File attachment support
- Complaint priority levels
- Dashboard analytics
- OTP-based authentication
- Responsive mobile interface

## Author

**Mantu Kumar**
B.Tech Computer Science and Engineering, GITAM University
