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
     * - 전송실패시 사전에 지정한 변수 'altSendType' 값으로 대체문자를 전송할 수 있고, 이 경우 문자(SMS/LMS) 요금이 과금됩니다.
     * - https://docs.popbill.com/kakao/java/api#SendATS_one
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 알림톡 템플릿코드
    // 승인된 알림톡 템플릿 코드는 ListATStemplate API, GetATSTemplateMgtURL API, 또는 팝빌사이트에서 확인 가능합니다.
    String templateCode = "019020000163";

    //발신번호 (팝빌에 등록된 발신번호만 이용가능)
    String senderNum = "07043042991";

    // 알림톡 내용 (최대 1000자)
    String content = "[ 팝빌 ]\n";
    content += "신청하신 #{템플릿코드}에 대한 심사가 완료되어 승인 처리되었습니다.\n";
    content += "해당 템플릿으로 전송 가능합니다.\n\n";
    content += "문의사항 있으시면 파트너센터로 편하게 연락주시기 바랍니다.\n\n";
    content += "팝빌 파트너센터 : 1600-8536\n";
    content += "support@linkhub.co.kr";

    // 대체문자 내용 (최대 2000byte)
    String altContent = "대체문자 내용";

    // 대체문자 유형 (null , "C" , "A" 중 택 1)
    // null = 미전송, C = 알림톡과 동일 내용 전송 , A = {altContent}에 입력한 내용 전송
    String altSendType = "A";

    // 수신번호
    String receiverNum = "010111222";

    // 수신자 이름
    String receiverName = "수신자명";

    // 예약일시 (작성형식 : yyyyMMddHHmmss)
    String sndDT = "";

    // 팝빌회원 아이디
    String testUserID = "testkorea";

    // 전송요청번호
    // 파트너가 전송 건에 대해 관리번호를 구성하여 관리하는 경우 사용.
    // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
    String requestNum = "";

    // 접수번호
    String receiptNum = null;

    // 알림톡 버튼정보를 템플릿 신청 시 기재한 버튼정보와 동일하게 전송하는 경우 null 처리.
    KakaoButton[] btns = null;

    // 알림톡 버튼 URL에 #{템플릿변수}를 기재한경우 템플릿변수 영역을 변경하여 버튼정보 구성
    // KakaoButton[] btns = new KakaoButton[1];
    //
    // KakaoButton button = new KakaoButton();
    // button.setN("버튼명"); // 버튼명
    // button.setT("WL"); // 버튼타입
    // button.setU1("https://www.popbill.com"); // 버튼링크1
    // button.setU2("http://test.popbill.com"); // 버튼링크2
    // btns[0] = button;

    try {

        receiptNum = kakaoService.sendATS(testCorpNum, templateCode, senderNum, content, altContent, altSendType,
                receiverNum, receiverName, sndDT, testUserID, requestNum, btns);

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
