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
     * 이미지가 첨부된 다수건의 친구톡 전송을 팝빌에 접수하며, 수신자 별로 개별 내용을 전송합니다. (최대 1,000건)
     * - 친구톡은 심야 전송(20:00~08:00)이 제한됩니다.
     * - 이미지 전송규격 / jpg 포맷, 용량 최대 500KByte, 이미지 높이/너비 비율 1.333 이하, 1/2 이상
     * - 전송실패시 사전에 지정한 변수 'altSendType' 값으로 대체문자를 전송할 수 있고, 이 경우 문자(SMS/LMS) 요금이 과금됩니다.
     * - https://docs.popbill.com/kakao/java/api#SendFMS_multi
     */

    // 팝빌회원 사업자번호
    String testCorpNum = "1234567890";

    // 팝빌에 등록된 카카오톡 채널 아이디
    String plusFriendID = "@팝빌";

    //발신번호 (팝빌에 등록된 발신번호만 이용가능)
    String senderNum = "07043042992";

    // 친구톡 메시지 내용 (최대 400자)
    String content = "친구톡 메시지 내용";

    // 대체문자 내용 (최대 2000byte)
    String altContent = "대체문자 내용";

    // 대체문자 유형 [공백-미전송, C-친구톡내용, A-대체문자내용]
    String altSendType = "C";

    // 1회 최대 전송 1,000건 전송 가능
    KakaoReceiver[] receivers = new KakaoReceiver[10];

    for (int i = 0; i < 10; i++) {
        KakaoReceiver message = new KakaoReceiver();
        message.setReceiverNum("010111222" + i);
        message.setReceiverName("수신자명" + i);
        message.setMessage("친구톡 이미지 입니다." + i);
        message.setAltMessage("대체문자 내용" + i);
        receivers[i] = message;
    }

    // 버튼 (최대 5개)
    KakaoButton[] btns = new KakaoButton[5];

    for (int i = 0; i <5 ; i++) {
        KakaoButton button = new KakaoButton();
        button.setN("버튼명"+i);
        button.setT("WL");
        button.setU1("http://www.popbill.com");
        button.setU2("http://test.popbill.com");
        btns[i] = button;
    }

    // 예약일시 (작성형식 : yyyyMMddHHmmss)
    String sndDT = "";

    // 광고여부
    Boolean adsYN = false;

    // 파일경로
    // 이미지 전송 규격 (전송포맷-JPG,JPEG / 용량제한-최대 500Kbyte / 이미지 높이/너비 비율 : 1.333 이하, 1/2 이상)
    File file = new File((application.getRealPath("/resources/kakaofmstest.jpg")));

    // 이미지 링크 URL
    String imageURL = "http://www.linkhub.co.kr";

    // 팝빌회원 아이디
    String testUserID = "testkorea";

    // 전송요청번호
    // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
    // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
    String requestNum = "";

    // 접수번호
    String receiptNum = null;

    try {

        receiptNum = kakaoService.sendFMS(testCorpNum, plusFriendID, senderNum, altSendType,
                receivers, btns, sndDT, adsYN, file, imageURL, testUserID, requestNum);

    } catch (PopbillException pe) {
        //적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        //예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
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
