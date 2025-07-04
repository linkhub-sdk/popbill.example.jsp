<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="java.util.Date"%>
<%@page import="com.popbill.api.fax.Receiver"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 파트너가 할당한 전송요청 번호를 통해 다수건의 팩스를 재전송합니다. (최대 전송파일 개수: 20개) (최대 1,000건)
     * - 발신/수신 정보 미입력시 기존과 동일한 정보로 팩스가 전송되고, 접수일 기준 최대 60일이 경과되지 않는 건만 재전송이 가능합니다.
     * - 팩스 재전송 요청시 포인트가 차감됩니다. (전송실패시 환불처리)
     * - 변환실패 사유로 전송실패한 팩스 접수건은 재전송이 불가합니다.
     * - https://developers.popbill.com/reference/fax/java/api/send#ResendFAXRNMulti
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 팝빌회원 아이디
    String testUserID = "testkorea";

    // 재전송 팩스의 전송요청번호
    // 파트너가 전송 건에 대해 관리번호를 생성하여 관리하는 경우 사용.
    // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
    String requestNum = "";

    // 발신번호, 공백처리시 기존전송정보로 재전송
    String sendNum = "07040342991";

    // 발신자명, 공백처리시 기존전송정보로 재전송
    String senderName = "발신자명";

    // 팩스수신정보를 기존전송정보와 동일하게 재전송하는 경우, receivers 변수 null 처리
    Receiver[] receivers = null;


    // 팩스수신정보를 기존전송정보와 다르게 재전송하는 경우, 아래의 코드 적용 (최대 1000건)
    // Receiver[] receivers = new Receiver[2];
    //
    // Receiver receiver1 = new Receiver();
    // receiver1.setReceiveName("수신자1");       // 수신자명
    // receiver1.setReceiveNum("010111222");     // 수신팩스번호
    // receiver1.setInterOPRefKey("20221007-reFAXRN001"); // 파트너 지정키
    // receivers[0] = receiver1;
    //
    // Receiver receiver2 = new Receiver();
    // receiver2.setReceiveName("수신자2");       // 수신자명
    // receiver2.setReceiveNum("010333444");     // 수신팩스번호
    // receiver2.setInterOPRefKey("20221007-reFAXRN001"); // 파트너 지정키
    // receivers[1] = receiver2;


    // 예약전송일시, null인 경우 즉시전송
    // String reserveDTtxt = "20141229180000";
    // SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
    // reserveDT = formatter.parse(reserveDTtxt);
    Date reserveDT = null;

    // 팩스전송 제목
    String title = "팩스재전송 동보제목";

    // 원본 팩스 전송시 할당한 전송요청번호(requestNum)
    String orgRequestNum = "20221007-request";

    String receiptNum = null;

    try {

        receiptNum = faxService.resendFAXRN(testCorpNum, requestNum, sendNum, senderName,
            receivers, reserveDT, testUserID, title, orgRequestNum);

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
