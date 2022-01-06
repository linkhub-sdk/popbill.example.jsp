<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>

<%@ include file="common.jsp" %>
<%@page import="java.util.ArrayList" %>
<%@page import="com.popbill.api.Response" %>
<%@page import="com.popbill.api.PopbillException" %>
<%@page import="com.popbill.api.taxinvoice.Taxinvoice" %>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceDetail" %>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceAddContact" %>

<%
    /*
     * 공급받는자가 작성한 세금계산서 데이터를 팝빌에 저장하고 공급자에게 송부하여 발행을 요청합니다.
     * - 역발행 세금계산서 프로세스를 구현하기 위해서는 공급자/공급받는자가 모두 팝빌에 회원이여야 합니다.
     * - 역발행 즉시 요청(RegistRequest) 후 공급자가 [발행] 처리시 포인트가 차감되며 역발행 세금계산서 항목 중
     * - 과금방향(ChargeDirection)에 기재한 값에 따라 정과금(공급자과금) 또는 역과금(공급받는자과금) 처리됩니다.
     * - https://docs.popbill.com/taxinvoice/java/api#RegistRequest
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 팝빌회원 아이디
    String testUserID = "testkorea";

    /***************************************************************************
     *                               세금계산서 정보
     ****************************************************************************/

    Taxinvoice taxinvoice = new Taxinvoice();

    // 작성일자, 날짜형식(yyyyMMdd)
    taxinvoice.setWriteDate("20220104");

    // 발행유형, {정발행, 역발행, 위수탁} 중 기재
    taxinvoice.setIssueType("역발행");

    // 과금방향, {정과금, 역과금} 중 선택 기재
    // -'역과금'은 역발행 세금계산서 발행 시에만 이용가능
    taxinvoice.setChargeDirection("정과금");

    // {영수, 청구, 없음} 중 기재
    taxinvoice.setPurposeType("영수");

    // 과세형태, {과세, 영세, 면세} 중 기재
    taxinvoice.setTaxType("과세");


    /***************************************************************************
     *                               공급자 정보
     ****************************************************************************/

    // 공급자 사업자번호, "-"제외
    taxinvoice.setInvoicerCorpNum("8888888888");

    // 공급자 종사업자 식별번호. 필요시 기재. 형식은 숫자 4자리.
    taxinvoice.setInvoicerTaxRegID("");

    // 공급자 상호
    taxinvoice.setInvoicerCorpName("공급자 상호");

    // 공급자 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로 사업자 별로 중복되지 않도록 구성
    taxinvoice.setInvoicerMgtKey("");

    // 공급자 대표자 성명
    taxinvoice.setInvoicerCEOName("공급자 대표자 성명");

    // 공급자 주소
    taxinvoice.setInvoicerAddr("공급자 주소");

    // 공급자 종목
    taxinvoice.setInvoicerBizClass("공급자 종목");

    // 공급자 업태
    taxinvoice.setInvoicerBizType("공급자 업태");

    // 공급자 담당자 성명
    taxinvoice.setInvoicerContactName("공급자 담당자 성명");

    // 공급자 담당자 메일주소
    taxinvoice.setInvoicerEmail("test@test.com");

    // 공급자 담당자 연락처
    taxinvoice.setInvoicerTEL("070-7070-0707");

    // 공급자 휴대폰번호
    taxinvoice.setInvoicerHP("010-000-2222");

    // 발행 안내 문자 전송여부
    // - 전송시 포인트 차감되며, 전송실패시 환불처리
    taxinvoice.setInvoicerSMSSendYN(false);


    /***************************************************************************
     *                               공급받는 정보
     ****************************************************************************/

    // 공급받는자 구분, {사업자 , 개인 , 외국인} 중 기재
    taxinvoice.setInvoiceeType("사업자");

    // 공급받는자 사업자번호, '-' 제외 10자리
    taxinvoice.setInvoiceeCorpNum(testCorpNum);

    // 공급받는자 종사업장 식별번호, 필요시 숫자4자리 기재
    taxinvoice.setInvoiceeTaxRegID("");

    // 공급받는자 상호
    taxinvoice.setInvoiceeCorpName("공급받는자 상호");

    // [역발행 시 필수] 공급받는자 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로 사업자 별로 중복되지 않도록 구성
    taxinvoice.setInvoiceeMgtKey("20220104-003");

    // 공급받는자 대표자 성명
    taxinvoice.setInvoiceeCEOName("공급받는자 대표자 성명");

    // 공급받는자 주소
    taxinvoice.setInvoiceeAddr("공급받는자 주소");

    // 공급받는자 종목
    taxinvoice.setInvoiceeBizClass("공급받는자 업종");

    // 공급받는자 업태
    taxinvoice.setInvoiceeBizType("공급받는자 업태");

    // 공급받는자 담당자 성명
    taxinvoice.setInvoiceeContactName1("공급받는자 담당자 성명");

    // 공급받는자 담당자 메일주소
    // 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
    // 실제 거래처의 메일주소가 기재되지 않도록 주의
    taxinvoice.setInvoiceeEmail1("test@test.com");

    // 공급받는자 담당자 연락처
    taxinvoice.setInvoiceeTEL1("070-1234-1234");

    // 공급받는자 담당자 휴대폰번호
    taxinvoice.setInvoiceeHP1("010-000-1111");

    // 역발행 안내 문자 전송여부
    // - 전송시 포인트 차감되며, 전송실패시 환불처리
    taxinvoice.setInvoiceeSMSSendYN(false);


    /***************************************************************************
     *                              세금계산서 기재정보
     ****************************************************************************/

    // 공급가액 합계
    taxinvoice.setSupplyCostTotal("200000");

    // 세액 합계
    taxinvoice.setTaxTotal("20000");

    // 합계금액. 공급가액 + 세액
    taxinvoice.setTotalAmount("220000");

    // 일련번호
    taxinvoice.setSerialNum("123");

    // 현금
    taxinvoice.setCash("");

    // 수표
    taxinvoice.setChkBill("");

    // 어음
    taxinvoice.setNote("");

    // 외상미수금
    taxinvoice.setCredit("");
    taxinvoice.setRemark1("비고1");
    taxinvoice.setRemark2("비고2");
    taxinvoice.setRemark3("비고3");

    // 책번호 '권' 항목, 최대값 32767
    taxinvoice.setKwon((short) 1);

    // 책번호 '호' 항목, 최대값 32767
    taxinvoice.setHo((short) 1);

    // 사업자등록증 이미지 첨부여부
    taxinvoice.setBusinessLicenseYN(false);

    // 통장사본 이미지 첨부여부
    taxinvoice.setBankBookYN(false);

    /***************************************************************************
     * 수정세금계산서 정보 (수정세금계산서 작성시에만 기재)
     * - 수정세금계산서 관련 정보는 연동매뉴얼 또는 개발가이드 링크 참조
     * - 수정세금계산서 작성방법 안내 [https://docs.popbill.com/taxinvoice/modify?lang=java]
     ****************************************************************************/

    // 수정사유코드, 수정사유에 따라 1~6 중 선택기재.
    taxinvoice.setModifyCode(null);

    // 수정세금계산서 작성시 원본세금계산서 국세청 승인번호 기재
    taxinvoice.setOrgNTSConfirmNum("");


    /***************************************************************************
     *                           상세항목(품목) 정보
     ****************************************************************************/

    taxinvoice.setDetailList(new ArrayList<TaxinvoiceDetail>());

    // 상세항목 객체
    TaxinvoiceDetail detail = new TaxinvoiceDetail();

    detail.setSerialNum((short) 1);   // 일련번호, 1부터 순차기재
    detail.setPurchaseDT("20220103"); // 거래일자
    detail.setItemName("품목명");     // 품목명
    detail.setSpec("규격");           // 규격
    detail.setQty("1");               // 수량
    detail.setUnitCost("50000");      // 단가
    detail.setSupplyCost("50000");    // 공급가액
    detail.setTax("5000");            // 세액
    detail.setRemark("품목비고");     // 비고

    taxinvoice.getDetailList().add(detail);

    detail = new TaxinvoiceDetail();

    detail.setSerialNum((short) 2);
    detail.setPurchaseDT("20220103");
    detail.setItemName("품목명2");
    detail.setSpec("규격");
    detail.setQty("1");
    detail.setUnitCost("50000");
    detail.setSupplyCost("50000");
    detail.setTax("5000");
    detail.setRemark("품목비고2");

    taxinvoice.getDetailList().add(detail);

    // 메모
    String memo = "즉시요청 메모";

    Response CheckResponse = null;

    try {

        CheckResponse = taxinvoiceService.registRequest(testCorpNum, taxinvoice, memo, testUserID);

    } catch (PopbillException pe) {
        // 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        // 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
        throw pe;
    }
%>
<body>
<div id="content">
    <p class="heading1">Response</p>
    <br/>
    <fieldset class="fieldset1">
        <legend>세금계산서 즉시요청</legend>
        <ul>
            <li>Response.code : <%=CheckResponse.getCode()%></li>
            <li>Response.message : <%=CheckResponse.getMessage()%></li>
        </ul>
    </fieldset>
</div>
</body>
</html>
