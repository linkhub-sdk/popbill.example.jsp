<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.statement.Statement"%>
<%@page import="com.popbill.api.statement.StatementDetail"%>

<%
	/*
	 * "임시저장" 상태의 전자명세서를 수정합니다.
	 * - https://docs.popbill.com/statement/java/api#Update
	 */

	// 팝빌회원 사업자번호, '-'제외 10자리
	String testCorpNum = "1234567890";

	// 명세서 코드, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
	int itemCode = 121;

	// 수정할 전자명세서 문서번호
	String mgtKey = "20210704-001";


	/***************************************************************************
	 *                               전자명세서 정보
	 ****************************************************************************/

	Statement statement = new Statement();

	// [필수] 작성일자, 날짜형식(yyyyMMdd)
	statement.setWriteDate("20210701");

	// [필수] {영수, 청구} 중 기재
	statement.setPurposeType("영수");

	// [필수] 과세형태, {과세, 영세, 면세} 중 기재
	statement.setTaxType("과세");

	// 맞춤양식코드, 미기재시 기본양식으로 처리
	statement.setFormCode("");

	// [필수] 명세서 코드, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
	statement.setItemCode((short) 121);

	// [필수] 문서번호, 최대 24자리 영문, 숫자, '-', '_' 조합으로 구성
	statement.setMgtKey(mgtKey);


	/***************************************************************************
	 *                               발신자 정보
	 ****************************************************************************/

	// 발신자 사업자번호
	statement.setSenderCorpNum(testCorpNum);

	// 발신자 상호
	statement.setSenderCorpName("발신자 상호_수정");

	// 발신자 주소
	statement.setSenderAddr("발신자 주소_수정");

	// 발신자 대표자 성명
	statement.setSenderCEOName("발신자 대표자 성명");

	// 발신자 종사업장 식별번호
	statement.setSenderTaxRegID("");

	// 발신자 종목
	statement.setSenderBizClass("종목");

	// 발신자 업태
	statement.setSenderBizType("업태");

	// 발신자 담당자명
	statement.setSenderContactName("발신자 담당자명");

	// 발신자 담당자 메일주소
	statement.setSenderEmail("test@test.com");

	// 발신자 담당자 연락처
	statement.setSenderTEL("070-7070-0707");

	// 발신자 담당자 휴대폰번호
	statement.setSenderHP("010-000-2222");


	/***************************************************************************
	 *                             수신자 정보
	 ****************************************************************************/

	// 수신자 사업자번호
	statement.setReceiverCorpNum("8888888888");

	// 수신자 상호
	statement.setReceiverCorpName("수신자 상호");

	// 수신자 대표자성명
	statement.setReceiverCEOName("수신자 대표자 성명");

	// 수신자 주소
	statement.setReceiverAddr("수신자 주소");

	// 수신자 종목
	statement.setReceiverBizClass("수신자 업종");

	// 수신자 업태
	statement.setReceiverBizType("수신자 업태");

	// 수신자 담당자명
	statement.setReceiverContactName("수신자 담당자명");

	// 수신자 담당자 메일주소
	// 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
	// 실제 거래처의 메일주소가 기재되지 않도록 주의
	statement.setReceiverEmail("test@receiver.com");

	// 수신자 담당자 연락처
	statement.setReceiverTEL("010-111-1111");

	// 수신자 담당자 휴대폰번호
	statement.setReceiverHP("010-1234-1234");


	/***************************************************************************
	 *                               전자명세서 기재정보
	 ****************************************************************************/

	// [필수] 공급가액 합계
	statement.setSupplyCostTotal("400000");

	// [필수] 세액 합계
	statement.setTaxTotal("40000");

	// [필수] 합계금액.  공급가액 + 세액
	statement.setTotalAmount("440000");

	// 기재상 일련번호 항목
	statement.setSerialNum("123");

	// 기재상 비고 항목
	statement.setRemark1("비고1");
	statement.setRemark2("비고2");
	statement.setRemark3("비고3");

	// 사업자등록증 이미지 첨부여부
	statement.setBusinessLicenseYN(false);

	// 통장사본 이미지 첨부여부
	statement.setBankBookYN(false);


	// 상세항목(품목) 배열
	statement.setDetailList(new ArrayList<StatementDetail>());

	StatementDetail detail = new StatementDetail();

	detail.setSerialNum((short) 1);		// 일련번호, 1부터 순차기재
	detail.setItemName("품명");				 // 품목명
	detail.setPurchaseDT("20190107");	// 거래일자
	detail.setQty("1");								// 수량
	detail.setSupplyCost("200000");		// 공급가액
	detail.setTax("20000");						// 세액

	statement.getDetailList().add(detail);

	detail = new StatementDetail();		// 상세항목(품목) 배열

	detail.setSerialNum((short) 2);		 // 일련번호 1부터 순차기재
	detail.setItemName("품명");					// 품목명
	detail.setPurchaseDT("20190107");	 // 거래일자
	detail.setQty("1");								 // 수량
	detail.setSupplyCost("200000");		 // 공급가액
	detail.setTax("20000");						 // 세액

	statement.getDetailList().add(detail);


	/***************************************************************************
	 *                               추가속성 정보
	 * - 추가속성에 관한 자세한 사항은 "[전자명세서 API 연동매뉴얼] > 5.2. 기본양식 추가속성 테이블"
	 *   을 참조하시기 바랍니다.
	 ****************************************************************************/

	// 추가속성, 추가속성에 관한 정보는 [전자명세서 API 연동매뉴얼 > [5.2 기본양식 추가속성 테이블] 참조
	Map<String, String> propertyBag = new HashMap<String, String>();

	propertyBag.put("Balance", "15000");			// 전잔액
	propertyBag.put("Deposit", "5000");				// 입금액
	propertyBag.put("CBalance", "20000");			// 현잔액

	statement.setPropertyBag(propertyBag);

	Response CheckResponse = null;

	try {

		CheckResponse = statementService.update(testCorpNum, itemCode, mgtKey, statement);

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
				<legend>전자명세서 수정 확인</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
