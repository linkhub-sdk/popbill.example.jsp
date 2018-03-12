<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException" %>
<%@page import="com.popbill.api.kakao.ATSTemplate" %>

<%
    /*
    (주)카카오로 부터 승인된 알림톡 템플릿 목록을 확인 합니다.
     */

    // 팝빌회원 사업자번호
    String testCorpNum = "1234567890";

    ATSTemplate[] aTSTemplates = null;

    try {

        aTSTemplates = kakaoService.listATSTemplate(testCorpNum);

    } catch (PopbillException pe) {
        //적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        //예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
        throw pe;
    }

%>
<div id="content">
    <p class="heading1">Response</p>
    <br/>
    <fieldset class="fieldset1">
        <legend>알림톡 템플릿 목록 확인</legend>
        <%
            ATSTemplate aTSTemplate = null;

            for (int i = 0; i < aTSTemplates.length; i++) {
                aTSTemplate = aTSTemplates[i];
        %>
        <fieldset class="fieldset2">
            <legend>템플릿 정보 [<%=i + 1%> / <%=aTSTemplates.length%>]</legend>
            <ul>
                <li>templateCode (템플릿 코드) : <%=aTSTemplate.getTemplateCode()%></li>
                <li>templateName (템플릿 제목) : <%=aTSTemplate.getTemplateName()%></li>
                <li>template (템플릿 내용) : <%=aTSTemplate.getTemplate()%></li>
                <li>plusFriendID (플러스친구 아이디) : <%=aTSTemplate.getPlusFriendID()%></li>
            </ul>
        </fieldset>
        <%
            }
        %>
    </fieldset>
</div>
</html>
