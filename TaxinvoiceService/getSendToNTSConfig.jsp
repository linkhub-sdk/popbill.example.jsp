<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>

<%
   /*
    * 연동회원의 국세청 전송 옵션 설정 상태를 확인합니다.
    * - 국세청 전송 옵션 설정은 팝빌 사이트 [전자세금계산서] > [환경설정] > [세금계산서 관리] 메뉴에서 설정할 수 있으며,
    *   API로 설정은 불가능 합니다.
    * - 세금계산서 국세청 전송 정책 [https://docs.popbill.com/taxinvoice/ntsSendPolicy?lang=java]
    * - https://docs.popbill.com/taxinvoice/java/api#GetSendToNTSConfig
    */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    boolean ntsConfig;

    try {

         ntsConfig = taxinvoiceService.getSendToNTSConfig(testCorpNum);

    } catch (PopbillException pe) {
        // 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        // 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
        throw pe;
    }
%>
        <div id="content">
            <p class="heading1">Response</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>국세청 전송 옵션 설정 상태 확인</legend>
                <ul>
                    <li>ntsConfig : <%=ntsConfig%></li>
                    <li>(true)-발행 즉시 전송 (false)-익일 자동 전송</li>
                </ul>
            </fieldset>
         </div>
</html>
