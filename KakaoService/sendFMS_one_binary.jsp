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
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="com.popbill.api.Attachment" %>

<%
    /*
     * 바이너리 형식의 이미지 데이터가 첨부된 1건의 친구톡 전송을 팝빌에 접수합니다.
     * - 친구톡의 경우 야간 전송은 제한됩니다. (20:00 ~ 익일 08:00)
     * - 전송실패시 사전에 지정한 변수 'AltSendType' 값으로 대체문자를 전송할 수 있고, 이 경우 문자(SMS/LMS) 요금이 과금됩니다.
     * - 대체문자의 경우, 포토문자(MMS) 형식은 지원하고 있지 않습니다.
     * - 팝빌 서비스의 안정적인 제공을 위하여 동시호출이 제한될 수 있습니다.
     * - 동시에 1,000건 이상 요청하는 경우 동보전송 또는 대량전송으로 이용하시는 것을 권장합니다.
     * - https://developers.popbill.com/reference/kakaotalk/java/api/send#SendFMSBinaryOne
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

    // 친구톡 내용 (최대 400자)
    String content = "친구톡 메시지 내용";

    // 대체문자 제목
    // - 메시지 길이(90byte)에 따라 장문(LMS)인 경우에만 적용.
    String altSubject = "친구톡 이미지 대체문자 제목";

    // 대체문자 내용, 대체문자 유형(altSendType)이 "A"일 경우, 대체문자로 전송할 내용 (최대 2000byte)
    // └ 팝빌이 메시지 길이에 따라 단문(90byte 이하) 또는 장문(90byte 초과)으로 전송처리
    String altContent = "[친구톡이미지 대체문자]\n\n" + "친구톡 이미지 대체문자 내용입니다.\n" + "대체문자를 친구톡 메시지 내용 그대로 전송할 수 있습니다.\n"
            + "또는 대체문자 내용을 작송하여 전송할 수도 있습니다.\n" + "하지만 대체문자 내용이 길어지게 되면 LMS 로 전송될 수 있습니다.\n\n"
            + "수신을 원치 않으시면 1600-9854로 전화주시길 바랍니다.\n";

    // 대체문자 유형 (null , "C" , "A" 중 택 1)
    // null = 미전송, C = 친구톡과 동일 내용 전송 , A = 대체문자 내용(altContent)에 입력한 내용 전송
    String altSendType = "A";

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

    // 수신번호
    String receiverNum = "010111222";

    // 수신자명
    String receiverName = "수신자명";

    // 전송 예약일시, 형태(yyyyMMddHHmmss)
    // - 분단위 전송, 미입력 시 즉시 전송
    String sndDT = "";

    // 광고성 메시지 여부 ( true , false 중 택 1)
    // └ true = 광고 , false = 일반
    // - 미입력 시 기본값 false 처리
    Boolean adsYN = false;

    // 전송 이미지 파일
    // - 이미지 파일 규격: 전송 포맷 – JPG 파일 (.jpg, .jpeg), 용량 – 최대 500 Kbyte, 크기 – 가로 500px
    // 이상, 가로 기준으로 세로 0.5~1.3배 비율 가능
    File file = new File((application.getRealPath("/resources/kakaofmstest.jpg")));
    InputStream inputStream = new FileInputStream(file);

    // 전송 이미지 파일의 객체정보
    Attachment attachment = new Attachment();
    attachment.setFileName(file.getName()); // 전송 이미지 파일명
    attachment.setFileData(inputStream); // 전송 이미지 파일의 바이너리 데이터

    // 이미지 링크 URL
    // └ 수신자가 친구톡 상단 이미지 클릭시 호출되는 URL
    // - 미입력시 첨부된 이미지를 링크 기능 없이 표시
    String imageURL = "http://test.popbill.com";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    // 요청번호
    // 팝빌이 접수 단위를 식별할 수 있도록 파트너가 할당한 식별번호.
    // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
    String requestNum = "";

    // 접수번호
    String receiptNum = null;

    try {

        receiptNum = kakaoService.sendFMSBinary(CorpNum, plusFriendID, senderNum, content, altSubject, altContent,
                altSendType, btns, receiverNum, receiverName, sndDT, adsYN, attachment, imageURL, UserID, requestNum);

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
