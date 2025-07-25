<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 파트너가 할당한 요청번호를 통해 팩스 1건을 재전송합니다.
     * 발신/수신 정보 미입력시 기존과 동일한 정보로 팩스가 전송되고, 접수일 기준 최대 60일이 경과되지 않는 건만 재전송이 가능합니다.
     * - https://developers.popbill.com/reference/fax/java/api/send#ResendFAXRN
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 요청번호
    // 파트너가 접수 단위를 식별하기 위해 할당하는 관리번호
    // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
    String requestNum = "";

    // 발신번호, 공백처리시 기존전송정보로 재전송
    String sendNum = "07043042991";

    // 발신자명, 공백처리시 기존전송정보로 재전송
    String senderName = "발신자명";

    // 수신번호, 공백처리시 기존전송정보로 재전송
    String receiveNum = "";

    // 수신자명, 공백처리시 기존전송정보로 재전송
    String receiveName = "";

    // 전송 예약일시, null인 경우 즉시전송
    Date reserveDT = null;

    // 팝빌회원 아이디
    String UserID = "testkorea";

    // 팩스 제목
    String title = "팩스 재전송 제목";

    // 원본 팩스 요청번호
    String orgRequestNum = "";

    String receiptNum = null;

    try {

        receiptNum = faxService.resendFAXRN(CorpNum, requestNum, sendNum, senderName, receiveNum, receiveName,
                reserveDT, UserID, title, orgRequestNum);

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
                    <li>receiptNum (팩스전송 접수번호) : <%=receiptNum%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
