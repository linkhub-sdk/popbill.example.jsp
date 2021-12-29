<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>

<%@ include file="common.jsp" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="com.popbill.api.kakao.KakaoButton" %>
<%@page import="com.popbill.api.PopbillException" %>

<%
    /*
     * 텍스트로 구성된 1건의 친구톡 전송을 팝빌에 접수합니다.
     * - 친구톡은 심야 전송(20:00~08:00)이 제한됩니다.
     * - 전송실패시 사전에 지정한 변수 'altSendType' 값으로 대체문자를 전송할 수 있고, 이 경우 문자(SMS/LMS) 요금이 과금됩니다.
     * - https://docs.popbill.com/kakao/java/api#SendFTS_one
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 팝빌에 등록된 카카오톡 채널 아이디
    String plusFriendID = "@팝빌";

    //발신번호 (팝빌에 등록된 발신번호만 이용가능)
    String senderNum = "07043042992";

    // 친구톡 메시지 내용 (최대 1000자)
    String content = "친구톡 메시지 내용";

    // 대체문자 내용 (최대 2000byte)
    String altContent = "대체문자 내용";

    // 대체문자 유형 [공백-미전송, C-친구톡내용, A-대체문자내용]
    String altSendType = "C";

    // 버튼 (최대 5개)
    KakaoButton[] btns = new KakaoButton[5];

    for (int i = 0; i < 5; i++) {
        KakaoButton button = new KakaoButton();
        button.setN("버튼명" + i);
        button.setT("WL");
        button.setU1("http://www.popbill.com");
        button.setU2("http://test.popbill.com");
        btns[i] = button;
    }

    // 수신번호
    String receiverNum = "010111222";

    // 수신자 이름
    String receiverName = "수신자명";

    // 예약일시 (작성형식 : yyyyMMddHHmmss)
    String sndDT = "";

    // 광고여부
    Boolean adsYN = false;

    // 팝빌회원 아이디
    String testUserID = "testkorea";

    // 전송요청번호
    // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
    // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
    String requestNum = "";

    // 접수번호
    String receiptNum = null;

    try {

        receiptNum = kakaoService.sendFTS(testCorpNum, plusFriendID, senderNum, content, altContent, altSendType,
                btns, receiverNum, receiverName, sndDT, adsYN, testUserID, requestNum);

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
        <legend>친구톡 텍스트 전송</legend>
        <ul>
            <li>접수번호 : <%=receiptNum%></li>
        </ul>
    </fieldset>
</div>
</body>
</html>
