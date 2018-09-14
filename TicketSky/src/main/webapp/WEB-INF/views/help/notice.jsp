<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/help/helpBar.jsp"/>
<link rel="stylesheet" href="${path }/resources/help/tabform.css"/>

<script>
function fn_noticeAdmin()
{	
	location.href='${pageContext.request.contextPath}/help/noticeAdmin.do';
}
function noEvent() {
	if (event.keyCode == 116) {
	event.keyCode= 2;
	return false;
	}
	else if(event.ctrlKey && (event.keyCode==78 || event.keyCode == 82))
	{
	return false;
	}
	}
</script>

<style>
	a{
		color:blue;
	}
</style>
<br>
<br>
<br>
<hr>
<h2 style="text-align: center">공지사항</h2>
<hr>
<br>
<div>
<p style="margin:0 0 0 10%"><img src="${path}/resources/img/help-img/mark.png"/>총${totalContents}건의 게시물이 있습니다.</p>
</div>
<div class="main">
    <input id="tab1" type="radio" name="tabs" checked value="0" onclick="fn_notice();"> <!--디폴트 메뉴-->
    <label for="tab1">전체</label>

    <input id="tab2" type="radio" name="tabs" value="1" onclick="fn_notice();">
    <label for="tab2">티켓오픈</label>

    <input id="tab3" type="radio" name="tabs" value="2" onclick="fn_notice();">
    <label for="tab3">변경/취소</label>

    <input id="tab4" type="radio" name="tabs" value="3" onclick="fn_notice();">
    <label for="tab4">기타</label>

    <section id="content1" >
        <table class="table table-striped table-bordered table-hover">
        	<thead>
        		<tr>
        			<th>카테고리</th>
        			<th>제목</th>
        			<th>예매오픈일</th>
        			<th>등록일</th>
        			<th>조회수</th>
        		</tr>
        	</thead>
        	<tbody id="n0"></tbody>
        </table>
        <div id="page0"></div>
    </section>

    <section id="content2">
        <table class="table table-striped table-bordered table-hover">
        	<thead>
        		<tr>
        			<th>카테고리</th>
        			<th>제목</th>
        			<th>예매오픈일</th>
        			<th>등록일</th>
        			<th>조회수</th>
        		</tr>
        	</thead>
        	<tbody id="n1"></tbody>
        </table>
        <div id="page1"></div>
    </section>

    <section id="content3">
        <table class="table table-striped table-bordered table-hover">
        	<thead>
        		<tr>
        			<th>카테고리</th>
        			<th>제목</th>
        			<th>등록일</th>
        			<th>조회수</th>
        		</tr>
        	</thead>
        	<tbody id="n2"></tbody>
        </table>
        <div id="page2"></div>
    </section>

    <section id="content4">
        <table class="table table-striped table-bordered table-hover">
        	<thead>
        		<tr>
        			<th>카테고리</th>
        			<th>제목</th>
        			<th>등록일</th>
        			<th>조회수</th>
        		</tr>
        	</thead>
        	<tbody id="n3"></tbody>
        </table>
        <div id="page3"></div>
    </section>

<button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="fn_noticeAdmin()">글쓰기</button>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<script>

 	$(function(){
		fn_notice(1);
	});
	
	function fn_notice(cPage){
		var cateNo = $('input[name="tabs"]:checked').val();
		$.ajax({
			type:"get",
			url:"${path}/help/noticeView.do",
			datatype:"json",
			data:{cateNo:cateNo,cPage:cPage},
			success:function(data){
				console.log(data);
				var view="";
				var page=data[1];
				if(data!=null){
					for(var i=0;i<data[0].length;i++){
						view+="<tr>";
						view+="<td>"+data[0][i].CATENAME+"</td>"; //CATE_NAME
						view+="<td><a href='${path}/help/noticeForm.do?no="+data[0][i].NOTICENO+"'>"+data[0][i].TITLE+"</a></td>";
						if(data[0][i].CATENO==1)
							view+="<td>"+data[0][i].OPENDATE+"</td>";
						else
							view+="<td></td>";
						view+="<td>"+data[0][i].NDATE+"</td>";
						view+="<td>"+data[0][i].COUNT+"</td>";
						view+="</tr>";
					}
				}
				if(cateNo==0) $('#n0').html(view);
				else if(cateNo==1) $('#n1').html(view);
				else if(cateNo==2) $('#n2').html(view);
				else if(cateNo==3) $('#n3').html(view);
				$('#page0').html(page);
				$('#page1').html(page);
				$('#page2').html(page);
				$('#page3').html(page);
			},
			error:function(xhr,Status,error){
	            console.log("notice ajax 실패 : "+xhr+" "+Status+" "+error);
			}
		});
	} 
</script>
