<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.JoinForm"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 프로그램 공급사의 고객사를 팝빌 연동회원으로 가입하는 API 입니다.
     * - https://developers.popbill.com/reference/statement/java/common-api/member#JoinMember
     */

    // 연동회원 객체정보
    JoinForm joinInfo = new JoinForm();

    // 아이디, 6자 이상 50자 미만
    joinInfo.setID("testkorea0328");

    // 비밀번호 (8자 이상 20자 이하) 영문, 숫자, 특수문자 조합
    joinInfo.setPassword("password123!@#");

    // 파트너 링크아이디
    joinInfo.setLinkID(LinkID);

    // 사업자번호 (하이픈 '-' 제외 10 자리)
    joinInfo.setCorpNum("1234567890");

    // 대표자 성명, 최대 100자
    joinInfo.setCEOName("대표자 성명");

    // 회사명, 최대 200자
    joinInfo.setCorpName("회사명");

    // 사업장 주소, 최대 300자
    joinInfo.setAddr("주소");

    // 업태, 최대 100자
    joinInfo.setBizType("업태");

    // 종목, 최대 100자
    joinInfo.setBizClass("종목");

    // 담당자 성명, 최대 100자
    joinInfo.setContactName("담당자 성명");

    // 담당자 메일, 최대 100자
    joinInfo.setContactEmail("test@test.com");

    // 담당자 휴대폰, 최대 20자
    joinInfo.setContactTEL("02-999-9999");

    Response CheckResponse = null;

    try {

        CheckResponse = statementService.joinMember(joinInfo);

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
                    <li>응답코드 (code) : <%=CheckResponse.getCode()%></li>
                    <li>응답메시지 (message) : <%=CheckResponse.getMessage()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
