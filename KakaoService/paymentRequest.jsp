<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.popbill.api.PaymentResponse"%>
<%@page import="com.popbill.api.PaymentForm"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 연동회원 포인트 충전을 위해 무통장입금을 신청합니다.
     * - https://developers.popbill.com/reference/kakaotalk/java/common-api/point#PaymentRequest
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 입금신청 객체정보
    PaymentForm paymentForm = new PaymentForm();

    // 담당자명
    paymentForm.setSettlerName("담당자명");

    // 담당자 메일
    paymentForm.setSettlerEmail("test@test.com");

    // 담당자 휴대폰
    // └ 무통장 입금 승인 알림톡이 전송될 번호
    paymentForm.setNotifyHP("01012341234");

    // 입금자명
    paymentForm.setPaymentName("입금자명");

    // 결제금액
    paymentForm.setSettleCost("11000");

    // 팝빌회원 아이디
    String UserID = "testkorea";

    PaymentResponse paymentResponse = new PaymentResponse();

    try {

        paymentResponse = kakaoService.paymentRequest(CorpNum, paymentForm, UserID);

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
                    <li>code (응답코드) : <%=paymentResponse.getCode()%></li>
                    <li>message (응답메시지) : <%=paymentResponse.getMessage()%></li>
                    <li>정산코드 (settleCode) : <%=paymentResponse.getSettleCode()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
