<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Shop- Library Management System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
       
    <link rel="stylesheet" href="styles1.css">
<link rel="stylesheet" href="<%= application.getContextPath() %>/css/style2.css">
</head>

<body>

  
  <jsp:include page="nav.jsp"/>
<section id="hero">
    <div id="heroCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
         
            <div class="carousel-item active">
                <img src="img/books.png" class="d-block w-100" alt="First Slide">
                <div class="carousel-caption d-none d-md-block">
                    <h1>Your Source of Premium Books!</h1>
                    <p>Find the best books in our store.</p>
                    <a href="#" class="btn btn-warning">Shop Now!</a>
                </div>
            </div>
           
            <div class="carousel-item">
                <img src="img/glasses-1052010_640.jpg" class="d-block w-100" alt="Second Slide">
                <div class="carousel-caption d-none d-md-block">
                    <h1>Discover New Titles!</h1>
                    <p>Explore our collection of new arrivals.</p>
                    <a href="#" class="btn btn-warning">Browse Now!</a>
                </div>
            </div>
           
            <div class="carousel-item">
                <img src="img/books-bookstore-book-reading-159711.jpeg" class="d-block w-100" alt="Third Slide">
                <div class="carousel-caption d-none d-md-block">
                    <h1>Top Rated Books!</h1>
                    <p>Check out what everyone is reading.</p>
                    <a href="#" class="btn btn-warning">See Bestsellers!</a>
                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#heroCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#heroCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</section>

    
    <section id="featured" class="py-5">
        <div class="container">
            <div class="row text-center">
                <div class="col-lg-4 col-md-4 col-sm-6 mb-4">
                    <div class="card">
                        <img src="img/books-bookstore-book-reading-159711.jpeg" class="card-img-top" alt="Current Bestsellers">
                        <div class="card-body">
                            <h5 class="card-title">Current Bestsellers</h5>
                        </div>
                    </div>
                </div>
            <div class="col-lg-4 col-md-4 col-sm-6 mb-4">
                    <div class="card">
                        <img src="img/000_32D92PQ-1.jpg" class="card-img-top" alt="Editor's Picks">
                        <div class="card-body">
                            <h5 class="card-title">Editor's Picks</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-6 mb-4">
                    <div class="card">
                        <img src="img/open-book-1428428_640.jpg" class="card-img-top" alt="Featured Authors">
                        <div class="card-body">
                            <h5 class="card-title">Featured Authors</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


    <section id="featured-products" class="py-5 ">
        <div class="container bg">
            <h2 class="text-center mb-4">Featured Products</h2>
            <div class="row">
                <div class="col-md-4 mt-1">
                    <div class="card">
                        <img src="img/art-museum-books-sticker.jpg" class="card-img-top" alt="Product 1">
                        <div class="card-body">
                            <h5 class="card-title">After Ever Happy</h5>
                            <p class="card-text">$258.96</p>
                            <div class="d-flex justify-content-between">
                                <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-cart"></i></a>
                                <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-heart"></i></a>
                                <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-eye"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mt-1">
                    <div class="card">
                        <img src="img/cta.jpg" class="card-img-top" alt="Product 1">
                        <div class="card-body">
                            <h5 class="card-title">After Ever Happy</h5>
                            <p class="card-text">$258.96</p>
                            <div class="d-flex justify-content-between">
                                <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-cart"></i></a>
                                <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-heart"></i></a>
                                <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-eye"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mt-1">
                    <div class="card">
                        <img src="img/the-magick-of-physics-9781797158259_hr.jpg" class="card-img-top" alt="Product 1">
                          <div class="card-body">
                            <h5 class="card-title">After Ever Happy</h5>
                            <p class="card-text">$258.96</p>
                            <div class="d-flex justify-content-between">
                                <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-cart"></i></a>
                                <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-heart"></i></a>
                                <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-eye"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mt-1">
                    <div class="card">
                        <img src="img/the-famous-five-collection-1-books-1-3.jpg" class="card-img-top" alt="Product 1">
                        <div class="card-body">
                            <h5 class="card-title">After Ever Happy</h5>
                            <p class="card-text">$258.96</p>
                            <div class="d-flex justify-content-between">
                                <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-cart"></i></a>
                                <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-heart"></i></a>
                                <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-eye"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="col-md-4 mt-1">
                    <div class="card">
                        <img src="img//000_32D92PQ-1.jpg" class="card-img-top" alt="Product 1">
                        <div class="card-body">
                            <h5 class="card-title">After Ever Happy</h5>
                            <p class="card-text">$258.96</p>
                            <div class="d-flex justify-content-between">
                                <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-cart"></i></a>
                                <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-heart"></i></a>
                                <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-eye"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                     <div class="col-md-4 mt-1">
                    <div class="card">
                        <img src="img/open-book-1428428_640.jpg" class="card-img-top" alt="Product 1">
                        <div class="card-body">
                            <h5 class="card-title">After Ever Happy</h5>
                            <p class="card-text">$258.96</p>
                            <div class="d-flex justify-content-between">
                                <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-cart"></i></a>
                                <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-heart"></i></a>
                                <a href="#" class="btn btn-outline-secondary btn-sm"><i class="bi bi-eye"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    
    <section id="cta" class="text-center">
        <div class="container">
            <h2>Instead of Buying, Why Not Rent a Book and Save?</h2>
            <p>Discover the benefits of renting your favorite books instead of buying them.</p>
        </div>
    </section>


    <footer class="bg-dark text-light py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h5>About Us</h5>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque nisl eros, pulvinar facilisis
                        justo mollis.</p>
                </div>
               
                <div class="col-md-6">
                    <h5>Newsletter</h5>
                    <form>
                        <div class="mb-3">
                            <label for="email" class="form-label">Enter your email here:</label>
                            <input type="email" class="form-control" id="email" placeholder="Email">
                        </div>
                        <button type="submit" class="btn btn-warning">Subscribe</button>
                    </form>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>