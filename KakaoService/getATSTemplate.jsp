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
<%@page import="com.popbill.api.kakao.KakaoButton" %>
<%@page import="java.util.List" %>

<%
    /*
     * 승인된 알림톡 템플릿 정보를 확인합니다.
     * - https://developers.popbill.com/reference/kakaotalk/java/api/template#GetATSTemplate
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 템플릿 코드
    String templateCode = "021010000076";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    ATSTemplate aTSTemplate = null;

    try {

        aTSTemplate = kakaoService.getATSTemplate(CorpNum, templateCode, UserID);

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
        <legend><%=request.getRequestURI()%></legend>
            <ul>
                <li>templateCode (템플릿 코드) : <%=aTSTemplate.getTemplateCode()%></li>
                <li>templateName (템플릿 제목) : <%=aTSTemplate.getTemplateName()%></li>
                <li>template (템플릿 내용) : <%=aTSTemplate.getTemplate()%></li>
                <li>plusFriendID (검색용 아이디) : <%=aTSTemplate.getPlusFriendID()%></li>
                <li>ads (광고 메시지) : <%=aTSTemplate.getAds()%></li>
                <li>appendix (부가 메시지) : <%=aTSTemplate.getAppendix()%></li>
                <li>secureYN (보안템플릿 여부) : <%=aTSTemplate.getSecureYN()%></li>
                <li>state (템플릿 상태) : <%=aTSTemplate.getState()%></li>
                <li>stateDT (템플릿 상태 일시) : <%=aTSTemplate.getStateDT()%></li>
                <% if (aTSTemplate.getBtns() != null) {
                    List<KakaoButton> btns = aTSTemplate.getBtns();
                        for (int i = 0; i < btns.size(); i++) { %>
                            <fieldset class="fieldset2">
                                <legend>버튼 목록 [<%=i + 1%> / <%=btns.size()%> ] </legend>
                                <ul>
                                    <li>n (버튼명) : <%=btns.get(i).getN()%></li>
                                    <li>t (버튼유형) : <%=btns.get(i).getT()%></li>
                                    <li>u1 (버튼링크) : <%=btns.get(i).getU1()%></li>
                                    <li>u2 (버튼링크) : <%=btns.get(i).getU2()%></li>
                                    <li>tg (아웃 링크) : <%=btns.get(i).getTg()%></li>
                                </ul>
                            </fieldset>
                <%
                        }
                    }
                %>
            </ul>
    </fieldset>
</div>
</html>
