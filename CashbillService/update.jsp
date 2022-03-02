<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.Response" %>
<%@page import="com.popbill.api.PopbillException" %>
<%@page import="com.popbill.api.cashbill.Cashbill" %>

<%
    /*
     * 1건의 현금영수증을 [수정]합니다.
     * - [임시저장] 상태의 현금영수증만 수정할 수 있습니다.
     * - 국세청에 신고된 현금영수증은 수정할 수 없으며, 취소 현금영수증을 발행하여 취소처리 할 수 있습니다.
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 현금영수증 문서번호
    String mgtKey = "20220218-JSP002";

    // 현금영수증 정보 객체
    Cashbill cashbill = new Cashbill();

    // 현금영수증 문서번호, 1~24자리 (숫자, 영문, '-', '_') 조합으로 사업자 별로 중복되지 않도록 구성
    cashbill.setMgtKey(mgtKey);

    // 거래구분, {소득공제용, 지출증빙용} 중 기재
    cashbill.setTradeUsage("소득공제용");

    // 거래유형, {일반, 도서, 대중교통} 중 기재
    cashbill.setTradeOpt("일반");

    // 식별번호, 거래구분에 따라 작성
    // └ 소득공제용 - 주민등록/휴대폰/카드번호(현금영수증 카드)/자진발급용 번호(010-000-1234) 기재가능
    // └ 지출증빙용 - 사업자번호/주민등록/휴대폰/카드번호(현금영수증 카드) 기재가능
    // └ 주민등록번호 13자리, 휴대폰번호 10~11자리, 카드번호 13~19자리, 사업자번호 10자리 입력 가능
    cashbill.setIdentityNum("01011112222");

    // 과세형태, {과세, 비과세} 중 기재
    cashbill.setTaxationType("과세");

    // 공급가액, 숫자만 가능
    cashbill.setSupplyCost("10000");

    // 부가세, 숫자만 가능
    cashbill.setTax("1000");

    // 봉사료, 숫자만 가능
    cashbill.setServiceFee("0");

    // 합계금액, 숫자만 가능, 봉사료 + 공급가액 + 부가세
    cashbill.setTotalAmount("11000");


    // 가맹점 사업자번호, '-'제외 10자리
    cashbill.setFranchiseCorpNum(testCorpNum);

    // 가맹점 종사업장 번호
    cashbill.setFranchiseTaxRegID("");

    // 가맹점 상호
    cashbill.setFranchiseCorpName("가맹점 상호_수정");

    // 가맹점 대표자 성명
    cashbill.setFranchiseCEOName("가맹점 대표자_수정");

    // 가맹점 주소
    cashbill.setFranchiseAddr("가맹점 주소");

    // 가맹점 연락처
    cashbill.setFranchiseTEL("07043042991");

    // 구매자 성명
    cashbill.setCustomerName("주문자명");

    // 주문상품명
    cashbill.setItemName("주문상품명");

    // 주문번호
    cashbill.setOrderNumber("주문번호");

    // 구매자 이메일
    cashbill.setEmail("test@test.com");

    // 구매자 휴대폰
    // - {smssendYN} 의 값이 true 인 경우 이 값으로 안내 문자 전송
    cashbill.setHp("");

    // 발행 안내 문자 전송여부
    cashbill.setSmssendYN(false);

    Response CheckResponse = null;

    try {

        CheckResponse = cashbillService.update(testCorpNum, mgtKey, cashbill);

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
        <legend>현금영수증 수정</legend>
        <ul>
            <li>Response.code : <%=CheckResponse.getCode()%></li>
            <li>Response.message : <%=CheckResponse.getMessage()%></li>
        </ul>
    </fieldset>
</div>
</body>
</html>
