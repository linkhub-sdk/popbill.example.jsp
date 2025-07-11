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
<%@page import="com.popbill.api.cashbill.Cashbill"%>

<%
    /*
     * 최대 100건의 현금영수증 발행을 한번의 요청으로 접수합니다.
     * - https://developers.popbill.com/reference/cashbill/java/api/issue#BulkSubmit
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 제출아이디, 대량 발행 접수를 구별하는 식별키
    // └ 최대 36자리 영문, 숫자, '-' 조합으로 구성
    String SubmitID = "20250711-JSP-BULK";

    // 최대 100건.
    List<Cashbill> cashbillList = new ArrayList<Cashbill>();

    for (int i = 0 ; i < 5; i++) {

        // 현금영수증 정보 객체
        Cashbill cashbill = new Cashbill();

        // 현금영수증 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로 사업자 별로 중복되지 않도록 구성
        cashbill.setMgtKey(SubmitID + "-" + String.valueOf(i + 1));

        // 거래일시, 날짜(yyyyMMddHHmmss)
        // 당일, 전일만 가능
        cashbill.setTradeDT("20250711000000");

        // 문서형태, 승인거래 기재
        cashbill.setTradeType("승인거래");

        // 거래구분, {소득공제용, 지출증빙용} 중 기재
        cashbill.setTradeUsage("소득공제용");

        // 거래유형, {일반, 도서공연, 대중교통} 중 기재
        // - 미입력시 기본값 "일반" 처리
        cashbill.setTradeOpt("대중교통");

        // 과세형태, {과세, 비과세} 중 기재
        cashbill.setTaxationType("과세");

        // 합계금액, 숫자만 가능, 봉사료 + 공급가액 + 부가세
        cashbill.setTotalAmount("11000");

        // 공급가액, 숫자만 가능
        cashbill.setSupplyCost("10000");

        // 부가세, 양수 또는 0 입력
        cashbill.setTax("1000");

        // 봉사료, 양수 또는 0 입력
        cashbill.setServiceFee("0");

        // 가맹점 사업자번호, '-'제외 10자리
        cashbill.setFranchiseCorpNum("1234567890");

        // 가맹점 종사업장 번호
        cashbill.setFranchiseTaxRegID("");

        // 가맹점 상호
        cashbill.setFranchiseCorpName("가맹점 상호");

        // 가맹점 대표자 성명
        cashbill.setFranchiseCEOName("가맹점 대표자");

        // 가맹점 주소
        cashbill.setFranchiseAddr("가맹점 주소");

        // 가맹점 연락처
        cashbill.setFranchiseTEL("07043042991");

        // 식별번호, 거래구분에 따라 작성
        // └ 소득공제용 - 주민등록/휴대폰/카드번호(현금영수증 카드)/자진발급용 번호(010-000-1234) 기재가능
        // └ 지출증빙용 - 사업자번호/주민등록/휴대폰/카드번호(현금영수증 카드) 기재가능
        // └ 주민등록번호 13자리, 휴대폰번호 10~11자리, 카드번호 13~19자리, 사업자번호 10자리 입력 가능
        cashbill.setIdentityNum("0101112222");

        // 구매자 성명
        cashbill.setCustomerName("고객명");

        // 주문상품명
        cashbill.setItemName("상품명");

        // 주문번호
        cashbill.setOrderNumber("주문번호");

        // 구매자 이메일
        // 팝빌 개발환경에서 테스트하는 경우에도 안내 메일이 전송되므로,
        // 실제 거래처의 메일주소가 기재되지 않도록 주의
        cashbill.setEmail("");

        // 구매자 휴대폰
        // - {smssendYN} 의 값이 true 인 경우 아래 휴대폰번호로 안내 문자 전송
        cashbill.setHp("");

        // 발행 안내 문자 전송여부
        cashbill.setSmssendYN(false);

        cashbillList.add(cashbill);
    }

    // 팝빌회원 아이디
    String UserID = "testkorea";

    BulkResponse CheckResponse = null;

    try {

        CheckResponse = cashbillService.bulkSubmit(testCorpNum, SubmitID, cashbillList, UserID);

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
                    <li>응답 코드(code) : <%=CheckResponse.getCode()%></li>
                    <li>응답메시지 (message) : <%=CheckResponse.getMessage()%></li>
                    <li>접수아이디 (Response.receiptID) : <%=CheckResponse.getReceiptID()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
