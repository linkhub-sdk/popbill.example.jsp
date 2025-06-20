<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.Response"%>
<%@page import="com.popbill.api.ContactInfo"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 연동회원에 담당자를 추가합니다.
     * - https://developers.popbill.com/reference/fax/java/common-api/member#RegistContact
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    ContactInfo contactInfo = new ContactInfo();

    // 담당자 아이디 (최대 50자)
    contactInfo.setId("testkorea");

    // 담당자 비밀번호 (8자 이상 20자 이하) 영문, 숫자 ,특수문자 조합
    contactInfo.setPassword("password123!@#");

    // 담당자 성명, 최대 100자
    contactInfo.setPersonName("담당자");

    // 담당자 연락처 (최대 20자)
    contactInfo.setTel("02-1234-1234");

    // 담당자 이메일 (최대 100자)
    contactInfo.setEmail("test@test.com");

    // 담당자 조회권한 1 - 개인권한 / 2 - 읽기권한  / 3 - 회사권한
    contactInfo.setSearchRole(3);

    Response CheckResponse = null;

    try {

        CheckResponse = faxService.registContact(testCorpNum, contactInfo);

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
                <legend>담당자 추가등록</legend>
                <ul>
                    <li>응답 코드(code) : <%=CheckResponse.getCode()%></li>
                    <li>응답메시지 (message) : <%=CheckResponse.getMessage()%></li>
                </ul>
            </fieldset>
        </div>
    </body>
</html>
