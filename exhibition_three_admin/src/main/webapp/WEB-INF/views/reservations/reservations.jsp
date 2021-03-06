<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ include file="../commons/admin_session.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Reservations</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="http://localhost/exhibitionThreeAdmin/css/styles.css" rel="stylesheet" />
        <!-- jQeury CDN -->
		<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
  		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="http://localhost/exhibitionThreeAdmin/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="http://localhost/exhibitionThreeAdmin/assets/demo/chart-area-demo.js"></script>
        <script src="http://localhost/exhibitionThreeAdmin/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="http://localhost/exhibitionThreeAdmin/js/datatables-simple-demo.js"></script>
     	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
      hr {width:200px; margin: 0px auto; margin-top:10px;}
      #member_tab{ text-align:center;}
      .memberTitle{font-weight:bold}
</style>

<script type="text/javascript">
$(function(){
	 $("#findNamesBtn").click(function() {
	    	document.dataSearchFrm.submit();
		});//findNamesBtn
		
 	$("#rezDetail").on("show.bs.modal", function(e) {		
	   	var num= $(e.relatedTarget).data('num');
	 	$.ajax({
			url:"http://localhost/exhibitionThreeAdmin/admin/rezDetail.do",
			data: {"rezNum":num},
			async:false,
			type: "get",
			dataType:"json",
			error:function(xhr){
				console.log("rezDetail"+xhr.status+", "+xhr.statusText);
			},
			success:function(jsonObj){
				$("#exName").val(jsonObj.exName);				
				$("#exNum").val(jsonObj.exNum);				
				$("#resNum").val(num);				
				$("#userName").val(jsonObj.name);				
				$("#rezCount").val(jsonObj.rezCount);				
				$("#rezDate").val(jsonObj.rezDate);				
				$("#userId").val(jsonObj.userId);				
				$("#visitDate").val(jsonObj.visitDate);				
				$("#price").val(jsonObj.price);	
			}
		});//ajax		
 	});//rezDetail
 	
 	$("#confirmModify").click(function() {
		$("#confirmModal").modal('show');
	});
 	
});//ready

function confirmModify() {
	var num= $("#resNum").val();
	var rezCount=$("#rezCount").val();
	var visitDate=$("#visitDate").val();
		
	var now= new Date();
	
	if(rezCount<1){
		alert("????????? 1??? ????????????????????????.")
		return;
	}
	
	if(now > new Date(visitDate)){
		alert("????????? ??? ?????? ???????????????.");
		return;
			
	}
	if(rezCount=="" || visitDate==""){
		alert("??????????????? ??????????????? ???????????? ??? ????????????.");
		return;
	}
	 $.ajax({
		url:"http://localhost/exhibitionThreeAdmin/admin/rezModify.do",
		data: {"rez_count":rezCount, "visit_date":visitDate, "rez_num":num},
		async:false,
		type: "get",
		dataType:"json",
		error:function(xhr){
			console.log("confirmModify : "+xhr.status+", "+xhr.statusText);
		},
		success:function(jObj){
			if(jObj.msg=="??????"){
				alert("?????????????????????.");
				location.href="http://localhost/exhibitionThreeAdmin/admin/reservation.do";
			}
		}
	}); //ajax
} //confirmModify

function cancelRez() {
	var num= $("#rezNum").text();
	var rezStatus=$("#rezStatus").text();
	if(rezStatus!='f'){
	 $.ajax({
			url:"http://localhost/exhibitionThreeAdmin/admin/rezCancelorConfirm.do",
			data: {"rezNum":num, "rezStatus":rezStatus},
			type: "get",
			dataType:"json",
			error:function(xhr){
				alert("cancelAjax : "+xhr.status+", "+xhr.statusText);
			},
			success:function(jObj){
				if(jObj.cnt == 1){
					alert("????????? ?????????????????????.");
				} 
			}  
		}); //ajax */
	}// if
	else{ alert("?????? ????????? ???????????????.")}
	location.href="reservation.do";
}//cancelRez

