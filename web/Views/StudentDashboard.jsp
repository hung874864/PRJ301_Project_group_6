<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard - Dorm Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f7f6;
            color: #2c3e50;
        }

        /* Navbar Style */
        .navbar {
            background-color: #2c3e50 !important; /* Slate */
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        /* Card Styles */
        .card {
            border: none;
            border-radius: 12px;
            overflow: hidden;
            transition: transform 0.2s;
        }

        .card-header {
            font-weight: 600;
            border-bottom: none;
            padding: 15px 20px;
        }

        .bg-slate { background-color: #2c3e50 !important; color: white; }
        .bg-blue { background-color: #3498db !important; color: white; }
        .bg-accent { background-color: #f39c12 !important; color: white; }

        /* Form Controls */
        .form-label { font-weight: 600; color: #34495e; }
        .form-control:read-only { background-color: #e9ecef; }
        
        /* Table Styles */
        .table thead { background-color: #34495e; color: white; }
        
        .btn-primary-custom {
            background-color: #3498db;
            border: none;
            font-weight: 600;
            padding: 10px;
        }
        .btn-primary-custom:hover { background-color: #2980b9; }

        .status-badge {
            padding: 5px 12px;
            border-radius: 20px;
            font-size: 0.85rem;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark mb-4">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">Dorm Management</a>
        <div class="d-flex align-items-center">
            <span class="navbar-text me-3 text-white">
                Welcome, <strong>${sessionScope.account.username}</strong>!
            </span>
            <a href="${pageContext.request.contextPath}/Logout" class="btn btn-outline-light btn-sm">Logout</a>
        </div>
    </div>
</nav>

<div class="container">
    <%-- Alerts for feedback --%>
    <c:if test="${not empty message}">
        <div class="alert alert-success alert-dismissible fade show border-0 shadow-sm" role="alert">
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </c:if>

    <div class="row">
        <div class="col-md-5 mb-4">
            <div class="card shadow-sm">
                <div class="card-header bg-slate">
                    <h5 class="card-title mb-0">Personal Profile</h5>
                </div>
                <div class="card-body p-4">
                    <form action="Student" method="POST">
                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" class="form-control" name="username" value="${student.username}" readonly>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text" class="form-control" name="fullName" value="${student.fullName}" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Date of Birth</label>
                            <input type="date" class="form-control" name="birthDate" value="${student.birthDate}" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Gender</label>
                            <select class="form-select" name="gender">
                                <option value="Male" ${student.gender == 'Male' ? 'selected' : ''}>Male</option>
                                <option value="Female" ${student.gender == 'Female' ? 'selected' : ''}>Female</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phone Number</label>
                            <input type="text" class="form-control" name="phone" value="${student.phone}">
                        </div>
                        <button type="submit" class="btn btn-primary-custom text-white w-100 mt-2">Update Information</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-7">
            <div class="card shadow-sm mb-4">
                <div class="card-header bg-blue">
                    <h5 class="card-title mb-0">Room Information</h5>
                </div>
                <div class="card-body p-4">
                    <c:choose>
                        <c:when test="${room != null}">
                            <div class="row g-3">
                                <div class="col-6">
                                    <small class="text-muted d-block">Room Name</small>
                                    <span class="fw-bold">${room.roomName}</span>
                                </div>
                                <div class="col-6">
                                    <small class="text-muted d-block">Capacity</small>
                                    <span class="fw-bold">${room.maxStudents} Persons</span>
                                </div>
                                <div class="col-6">
                                    <small class="text-muted d-block">Price</small>
                                    <span class="fw-bold text-success">${room.price} VND</span>
                                </div>
                                <div class="col-6">
                                    <small class="text-muted d-block">Status</small>
                                    <span class="status-badge bg-success text-white">Assigned</span>
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="text-center py-3">
                                <p class="text-muted mb-0">No room assigned yet.</p>
                                <small>Please contact the administrator.</small>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <div class="card shadow-sm">
                <div class="card-header bg-accent">
                    <h5 class="card-title mb-0">Utility Bills</h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <thead>
                                <tr>
                                    <th class="ps-4">Year</th>
                                    <th>Electricity</th>
                                    <th>Water</th>
                                    <th class="pe-4">Total</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${bill != null}">
                                        <tr>
                                            <td class="ps-4">${bill.year}</td>
                                            <td>${bill.electricity}</td>
                                            <td>${bill.water}</td>
                                            <td class="pe-4 fw-bold text-danger">${bill.electricity + bill.water}</td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="4" class="text-center py-4 text-muted">No billing records found.</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>