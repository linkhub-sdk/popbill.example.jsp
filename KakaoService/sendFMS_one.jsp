<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>

<%@ include file="common.jsp" %>
<%@page import="java.io.File" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="com.popbill.api.kakao.KakaoButton" %>
<%@page import="com.popbill.api.PopbillException" %>

<%
    /*
     * 이미지가 첨부된 1건의 친구톡 전송을 팝빌에 접수합니다.
     * - 친구톡은 심야 전송(20:00~08:00)이 제한됩니다.
     * - 이미지 전송규격 / jpg 포맷, 용량 최대 500KByte, 이미지 높이/너비 비율 1.333 이하, 1/2 이상
     * - 전송실패시 사전에 지정한 변수 'altSendType' 값으로 대체문자를 전송할 수 있고, 이 경우 문자(SMS/LMS) 요금이 과금됩니다.
     * - https://docs.popbill.com/kakao/java/api#SendFMS_one
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 팝빌에 등록된 카카오톡 채널 아이디
    String plusFriendID = "@팝빌";

    //발신번호 (팝빌에 등록된 발신번호만 이용가능)
    String senderNum = "07043042992";

    // 친구톡 메시지 내용 (최대 400자)
    String content = "친구톡 메시지 내용";

    // 대체문자 내용 (최대 2000byte)
    String altContent = "대체문자 내용";

    // 대체문자 유형 (null , "C" , "A" 중 택 1)
    // null = 미전송, C = 친구톡과 동일 내용 전송 , A = {altContent}에 입력한 내용 전송
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
    // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
    // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
    String requestNum = "";

    // 접수번호
    String receiptNum = null;

    try {

        receiptNum = kakaoService.sendFMS(testCorpNum, plusFriendID, senderNum, content, altContent, altSendType,
                btns, receiverNum, receiverName, sndDT, adsYN, file, imageURL, testUserID, requestNum);

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
