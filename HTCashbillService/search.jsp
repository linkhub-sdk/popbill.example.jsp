<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>

<%@page import="com.popbill.api.hometax.HTCashbillSearchResult"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
	String testCorpNum = "1234567890";		// 연동회원 사업자번호
  String jobID = "016062014000000006";  // 수집 요청시 발급받은 작업아이디
  String[] TradeUsage = {"P", "C"};
  String[] TradeType = {"N", "C"};

  int Page = 1;
  int PerPage = 50;
  String Order = "D";

  HTCashbillSearchResult result = null;

	try {

		result = htCashbillService.search(testCorpNum, jobID, TradeUsage, TradeType, Page, PerPage, Order);

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
          <legend> 현금영수증 정보 [ <%=(i+1) %> ] </legend>
          <ul>
            <li>ntsconfirmNum (국세청 승인번호) : <%= result.getList().get(i).getNtsconfirmNum() %></li>

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
