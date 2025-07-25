<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>사업자등록상태조회 (휴폐업조회) SDK JSP Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.CorpState"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 사업자번호 1건에 대해 실시간으로 사업자등록상태를 확인합니다.
     * 팝빌 서비스의 안정적인 제공을 위하여 동시호출이 제한될 수 있습니다.
     * 동시에 100건 이상 요청하는 경우 대량 조회를 이용하시는 것을 권장합니다.
     * - https://developers.popbill.com/reference/closedown/java/api/check#CheckCorpNum
     */

    CorpState corpState = null;

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String CorpNum = "1234567890";

    // 팝빌회원 아이디
    String UserID = "testkorea";

    if ( request.getParameter("CheckCorpNum") != null ) {
        // 조회할 사업자번호
        String checkCorpNum = request.getParameter("CheckCorpNum");

        try{
            corpState = closedownService.CheckCorpNum(CorpNum, checkCorpNum, UserID);
        } catch (PopbillException pe){
            // 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
            // 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
            throw pe;
        }
    }
%>

    <body>
        <div id="content">
            <p class="heading1">사업자등록상태조회 (휴폐업조회) API SDK - JSP Example.</p>
            <br/>
            <fieldset class="fieldset1">
                <legend><%=request.getRequestURI()%></legend>
                    <div class ="fieldset4">
                    <form method= "GET" id="corpnum_form" action="checkCorpNum.jsp">
                        <input class= "txtCorpNum left" type="text" placeholder="사업자번호 기재" id="CheckCorpNum" name="CheckCorpNum" value ='<%=corpState != null ? corpState.getCorpNum():""%>' tabindex=1/>
                        <p class="find_btn find_btn01 hand" onclick="search()" tabindex=2>조회</p>
                    </form>
                    </div>
            </fieldset>
            <%
                if ( corpState != null ) {
            %>
                <fieldset class ="fieldset2">
                    <legend>사업자등록상태조회 (휴폐업조회) 단건</legend>
                    <p class="info"> state : null (확인실패), 0 (등록되지 않은 사업자번호), 1 (사업중), 2 (폐업), 3 (휴업)</p>
                    <p class="info"> taxType : null (확인실패), 10 (일반과세자), 20 (면세과세자), 30 (간이과세자), 31 (간이과세자 세금계산서 발급사업자), 40 (비영리법인 또는 국가기관, 고유번호가 할당된 단체)</p>
                    <ul>
                        <li>corpNum (조회한 사업자번호) : <%=corpState.getCorpNum()%></li>
                        <li>taxType (사업자 과세유형) : <%=corpState.getTaxType()%></li>
                        <li>typeDate (과세유형 전환일자) : <%=corpState.getTypeDate()%></li>
                        <li>state (휴폐업상태) : <%=corpState.getState()%></li>
                        <li>stateDate (휴폐업일자) : <%=corpState.getStateDate()%></li>
                        <li>checkDate (국세청 확인일자) : <%=corpState.getCheckDate()%></li>
                    </ul>
                </fieldset>
            <%
                }
            %>
            <br />
        </div>

        <script type ="text/javascript">
        window.onload=function(){
            document.getElementById('CorpNum').focus();
        }

        function search(){
            document.getElementById('corpnum_form').submit();
        }

        </script>

    </body>
</html>
