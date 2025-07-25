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
<%@page import="com.popbill.api.PopbillException" %>

<%
    /*
     * 팩스 1건을 전송합니다. (최대 전송파일 개수: 20개)
     * - https://developers.popbill.com/reference/fax/java/api/send#SendFAX
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 발신번호
    // 팝빌에 등록되지 않은 번호를 입력하는 경우 '원발신번호'로 팩스 전송됨
    String sendNum = "07043042991";

    // 수신번호
    String receiveNum = "070111222";

    // 수신자명
    String receiveName = "수신자명";

    // 파일 목록
    // 파일 전송 개수 최대 20개
    File[] files = new File[2];
    files[0] = new File((application.getRealPath("/resources/test.jpg")));
    files[1] = new File((application.getRealPath("/resources/test.jpg")));

    // 전송 예약일시, null인 경우 즉시전송
    Date reserveDT = null;

    // 팝빌회원 아이디
    String UserID = "testkorea";

    // 광고팩스 전송여부 , true / false 중 택 1
    // └ true = 광고 , false = 일반
    // └ 미입력 시 기본값 false 처리
    Boolean adsYN = false;

    // 팩스제목
    String title = "팩스 제목";

    // 요청번호
    // 파트너가 접수 단위를 식별하기 위해 할당하는 관리번호
    // 1~36자리로 구성. 영문, 숫자, 하이픈(-), 언더바(_)를 조합하여 팝빌 회원별로 중복되지 않도록 할당.
    String requestNum = "";

    String receiptNum = null;

    try {

        receiptNum = faxService.sendFAX(CorpNum, sendNum, receiveNum, receiveName,
                files, reserveDT, UserID, adsYN, title, requestNum);

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
            <li>receiptNum (팩스전송 접수번호) : <%=receiptNum%>
            </li>
        </ul>
    </fieldset>
</div>
</body>
</html>
