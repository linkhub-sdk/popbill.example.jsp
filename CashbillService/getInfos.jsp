<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.cashbill.CashbillInfo"%>

<%
    /*
     * 다수건의 현금영수증 상태 및 요약 정보를 확인합니다. (1회 호출 시 최대 1,000건 확인 가능)
     * - 리턴값 'CashbillInfo'의 변수 'stateCode'를 통해 현금영수증의 상태코드를 확인합니다.
     * - 현금영수증 상태코드 [https://developers.popbill.com/reference/cashbill/java/response-code]
     * - https://developers.popbill.com/reference/cashbill/java/api/info#GetInfos
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 현금영수증 문서번호 배열 (최대 1000건)
    String[] mgtKeyList = new String[] {"20210701-001","20230102-JSP001", "20230102-JSP002"};

    // 팝빌회원 아이디
    String UserID = "testkorea";

    CashbillInfo[] cashbillInfos = null;

    try {

        cashbillInfos = cashbillService.getInfos(testCorpNum, mgtKeyList, UserID);

    } catch (PopbillException pe) {
        // 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        // 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
        throw pe;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">Response </p>
            <br/>
            <fieldset class="fieldset1">
                <legend><%=request.getRequestURI()%></legend>
                <%
                    CashbillInfo cashbillInfo = null;

                    for ( int i = 0; i < cashbillInfos.length; i++ ) {
                        cashbillInfo = cashbillInfos[i];
                %>
                <fieldset class="fieldset2">
                    <legend>현금영수증 상태/요약정보</legend>
                    <ul>
                        <li>itemKey (팝빌번호) : <%= cashbillInfo.getItemKey()%></li>
                        <li>mgtKey (문서번호) : <%= cashbillInfo.getMgtKey()%></li>
                        <li>tradeDate (거래일자) : <%= cashbillInfo.getTradeDate()%></li>
                        <li>tradeDT (거래일시) : <%= cashbillInfo.getTradeDT()%></li>
                        <li>tradeType (문서형태) : <%= cashbillInfo.getTradeType()%></li>
                        <li>tradeUsage (거래구분) : <%= cashbillInfo.getTradeUsage()%></li>
                        <li>tradeOpt (거래유형) : <%= cashbillInfo.getTradeOpt()%></li>
                        <li>taxationType (과세형태) : <%= cashbillInfo.getTaxationType()%></li>
                        <li>totalAmount (거래금액) : <%= cashbillInfo.getTotalAmount()%></li>
                        <li>supplyCost (공급가액) : <%= cashbillInfo.getSupplyCost()%></li>
                        <li>tax (부가세) : <%= cashbillInfo.getTax()%></li>
                        <li>serviceFee (봉사료) : <%= cashbillInfo.getServiceFee()%></li>
                        <li>issueDT (발행일시) : <%= cashbillInfo.getIssueDT()%></li>
                        <li>regDT (등록일시) : <%= cashbillInfo.getRegDT()%></li>
                        <li>stateCode (상태코드) : <%= cashbillInfo.getStateCode()%></li>
                        <li>stateDT (상태 변경일시) : <%= cashbillInfo.getStateDT()%></li>
                        <li>identityNum (식별번호) : <%= cashbillInfo.getIdentityNum()%></li>
                        <li>itemName (상품명) : <%= cashbillInfo.getItemName()%></li>
                        <li>orderNumber (주문번호) : <%= cashbillInfo.getOrderNumber()%></li>
                        <li>email (구매자 이메일) : <%= cashbillInfo.getEmail()%></li>
                        <li>hp (구매자 휴대폰) : <%= cashbillInfo.getHp()%></li>
                        <li>customerName (구매자(고객) 성명) : <%= cashbillInfo.getCustomerName()%></li>
                        <li>confirmNum (국세청승인번호) : <%= cashbillInfo.getConfirmNum()%></li>
                        <li>orgConfirmNum (당초 국세청승인번호) : <%= cashbillInfo.getOrgConfirmNum()%></li>
                        <li>orgTradeDate (당초 거래일자) : <%= cashbillInfo.getOrgTradeDate()%></li>
                        <li>ntssendDT (국세청 전송일시) : <%= cashbillInfo.getNtssendDT()%></li>
                        <li>ntsresultDT (국세청 처리결과 수신일시) : <%= cashbillInfo.getNtsresultDT()%></li>
                        <li>ntsresultCode (결과코드) : <%= cashbillInfo.getNtsresultCode()%></li>
                        <li>ntsresultMessage (결과메시지) : <%= cashbillInfo.getNtsresultMessage()%></li>
                        <li>printYN (인쇄여부) : <%= cashbillInfo.isPrintYN()%></li>
                        <li>interOPYN (연동문서 여부) : <%= cashbillInfo.isInterOPYN()%></li>
                    </ul>
                </fieldset>
                <%
                    }
                %>
            </fieldset>
        </div>
    </body>
</html>