<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="java.io.File"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.popbill.api.message.Message"%>
<%@page import="com.popbill.api.PopbillException"%>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.FileInputStream" %>
<%@ page import="com.popbill.api.Attachment" %>

    <%
    /*
     * 최대 2,000byte의 메시지와 바이너리 형식의 이미지 데이터로 구성된 포토문자(MMS) 다수건 전송을 팝빌에 접수합니다. (최대 1,000건)
     * - 이미지 파일 포맷/규격 : 최대 300Kbyte(JPEG), 가로/세로 1,000px 이하 권장
     * - 모든 수신자에게 동일한 내용을 전송하거나(동보전송), 수신자마다 개별 내용을 전송할 수 있습니다(대량전송).
     * - https://developers.popbill.com/reference/sms/java/api/send#SendMMSBinaryOne
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 팝빌회원 아이디
    String testUserID = "testkorea";

    // [동보전송시 필수] 발신번호, 개별 전송정보의 발신번호가 없는 경우 적용
    String sender = "07043042991";

    // [동보전송시 필수] 메시지 제목, 개별 전송정보의 메시지 제목이 없는 경우 적용
    String subject = "대량전송 제목";

    // [동보전송시 필수] 메시지 내용, 개별 전송정보의 메시지 내용이 없는 경우 적용
    // └ 한글, 한자, 특수문자 2byte / 영문, 숫자, 공백 1byte
    String content = "대량전송 메시지 내용";

    // 광고 메시지 여부 ( true , false 중 택 1)
    // └ true = 광고 , false = 일반
    Boolean adsYN = false;

    // 전송 정보 배열, 최대 1000건.
    Message[] messages = new Message[2];

    Message msg1 = new Message();
    msg1.setSender("07043042991");       // 발신번호
    msg1.setSenderName("발신자1");       // 발신자명
    msg1.setReceiver("010111222");       // 수신번호
    msg1.setReceiverName("수신자1");     // 수신자명
    msg1.setSubject("멀티 메시지 제목"); // 문자제목
    msg1.setContent("메시지 내용1");     // 메시지내용
    msg1.setInterOPRefKey("20221007-MMS001");     // 파트너 지정키
    messages[0] = msg1;

    Message msg2 = new Message();
    msg2.setSender("07043042991");
    msg2.setSenderName("발신자2");
    msg2.setReceiver("010111222");
    msg2.setReceiverName("수신자2");
    msg2.setSubject("멀티 메시지 제목");
    msg2.setContent("메시지 내용2");
    msg2.setInterOPRefKey("20221007-MMS002");
    messages[1] = msg2;

    // 전송할 이미지 파일 경로
    File file = new File(application.getRealPath("/resources/test.jpg"));
    InputStream inputStream = new FileInputStream(file);

    Attachment attachment = new Attachment();
    attachment.setFileName(file.getName());
    attachment.setFileData(inputStream);

    // 예약전송일시, null인 경우 즉시전송
    Date reserveDT = null;
    // 예약전송시 아래의 코드 참조
    // String reserveDTtxt ="20220228180000";
    // SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
    // reserveDT = formatter.parse(reserveDTtxt);

    // 전송요청번호
    // 팝빌이 접수 단위를 식별할 수 있도록 파트너가 할당한 식별번호.
    // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
    String requestNum = "";

    String receiptNum = null;

    try {

        receiptNum = messageService.sendMMSBinary(testCorpNum, sender, null, subject, content, messages,
                attachment, reserveDT, adsYN, testUserID, requestNum);

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
