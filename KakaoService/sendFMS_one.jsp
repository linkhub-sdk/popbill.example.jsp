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
    단건의 친구톡 이미지를 전송합니다
    */

    // 팝빌회원 사업자번호
    String testCorpNum = "1234567890";

    // 팝빌에 등록된 플러스 친구 아이디
    String plusFriendID = "@팝빌";

    //발신번호 (팝빌에 등록된 발신번호만 이용가능)
    String senderNum = "07043042993";

    // 친구톡 메시지 내용 (최대 400자)
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

    // 파일경로
    // 이미지 전송 규격 (전송포맷-JPG,JPEG / 용량제한-최대 500Kbyte / 가로/세로 1.5미만)
    File file = new File("/Users/kimhyunjin/Workspace/popbill.example.jsp/KakaoService/test.jpg");

    // 이미지 링크 URL
    String imageURL = "http://www.linkhub.co.kr";

    // 접수번호
    String receiptNum = null;

    try {

        receiptNum = kakaoService.sendFMS(testCorpNum, plusFriendID, senderNum, content, altContent, altSendType,
                btns, receiverNum, receiverName, sndDT, adsYN, file, imageURL);

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
            <li>접수번호 : <%=receiptNum%>
            </li>
        </ul>
    </fieldset>
</div>
</body>
</html>
