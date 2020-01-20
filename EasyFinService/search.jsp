<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.easyfin.EasyFinBankSearchResult"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
  	 * 계좌 거래내역을 조회한다.
     * - https://docs.popbill.com/easyfinbank/java/api#Search
  	 */

    // 팝빌회원 사업자번호
    String testCorpNum = "1234567890";

    // 팝빌회원 아이디
    String testUserID = "testkorea";

    // 수집 요청시 발급받은 작업아이디
    String jobID = "019121913000000001";

    // 거래유형, I-입금 / O-출금
    String[] TradeType = {"I", "O"};

    // 페이지 번호
    int Page = 1;

    // 페이지당 목록개수
    int PerPage = 10;

    // 정렬발향, A-오름차순, D-내림차순
    String Order = "D";

    // 조회 검색어, 거래처 사업자번호 또는 거래처명 like 검색
    String searchString = "";

    EasyFinBankSearchResult result = null;

    try {
        result = easyFinBankService.search(testCorpNum, jobID, TradeType, searchString,
            Page, PerPage, Order, testUserID);

    } catch (PopbillException pe) {
        //적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
        //예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
        throw pe;
    }
%>
    <body>
    <div id="content">
        <p class="heading1">Response </p>
        <br/>
        <fieldset class="fieldset1">
            <legend> 조회결과 </legend>
            <ul>
                <li>code (응답코드) : <%= result.getCode() %></li>
                <li>message (응답메시지) : <%= result.getMessage() %></li>
                <li>total (총 검색결과 건수) : <%= result.getTotal() %></li>
                <li>perPage (페이지당 검색개수) : <%= result.getPerPage() %></li>
                <li>pageNum (페이지 번호) : <%= result.getPageNum() %></li>
                <li>pageCount (페이지 개수) : <%= result.getPageCount() %></li>
            </ul>
            <%
                if ( result != null ){
                    for(int i=0; i < result.getList().size(); i++){
            %>
            <fieldset class="fieldset2">
                <ul>
                    <li> trdate (거래일자) : <%= result.getList().get(i).getTrdate() %></li>
                    <li> trdt (거래일시) : <%= result.getList().get(i).getTrdt() %></li>
                    <li> accIn (입금액) : <%= result.getList().get(i).getAccIn() %></li>
                    <li> accOut (출금액) : <%= result.getList().get(i).getAccOut() %></li>
                    <li> balance (잔액) : <%= result.getList().get(i).getBalance() %></li>
                    <li> remark1 (비고1) : <%= result.getList().get(i).getRemark1() %></li>
                    <li> remark2 (비고2) : <%= result.getList().get(i).getRemark2() %></li>
                    <li> remark3 (비고3) : <%= result.getList().get(i).getRemark3() %></li>
                    <li> remark4 (비고4) : <%= result.getList().get(i).getRemark4() %></li>
                    <li> regDT (등록일시) : <%= result.getList().get(i).getRegDT() %></li>
                    <li> memo (메모) : <%= result.getList().get(i).getMemo() %></li>
                    <li> tid (거래내역 아이디) : <%= result.getList().get(i).getTid() %></li>
                    <li> trserial (거래일자별 일련번호) : <%= result.getList().get(i).getTrserial() %></li>
                </ul>
            </fieldset>
            <%
                    }
                }
            %>

        </fieldset>
    </div>
    </body>
</html>
