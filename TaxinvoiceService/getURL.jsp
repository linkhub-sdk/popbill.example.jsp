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
     * 로그인 상태로 팝빌 사이트의 전자세금계산서 문서함 메뉴에 접근할 수 있는 페이지의 팝업 URL을 반환합니다.
     * - 반환되는 URL은 보안 정책상 30초 동안 유효하며, 시간을 초과한 후에는 해당 URL을 통한 페이지 접근이 불가합니다.
     * - https://developers.popbill.com/reference/taxinvoice/java/api/info#GetURL
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 접근 메뉴 ( "TBOX" , "SBOX" , "PBOX" , "WRITE" 중 택 1)
    // TBOX : 임시문서함 , SBOX : 매출문서함 , PBOX : 매입문서함 , 
    // SWBOX : 매출발행 대기함 , PWBOX : 매입발행 대기함 , WRITE : 매출작성
    String TOGO = "TBOX";

    // 팝빌회원 아이디
    String testUserID = "testkorea";

    String url = null;

    try {

        url = taxinvoiceService.getURL(testCorpNum, testUserID, TOGO);

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
            <legend>세금계산서 관련 SSO URL 확인</legend>
            <ul>
                <li>url : <%=url%></li>
            </ul>
        </fieldset>
    </div>
</html>
