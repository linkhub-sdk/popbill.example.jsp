<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException" %>
<%@page import="com.popbill.api.cashbill.Cashbill" %>

<%
    /*
     * 현금영수증 1건의 상세정보를 확인합니다.
     * - https://docs.popbill.com/cashbill/java/api#GetDetailInfo
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 현금영수증 문서번호
    String mgtKey = "20221108-JSP001";

    Cashbill cashbill = null;

    try {

        cashbill = cashbillService.getDetailInfo(testCorpNum, mgtKey);

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
                <legend>현금영수증 상세정보 조회</legend>
                <fieldset class="fieldset2">
                    <legend>Cashbill</legend>
                    <ul>
                        <li>mgtKey (문서번호) : <%=cashbill.getMgtKey() %></li>
                        <li>confirmNum (국세청 승인번호) : <%=cashbill.getConfirmNum() %></li>
                        <li>orgConfirmNum (원본 현금영수증 국세청 승인번호) : <%=cashbill.getOrgConfirmNum() %></li>
                        <li>orgTradeDate (원본 현금영수증 거래일자) : <%=cashbill.getOrgTradeDate() %></li>
                        <li>tradeDate (거래일자) : <%=cashbill.getTradeDate() %></li>
                        <li>tradeDT (거래일시) : <%=cashbill.getTradeDT() %></li>
                        <li>tradeType (문서형태) : <%=cashbill.getTradeType() %></li>
                        <li>tradeUsage (거래구분) : <%= cashbill.getTradeUsage()%></li>
                        <li>tradeOpt (거래유형) : <%= cashbill.getTradeOpt()%></li>
                        <li>taxationType (과세형태) : <%=cashbill.getTaxationType() %></li>
                        <li>totalAmount (합계금액) : <%=cashbill.getTotalAmount() %></li>
                        <li>supplyCost (공급가액) : <%=cashbill.getSupplyCost() %></li>
                        <li>tax (부가세) : <%=cashbill.getTax() %></li>
                        <li>serviceFee (봉사료) : <%=cashbill.getServiceFee() %></li>
                        <li>franchiseCorpNum (가맹점 사업자번호) : <%=cashbill.getFranchiseCorpNum() %></li>
                        <li>franchiseTaxRegID (가맹점 종사업장 번호) : <%=cashbill.getFranchiseTaxRegID() %></li>
                        <li>franchiseCorpName (가맹점 상호) : <%=cashbill.getFranchiseCorpName() %></li>
                        <li>franchiseCEOName (가맹점 대표자 성명) : <%=cashbill.getFranchiseCEOName() %></li>
                        <li>franchiseAddr (가맹점 주소) : <%=cashbill.getFranchiseAddr() %></li>
                        <li>franchiseTEL (가맹점 연락처) : <%=cashbill.getFranchiseTEL() %></li>
                        <li>identityNum (거래처 식별번호) : <%=cashbill.getIdentityNum() %></li>
                        <li>customerName (거래처 주문자명) : <%=cashbill.getCustomerName() %></li>
                        <li>itemName (거래처 주문상품명) : <%=cashbill.getItemName() %></li>
                        <li>orderNumber (가맹점 주문번호) : <%=cashbill.getOrderNumber() %></li>
                        <li>email (거래처 이메일) : <%=cashbill.getEmail() %></li>
                        <li>hp (거래처 휴대폰번호) : <%=cashbill.getHp() %></li>
                        <li>cancelType (취소사유) : <%=cashbill.getCancelType() %></li>
                        <li>smssendYN (알림문자 전송여부) : <%=cashbill.isSmssendYN() %></li>
                    </ul>
            </fieldset>
        </fieldset>
    </div>
</body>
</html>
