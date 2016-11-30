<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.cashbill.Cashbill"%>

<%
	/**
  * 1건의 임시저장 현금영수증을 수정합니다.
  * - [임시저장] 상태의 현금영수증만 수정할 수 있습니다.
  * - 국세청에 신고된 현금영수증은 수정할 수 없으며, 취소 현금영수증을 발행하여 취소처리 할 수 있습니다.
  * - 취소현금영수증 작성방법 안내 - http://blog.linkhub.co.kr/702
  */

  // 팝빌회원 사업자번호
  String testCorpNum = "1234567890";

  // 팝빌회원 아이디
  String userID = "testkorea";

  // 현금영수증 문서관리번호
  String mgtKey = "20161130-02";


  // 현금영수증 정보 객체
	Cashbill cashbill = new Cashbill();

  // 현금영수증 문서관리번호, 최대 24자리, 영문, 숫자 '-', '_'를 조합하여 사업자별로 중복되지 않도록 구성
	cashbill.setMgtKey("20161130-02");

  // 현금영수증 형태, {승인거래, 취소거래} 중 기재
	cashbill.setTradeType("승인거래");

  // 거래유형, {소득공제용, 지출증빙용} 중 기재
	cashbill.setTradeUsage("소득공제용");

  //거래처 식별번호, 거래유형에 따라 작성
  //소득공제용 - 주민등록/휴대폰/카드번호 기재가능
  //지출증빙용 - 사업자번호/주민등록/휴대폰/카드번호 기재가능
  cashbill.setIdentityNum("01011112222");

  // 과세형태, {과세, 비과세} 중 기재
  cashbill.setTaxationType("과세");

  // 공급가액, 숫자만 가능
  cashbill.setSupplyCost("10000");

  // 세액, 숫자만 가능
	cashbill.setTax("1000");

  // 봉사료, 숫자만 가능
	cashbill.setServiceFee("0");

  // 합계금액, 숫자만 가능, 봉사료 + 공급가액 + 세액
	cashbill.setTotalAmount("11000");


  // 발행자 사업자번호, '-'제외 10자리
	cashbill.setFranchiseCorpNum("1234567890");

  // 발행자 상호
	cashbill.setFranchiseCorpName("발행자 상호_수정");

  // 발행자 대표자성명
	cashbill.setFranchiseCEOName("발행자 대표자_수정");

  // 발행자 주소
	cashbill.setFranchiseAddr("발행자 주소");

  // 발행자 연락처
	cashbill.setFranchiseTEL("07043042991");

  // 발행시 안내문자 전송여부
	cashbill.setSmssendYN(false);


  // 고객명
	cashbill.setCustomerName("고객명");

  // 상품명
	cashbill.setItemName("상품명");

  // 주문번호
	cashbill.setOrderNumber("주문번호");

  // 고객 메일주소
	cashbill.setEmail("test@test.com");

  // 고객 휴대폰번호
	cashbill.setHp("01043245117");

  // 고객 팩스번호
	cashbill.setFax("070111222");


	Response CheckResponse = null;

	try {

		CheckResponse = cashbillService.update(testCorpNum, mgtKey, cashbill, userID);

	} catch (PopbillException pe) {
		//적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
		//예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
		throw pe;
	}
%>
	<body>
		<div id="content">
			<p class="heading1">Response</p>
			<br/>
			<fieldset class="fieldset1">
				<legend>현금영수증 수정</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
