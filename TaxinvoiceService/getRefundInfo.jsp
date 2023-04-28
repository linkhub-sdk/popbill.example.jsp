<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.RefundResponse"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 포인트 환불에 대한 상세정보 1건을 확인합니다.
     * - https://developers.popbill.com/reference/taxinvoice/java/api/point#GetRefundInfo
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    String refundCode = "023040000017";

    RefundResponse response;

    try {

        response = taxinvoiceService.getRefundInfo(testCorpNum, refundCode);

    } catch (PopbillException pe) {
        // 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        // 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
        throw pe;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">GetRefundInfo</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>RefundInfo (환불 신청 상태)</legend>
                <ul>
                    <li>reqDT (신청일시) : <%=response.reqDT%></li>
                    <li>requestPoint (환불 신청포인트) : <%=response.requestPoint%></li>
                    <li>accountBank (환불계좌 은행명) : <%=response.accountBank%></li>
                    <li>accountNum (환불계좌번호) : <%=response.accountNum%></li>
                    <li>accountName (환불계좌 예금주명) : <%=response.accountName%></li>
                    <li>state (상태) : <%=response.state%></li>
                    <li>reason (환불사유) : <%=response.reason%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
