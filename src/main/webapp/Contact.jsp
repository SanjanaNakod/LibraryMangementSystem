<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Library Management System</title>
    <!-- Bootstrap CSS CDN -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="nav.jsp"/>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-8 offset-md-2">
                <h1 class="text-center mb-4">Contact Us</h1>
                <p class="text-center">If you have any questions, suggestions, or concerns, feel free to reach out to us! Fill out the form below, and we will get back to you as soon as possible.</p>

                <form action="submitContactForm.jsp" method="post" class="mt-4">
                    <div class="form-group">
                        <label for="name">Your Name:</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Your Email:</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
                    </div>

                    <div class="form-group">
                        <label for="message">Your Message:</label>
                        <textarea class="form-control" id="message" name="message" rows="5" placeholder="Type your message here" required></textarea>
                    </div>

                    <button type="submit" class="btn btn-primary btn-block">Submit</button>
                </form>

                <div class="info mt-5 p-4 bg-light border rounded">
                    <h5>Library Information</h5>
                    <p><strong>Address:</strong> 123 Library Lane, Booktown, ABC 12345</p>
                    <p><strong>Phone:</strong> +123 456 7890</p>
                    <p><strong>Email:</strong> info@librarysystem.com</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies (Popper.js and jQuery) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
