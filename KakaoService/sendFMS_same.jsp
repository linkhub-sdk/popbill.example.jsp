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
<%@page import="java.io.File" %>

<%
    /*
    * 이미지가 첨부된 다수건의 친구톡 전송을 팝빌에 접수하며, 모든 수신자에게 동일 내용을 전송합니다. (최대 1,000건)
    * - 친구톡의 경우 야간 전송은 제한됩니다. (20:00 ~ 익일 08:00)
    * - 전송실패시 사전에 지정한 변수 'altSendType' 값으로 대체문자를 전송할 수 있고, 이 경우 문자(SMS/LMS) 요금이 과금됩니다.
    * - 대체문자의 경우, 포토문자(MMS) 형식은 지원하고 있지 않습니다.
     * - https://docs.popbill.com/kakao/java/api#SendFMS_same
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 팝빌에 등록된 카카오톡 채널 아이디
    String plusFriendID = "@팝빌";

    // 팝빌에 사전 등록된 발신번호
    // altSendType = 'C' / 'A' 일 경우, 대체문자를 전송할 발신번호
    // altSendType = '' 일 경우, null 또는 공백 처리
    // ※ 대체문자를 전송하는 경우에는 사전에 등록된 발신번호 입력 필수
    String senderNum = "070-4304-2991";

    // 친구톡 내용 (최대 400자)
    String content = "[친구톡 이미지 테스트]\n\n"
                   + "친구톡 이미지 동보내용입니다.\n"
                   + "대체문자를 친구톡 메시지 내용 그대로 전송할 수 있습니다.\n"
                   + "또는 대체문자 내용을 작송하여 전송할 수도 있습니다.\n"
                   + "하지만 대체문자 내용이 길어지게 되면 LMS 로 전송될 수 있습니다.\n\n"
                   + "수신을 원치 않으시면 1600-9854로 전화주시길 바랍니다.\n";

    // 대체문자 제목
    // - 메시지 길이(90byte)에 따라 장문(LMS)인 경우에만 적용.
    String altSubject = "대체문자 제목";

    // 대체문자 유형(altSendType)이 "A"일 경우, 대체문자로 전송할 내용 (최대 2000byte)
    // └ 팝빌이 메시지 길이에 따라 단문(90byte 이하) 또는 장문(90byte 초과)으로 전송처리
    String altContent = "대체문자 내용";

    // 대체문자 유형 (null , "C" , "A" 중 택 1)
    // null = 미전송, C = 알림톡과 동일 내용 전송 , A = 대체문자 내용(altContent)에 입력한 내용 전송
    String altSendType = "C";

    // 카카오톡 수신정보 배열, 최대 1000건
    KakaoReceiver[] receivers = new KakaoReceiver[2];

    for (int i = 0; i < 2; i++) {
        KakaoReceiver message = new KakaoReceiver();
        message.setReceiverNum("010111222" + i);
        message.setReceiverName("수신자명" + i);
        receivers[i] = message;
    }

    // 버튼 배열 (최대 5개)
    KakaoButton[] btns = new KakaoButton[5];

    for (int i = 0; i < 5; i++) {
        KakaoButton button = new KakaoButton();
        button.setN("버튼명" + i);
        button.setT("WL");
        button.setU1("http://www.popbill.com");
        button.setU2("http://test.popbill.com");
        btns[i] = button;
    }


    // 예약일시 (작성형식 : yyyyMMddHHmmss)
    String sndDT = "";

    // 광고여부
    Boolean adsYN = false;

    // 첨부이미지 파일 경로
    // 이미지 파일 규격: 전송 포맷 – JPG 파일 (.jpg, .jpeg), 용량 – 최대 500 Kbyte, 크기 – 가로 500px 이상, 가로 기준으로 세로 0.5~1.3배 비율 가능
    File file = new File((application.getRealPath("/resources/kakaofmstest.jpg")));

    // 이미지 링크 URL
    // └ 수신자가 친구톡 상단 이미지 클릭시 호출되는 URL
    // 미입력시 첨부된 이미지를 링크 기능 없이 표시
    String imageURL = "http://www.linkhub.co.kr";

    // 팝빌회원 아이디
    String testUserID = "testkorea";

    // 전송요청번호
    // 팝빌이 접수 단위를 식별할 수 있도록 파트너가 할당한 식별번호.
    // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
    String requestNum = "";

    // 접수번호
    String receiptNum = null;

    try {

        receiptNum = kakaoService.sendFMS(testCorpNum, plusFriendID, senderNum, content, altSubject, altContent,
                altSendType, receivers, btns, sndDT, adsYN, file, imageURL, testUserID, requestNum);

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
        <legend>친구톡 이미지 전송</legend>
        <ul>
            <li>접수번호 : <%=receiptNum%></li>
        </ul>
    </fieldset>
</div>
</body>
</html>
