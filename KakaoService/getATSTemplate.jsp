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
     * - https://docs.popbill.com/kakao/java/api#GetATSTemplate
     */

    // 팝빌회원 사업자번호
    String testCorpNum = "1234567890";
	
    // 확인할 템플릿 코드
    String templateCode = "021010000076";
            
    ATSTemplate aTSTemplate = null;

    try {

        aTSTemplate = kakaoService.getATSTemplate(testCorpNum, templateCode);

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
        <legend>알림톡 템플릿 정보 확인</legend>
            <ul>
                <li>templateCode (템플릿 코드) : <%=aTSTemplate.getTemplateCode()%></li>
                <li>templateName (템플릿 제목) : <%=aTSTemplate.getTemplateName()%></li>
                <li>template (템플릿 내용) : <%=aTSTemplate.getTemplate()%></li>
                <li>plusFriendID (카카오톡 채널 아이디) : <%=aTSTemplate.getPlusFriendID()%></li>
                <li>ads (광고메시지) : ${aTSTemplate.getAds()}</li>
                <li>appendix(부가메시지) : ${aTSTemplate.getAppendix()}</li>
                <% if (aTSTemplate.getBtns() != null) {
                    List<KakaoButton> btns = aTSTemplate.getBtns();
                        for (int i = 0; i < btns.size(); i++) { %>
                            <fieldset class="fieldset2">
                                <legend>버튼 목록 [<%=i + 1%> / <%=btns.size()%> ] </legend>
                                <ul>
                                    <li>n (버튼명) : <%=btns.get(i).getN()%></li>
                                    <li>t (버튼유형) : <%=btns.get(i).getT()%></li>
                                    <li>u1 (버튼링크1) : <%=btns.get(i).getU1()%></li>
                                    <li>u2 (버튼링크2) : <%=btns.get(i).getU2()%></li>
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
