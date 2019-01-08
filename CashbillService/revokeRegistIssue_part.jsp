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
	/*
	 * 1건의 (부분)취소현금영수증을 [즉시발행]합니다.
	 * - 발행일 기준 오후 5시 이전에 발행된 현금영수증은 다음날 오후 2시에 국세청 전송결과를 확인할 수 있습니다.
	 * - 현금영수증 국세청 전송 정책에 대한 정보는 "[현금영수증 API 연동매뉴얼] > 1.3. 국세청 전송정책"을 참조하시기 바랍니다.
	 */

	// 팝빌회원 사업자번호, '-'제외 10자리
	String testCorpNum = "1234567890";

	// 현금영수증 문서관리번호, 최대 24자리, 영문, 숫자 '-', '_'를 조합하여 사업자별로 중복되지 않도록 구성
	String mgtKey = "20190107-001";

	// 원본현금영수증 승인번호
	String orgConfirmNum = "081648147";

	// 원본현금영수증 거래일자
	String orgTradeDate = "20190104";

	// 안내문자 전송여부
	Boolean smssendYN = false;

	// 발행메모
	String memo = "";

	// 부분취소여부, true-부분취소, false-전체취소
	Boolean isPartCancel = true;

	// 취소사유(integer) / 1-거래취소, 2-오류발급취소, 3-기타
	Integer cancelType = 1;

	// [취소] 공급가액
	String supplyCost = "3000";

	// [취소] 세액
	String tax = "300";

	// [취소] 봉사료
	String serviceFee = "0";

	// [취소] 합계금액
	String totalAmount = "3300";


	Response CheckResponse = null;

	try {

		CheckResponse = cashbillService.revokeRegistIssue(testCorpNum, mgtKey, orgConfirmNum, orgTradeDate, smssendYN,
				memo, isPartCancel, cancelType, supplyCost, tax, serviceFee, totalAmount);

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
				<legend>(부분)취소현금영수증 즉시발행</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
