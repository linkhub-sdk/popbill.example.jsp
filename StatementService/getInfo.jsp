<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.statement.StatementInfo"%>

<%
	/*
	 * 1건의 전자명세서 상태/요약 정보를 확인합니다.
	 * - 응답항목에 대한 자세한 정보는 "[전자명세서 API 연동매뉴얼] > 4.2 전자명세서 상태정보 구성"을 참조하시기 바랍니다.
	 */

	// 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

	// 명세서 코드, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
	int itemCode = 121;

	// 전자명세서 문서관리번호
	String mgtKey = "20190107-001";

	StatementInfo statementInfo = null;

	try {

		statementInfo = statementService.getInfo(testCorpNum, itemCode, mgtKey);

	} catch (PopbillException pe) {
		//적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
		//예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
		throw pe;
	}
%>
	<body>
		<div id="content">
			<p class="heading1">Response </p>
			<br/>
			<fieldset class="fieldset1">
				<legend>전자명세서 상태/요약 정보</legend>
				<fieldset class="fieldset2">
					<legend>StatementInfo</legend>
					<ul>
						<li> itemKey(아이템키) : <%= statementInfo.getItemKey()%></li>
						<li> itemCode(문서종류코드) : <%= statementInfo.getItemCode()%></li>
						<li> stateCode(상태코드) : <%= statementInfo.getStateCode()%></li>
						<li> taxType(세금형태) : <%= statementInfo.getTaxType()%></li>
						<li> purposeType(영수/청구) : <%= statementInfo.getPurposeType()%></li>
						<li> writeDate(작성일자) : <%= statementInfo.getWriteDate()%></li>
						<li> senderCorpName(발신자 상호) : <%= statementInfo.getSenderCorpName()%></li>
						<li> senderCorpNum(발신자 사업자번호) : <%= statementInfo.getSenderCorpNum()%></li>
						<li> senderPrintYN(발신자 인쇄여부) : <%= statementInfo.isSenderPrintYN()%></li>
						<li> receiverCorpName(수신자 상호) : <%= statementInfo.getReceiverCorpName()%></li>
						<li> receiverCorpNum(수신자 사업자번호) : <%= statementInfo.getReceiverCorpNum()%></li>
						<li> receiverPrintYN(수신자 인쇄여부) : <%= statementInfo.isReceiverPrintYN()%></li>
						<li> supplyCostTotal(공급가액 합계) : <%= statementInfo.getSupplyCostTotal()%></li>
						<li> taxTotal(세액 합계) : <%= statementInfo.getTaxTotal()%></li>
						<li> issueDT(발행일시) : <%= statementInfo.getIssueDT()%></li>
						<li> stateDT(상태 변경일시) : <%= statementInfo.getStateDT()%></li>
						<li> openYN(메일 개봉 여부) : <%= statementInfo.isOpenYN()%></li>
						<li> openDT(개봉 일시) : <%= statementInfo.getOpenDT()%></li>
						<li> stateMemo(상태메모) : <%= statementInfo.getStateMemo()%></li>
						<li> regDT(등록일시) : <%= statementInfo.getRegDT()%></li>
					</ul>
				</fieldset>
			</fieldset>
		 </div>
	</body>
</html>
