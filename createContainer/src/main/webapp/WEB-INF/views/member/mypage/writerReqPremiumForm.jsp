<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	td {
		font-size:12px;
	}
</style>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="margin-top: 3.5%;">

	
	<jsp:include page="common/writerbanner.jsp"/>
  
<div class="container">
  <div class="row">
  <jsp:include page="common/mypageNavbar.jsp"/>
    <div class="col-sm-3">
  	 	<jsp:include page="common/WriterpageSideNavbar.jsp"/>
    </div>
    <div class="col-sm-7">
      <div class="point">
					<ul class="nav nav-tabs">
    					<li class="active"><a href="#">유료 작품 등록하기</a></li>
    					
  					</ul>
  					<br>
  					<form action="insertRequest.mg" method="post">
  					<table width="100%;" style="margin-left:30px;">
  						<c:if test="${ work.workType == 'WN' }">
  						<tr>
  							<td colspan=2 align="center"><img src="${ contextPath }/resources/uploadFiles/webnovelMain/${ Thumnail }" width="150px" height="150px" style="border-radius:15px;">
  						</tr>
  						</c:if>
  						<c:if test="${ work.workType == 'WT' }">
  						<tr>
  							<td colspan=2 align="center"><img src="${ contextPath }/resources/uploadFiles/webtoonMain/${ Thumnail }" width="150px" height="150px" style="border-radius:15px;">
  						</tr>
  						</c:if>
  						<tr>
  							<td>&nbsp;</td>
  						</tr>
  						<tr>
  							<td width="100px;">작품 제목 : </td>
  							<td><input type="text" readonly value="${ work.wTitle }" style="width:80%; border-radius:12px; border:1px solid #ececec; text-align:center;">
  						</tr>
  						<tr>
  							<td>&nbsp;</td>
  						</tr>
  						<tr>
  							<td width="100px;">연재 주기 : </td>
  							<td><input type="text" readonly value="${ work.wCycle }" style="width:80%; border-radius:12px; border:1px solid #ececec; text-align:center;">
  						</tr>
  						<tr>
  							<td>&nbsp;</td>
  						</tr>
  						<tr>
  							<td width="100px;">연재 회차 : </td>
  							<td><input type="text" readonly value="${ round }회" style="width:80%; border-radius:12px; border:1px solid #ececec; text-align:center;">
  						</tr>
  						<tr>
  							<td>&nbsp;</td>
  						</tr>
  						<tr>
  							<td width="100px;">희망 전환 날짜 : </td>
  							<td><input type="text" readonly value="${ round }회" style="width:80%; border-radius:12px; border:1px solid #ececec; text-align:center;">
  						</tr>
  						<tr>
  							<td>&nbsp;</td>
  						</tr>
  						<tr>
  							<td width="100px;">사업자 등록증 : </td>
  							<td><input type="file" readonly value="${ round }회" style="width:80%; border-radius:2px; border:1px solid #ececec; text-align:center;">
  						</tr>
  						
  						<tr>
  							<td width="100px;">통신 판매증 : </td>
  							<td><input type="file" readonly value="${ round }회" style="width:80%; border-radius:2px; border:1px solid #ececec; text-align:center;">
  						</tr>
  						<tr>
  							<td>&nbsp;</td>
  						</tr>
  						<tr>
  							<td>
  							</td>
  						</tr>
  						
  					</table>
  <h4>이용, 운영원칙</h4>
  <pre style="font-size:10px; height:400px;">

  	01. 필수 에티켓
