<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.Response" %>
<%@page import="com.popbill.api.ContactInfo" %>
<%@page import="com.popbill.api.PopbillException" %>

<%
    /*
     * 연동회원에 담당자를 추가합니다.
     * - https://developers.popbill.com/reference/kakaotalk/java/common-api/member#RegistContact
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 담당자 객체정보
    ContactInfo contactInfo = new ContactInfo();

    // 아이디, 6자 이상 50자 미만
    contactInfo.setId("testid");

    // 비밀번호 (8자 이상 20자 이하) 영문, 숫자, 특수문자 조합
    contactInfo.setPassword("password123!@#");

    // 담당자 성명, 최대 100자
    contactInfo.setPersonName("담당자 성명");

    // 담당자 휴대폰, 최대 20자
    contactInfo.setTel("070-1234-1234");

    // 담당자 메일, 최대 100자
    contactInfo.setEmail("test1234@test.com");

    // 권한, 1 - 개인권한 / 2 - 읽기권한 / 3 - 회사권한
    contactInfo.setSearchRole(3);

    // 팝빌회원 아이디
    String UserID =  "testkorea";

    Response CheckResponse = null;

    try {

        CheckResponse = kakaoService.registContact(CorpNum, contactInfo, UserID);

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
            <li>code (응답코드) : <%=CheckResponse.getCode()%></li>
            <li>message (응답메시지) : <%=CheckResponse.getMessage()%></li>
        </ul>
    </fieldset>
</div>
</body>
</html>
