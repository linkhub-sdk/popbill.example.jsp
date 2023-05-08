<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 가입된 연동회원의 탈퇴를 요청합니다.
     * - 회원탈퇴 신청과 동시에 팝빌의 모든 서비스 이용이 불가하며, 관리자를 포함한 모든 담당자 계정도 일괄탈퇴 됩니다.
     * - 회원탈퇴로 삭제된 데이터는 복원이 불가능합니다.
     * - 관리자 계정만 사용 가능합니다.
     * - https://developers.popbill.com/reference/taxinvoice/java/api/member#QuitMember
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    String quitReason = "회원 탈퇴 사유";

    Response quitResponse = new Response();

    try {

        quitResponse = taxinvoiceService.quitMember(testCorpNum, quitReason);

    } catch (PopbillException pe) {
        // 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        // 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
        throw pe;
    }
%>
    <body>
        <div id="content">
            <p class="heading1">RefundableBalance</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>팝빌 회원 탈퇴</legend>
                <ul>
                    <li>응답 코드(code) : <%=quitResponse.getCode()%></li>
                    <li>응답메시지 (message) : <%=quitResponse.getMessage()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