CreateContainer 는 다양한 회원이 참여하는 공간인 만큼, 크고 작은 분쟁이나 의견충돌이 일어날 수도 있습니다.
모두가 기분 좋게 CreateContainer 를 이용할 수 있도록 서로에 대한 배려를 부탁 드리겠습니다.
마음에 드는 작품에는 별점을!
재미있거나 감동적인 작품에는 별점을 주는 것은 기본 에티켓! 1점 (1점) ~  10점 (10점)까지 별점을 줄 수 있습니다.
단, 무분별한 별점은 자제해 주세요.
불량 게시물은 안돼요!
무심코 올린 [불량 게시물]은 다른 사람을 불쾌하게 만들 수 있습니다. 불량 게시물 없는 쾌적하고 즐거운 CreateContainer 가 될 수 있도록 도와 주세요.
댓글은 이렇게!
댓글은 컨텐츠 게시판에서 가장 직접적이고 중요한 이용자의 피드백이지만 상대방이 불쾌하게 느끼지 않도록 하는 배려가 필요합니다.
내가 쓴 댓글에 [불량 게시물]에 해당하는 내용이 있지는 않은지, 상대방을 무조건 비방하거나 폄하하는 내용은 아닌지 확인 후 등록하는 건 어떨까요?
	
	02. 부당 이용 대응
CreateContainer 는 더 즐겁고 유익한 커뮤니티를 위해 다음과 같은 게시물과 ID에 대해서는 부득이 대응 조치를 취하고 있습니다.
모두가 기분 좋게 CreateContainer 를 이용할 수 있도록 항상 노력하겠습니다
불량 게시물이란?
CreateContainer웹툰 이용약관에서 정한 바에 따라 다음과 같은 게시물을 불량게시물로 정의합니다. 불량게시물 정의 시 방송통신심의위원회 인터넷내용등급서비스 등급기준을 참고하였습니다.

