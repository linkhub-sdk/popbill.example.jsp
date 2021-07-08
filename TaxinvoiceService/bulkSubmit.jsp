<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.popbill.api.BulkResponse"%>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.taxinvoice.Taxinvoice"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceDetail"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceAddContact"%>

<%
    /*
     * 1건의 세금계산서를 즉시발행 처리합니다.
     * - 세금계산서 항목별 정보는 "[전자세금계산서 API 연동매뉴얼] > 4.1. (세금)계산서구성"을 참조하시기 바랍니다.
     * - https://docs.popbill.com/taxinvoice/java/api#RegistIssue
     */
     
    String testCorpNum = "1234567890";
    
    // 제출아이디, 대량 발행 접수를 구별하는 식별키
    // └ 최대 36자리 영문, 숫자, '-' 조합으로 구성
    String submitID = "202010708JSP-BULK0";
     
    // 지연발행 강제여부
    // 발행마감일이 지난 세금계산서를 발행하는 경우, 가산세가 부과될 수 있습니다.
    // 가산세가 부과되더라도 발행을 해야하는 경우에는 forceIssue의 값을
    // true로 선언하여 API를 호출하시면 됩니다.
    boolean ForceIssue = false;
     
    List<Taxinvoice> bulkTx = new ArrayList<Taxinvoice>();
     
    for(int i=0; i<10; i++) {
         
        // 세금계산서 정보 객체
        Taxinvoice taxinvoice = new Taxinvoice();

        // 작성일자, 날짜형식(yyyyMMdd)
        taxinvoice.setWriteDate("20210708");

        // 과금방향, [정과금, 역과금] 중 선택기재, "역과금"은 역발행세금계산서 발행에만 가능
        taxinvoice.setChargeDirection("정과금");

        // 발행유형, [정발행, 역발행, 위수탁] 중 기재
        taxinvoice.setIssueType("정발행");

        // [영수, 청구] 중 기재
        taxinvoice.setPurposeType("영수");

        // 과세형태, [과세, 영세, 면세] 중 기재
        taxinvoice.setTaxType("과세");


        /*********************************************************************
         *                              공급자 정보
         *********************************************************************/

        // 공급자 사업자번호
        taxinvoice.setInvoicerCorpNum(testCorpNum);

        // 공급자 종사업장 식별번호, 필요시 기재. 형식은 숫자 4자리.
        taxinvoice.setInvoicerTaxRegID("");

        // 공급자 상호
        taxinvoice.setInvoicerCorpName("공급자 상호");

        // 공급자 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로 사업자 별로 중복되지 않도록 구성
        taxinvoice.setInvoicerMgtKey(submitID + "-" + i);

        // 공급자 대표자성명
        taxinvoice.setInvoicerCEOName("공급자 대표자 성명");

        // 공급자 주소
        taxinvoice.setInvoicerAddr("공급자 주소");

        // 공급자 종목
        taxinvoice.setInvoicerBizClass("공급자 업종");

        // 공급자 업태
        taxinvoice.setInvoicerBizType("공급자 업태,업태2");

        // 공급자 담당자 성명
        taxinvoice.setInvoicerContactName("공급자 담당자명");

        // 공급자 담당자 메일주소
        taxinvoice.setInvoicerEmail("test@test.com");

        // 공급자 담당자 연락처
        taxinvoice.setInvoicerTEL("070-7070-0707");

        // 공급자 담당자 휴대폰번호
        taxinvoice.setInvoicerHP("010-000-2222");

        // 발행 안내문자메시지 전송여부
        // - 전송시 포인트 차감되며, 전송실패시 환불처리
        taxinvoice.setInvoicerSMSSendYN(false);


        /*********************************************************************
         *                          공급받는자 정보
         *********************************************************************/

        // 공급받는자 구분, [사업자, 개인, 외국인] 중 기재
        taxinvoice.setInvoiceeType("사업자");

        // 공급받는자 사업자번호, '-' 제외 10자리
        taxinvoice.setInvoiceeCorpNum("8888888888");

        // 공급받는자 상호
        taxinvoice.setInvoiceeCorpName("공급받는자 상호");

        // [역발행시 필수] 공급받는자 문서번호, 1~24자리까지 사업자번호별 중복없는 고유번호 할당
        taxinvoice.setInvoiceeMgtKey("");

        // 공급받는자 대표자 성명
        taxinvoice.setInvoiceeCEOName("공급받는자 대표자 성명");

        // 공급받는자 주소
        taxinvoice.setInvoiceeAddr("공급받는자 주소");

        // 공급받는자 종목
        taxinvoice.setInvoiceeBizClass("공급받는자 업종");

        // 공급받는자 업태
        taxinvoice.setInvoiceeBizType("공급받는자 업태");

        // 공급받는자 담당자명
        taxinvoice.setInvoiceeContactName1("공급받는자 담당자명");

        // 공급받는자 담당자 메일주소
        // 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
        // 실제 거래처의 메일주소가 기재되지 않도록 주의
        taxinvoice.setInvoiceeEmail1("");

        // 공급받는자 담당자 연락처
        taxinvoice.setInvoiceeTEL1("070-111-222");

        // 공급받는자 담당자 휴대폰번호
        taxinvoice.setInvoiceeHP1("010-111-222");

        // 역발행시 안내문자메시지 전송여부
        // - 전송시 포인트 차감되며, 전송실패시 환불처리
        taxinvoice.setInvoiceeSMSSendYN(false);


        /*********************************************************************
         *                          세금계산서 기재정보
         *********************************************************************/

        // [필수] 공급가액 합계
        taxinvoice.setSupplyCostTotal("100000");

        // [필수] 세액 합계
        taxinvoice.setTaxTotal("10000");

        // [필수] 합계금액, 공급가액 + 세액
        taxinvoice.setTotalAmount("110000");

        // 기재 상 일련번호
        taxinvoice.setSerialNum("123");

        // 기재 상 현금
        taxinvoice.setCash("");
        
        // 기재 상 수표
        taxinvoice.setChkBill("");

        // 기재 상 어음
        taxinvoice.setNote("");

        // 기재 상 외상미수금
        taxinvoice.setCredit("");

        // 기재 상 비고
        taxinvoice.setRemark1("비고1");
        taxinvoice.setRemark2("비고2");
        taxinvoice.setRemark3("비고3");
        taxinvoice.setKwon((short) 1);
        taxinvoice.setHo((short) 1);

        // 사업자등록증 이미지 첨부여부
        taxinvoice.setBusinessLicenseYN(false);

        // 통장사본 이미지 첨부여부
        taxinvoice.setBankBookYN(false);


        /*********************************************************************
         *              수정세금계산서 정보 (수정세금계산서 작성시 기재)
         * - 수정세금계산서 관련 정보는 연동매뉴얼 또는 개발가이드 링크 참조
         & - [참고] 수정세금계산서 작성방법 안내 [https://docs.popbill.com/taxinvoice/modify?lang=java]
         *********************************************************************/
        
        // 수정사유코드, 수정사유에 따라 1~6 중 선택기재.
        //taxinvoice.setModifyCode(null);

        // 원본세금계산서 국세청승인번호
        //taxinvoice.setOrgNTSConfirmNum("");


        /*********************************************************************
         *                          상세항목(품목) 정보
         *********************************************************************/

        taxinvoice.setDetailList(new ArrayList<TaxinvoiceDetail>());

        // 상세항목 객체
        TaxinvoiceDetail detail = new TaxinvoiceDetail();

        detail.setSerialNum((short) 1); // 일련번호, 1부터 순차기재
        detail.setPurchaseDT("20210401"); // 거래일자
        detail.setItemName("품목명");
        detail.setSpec("규격");
        detail.setQty("1"); // 수량
        detail.setUnitCost("50000"); // 단가
        detail.setSupplyCost("50000"); // 공급가액
        detail.setTax("5000"); // 세액
        detail.setRemark("품목비고");

        taxinvoice.getDetailList().add(detail);

        detail = new TaxinvoiceDetail();

        detail.setSerialNum((short) 2); // 일련번호, 1부터 순차기재
        detail.setPurchaseDT("20210401"); // 거래일자
        detail.setItemName("품목명2");
        detail.setSpec("규격");
        detail.setQty("1"); // 수량
        detail.setUnitCost("50000"); // 단가
        detail.setSupplyCost("50000"); // 공급가액
        detail.setTax("5000"); // 세액
        detail.setRemark("품목비고2");

        taxinvoice.getDetailList().add(detail);


        /*********************************************************************
         *                          추가담당자 정보
         *********************************************************************/

        taxinvoice.setAddContactList(new ArrayList<TaxinvoiceAddContact>());

        TaxinvoiceAddContact addContact = new TaxinvoiceAddContact();

        addContact.setSerialNum(1);
        addContact.setContactName("추가 담당자명");
         
        // 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
        // 실제 거래처의 메일주소가 기재되지 않도록 주의
        addContact.setEmail("test2@test.com");

        taxinvoice.getAddContactList().add(addContact);
         
        bulkTx.add(taxinvoice);
    }

    BulkResponse CheckResponse = null;

    try {

        CheckResponse = taxinvoiceService.bulkSubmit(testCorpNum, submitID, bulkTx, ForceIssue);

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
                <legend>세금계산서 즉시발행</legend>
                <ul>
                    <li>응답코드 (Response.code) : <%=CheckResponse.getCode()%></li>
                    <li>응답메시지 (Response.message) : <%=CheckResponse.getMessage()%></li>
                    <li>접수아이디 (Response.receiptID) : <%=CheckResponse.getReceiptID()%></li>
                </ul>
            </fieldset>
         </div>
    </body>
</html>
