<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>
<%@ include file="common.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.taxinvoice.Taxinvoice"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceDetail"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceAddContact"%>

<%
	Taxinvoice taxinvoice = new Taxinvoice();

	taxinvoice.setWriteDate("20141224");		// 필수, 기재상 작성일자(yyyyMMdd)
	taxinvoice.setIssueType("정발행");			// 필수, {정발행, 역발행, 위수탁}
	taxinvoice.setChargeDirection("정과금");	// 필수, {정과금, 역과금}
	taxinvoice.setPurposeType("영수");			// 필수, {영수, 청구}
	taxinvoice.setIssueTiming("직접발행");		// 필수, {직접발행, 승인시자동발행}
	taxinvoice.setTaxType("과세");				// 필수, {과세, 비과세}

	//공급자 정보
	taxinvoice.setInvoicerCorpNum("1231212312");				// 공급자 사업자번호, "-"제외
	taxinvoice.setInvoicerTaxRegID("1234");						// 종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
	taxinvoice.setInvoicerCorpName("공급자 상호");				// 필수
	taxinvoice.setInvoicerMgtKey("20141230-12");				// 공급자 연동문서 관리번호. 최대 25자리 공급자 발행까지 API로 발행하고자 할경우 정발행과 동일한 형태로 추가 기재.
	taxinvoice.setInvoicerCEOName("공급자 대표자 성명");		// 필수
	taxinvoice.setInvoicerAddr("공급자 주소");
	taxinvoice.setInvoicerBizClass("공급자 업종");
	taxinvoice.setInvoicerBizType("공급자 업태,업태2");
	taxinvoice.setInvoicerContactName("공급자 담당자명");
	taxinvoice.setInvoicerEmail("test@test.com");
	taxinvoice.setInvoicerTEL("070-7070-0707");
	taxinvoice.setInvoicerHP("010-000-2222");
	taxinvoice.setInvoicerSMSSendYN(false);						// 발행시 문자발송기능 사용시 활용

	//공급받는자 정보 기재
	taxinvoice.setInvoiceeType("사업자");						// 사업자 , 개인 , 외국인
	taxinvoice.setInvoiceeCorpNum("8888888888");				// 개인의 경우 주민등록번호, 외국인의 경우 "9999999999999" 기재후 비고에 여권번호 또는 외국인등록번호 기재.
	taxinvoice.setInvoiceeCorpName("공급받는자 상호");			// 필수
	taxinvoice.setInvoiceeMgtKey("");							// 문서관리번호 최대 25자리 공급받는자 사업자번호별 중복없는 고유번호 할당
	taxinvoice.setInvoiceeCEOName("공급받는자 대표자 성명");	// 필수
	taxinvoice.setInvoiceeAddr("공급받는자 주소");
	taxinvoice.setInvoiceeBizClass("공급받는자 업종");
	taxinvoice.setInvoiceeBizType("공급받는자 업태");
	taxinvoice.setInvoiceeContactName1("공급받는자 담당자명");
	taxinvoice.setInvoiceeEmail1("weicome@innopost.com");

	taxinvoice.setSupplyCostTotal("200000");				// 필수 공급가액 합계
	taxinvoice.setTaxTotal("20000");						// 필수 세액 합계
	taxinvoice.setTotalAmount("220000");					// 필수 합계금액. 공급가액 + 세액
	taxinvoice.setModifyCode(null);							// 수정세금계산서 작성시 1~6까지 선택기재.
	taxinvoice.setOriginalTaxinvoiceKey("");				// 수정세금계산서 작성시 원본세금계산서의 ItemKey기재. ItemKey는 getInfo로 확인.
	taxinvoice.setSerialNum("123");							// 일련번호 항목
	taxinvoice.setCash("");									// 현금
	taxinvoice.setChkBill("");								// 수표
	taxinvoice.setNote("");									// 어음
	taxinvoice.setCredit("");								// 외상미수금
	taxinvoice.setRemark1("비고1");
	taxinvoice.setRemark2("비고2");
	taxinvoice.setRemark3("비고3");
	taxinvoice.setKwon((short) 1);
	taxinvoice.setHo((short) 1);

	taxinvoice.setBusinessLicenseYN(false);					// 사업자등록증 이미지 첨부시 설정.
	taxinvoice.setBankBookYN(false);						// 통장사본 이미지 첨부시 설정.

	taxinvoice.setDetailList(new ArrayList<TaxinvoiceDetail>());

	TaxinvoiceDetail detail = new TaxinvoiceDetail();

	detail.setSerialNum((short) 1);						 // 일련번호
	detail.setPurchaseDT("20141219");					 // 거래일자
	detail.setItemName("품목명");
	detail.setSpec("규격");
	detail.setQty("1");									// 수량
	detail.setUnitCost("100000");						// 단가
	detail.setSupplyCost("100000");						// 공급가액
	detail.setTax("10000");								 // 세액
	detail.setRemark("품목비고");

	taxinvoice.getDetailList().add(detail);

	detail = new TaxinvoiceDetail();

	detail.setSerialNum((short) 2);
	detail.setPurchaseDT("20141219");	
	detail.setItemName("품목명");
	detail.setSpec("규격");
	detail.setQty("1");									// 수량
	detail.setUnitCost("100000");						// 단가
	detail.setSupplyCost("100000");						// 공급가액
	detail.setTax("10000");								 // 세액
	detail.setRemark("품목비고");

	taxinvoice.getDetailList().add(detail);
	
	taxinvoice.setAddContactList(new ArrayList<TaxinvoiceAddContact>());
	
	TaxinvoiceAddContact addContact = new TaxinvoiceAddContact();
	addContact.setSerialNum(1);
	addContact.setContactName("추가 담당자명");
	addContact.setEmail("test2@test.com");
	taxinvoice.getAddContactList().add(addContact);
	
	Response CheckResponse = null;

	try {

		String testCorpNum = "1231212312";		// 정발행 시 - 공급자 사업자번호, 아이디 입력 
		String userID = "userid";				// 역발행 시 - 공급받는자 사업자번호, 아이디 입력

		CheckResponse = taxinvoiceService.register(testCorpNum, taxinvoice, userID);

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
				<legend>세금계산서 등록 확인</legend>
				<ul>
					<li>Response.code : <%=CheckResponse.getCode()%></li>
					<li>Response.message : <%=CheckResponse.getMessage()%></li>
				</ul>
			</fieldset>
		 </div>
	</body>
</html>