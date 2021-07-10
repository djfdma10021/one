<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.seed.study.vo.MainVo"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>SEED IT 게시판 실습</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
		<link rel="stylesheet" type="text/css" href="./resources/css/home.css">
	</head>
	
	<body id="body">
		<header>
			<h1>
				게시판 실습
			</h1>
			<hr>
			<br>
		</header>
		
		<div id="tableHeader">
			<span class="tableHeader_item checkBoxArea"></span>
			<span class="tableHeader_item">이름</span>
			<span class="tableHeader_item">나이</span>
			<span class="tableHeader_item">전화번호</span>
			<span class="tableHeader_item" id="lastItem">이메일</span>
		</div>
		
		<div id="content">
			<div id="tableBody">
			</div>
		</div>

		<div class="modal_back" id="modal_back">
			<div class="modal">
				유저 추가
				<hr>
				<br>
				<form id="form" class="form" name="form" method="post" action="insertUser.do">
					<br>
					<div>
						<div class="textBox">이름<hr></div>
						<input name="name" id="name" onfocus="this.select()" class="textArea" placeholder="..">
					</div>
					<br>
					<div>
						<span class="textBox">나이<hr></span>
						<input name="age" id="age" onfocus="this.select()" class="textArea" placeholder="..">
					</div>
					<br>
					<div>
						<span class="textBox">전화번호<hr></span>
						<input name="phone" id="phone" onfocus="this.select()" class="textArea" placeholder="010-1234-5678">
					</div>
					<br>
					<div>
						<span class="textBox">이메일<hr></span>
						<input type="email" name="email" id="email" onfocus="this.select()" class="textArea" placeholder="seed@it.com">
					</div>
					<br>
					<br>
				</form>
					<button class="addUserBtn" id="cancleBtn">취소</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="addUserBtn" id="okBtn" type="submit">완료</button>
			</div>
		</div>
		<div class="modal_back2" id="modal_back2">
			<div class="modal2">
				유저 삭제
				<hr><br><br><br><br>
				<div class="modal2_text">
					정말 삭제 하시겠습니까?
				</div>
				<br><br><br><br><br>				
					<button class="addUserBtn" id="cancleBtn2">아니오</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="addUserBtn" id="okBtn2">예</button>
			</div>
		</div>
		
		<div class="smallModal">
			<br><br><br>
			<div id="smallModalText">
				이름을 입력해주세요.
			</div>
			<br><br>
			<button id="smallModalBtn">확인</button>
		</div>
		
		<footer id="footer">
			<br>
			<hr>
			<button class="deleteBtn">-</button>
			<button class="addBtn">+</button>
			<P id="footerText"> ${serverTime} - 기술지원팀 - </P>
		</footer>
	</body>
	<script type="text/javascript">
	var listCount = 0;
	
	selectList();
	//list 처음에 불러오기
	function selectList(){
		var url = "selectList.do";
		var str = "";
	  $.getJSON(url,function(data){
			$('#tableBody').empty();		
		 $.each(data.userList, function(i,v){
			 if(i%2!=0){
				str='<div class="body_item" id="body_item1" name="body_item'+v.userNo+'">'+
					'<span class="tableBody_item checkBoxArea">'+
						'<input class="checkBox" type="checkbox">'+
					'</span>'+
					'<span class="tableBody_item">'+v.userName+'</span>'+
					'<span class="tableBody_item">'+v.userAge+'</span>'+
					'<span class="tableBody_item">'+v.userPhone+'</span>'+
					'<span class="tableBody_item">'+v.userEmail+'</span>'+
					'<input class="hidden" type="hidden" value="'+v.userNo+'"/>'+
					'</div>';
			 }else{
				str='<div class="body_item" id="body_item2" name="body_item'+v.userNo+'">'+
					'<span class="tableBody_item checkBoxArea">'+
						'<input class="checkBox" type="checkbox">'+
					'</span>'+
					'<span class="tableBody_item">'+v.userName+'</span>'+
					'<span class="tableBody_item">'+v.userAge+'</span>'+
					'<span class="tableBody_item">'+v.userPhone+'</span>'+
					'<span class="tableBody_item">'+v.userEmail+'</span>'+
					'<input class="hidden" type="hidden" value="'+v.userNo+'"/>'+
					'</div>';
			 }
			$('#tableBody').append(str);
			if(i+1==data.userList.length){
				listCount=data.userList.length;
				afterFunction();
			}
		 });
	  });
	};
	
	function afterFunction(){
		//라인 마우스 enter/leave
		$('.body_item').on('mouseenter', function() {
			var targ;
		    if (!e) {
		        var e = window.event;
		    }
		    var tid = e.target;
			    $('div[name='+tid.getAttribute('name')+']').css("background","rgba(56,147,151,0.37)");
		});
		$('.body_item').on('mouseleave', function() {
			var targ;
		    if (!e) {
		        var e = window.event;
		    }
		    var tid = e.target;
		    if(tid.id=="body_item1"){
		    	if($('div[name='+tid.getAttribute('name')+']').children()[0].children[0].checked==false){
		    	$('div[name='+tid.getAttribute('name')+']').css("background","rgba(100,100,100,0.15)");
		    	}
		    }else{
		    	if($('div[name='+tid.getAttribute('name')+']').children()[0].children[0].checked==false){
		   		$('div[name='+tid.getAttribute('name')+']').css("background","rgba(1,1,1,0.1)");
		    	}
		    }
		});
		//라인 클릭1 check
		$('.body_item').click(function(){
			console.log("line1");
			var targ;
		    if (!e) {
		        var e = window.event;
		    }
			
		    var tid = e.target;
		    
		    if($('div[name='+tid.getAttribute('name')+']').children()[0].children[0].checked==true){
			    $('div[name='+tid.getAttribute('name')+']').children()[0].children[0].checked=false;
		    	if(tid.id=="body_item1"){
			    	$('div[name='+tid.getAttribute('name')+']').css("background","rgba(100,100,100,0.15)");
			    }else{
			   		$('div[name='+tid.getAttribute('name')+']').css("background","rgba(1,1,1,0.1)");
			    }
		    }else{
		    	$('div[name='+tid.getAttribute('name')+']').children()[0].children[0].checked=true;
		   		$('div[name='+tid.getAttribute('name')+']').css("background","rgba(56,147,151,0.37)");
		    }
		});
		//라인 클릭2 check
		$('.tableBody_item').click(function(){
			console.log("line2");
			var targ;
		    if (!e) {
		        var e = window.event;
		    }
		    var tid = e.target;
		    var tname = tid.closest('div').getAttribute('name');
		    var tid2 = tid.closest('div').id;
		    console.log(tname);
		    console.log(tid2);
		    if(tid.closest('div').children[0].children[0].checked==true){
		    	tid.closest('div').children[0].children[0].checked=false;
		    	if(tid2=="body_item1"){
		    		$('div[name='+tname+']').css("background","rgba(100,100,100,0.15)");
			    }else{
			    	$('div[name='+tname+']').css("background","rgba(1,1,1,0.1)");
			    }
		    }else{
		    	tid.closest('div').children[0].children[0].checked=true;
		    	$('div[name='+tname+']').css("background","rgba(56,147,151,0.37)");
		    }
		});
	}
	
	//유저추가 모달 on		
		var modal = $(".modal_back");
		var modal2 = $(".modal_back2");
	$(".addBtn").click(function(){
		$("#email").val("");
		$("#phone").val("");
		$("#age").val("");
		$("#name").val("");
		modal.css("display","block");
	});
	
	//모달바탕 클릭 시 모달 닫기
	modal.click(function(event) {
	    var targ;
	    if (!e) {
	        var e = window.event;
	    }

	    var tid = e.target;
	    
	    if(tid.id=="modal_back"){
	    	modal.css("display","none");
	    }
	});
	
	//취소버튼 누르면 모달 닫기
	$("#cancleBtn").click(function(){
		if(modal.css("display")=="block"){
    		modal.css("display","none");
    	};
	});
	$("#cancleBtn2").click(function(){
    	if(modal2.css("display")=="block"){
    		modal2.css("display","none");
    	};
	});
	
	//esc버튼 누르면 모달 닫기
	$(document).keydown(function(event) {
	    if ( event.keyCode == 27 || event.which == 27 ) {
	    	if(modal.css("display")=="block"){
	    		modal.css("display","none");
	    	};
	    	if(modal2.css("display")=="block"){
	    		modal2.css("display","none");
	    	};
	    }
	});
	
	var check = 0;
	
	//완료버튼 누르면 유효성 검사
	$("#okBtn").click(function(){
		
		if($("#name").val()==""){
			$("#smallModalText").text("이름을 입력해주세요.");
			$(".smallModal").css("display","block");
			check=1;
		}else{
			if($("#age").val()==""){
				$("#smallModalText").text("나이를 입력해주세요.");
				$(".smallModal").css("display","block");
				check=2;
			}else{
				var age_check=/^[0-9]*$/;
				var age=$("#age").val();
				
				if(age_check.test(age)){
					if($("#phone").val()==""){
						$("#smallModalText").text("전화번호를 입력해주세요.");
						$(".smallModal").css("display","block");
						check=3;
					}else{
						var phone_check= /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
						var phone=$("#phone").val();
						
						if(phone_check.test(phone)){
							if($("#email").val()==""){
								$("#smallModalText").text("이메일을 입력해주세요.");
								$(".smallModal").css("display","block");
								check=4;
							}else{
								var email_check=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
								var email=$("#email").val();
								
								if(email_check.test(email)){
									
									var form = $('#form');
								    var url = form.attr('action');
								    var data = form.serialize();
									
								    $.ajax({
								           type: "POST",
								           url: url,
								           data: data,
								           dataType: 'json',
								           success: function(data)
								           {
								               if(data.status="success"){
													modal.css("display","none");
													$('#tableBody').empty();
								            	    selectList();
								               }
								           }
								   
								         });

								}else{
									$("#smallModalText").text("이메일 - 형식에맞게 입력해주세요.");
									$(".smallModal").css("display","block");
									check=4;
								}
							}
						}else{
							$("#smallModalText").text("전화번호 - 형식에맞게 입력해주세요.");
							$(".smallModal").css("display","block");
							check=3;
						}
					}
				}else{
					$("#smallModalText").text("나이 - 숫자로 입력해주세요.");
					$(".smallModal").css("display","block");
					check=2;
				}
				
			}
		}
	});
	
	//스몰모달 확인버튼
	$("#smallModalBtn").click(function(){
		$(".smallModal").css("display","none");
		
		if(check!=0){
			if(check==1){
				$("#name").focus();
			}else if(check==2){
				$("#age").focus();
			}else if(check==3){
				$("#phone").focus();
			}else{
				$("#email").focus();
			}
		}
	});
	
	
	$('.deleteBtn').click(function(){
		var cnt = 0;
		for(var i =0; i < $('.checkBox').length; i++){
			if($('.checkBox')[i].checked == true){
				cnt ++;
			}
		}
		console.log(cnt);
			if(cnt > 0){
			$('.modal_back2').css('display','block');
			$('.modal2').css('display','block');			
			}else{
				alert("삭제 데이터를 선택하세요.");
			}
	
	});
	$("#okBtn2").click(function(){
		var delArray = new Array();
		for(var i=0; i<$('.checkBox').length; i++){
			if($('.checkBox')[i].checked == true){
				delArray.push($('.checkBox').closest('span').nextAll('input')[i].value);
			}
		}
		var url = 'deleteUser.do';
		var data = JSON.stringify(delArray)
		$.ajax({
			type:'POST',
			url: url,
			data : data,
			dataType : 'JSON',
			contentType :  "application/json; charset=UTF-8",
			  traditional: true,
	           success: function(data)
	           {
	               if(data.status="success"){
	            	    selectList();
	               }else{
	            	   alert("삭제실패");
	               }
	           }
	   
	         });
	
		if(modal2.css("display")=="block"){
   		modal2.css("display","none");
   	};
	}); 
	
	/* //삭제버튼
	$('.deleteBtn').click(function(){
		var count = 0;
		for(var i=0; i<$('.checkBox').length; i++){
			if($('.checkBox')[i].checked==true){
			count++;
			}
		}
		
		if(count>0){
		modal2.css("display","block");
		}else{
			$("#smallModalText").text("삭제할 유저를 선택하세요.");
			$(".smallModal").css("display","block");
		}
	});
	
	$("#okBtn2").click(function(){
		var deleteNumArray = new Array();
		for(var i=0; i<$('.checkBox').length; i++){
			if($('.checkBox')[i].checked==true){
				deleteNumArray.push($('.checkBox').closest('span').nextAll('input')[i].value);
			}
		}
		var url = 'deleteUser.do';
		var data = JSON.stringify(deleteNumArray)
		 $.ajax({
	           type: "POST",
	           url: url,
	           data: data,
	           dataType: 'json',
	           contentType: "application/json; charset=UTF-8",
	           traditional: true,
	           success: function(data)
	           {
	               if(data.status="success"){
	            	    selectList();
	               }else{
	            	   alert("삭제실패");
	               }
	           }
	   
	         });
	
		if(modal2.css("display")=="block"){
    		modal2.css("display","none");
    	};
	}); 
	 */
</script>

	
</html>