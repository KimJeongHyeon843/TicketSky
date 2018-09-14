<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/help/helpBar.jsp"/>
 <h2>공지사항 내용폼</h2>
             <main role="main" class="container"> 
            <div class="col-6 col-lg-4" style="margin:5% 0 0 0%">
            <img class="left" src="img/help-img/main2.png" width="100px;" height="300px">
            <p>[단독판매] 포항시립합창단 제105회 정기연주회 가을의 선율 티켓오픈안내
                    오픈일
                    2018.09.06(목) 16:30
                    장소
                    포항문화예술회관 대공연장<br>
                    <button class="btn btn-secondary" style="background-color:black">예매하기</button> 
                    <hr>
                </p>
        </div>    
        
            <pre>[단독판매] 포항시립합창단 제105회 정기연주회 가을의 선율 티켓오픈안내

                공연정보
                공연 기간 : 2018년 09월 18일(화)
                공연 시간 : 19시 30분
                공연 장소 : 포항문화예술회관 대공연장
                티켓 가격 : 일반석 3,000원
                관람 시간 : 60분
                관람 등급 : 만7세이상​
                 
                
                기획사 정보​
                
                주최 : 포항시 
                
                문의 : 054-270-5483 
            </pre>
            <hr>
            <button class="btn btn-secondary" style="background-color:black">목록보기</button> 
        </body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>