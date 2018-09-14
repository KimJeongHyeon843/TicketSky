<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="<%=request.getContextPath()%>"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/help/helpBar.jsp"/>
<link rel="stylesheet" href="${path }/resources/help/tabform.css"/>

<style>
.btn-secondary{
background-color:black;
}
#faq
{
	text-align:center;
}
/* a.hover
{
	background-color:black;
} */
.panel-title
{
background-color:blue;
}
</style>
<script>
function fn_notice(cPage){
		var cateNo = $('input[name="tabs"]:checked').val();
		$.ajax({
			type:"get",
			url:"${path}/help/faqHome.do",
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
					/* if(cateNo==0 || cateNo==1)
						view+="<td>"+data[0][i].OPENDATE+"</td>";
						else
						view+="<td>"+null+"</td>"; */
							/* undefined면 <td>-</td> */
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
</script>
<br>
<br>
<br>
<hr>
<h2 style="text-align: center">FAQ</h2>
<hr>
<div class="main">
    <input id="tab1" type="radio" name="tabs" checked value="0" onclick="fn_notice();"> <!--디폴트 메뉴-->
    <label for="tab1">공연</label>

    <input id="tab2" type="radio" name="tabs" value="1" onclick="fn_notice();">
    <label for="tab2">결제</label>

    <input id="tab3" type="radio" name="tabs" value="2" onclick="fn_notice();">
    <label for="tab3">회원</label>

    <input id="tab4" type="radio" name="tabs" value="3" onclick="fn_notice();">
    <label for="tab4">기타</label>

                <div class="col-lg-6" style="margin:5% 0 0 0">
                        <div class="input-group">
                          <input type="text" class="form-control" placeholder="Search for..." width="30%px">
                         <span class="input-group-btn">
                       <button class="btn btn-outline-success" type="button" >Go!</button>
						</span>
						</div>
<!--                         </div>/input-group
                      </div>/.col-lg-6 -->
                          <!-- Button and dropdown menu -->
                        </div>
                      <br>
                      <!-- <table class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <td>문의유형(카테고리)</td>
                                <td>문의제목(title)</td>
                                <td>회원아이디(userId)</td>  
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>카테고리</td>
                                <td><a href="#">제목( 제목 클릭시 모달 띄우기 )</a></td>
                                <td>예매 오픈일</td>
         
                            </tr>
                            </tbody>
                        </table> -->
                      <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="margin:5% 0 0 0">
                            <div class="panel panel-default">
                              <div class="panel-heading" role="tab" id="headingOne">
                                <h4 class="panel-title">
                                  <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                    <input type="text" id="title" name="title" value=" value="${notice.title}"/>
                                    <c:foreach items="${notice}" var="n">
                                    	<tr>
                                    	<td>${n.TITLE}</td>
                                    	<td>${n.CONTENT}</td>	
                                    	</tr>
                                    </c:foreach>
                                    Collapsible Group Item #1
                                  </a>
                                </h4>
                              </div>
                              <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                <div class="panel-body">
                                  Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                </div>
                              </div>
                            </div>
                            <div class="panel panel-default">
                              <div class="panel-heading" role="tab" id="headingTwo">
                                <h4 class="panel-title">
                                  <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    Collapsible Group Item #2
                                  </a>
                                </h4>
                              </div>
                              <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                                <div class="panel-body">
                                  Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                </div>
                              </div>
                            </div>
                            <div class="panel panel-default">
                              <div class="panel-heading" role="tab" id="headingThree">
                                <h4 class="panel-title">
                                  <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                    Collapsible Group Item #3
                                  </a>
                                </h4>
                              </div>
                              <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                                <div class="panel-body">
                                  Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident. Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven't heard of them accusamus labore sustainable VHS.
                                </div>
                              </div>
                            </div>
                            <br><br><br><br><br><br>
                          </div>
        </main><!--/.container-->
        
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
