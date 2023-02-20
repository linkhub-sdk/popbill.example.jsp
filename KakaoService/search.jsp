<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen"/>
    <title>팝빌 SDK jsp Example.</title>
</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException" %>
<%@page import="com.popbill.api.kakao.KakaoSentDetail" %>
<%@page import="com.popbill.api.kakao.KakaoSearchResult" %>

<%
    /*
     * 검색조건에 해당하는 카카오톡 전송내역을 조회합니다. (조회기간 단위 : 최대 2개월)
     * - 카카오톡 접수일시로부터 6개월 이내 접수건만 조회할 수 있습니다.
     * - https://developers.popbill.com/reference/kakaotalk/java/api/info#Search
     */

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    // 시작일자, 날짜형식(yyyyMMdd)
    String SDate = "20230102";

    // 종료일자, 날짜형식(yyyyMMdd)
    String EDate = "20230131";

    // 전송상태 배열 ("0" , "1" , "2" , "3" , "4" , "5" 중 선택, 다중 선택 가능)
    // └ 0 = 전송대기 , 1 = 전송중 , 2 = 전송성공 , 3 = 대체문자 전송 , 4 = 전송실패 , 5 = 전송취소
    // - 미입력 시 전체조회
    String[] State = {"0", "1", "2", "3", "4", "5"};

    // 검색대상 배열 ("ATS", "FTS", "FMS" 중 선택, 다중 선택 가능)
    // └ ATS = 알림톡 , FTS = 친구톡(텍스트) , FMS = 친구톡(이미지)
    // - 미입력 시 전체조회
    String[] Item = {"ATS", "FTS", "FMS"};

    // 전송유형별 조회 (null , "0" , "1" 중 택 1)
    // └ null = 전체 , 0 = 즉시전송건 , 1 = 예약전송건
    // - 미입력 시 전체조회
    String ReserveYN = null;

    // 사용자권한별 조회 (true / false 중 택 1)
    // └ false = 접수한 카카오톡 전체 조회 (관리자권한)
    // └ true = 해당 담당자 계정으로 접수한 카카오톡만 조회 (개인권한)
    // 미입력시 기본값 false 처리
    Boolean SenderYN = false;

    // 페이지 번호
    int Page = 1;

    // 페이지당 검색개수, 최대 1000개
    int PerPage = 20;

    // 알림톡 / 친구톡 접수일시를 기준으로 하는 목록 정렬 방향 ("D" , "A" 중 택 1)
    // └ D = 내림차순(기본값) , A = 오름차순
    String Order = "D";

    String userID = "testkorea";

    // 조회하고자 하는 수신자명
    // - 미입력시 전체조회
    String QString = "";

    KakaoSearchResult searchResult = null;

    try {

        searchResult = kakaoService.search(testCorpNum, SDate, EDate, State, Item,
                ReserveYN, SenderYN, Page, PerPage, Order, userID, QString);

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
        <legend>알림톡/친구톡 전송결과 조회</legend>
        <ul>
            <li>code (응답코드) : <%=searchResult.getCode()%></li>
            <li>message (응답메시지) : <%=searchResult.getMessage()%></li>
            <li>total (총 검색결과 건수) : <%=searchResult.getTotal()%></li>
            <li>perPage (페이지당 검색개수) : <%=searchResult.getPerPage()%></li>
            <li>pageNum (페이지번호) : <%=searchResult.getPageNum()%></li>
            <li>pageCount (페이지 개수) : <%=searchResult.getPageCount()%></li>
        </ul>
        <%
        for ( int i = 0; i < searchResult.getList().size(); i++ ) {
            KakaoSentDetail sentMsg = searchResult.getList().get(i);
        %>
        <fieldset class="fieldset3">
            <legend>카카오톡 전송내역 조회 결과 : [ <%=i + 1%> / <%=searchResult.getList().size() %> ]</legend>
            <ul>
                <li>state (전송 상태코드) : <%=sentMsg.getState()%></li>
                <li>sendDT (전송일시) : <%=sentMsg.getSendDT()%></li>
                <li>result (전송 결과코드) : <%=sentMsg.getResult()%></li>
                <li>resultDT (전송결과 수신일시) : <%=sentMsg.getResultDT()%></li>
                <li>contentType (카카오톡 유형) : <%=sentMsg.getContentType()%></li>
                <li>receiveNum (수신번호) : <%=sentMsg.getReceiveNum()%></li>
                <li>receiveName (수신자명) : <%=sentMsg.getReceiveName()%></li>
                <li>content (알림톡/친구톡 내용) : <%=sentMsg.getContent()%></li>
                <li>altSubject (대체문자 제목) : <%=sentMsg.getAltSubject()%></li>
                <li>altContent (대체문자 내용) : <%=sentMsg.getAltContent()%></li>
                <li>altContentType (대체문자 전송타입) : <%=sentMsg.getAltContentType()%></li>
                <li>altSendDT (대체문자 전송일시) : <%=sentMsg.getAltSendDT()%></li>
                <li>altResult (대체문자 전송결과 코드) : <%=sentMsg.getAltResult()%></li>
                <li>altResultDT (대체문자 전송결과 수신일시) :<%=sentMsg.getAltResultDT()%></li>
                <li>receiptNum (접수번호) :<%=sentMsg.getReceiptNum()%></li>
                <li>requestNum (요청번호) :<%=sentMsg.getRequestNum()%></li>
            </ul>
        </fieldset>
            <%
            }
            %>
</div>
</body>
</html>
