<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/help/helpBar.jsp"/>
<script>
	function fn_consultHome()
	{
		location.href='${pageContext.request.contextPath}/help/consult.do';
	}
	function fn_consultSubmit()
	{
		location.href='${pageContext.request.contextPath}/help/consultInsert.do';

	}
</script>

<br><br><br><hr>
<h2 style="text-align:center">1:1문의</h2>
<hr><br><br><br>
<main role="main" class="container">
                <!--위까지 고정Header-->
            <button class="btn btn-outline-success" type="submit" onclick="fn_consult()" style="margin:5% 0 0 0">상담내역</button>
            <button class="btn btn-outline-success" type="submit" onclick="location.href='consultInsert.do'" style="margin:5% 0 0 0">상담하기</button>
            <table class="table table-striped table-bordered table-hover" style="margin:5% 0 0 0">
                    <thead>
                    <tr>
                        <td>문의유형(카테고리)</td>
                        <td>카테고리번호</td>
                        <td>회원아이디(userId)</td>
                        <td>문의제목(title)</td>
                        <td>문의내용(content)</td>
                        <td>등록일(cDate)</td>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="c">
                    <tr>
                        <td>${c.consult_No}</td>
                        <td>${c.cate_No }</td>
			            <td>${c.userId}</td>                       
						<td>${c.title}</td> 
						<td>${c.content}</td>
						<td>${c.cDate}</td> 
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
            <p>(문의내용이 있으면 테이블출력 없으면 문구출력)<br>문의하신 내용이없습니다.
            서비스 이용 중 궁금한 내용이 있으시면, 언제든지 문의해주세요. 감사합니다.<br>
            상담내역불러오기
            </p>
              </div>
          <hr>
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit" onclick="fn_consultSubmit()" style="margin:0 0 0 40%">1:1 문의하기</button>
        <div class="row">
            <br>
        </div>
        </main><!--/.container-->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>