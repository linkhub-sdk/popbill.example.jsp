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
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.statement.Statement"%>
<%@page import="com.popbill.api.statement.StatementDetail"%>

<%
	/*
	 * 전자명세서를 팩스로 전송하는 함수로, 팝빌에 데이터를 저장하는 과정이 없습니다.
	 * - 팩스 전송 요청시 포인트가 차감됩니다. (전송실패시 환불처리)
	 * - 팝빌 사이트 [문자·팩스] > [팩스] > [전송내역] 메뉴에서 전송결과를 확인 할 수 있습니다.
	 * - 팩스 전송결과를 확인하기 위해서는 선팩스 전송 요청 시 반환받은 접수번호를 이용하여
	 *   팩스 API의 전송결과 확인 (GetFaxDetail) API를 이용하면 됩니다.
	 * - https://docs.popbill.com/statement/java/api#FAXSend
	 */

	// 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

	// 발신번호
	String sendNum = "070-4304-2991";

	// 수신팩스번호
	String receiveNum = "070-111-222";


	/***************************************************************************
	 *                               전자명세서 정보
	 ****************************************************************************/

	Statement statement = new Statement();

	// [필수] 작성일자, 날짜형식(yyyyMMdd)
	statement.setWriteDate("20190107");

	// [필수] {영수, 청구} 중 기재
	statement.setPurposeType("영수");

	// [필수] 과세형태, {과세, 영세, 면세} 중 기재
	statement.setTaxType("과세");

	// 맞춤양식코드, 미기재시 기본양식으로 처리
	statement.setFormCode("");

	// [필수] 명세서 코드, [121 - 거래명세서], [122 - 청구서], [123 - 견적서], [124 - 발주서], [125 - 입금표], [126 - 영수증]
	statement.setItemCode((short) 121);

	// [필수] 문서번호, 최대 24자리 영문, 숫자, '-', '_' 조합으로 구성
	statement.setMgtKey("20190107-06");


	/***************************************************************************
	 *                               발신자 정보
	 ****************************************************************************/

	// 발신자 사업자번호
	statement.setSenderCorpNum(testCorpNum);

	// 발신자 상호
	statement.setSenderCorpName("발신자 상호");

	// 발신자 주소
	statement.setSenderAddr("발신자 주소");

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

	// 발신자받는자 사업자번호
	statement.setReceiverCorpNum("8888888888");

	// 발신자받는자 상호
	statement.setReceiverCorpName("수신자 상호");

	// 발신자받는자 대표자성명
	statement.setReceiverCEOName("수신자 대표자 성명");

	// 발신자받는자 주소
	statement.setReceiverAddr("수신자 주소");

	// 발신자받는자 종목
	statement.setReceiverBizClass("수신자 업종");

	// 발신자받는자 업태
	statement.setReceiverBizType("수신자 업태");

	// 발신자받는자 담당자명
	statement.setReceiverContactName("수신자 담당자명");

	// 발신자받는자 담당자 메일주소
	statement.setReceiverEmail("test@receiver.com");

	// 발신자받는자 담당자 연락처
	statement.setReceiverTEL("010-111-1111");

	// 발신자받는자 담당자 휴대폰번호
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

	String receiptNum = null;

	try {

		receiptNum = statementService.FAXSend(testCorpNum, statement, sendNum, receiveNum);

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
				<legend>전자명세서 선팩스전송</legend>
				<ul>
					<li>receiptNum(팩스전송 접수번호) : <%=receiptNum%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>
