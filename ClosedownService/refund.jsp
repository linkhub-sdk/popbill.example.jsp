<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.RefundResponse"%>
<%@page import="com.popbill.api.RefundForm"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 연동회원 포인트를 환불 신청합니다.
     * - https://developers.popbill.com/reference/closedown/java/common-api/point#Refund
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 환불신청 객체정보
    RefundForm refundForm = new RefundForm();

    // 담당자명
    refundForm.setContactName("담당자명");

    // 담당자 연락처
    refundForm.setTel("01077777777");

    // 환불 신청 포인트
    refundForm.setRequestPoint("10");

    // 은행명
    refundForm.setAccountBank("국민");

    // 계좌번호
    refundForm.setAccountNum("123123123-123");

    // 예금주명
    refundForm.setAccountName("예금주명");

    // 환불사유
    refundForm.setReason("환불사유");

    // 팝빌회원 아이디
    String UserID = "testkorea";

    RefundResponse checkResponse = new RefundResponse();

    try {

        checkResponse = closedownService.refund(CorpNum, refundForm, UserID);

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
                    <li>응답코드 (code) : <%=checkResponse.getCode()%></li>
                    <li>응답메시지 (message) : <%=checkResponse.getMessage()%></li>
                    <li>환불코드 (refundCode) : <%=checkResponse.getRefundCode()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