//?????? ??????
function rezConfirm() {
	var num= $("#rezNum").text();
	var rezStatus=$("#rezStatus").text();
	if(rezStatus!='t'){
	 $.ajax({
			url:"http://localhost/exhibitionThreeAdmin/admin/rezCancelorConfirm.do",
			data: {"rezNum":num, "rezStatus":rezStatus},
			type: "get",
			dataType:"json",
			error:function(xhr){
				alert("cancelAjax : "+xhr.status+", "+xhr.statusText);
			},
			success:function(jObj){
				if(jObj.cnt == 1){
					alert("????????? ?????????????????????.");
				} 
			}  
		}); //ajax */
	}// if
	else alert("?????? ????????? ???????????????.");

	location.href="reservation.do";
}//rezConfirm
</script>
    </head>
   <body class="sb-nav-fixed">
   
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="http://localhost/exhibitionThreeAdmin/admin/index.do">Exhibition Admin</a>
<!--             Sidebar Toggle
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button> -->
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                </div>
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                       <li><a class="dropdown-item" href="http://localhost/exhibitionThreeAdmin/admin/settings.do">Settings</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="http://localhost/exhibitionThreeAdmin/admin/logout.do">Logout</a></li>
   					</ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                   <jsp:include page="../commons/navigation.jsp"/>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4" style="width:90%">
                        <h1 class="mt-4">?????? ??????</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="http://localhost/exhibitionThreeAdmin/admin/index.do" style="text-decoration:none; color:#333;">Dashboard</a></li>
                            <li class="breadcrumb-item active">?????? ??????</li>
                        </ol>
                        <!-- ????????? -->
						<div id="searchDiv">
                            <form class="d-flex" action="http://localhost/exhibitionThreeAdmin/admin/reservation.do" name="dataSearchFrm">
                            	<div class="input-group mb-3" style="width:300px; height:40px; margin-top:10px;" >
								  <span class="input-group-text" id="addon-wrapping">????????????</span>
					      		  <input type="date" name="vDate" class="form-control" placeholder="?????? ??????" style="width:200px;" id="vDate" value="${param.vDate}">
								</div>
	                         <div class="input-group mb-3" style="width:500px;margin-top:10px; margin-left: 100px;">
						  		<span class="input-group-text" id="addon-wrapping">????????????</span>
									 <select class="form-select" aria-label=".form-select-sm example" name="field" id="field">
									  <option value="name" ${(param.field =="name")?"selected":"" } >????????? ??????</option>
									  <option value="ex_name" ${(param.field =="ex_name")?"selected":""} >?????? ??????</option>
									</select>
								  <input type="text" class="form-control" style="width:100px" name="keyword" id="keyword" value="${param.keyword}">
								  <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal" id="findNamesBtn">??????</button>
								</div> 
						      </form>
                        	</div>
                        	
                        	<div class="form-check form-check-inline">
							</div>
						<div class="card-body">
                            <!-- ????????? ?????? -->
                              <table class="table table-hover" id="member_tab">
                            	<thead> 
							   <tr>
                                    	<th>????????????</th>
                                    	<th>?????????</th>
                                    	<th>?????????</th>
                                    	<th>????????????</th>
                                    	<th>????????????</th>
                                    	<th>??????</th>
                                   </tr>
						  	</thead> 
						  	<tbody>
						  	<tbody id="reservationBody"> 
						  	<c:choose>
						  	<c:when test="${empty rezList}">
						  		<tr>
								<td colspan="6">?????? ???????????? ????????????.</td>
								</tr>	
							</c:when>
							<c:otherwise>
							  	<c:forEach var="rezList" items="${rezList}">
								<tr style="cursor:pointer" data-bs-toggle="modal" data-bs-target="#rezDetail" data-num="${rezList.rez_num}"  class="rezList">
									<td id="rezNum"><c:out value="${rezList.rez_num}"/></td>
									<td><c:out value="${rezList.ex_name}"/></td>
									<td><c:out value="${rezList.name}"/></td>
									<td><fmt:formatDate value="${rezList.visit_date}" pattern="yyyy-MM-dd"/></td>
									<td id="rezStatus"><c:out value="${rezList.rez_status}"/></td>
									<td>
									 	<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#confirmCancel" >?????? ??????</button>
				        				<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#confirmOk">?????? ??????</button>
				        			</td>
							  	</c:forEach>
							</c:otherwise>
						  	</c:choose>
						  	</tbody> 
						  </table>
						  
                            </div>
                         <% String field=request.getParameter("field"); %>
						<% String keyword=request.getParameter("keyword"); %>
						<% String vDate=request.getParameter("vDate"); %>
						<% String pageScale=request.getParameter("pageScale"); %>
								<!-- ????????? -->
                            <div id="pageNavigation">
								<ul class="pagination justify-content-center"> 
								<c:if test="${not empty rezList}">
									<c:if test="${endPage gt pageCnt }">
										<c:set var="endPage" value="${pageCnt}"/>
									</c:if>
									
									<c:if test="${startPage gt pageBlock }">
									<li>
									<a style="margin-right:10px;text-decoration:none;"class="text-secondary page-item" 
							href="reservation.do?currentPage=${startPage-5}<%=!"".equals(pageScale)&&pageScale != null?"&vDate="+vDate+"&field="+field+"&keyword="+keyword+"&pageScale="+pageScale  : ""%>">
									??????
									</a>
									</li>
									</c:if>
									<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
										<c:choose>
										<c:when test="${i eq currentPage}">
											<li>
											<a style="margin-right:10px;"class="text-secondary" href="#void">
												<c:out value="${i}"/>
											</a>
											</li> 
										</c:when>
										<c:otherwise>
											<li>
											<a style="margin-right:10px;text-decoration:none;"class="text-secondary page-item" 
													href="reservation.do?currentPage=${i}<%=!"".equals(pageScale)&&pageScale != null?"&vDate="+vDate+"&field="+field+"&keyword="+keyword+"&pageScale="+pageScale  : ""%>">
											<c:out value="${i}"/>
											</a>
											</li> 
										</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:if test="${endPage lt pageCnt }">
									<li>
									<a style="margin-right:10px;text-decoration:none;"class="text-secondary page-item" 
										href="reservation.do?currentPage=${startPage+5}<%=!"".equals(pageScale)&&pageScale != null?"&vDate="+vDate+"&field="+field+"&keyword="+keyword+"&pageScale="+pageScale  : ""%>">
											??????
										</a>
										</li> 
									
									</c:if>
								</c:if>
								</ul> 
							</div>
						  <div>
						 	 <a href="mail.do" class="btn btn-dark" style="float:right;">????????? ??????</a>
						  </div>
							
                        </div>
						  <!-- ????????? ??? -->
			                </main>
			                <jsp:include page="../commons/admin_footer.html"/> 
							</div>
                        </div>
               <!-- ?????? ?????? ?????? ??????  -->
              
				<div class="modal fade" id="rezDetail" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel">?????? ?????? ??????</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
					 	<table class="modalTab" style="width:98%;" cellpadding="5">
					 		<tr>
					 			<th class="modalTh">?????????</th>
					 			<th class="modalTh">?????? ??????</th>
					 		</tr>
					 		<tr>
					 			<td class="modalTd"><input type="text" id="exName" class="form-control" readonly/></td>
					 			<td class="modalTd"><input type="text" id="exNum" class="form-control" style="width:100px" readonly/></td>
					 		</tr>
					 		<tr>
					 			<th class="modalTh">?????? ??????</th>
					 		</tr>
					 		<tr>
					 			<td class="modalTd"><input type="text" id="resNum" class="form-control" style="width:100px" readonly/></td>
					 		</tr>
					 		<tr>
					 			<th class="modalTh">????????????</th>
					 		</tr>
					 		
					 		<tr>
					 			<td class="modalTd"><input type="text" id="userName" class="form-control" style="width:100px" readonly/></td>
					 		</tr>
					 		
					 		<tr>
					 			<th class="modalTh">????????? ID</th>
					 		</tr>
					 		<tr>
					 			<td class="modalTd"><input type="text" id="userId" class="form-control" readonly/></td>
					 		</tr>
					 		
					 		<tr>
					 			<th class="modalTh">????????????</th>
					 		</tr>
					 		<tr>
					 			<td class="modalTd"><input id="rezCount" type="number" class="inputBox"/>
					 			<span id="countWarning" style="font-size:10px; color:#ff0000;"></span></td>
					 		</tr>
					 		<tr>
					 			<th class="modalTh">????????????</th>
					 		</tr>
					 		<tr>
					 			<td class="modalTd"><input type="date" id="rezDate" class="form-control" readonly/></td>
					 		</tr>
					 		<tr>
					 			<th class="modalTh">????????????</th>
					 		</tr>
					 		<tr>
					 			<td class="modalTd"><input id="visitDate" type="date" class="inputBox"/>
					 			<span id="visitWarning" style="font-size:10px; color:#ff0000;"></span></td>
					 		</tr>
					 		<tr>
					 			<th class="modalTh">????????????</th>
					 		</tr>
					 		<tr>
					 			<td class="modalTd" ><input type="text" id="price" class="form-control" readonly/></td>
					 		</tr>
					 	</table>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">????????????</button><!-- id="confirmModify"  -->
				        <button type="button" class="btn btn-outline-info" data-bs-toggle="modal" id="confirmModify">?????? ??????</button>
				      </div>
				    </div>
				  </div>
				</div>
	
				<!-- ???????????? ?????? modal -->
				<div class="modal fade" id="confirmCancel" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        ????????? ?????????????????????????
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Cancel</button>
				        <button type="button" class="btn btn-outline-info" onclick="cancelRez(${res.rezNum})">Ok</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- ?????? ?????? modal -->
				<div class="modal fade" id="confirmOk" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        ????????? ?????????????????????????
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Cancel</button>
				        <button type="button" class="btn btn-outline-info" onclick="rezConfirm(${res.rezNum})">Ok</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- ?????? ?????? modal -->
				<div class="modal fade" id="confirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        ?????????????????????????
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-outline-dark" data-bs-dismiss="modal">Cancel</button>
				        <button type="button" class="btn btn-outline-info" onclick="confirmModify(${res.rezNum})">Ok</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!--  -->
            </div>
        </div>
             
      
    </body>
</html>
