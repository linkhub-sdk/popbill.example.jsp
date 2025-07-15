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
<%@page import="com.popbill.api.kakao.KakaoReceiver" %>
<%@page import="com.popbill.api.PopbillException" %>

<%
    /*
     * 텍스트로 구성된 다수건의 친구톡 전송을 팝빌에 접수하며, 모든 수신자에게 동일 내용을 전송합니다. (최대 1,000건)
     * - 친구톡의 경우 야간 전송은 제한됩니다. (20:00 ~ 익일 08:00)
     * - 전송실패시 사전에 지정한 변수 'altSendType' 값으로 대체문자를 전송할 수 있고, 이 경우 문자(SMS/LMS) 요금이 과금됩니다.
     * - https://developers.popbill.com/reference/kakaotalk/java/api/send#SendFTSSame
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 검색용 아이디
    String plusFriendID = "@팝빌";

    // 발신번호
    // altSendType = 'C' / 'A' 일 경우, 대체문자를 전송할 발신번호
    // altSendType = '' 일 경우, null 또는 공백 처리
    // ※ 대체문자를 전송하는 경우에는 사전에 등록된 발신번호 입력 필수
    String senderNum = "07043042991";

    // 친구톡 내용 (최대 1000자)
    String content = "[친구톡 테스트]\n\n" + "친구톡 동보내용입니다.\n" + "대체문자를 친구톡 메시지 내용 그대로 전송할 수 있습니다.\n"
            + "또는 대체문자 내용을 작송하여 전송할 수도 있습니다.\n" + "하지만 대체문자 내용이 길어지게 되면 LMS 로 전송될 수 있습니다.\n\n"
            + "수신을 원치 않으시면 1600-9854로 전화주시길 바랍니다.";

    // 대체문자 제목
    // - 메시지 길이(90byte)에 따라 장문(LMS)인 경우에만 적용.
    String altSubject = "대체문자 동보제목";

    // 대체문자 내용, 대체문자 유형(altSendType)이 "A"일 경우, 대체문자로 전송할 내용 (최대 2000byte)
    // └ 팝빌이 메시지 길이에 따라 단문(90byte 이하) 또는 장문(90byte 초과)으로 전송처리
    String altContent = "대체문자 내용";

    // 대체문자 유형 (null , "C" , "A" 중 택 1)
    // null = 미전송, C = 친구톡과 동일 내용 전송 , A = 대체문자 내용(altContent)에 입력한 내용 전송
    String altSendType = "C";

    // 전송정보, 최대 1000건
    KakaoReceiver[] receivers = new KakaoReceiver[2];
    for (int i = 0; i < 2; i++) {
        KakaoReceiver message = new KakaoReceiver();
        message.setReceiverNum("010111222"); // 수신번호
        message.setReceiverName("수신자명" + i); // 수신자명
        // message.setInterOPRefKey(""); // 파트너 지정키
        receivers[i] = message;
    }

    // 버튼 목록, 최대 5개
    KakaoButton[] btns = new KakaoButton[2];

    KakaoButton button = new KakaoButton();
    button.setN("버튼명"); // 버튼명
    button.setT("WL"); // 버튼 유형
    button.setU1("http://www.popbill.com"); // 버튼링크
    button.setU2("http://test.popbill.com"); // 버튼링크
    button.setTg("out"); // 아웃 링크, 디바이스 기본 브라우저 사용 (공백(기본값) : 카카오톡 인앱 브라우저 사용)
    btns[0] = button;

    button = new KakaoButton();
    button.setN("버튼명2");
    button.setT("WL");
    button.setU1("http://www.popbill.com");
    button.setU2("http://test.popbill.com");
    button.setTg("out"); // 아웃 링크, 디바이스 기본 브라우저 사용 (공백(기본값) : 카카오톡 인앱 브라우저 사용)
    btns[1] = button;

    // 전송 예약일시, 형태(yyyyMMddHHmmss)
    // - 분단위 전송, 미입력 시 즉시 전송
    String sndDT = "";

    // 광고성 메시지 여부 ( true , false 중 택 1)
    // └ true = 광고 , false = 일반
    // - 미입력 시 기본값 false 처리
    Boolean adsYN = false;

    // 팝빌회원 아이디
    String UserID = "testkorea";

    // 요청번호
    // 팝빌이 접수 단위를 식별할 수 있도록 파트너가 할당한 식별번호.
    // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
    String requestNum = "";

    // 접수번호
    String receiptNum = null;

    try {

        receiptNum = kakaoService.sendFTS(CorpNum, plusFriendID, senderNum, content, altSubject, altContent,
                altSendType, receivers, btns, sndDT, adsYN, UserID, requestNum);

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
            <li>접수번호 : <%=receiptNum%></li>
        </ul>
    </fieldset>
</div>
</body>
</html>
