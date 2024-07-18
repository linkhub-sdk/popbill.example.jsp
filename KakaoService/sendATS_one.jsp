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
<%@page import="com.popbill.api.PopbillException" %>
<%@page import="com.popbill.api.kakao.KakaoButton" %>

<%
    /*
     * 승인된 템플릿의 내용을 작성하여 1건의 알림톡 전송을 팝빌에 접수합니다.
     * - 사전에 승인된 템플릿의 내용과 알림톡 전송내용(content)이 다를 경우 전송실패 처리됩니다.
     * - 전송실패 시 사전에 지정한 변수 'altSendType' 값으로 대체문자를 전송할 수 있고 이 경우 문자(SMS/LMS) 요금이 과금됩니다.
     * - https://developers.popbill.com/reference/kakaotalk/java/api/send#SendATSOne
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 승인된 알림톡 템플릿코드
    // └ 알림톡 템플릿 관리 팝업 URL(GetATSTemplateMgtURL API) 함수, 알림톡 템플릿 목록 확인(ListATStemplate API) 함수를 호출하거나
    //   팝빌사이트에서 승인된 알림톡 템플릿 코드를  확인 가능.
    String templateCode = "023100000450";

    // 팝빌에 사전 등록된 발신번호
    // altSendType = 'C' / 'A' 일 경우, 대체문자를 전송할 발신번호
    // altSendType = '' 일 경우, null 또는 공백 처리
    // ※ 대체문자를 전송하는 경우에는 사전에 등록된 발신번호 입력 필수
    String senderNum = "1600-8536";

    // 알림톡 내용 (최대 1000자)
    String content = "[주문완료 안내]\n테스트님, 카카오에 가입해주셔서 감사합니다~!\n\n테스트님께서 신청해주신 서비스는 5일 이내로 연동 신청 될 예정입니다\n\n[ 서비스 정보 ]\n▶ 신청하신 서비스명: 테스트\n▶ 신청 일자 : 테스트";

    // 대체문자 제목
    // - 메시지 길이(90byte)에 따라 장문(LMS)인 경우에만 적용.
    String altSubject = "대체문자 제목";

    // 대체문자 유형(altSendType)이 "A"일 경우, 대체문자로 전송할 내용 (최대 2000byte)
    // └ 팝빌이 메시지 길이에 따라 단문(90byte 이하) 또는 장문(90byte 초과)으로 전송처리
    String altContent = "대체문자 내용";

    // 대체문자 유형 (null , "C" , "A" 중 택 1)
    // null = 미전송, C = 알림톡과 동일 내용 전송 , A = 대체문자 내용(altContent)에 입력한 내용 전송
    String altSendType = null;

    // 수신번호
    String receiverNum = "";

    // 수신자 이름
    String receiverName = "수신자명";

    // 예약일시 (작성형식 : yyyyMMddHHmmss)
    String sndDT = "";

    // 팝빌회원 아이디
    String testUserID = null;

    // 전송요청번호
    // 팝빌이 접수 단위를 식별할 수 있도록 파트너가 할당한 식별번호.
    // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
    String requestNum = "";

    // 접수번호
    String receiptNum = null;

    // 알림톡 버튼정보를 템플릿 신청 시 기재한 버튼정보와 동일하게 전송하는 경우 null 처리.
    KakaoButton[] btns = null;

    // 알림톡 버튼 URL에 #{템플릿변수}를 기재한경우 템플릿변수 영역을 변경하여 버튼정보 구성
    // KakaoButton[] btns = new KakaoButton[1];

    // KakaoButton button = new KakaoButton();
    // button.setN("사이트 연결"); // 버튼명
    // button.setT("WL"); // 버튼타입
    // button.setU1("https://www.popbill.com/"); // 버튼링크1
    // button.setU2("https://www.popbill.com/"); // 버튼링크2
    // button.setTg("out");// 디바이스 기본 브라우저 사용 (공백(기본값) : 카카오톡 인앱 브라우저)
    // btns[0] = button;

    try {

        receiptNum = kakaoService.sendATS(testCorpNum, templateCode, senderNum, content, altSubject, altContent,
                altSendType, receiverNum, receiverName, sndDT, testUserID, requestNum, btns);

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
        <legend>알림톡 전송</legend>
        <ul>
            <li>접수번호 : <%=receiptNum%></li>
        </ul>
    </fieldset>
</div>
</body>
</html>