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
<%@page import="com.popbill.api.taxinvoice.MgtKeyType"%>
<%@page import="com.popbill.api.taxinvoice.Taxinvoice"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceDetail"%>
<%@page import="com.popbill.api.taxinvoice.TaxinvoiceAddContact"%>

<%
    /*
     * "임시저장" 상태의 세금계산서를 수정합니다.
     * - https://developers.popbill.com/reference/taxinvoice/java/api/issue#Update
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 문서번호 유형 (SELL-매출, BUY-매입, TRUSTEE-위수탁)
    MgtKeyType keyType = MgtKeyType.SELL;

    // 파트너가 할당한 문서번호
    String mgtKey = "20250711-JSP002";

    // 수정할 전자세금계산서 정보
    Taxinvoice taxinvoice = new Taxinvoice();

    // 발행형태, [정발행, 역발행, 위수탁] 중 기재
    taxinvoice.setIssueType("정발행");

    // 과세형태, [과세, 영세, 면세] 중 기재
    taxinvoice.setTaxType("과세");

    // 과금방향, {정과금, 역과금} 중 기재
    // └ 정과금 = 공급자 과금 , 역과금 = 공급받는자 과금
    // -'역과금'은 역발행 세금계산서 발행 시에만 이용가능
    taxinvoice.setChargeDirection("정과금");

    // 일련번호
    taxinvoice.setSerialNum("123");

    // 책번호 "권" 항목
    taxinvoice.setKwon((short) 1);

    // 책번호 "호" 항목
    taxinvoice.setHo((short) 1);

    // 작성일자, 날짜형식(yyyyMMdd)
    taxinvoice.setWriteDate("20250711");

    // 영수/청구, [영수, 청구, 없음] 중 기재
    taxinvoice.setPurposeType("영수");

    // 공급가액 합계
    taxinvoice.setSupplyCostTotal("100000");

    // 세액 합계
    taxinvoice.setTaxTotal("10000");

    // 합계금액, 공급가액 + 세액
    taxinvoice.setTotalAmount("110000");

    // 현금
    taxinvoice.setCash("");

    // 수표
    taxinvoice.setChkBill("");

    // 외상
    taxinvoice.setCredit("");

    // 어음
    taxinvoice.setNote("");

    // 비고
    // {invoiceeType}이 "외국인" 이면 remark1 필수
    // - 외국인 등록번호 또는 여권번호 입력
    taxinvoice.setRemark1("비고1");
    taxinvoice.setRemark2("비고2");
    taxinvoice.setRemark3("비고3");

    /***************************************************************************
     * 공급자 정보
     ****************************************************************************/

    // 공급자 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합하여 사업자별로 중복되지 않도록 구성
    taxinvoice.setInvoicerMgtKey("20250711-JSP002");

    // 공급자 사업자번호
    taxinvoice.setInvoicerCorpNum(CorpNum);

    // 공급자 종사업장 식별번호, 필요시 기재. 형식은 숫자 4자리.
    taxinvoice.setInvoicerTaxRegID("");

    // 공급자 상호
    taxinvoice.setInvoicerCorpName("공급자 상호");

    // 공급자 대표자 성명
    taxinvoice.setInvoicerCEOName("공급자 대표자 성명");

    // 공급자 주소
    taxinvoice.setInvoicerAddr("공급자 주소");

    // 공급자 업태
    taxinvoice.setInvoicerBizType("공급자 업태,업태2");

    // 공급자 종목
    taxinvoice.setInvoicerBizClass("공급자 종목");

    // 공급자 담당자 성명
    taxinvoice.setInvoicerContactName("공급자 담당자 성명");

    // 공급자 담당자 부서명
    taxinvoice.setInvoicerDeptName("공급자 담당자 부서명");

    // 공급자 담당자 연락처
    taxinvoice.setInvoicerTEL("070-7070-0707");

    // 공급자 담당자 휴대폰
    taxinvoice.setInvoicerHP("010-000-2222");

    // 공급자 담당자 메일
    taxinvoice.setInvoicerEmail("test@test.com");

    // 공급자 알림문자 전송 여부 (true / false 중 택 1)
    // └ true = 전송 , false = 미전송
    // └ 공급받는자 (주)담당자 휴대폰번호 {invoiceeHP1} 값으로 문자 전송
    // - 전송 시 포인트 차감되며, 전송실패시 환불처리
    taxinvoice.setInvoicerSMSSendYN(false);

    /***************************************************************************
     * 공급받는자 정보
     ****************************************************************************/

    // [역발행시 필수] 공급받는자 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합하여 사업자별로 중복되지 않도록 구성
    taxinvoice.setInvoiceeMgtKey("");

    // 공급받는자 유형, [사업자, 개인, 외국인] 중 기재
    taxinvoice.setInvoiceeType("사업자");

    // 공급받는자 등록번호
    // - {invoiceeType}이 "사업자" 인 경우, 사업자번호 (하이픈 ('-') 제외 10자리)
    // - {invoiceeType}이 "개인" 인 경우, 주민등록번호 (하이픈 ('-') 제외 13자리)
    // - {invoiceeType}이 "외국인" 인 경우, "9999999999999" (하이픈 ('-') 제외 13자리)
    taxinvoice.setInvoiceeCorpNum("8888888888");

    // 공급받는자 종사업장 식별번호, 필요시 기재. 형식은 숫자 4자리.
    taxinvoice.setInvoiceeTaxRegID("");

    // 공급받는자 상호
    taxinvoice.setInvoiceeCorpName("공급받는자 상호");

    // 공급받는자 대표자 성명
    taxinvoice.setInvoiceeCEOName("공급받는자 대표자 성명");

    // 공급받는자 주소
    taxinvoice.setInvoiceeAddr("공급받는자 주소");

    // 공급받는자 업태
    taxinvoice.setInvoiceeBizType("공급받는자 업태");

    // 공급받는자 종목
    taxinvoice.setInvoiceeBizClass("공급받는자 종목");

    // 공급받는자 담당자 성명
    taxinvoice.setInvoiceeContactName1("공급받는자 담당자 성명");

    // 공급받는자 담당자 부서명
    taxinvoice.setInvoiceeDeptName1("공급받는자 담당자 부서명");

    // 공급받는자 담당자 연락처
    taxinvoice.setInvoiceeTEL1("070-111-222");

    // 공급받는자 담당자 휴대폰
    taxinvoice.setInvoiceeHP1("010-111-222");

    // 공급받는자 담당자 메일
    // 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
    // 실제 거래처의 메일주소가 기재되지 않도록 주의
    taxinvoice.setInvoiceeEmail1("test@test.com");

    // 공급받는자 알림문자 전송 여부 (true / false 중 택 1)
    // └ true = 전송 , false = 미전송
    // └ 공급자 담당자 휴대폰번호 {invoicerHP} 값으로 문자 전송
    // - 전송 시 포인트 차감되며, 전송실패시 환불처리
    taxinvoice.setInvoiceeSMSSendYN(false);

    /***************************************************************************
     * 수정세금계산서 정보 (수정세금계산서 작성시에만 기재)
     * - 수정세금계산서 작성방법 안내 [https://developers.popbill.com/guide/taxinvoice/java/introduction/modified-taxinvoice#intro]
     ****************************************************************************/

    // 수정 사유코드, 수정사유에 따라 1~6 중 선택기재.
    taxinvoice.setModifyCode(null);

    // 수정세금계산서 작성시 당초 국세청승인번호 기재
    taxinvoice.setOrgNTSConfirmNum(null);

    // 팝빌에 등록된 사업자등록증 첨부 여부 (true / false 중 택 1)
    // └ true = 첨부 , false = 미첨부(기본값)
    // - 팝빌 사이트 또는 인감 및 첨부문서 등록 팝업 URL (GetSealURL API) 함수를 이용하여 등록
    taxinvoice.setBusinessLicenseYN(false);

    // 팝빌에 등록된 통장사본 첨부 여부 (true / false 중 택 1)
    // └ true = 첨부 , false = 미첨부(기본값)
    // - 팝빌 사이트 또는 인감 및 첨부문서 등록 팝업 URL (GetSealURL API) 함수를 이용하여 등록
    taxinvoice.setBankBookYN(false);

    /***************************************************************************
     * 품목 상세정보
     ****************************************************************************/

    taxinvoice.setDetailList(new ArrayList<TaxinvoiceDetail>());

    TaxinvoiceDetail detail = new TaxinvoiceDetail();

    detail.setSerialNum((short) 1); // 일련번호, 1부터 순차기재
    detail.setPurchaseDT("20250711"); // 거래일자
    detail.setItemName("품명"); // 품명
    detail.setSpec("규격"); // 규격
    detail.setQty("1"); // 수량
    detail.setUnitCost("50000"); // 단가
    detail.setSupplyCost("50000"); // 공급가액
    detail.setTax("5000"); // 세액
    detail.setRemark("품목비고"); // 비고

    taxinvoice.getDetailList().add(detail);

    detail = new TaxinvoiceDetail();

    detail.setSerialNum((short) 2);
    detail.setPurchaseDT("20250711");
    detail.setItemName("품명2");
    detail.setSpec("규격");
    detail.setQty("1");
    detail.setUnitCost("50000");
    detail.setSupplyCost("50000");
    detail.setTax("5000");
    detail.setRemark("품목비고2");

    taxinvoice.getDetailList().add(detail);

    /***************************************************************************
     * 공급받는자 추가담당자 정보
     * - 세금계산서 발행 안내 메일을 수신받을 공급받는자 담당자가 다수인 경우 담당자 정보를 추가하여 발행 안내메일을 다수에게 전송할 수 있습니다. (최대 5명)
     ****************************************************************************/

    taxinvoice.setAddContactList(new ArrayList<TaxinvoiceAddContact>());

    TaxinvoiceAddContact addContact = new TaxinvoiceAddContact();
    addContact.setSerialNum(1); // 일련번호, (1부터 순차적으로 입력 (최대 5))
    addContact.setContactName("추가 담당자 성명"); // 담당자 성명
    addContact.setEmail("test2@test.com"); // 메일
    taxinvoice.getAddContactList().add(addContact);

    addContact = new TaxinvoiceAddContact();
    addContact.setSerialNum(2);
    addContact.setContactName("추가 담당자 성명");
    addContact.setEmail("test2@test.com");
    taxinvoice.getAddContactList().add(addContact);

    // 팝빌회원 아이디
    String UserID = "testkorea";

    Response CheckResponse = null;

    try {

        CheckResponse = taxinvoiceService.update(CorpNum, keyType, mgtKey, taxinvoice, UserID);

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
                <legend><%=request.getRequestURI()%></legend>
                <ul>
                    <li>code (응답코드) : <%=CheckResponse.getCode()%></li>
                    <li>message (응답메시지) : <%=CheckResponse.getMessage()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>