명예 훼손 게시물
· 개인의 사생활, 초상권을 침해한 내용
· 개인이나 단체에 대해 비방하거나 허위사실을 유포한 경우 또는 권리를 침해한 경우
· 욕설 또는 언어폭력 등의 저속한 표현으로 특정인의 인격을 모독하거나 불쾌감을 불러 일으키는 내용
· 타인의 개인정보(실명, 주민번호, 연락처, 주소, SNS 등)를 본인의 동의 없이 고의적, 악의적으로 게시하는 경우
저작권을 침해하는 게시물
· 저작권자의 동의를 구하지 않은 자료를 불법게재, 배포, 권유하는 내용
· 다른 서비스나 사이트에서 허락되지 않은 자료를 퍼오거나 링크하는 경우
· 정품 프로그램을 사용하지 않고 무료 다운로드 등 불법 복제/프로그램설치를 권하는 내용
· 시리얼 번호와 CD키 공유 등 불법 복제와 관련된 내용
· 백업 CD를 판매하는 내용
· 타인의 권리에 속하는 저작권, 상표권, 의장권 등을 무단으로 침해하는 내용 자신의 저작권을 침해한 게시물(침해 주장 게시물)이 있는 경우, 게시중단요청서비스로 신고해 주세요.
음란성 게시물
· 지나친 신체 노출로 청소년에게 유해하다고 판단되는 경우
· 성행위를 직접적으로 묘사한 내용
· 성범죄를 구체적 사실적으로 묘사하거나 미화한 내용
· 노골적인 성적대화 등 성적유희 대상을 찾거나 매개하는 내용
· 음란정보 또는 퇴폐업소가 있는 장소를 안내 또는 매개하는 내용
· 음란 사이트, 자료 등을 게재하거나 링크한 경우
반사회적 게시물
· 자살을 미화·권유하거나 자살방법을 적시하는 내용, 동반자살을 유도하는 내용
· 범죄 관련 내용을 미화·권유·조장하는 내용
· 특정 계층이나 종교를 비하하는 내용
· 성폭력 마약복용 등 퇴폐적 행위를 자극하거나 미화하는 내용
· 살인을 청탁하거나 이를 권유 유도 매개하는 내용
· 사회 윤리적으로 용납되지 않은 행위를 매개하는 경우 사이버 스토킹에 관한 내용
· 처형장면, 시체 등 혐오감을 일으키는 이미지를 수록하거나 링크시키는 경우
· 부녀자 및 어린이 학대 등 폭력행위를 미화하는 내용
· 도박 등의 사행심을 조장하는 내용
· 미신 또는 비과학적인 생활태도를 조장하는 내용
사행심 조장 및 상업성 게시물
· 금전적 거래를 발생시키거나 이를 알선하는 경우
· 불법적인 피라미드식 영업행위를 권유 조장하는 등의 내용
· 불법적인 경품/복권을 강매 또는 판매하는 등의 내용
· 특정 회사나 개인의 이익을 목적으로 상업적 내용을 게시한 경우
· 돈버는 사이트 소개, 피라미드식 사기행위 등 허위사실이나 불법적 내용을 게시하는 경우
기타 불량 게시물
· 게시판 성격에 맞지 않거나 동일한 게시물을 반복적 도배하는 경우
· 내용 없는 그림을 등록하여 서비스 내 공정한 경쟁을 해치는 경우
· 개인적인 비난, 비판, 토론 형태를 갖는 게시물의 경우
· 스팸글, 홍보글 등의 도배자료를 올리는 경우
· 주민등록생성기, 카드생성기, 아이템생성기 등 불법자료를 올리는 경우
· 불법제품을 이용자에게 판매하거나 소개하는 경우
· 불법적인 해킹이나 바이러스를 유포하는 행위
· 운영자, 직원 및 관계자 사칭하는 경우
불량 게시물에 대한 신고는 이렇게 해주세요!
의 모든 게시물에 있는 '신고하기' 버튼 클릭
어떤 게시글이나 댓글이 불량성이 있다고 판단될 때, 신고사유를 선택하거나 입력하여 직접 신고할 수 있습니다.
게시물에 대한 신고는 한 번만
한 게시물을 동일한 사용자가 1회 이상 신고할 수 없으며, 부당한 사유로 신고하는 경우에는 신고자가 부당 신고로 인한 모든 책임을 부담하게 됩니다.
불량 게시물에 대한 대응은 이렇게 이뤄지고 있습니다.
동일 게시글이 3회 이상 신고된 경우
관리자의 검토 후 신고내용이 적절할 경우 해당 불량 게시물은 게시중단 됩니다.
또한 반복적으로 불량 게시물을 등록할 경우 해당 회원은  등록과 댓글쓰기, 신고하기가 제한됩니다.
불량 게시물 작성으로 이용제한을 받은 적이 있는 회원은
신고회수 및 제한조치의 누적 정도에 따라서 경고, 일시정지 ,영구이용정지 등 단계적으로 제한될 수 있습니다.
특히, 음란게시물 작성 등 그 위반 정도가 중한 경우 누적 정도와 관계없이 일시정지 또는 영구이용정지 될 수 있습니다.
부당 신고란?
불량성이 아닌 타인의 게시물을 적합하지 않은 사유로 신고하거나 동일 게시물을 중복 신고하는 경우 부당신고로 처리되며 부당 신고자는 다음의 원칙에 따라 불이익을 받을 수 있습니다

부당 신고에 대한 대응은 이렇게 이뤄지고 있습니다.
부당신고자는
기본 7일~30일 간  등록과 댓글쓰기, 신고하기가 제한됩니다.
부당신고의 정도가 심한 경우,
영구적으로  서비스 이용이 제한될 수 있습니다.
  </pre>
  <div style="width:100%; text-align:right;">
	<label>동의합니다. &nbsp;</label><input type="radio" name="agree" value="agree"><label>&nbsp;&nbsp;&nbsp;동의하지 않습니다. &nbsp;</label><input type="radio" name="agree" value="disagree">
  <br>
  <button type="button" class="btn btn-info" id="modify">신청하기</button>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  </div>
  </form>
				</div>
    </div>
    <div class="col-sm-2">
     <img src="${ contextPath }/resources/images/advertisement.png" width="100%">     
    </div>
  </div>
</div>
</body>
</html>