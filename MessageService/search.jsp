<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>팝빌 SDK jsp Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.message.SentMessage"%>
<%@page import="com.popbill.api.message.MSGSearchResult"%>

<%
    /*
     * 검색조건에 해당하는 문자 전송내역을 조회합니다. (조회기간 단위 : 최대 2개월)
     * - 문자 접수일시로부터 6개월 이내 접수건만 조회할 수 있습니다.
     * 문자 상태코드 [https://developers.popbill.com/reference/sms/java/response-code#state-code]
     * 통신사 결과코드 [https://developers.popbill.com/reference/sms/java/response-code#result-code]
     * - https://developers.popbill.com/reference/sms/java/api/info#Search
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum= "1234567890";

    // 검색 시작일자, 날짜형식(yyyyMMdd)
    String SDate = "20250711";

    // 검색 종료일자, 날짜형식(yyyyMMdd)
    String EDate = "20250731";

    // 전송상태 ("1" , "2" , "3" , "4" 중 선택, 다중 선택 가능)
    // └ 1 = 대기 , 2 = 성공 , 3 = 실패 , 4 = 취소
    // - 미입력 시 전체조회
    String[] State = {"1", "2", "3", "4"};

    // 검색대상 ("SMS" , "LMS" , "MMS" 중 선택, 다중 선택 가능)
    // └ SMS = 단문 , LMS = 장문 , MMS = 포토문자
    // - 미입력 시 전체조회
    String[] Item = {"SMS", "LMS", "MMS"};

    // 예약여부 (null, false , true 중 택 1)
    // └ null = 전체조회, false = 즉시전송건 조회, true = 예약전송건 조회
    // - 미입력 시 전체조회
    Boolean ReserveYN = false;

    // 사용자권한별 조회
    // └ true = 팝빌회원 아이디(UserID)로 전송한 문자만 조회
    // └ false = 전송한 문자 전체 조회 : 기본값
    Boolean SenderOnly = false;

    // 목록 페이지번호
    int Page = 1;

    // 페이지당 표시할 목록 건수 (최대 1000건)
    int PerPage = 20;

    // 문자 접수일시를 기준으로 하는 목록 정렬 방향 ("D" , "A" 중 택 1)
    // └ D = 내림차순(기본값) , A = 오름차순
    String Order = "D";

    // 조회 검색어(발신자명/수신자명)
    // - 미입력시 전체조회
    String QString = "";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    MSGSearchResult searchResult = null;

    try {

        searchResult = messageService.search(CorpNum, SDate, EDate, State, Item,
                ReserveYN, SenderOnly, Page, PerPage, Order, QString, UserID);

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
                    <li>code (응답코드) : <%=searchResult.getCode()%></li>
                    <li>message (응답메시지) : <%=searchResult.getMessage()%></li>
                    <li>total (총 검색결과 건수) : <%=searchResult.getTotal()%></li>
                    <li>perPage (페이지당 목록 건수) : <%=searchResult.getPerPage()%></li>
                    <li>pageNum (페이지 번호) : <%=searchResult.getPageNum()%></li>
                    <li>pageCount (페이지 개수) : <%=searchResult.getPageCount()%></li>
                </ul>
                <%
                    for ( int i = 0; i < searchResult.getList().size(); i++ ) {

                        SentMessage sentMsg = searchResult.getList().get(i);
                %>

                <fieldset class="fieldset2">
                    <legend>전송내역 : [ <%=i+1%> / <%=searchResult.getList().size() %> ]</legend>
                    <ul>
                        <li>subject (메시지 제목) : <%=sentMsg.getSubject()%></li>
                        <li>content (메시지 내용) : <%=sentMsg.getContent()%></li>
                        <li>sendNum (발신번호) : <%=sentMsg.getSendNum()%></li>
                        <li>senderName (발신자명) : <%=sentMsg.getSenderName()%></li>
                        <li>receiveNum (수신번호) : <%=sentMsg.getReceiveNum()%></li>
                        <li>receiveName (수신자명) : <%=sentMsg.getReceiveName()%></li>
                        <li>receiptDT (접수일시) : <%=sentMsg.getReceiptDT()%></li>
                        <li>sendDT (전송일시) : <%=sentMsg.getSendDT()%></li>
                        <li>resultDT (전송결과 수신일시) : <%=sentMsg.getResultDT()%></li>
                        <li>reserveDT (예약일시) : <%=sentMsg.getReserveDT()%></li>
                        <li>state (상태코드) : <%=sentMsg.getState()%> </li>
                        <li>result (결과코드) : <%=sentMsg.getResult()%></li>
                        <li>messageType (메시지 타입) : <%=sentMsg.getMessageType()%></li>
                        <li>tranNet (전송처리 이동통신사명) : <%=sentMsg.getTranNet()%></li>
                        <li>receiptNum (접수번호) : <%=sentMsg.getReceiptNum()%></li>
                        <li>requestNum (요청번호) : <%=sentMsg.getRequestNum()%></li>
                        <li>interOPRefKey (파트너 지정키) : <%=sentMsg.getInterOPRefKey()%></li>
                    </ul>
                </fieldset>
                <%
                    }
                %>
        </div>
    </body>
</html>
