<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Login</title>
        <link href="http://localhost/exhibitionThreeAdmin/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
      
      
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <script type="text/javascript">
        $(function() {
        	$("#loginBtn").click(function() {
				$("#loginForm").submit();
			})
		
		});
        function enter(evt) {
			if(window.event.keyCode==13){
	        	$("#loginForm").submit();
			}
		}
        </script>
        
        <c:if test="${loginFail eq 1}">
        	<script type="text/javascript">
	        	alert("로그인 실패");
        	</script>
        </c:if>
    </head>
    
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">Login</h3></div>
                                    <div class="card-body" style="margin-top: 20px;">
                                        <form action="http://localhost/exhibitionThreeAdmin/admin/loginChk.do" method="post" id="loginForm">
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inEmail" type="email" name="id" placeholder="name@example.com" value="exhibition" onkeyup="enter()" />
                                                <label for="inputEmail">Email address</label>
                                            </div>
                                            <div class="form-floating mb-3">
                                                <input class="form-control" id="inPassword" type="password" name="password" placeholder="Password" value="exhibitionThree" onkeyup="enter()" />
                                                <label for="inputPassword">Password</label>
                                            </div>
                                            <div class="form-check mb-3">
                                            </div>
                                            <div class="d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="btn btn-primary" id="loginBtn" style="width:200px; margin: 0px auto;" >Login</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                	<jsp:include page="admin_footer.html"/>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="http://localhost/exhibitionThreeAdmin/js/scripts.js"></script>
    </body>
</html>