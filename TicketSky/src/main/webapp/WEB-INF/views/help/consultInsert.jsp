<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/help/helpBar.jsp"/>
<link rel="stylesheet" href="${path}/resources/help/form.css"/>
<link rel="stylesheet" href="${path}/resources/help/responsive.css"/>
<br><br><br><hr>
<h2 style="text-align:center">1:1문의</h2>
<hr><br><br><br>
 <main role="main" class="container">
          <div class="row row-offcanvas row-offcanvas-right">
            <div class="col-12 col-md-9">
  
                <button class="btn btn-outline-success" type="submit"  onclick="location.href='consult.do'" style="margin:5% 0 0 0">상담내역</button>
                <button class="btn btn-outline-success" type="submit" style="margin:5% 0 0 0">상담하기</button>
                <section id="container" style="margin:5% 0 0 0">
                    <hr>
                    <form name="hongkiat" id="hongkiat-form" method="post" action="#">
                            <section id="recipientcase" style="margin:0% 0 15% 0%">
                                    <p class="ess mt"><img src="${path}/resources/img/help-img/mark.png"/>아래 항목들은 <em>필수입력</em> 항목입니다.</p>    
                                        <select id="recipient" name="recipient" tabindex="6" class="selmenu">
                                              <option value="1">공연문의</option>
                                              <option value="2">취소/환불</option>
                                              <option value="3">기타</option>
                                        </select>
                                    </section>		
                    <div id="wrapping" class="clearfix" style="margin:0 0 0 0%">
                        <input type="text" name="name" id="name" placeholder="이름을 입력하세요." autocomplete="off" tabindex="1" class="txtinput" style="width:100%">
                        <input type="email" name="email" id="email" placeholder="회원정보에 등록된 메일 불러오기 email주소 fix시키기" autocomplete="off" tabindex="2" class="txtinput"  style="width:100%">

                    </div>
                    <div>
                        <input type="text" name="title" id="title" placeholder="제목을 입력하세요." tabindex="5" class="txtinput" style="width:100%">
                        <textarea name="message" id="content" placeholder="내용을 작성해주세요. (상담내역에 카테고리,제목,유저아이디 테이블에 꽂히게)" tabindex="5" class="txtblock"  style="width:100%; resize:none"></textarea>
                        <span id="counter">1212</span>
                        <hr>
                        <script>
                        	/* 한글입력시 2btye로 입력받게 */
					      $(document).ready(function() {
					      $('#content').keyup(function (e){
					          var content = $(this).val();
					          $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
					          $('#counter').html(content.length + '/2000');
					      });
					      $('#content').keyup();
						});
					      </script>
                       <p> <input type="checkbox"> 수집하는 개인정보[(필수)이메일, 문의내용], [(선택)휴대폰번호, 첨부파일]는 문의 내용 처리 및 고객 불만의 해결을 위해 사용되며,<b>관련 법령에 따라 3년간 보관 후 삭제됩니다.</b>문의 접수, 처리 및 회신을 위한 필요최소한의 개인정보이므로 동의를 해주셔야 서비스를 이용하실 수 있습니다.
                        <b>위, 개인정보 수집 및 이용에 동의합니다.</b></p>
                        <hr>	
                    </div>
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="margin:0 0 0 42%" onclick="location.href='consult.do'">취소</button>
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="margin:0 0 0 1%" onlick="location.href='consultInsert.do'">제출</button>
            
                    </form>
            </main><!--/.container-->        
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>