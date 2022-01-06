<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
        <title>휴폐업조회 SDK JSP Example.</title>
    </head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.CorpState"%>
<%@page import="com.popbill.api.PopbillException"%>

<%
    /*
     * 사업자번호 1건에 대한 휴폐업정보를 확인합니다.
     * - https://docs.popbill.com/closedown/java/api#CheckCorpNum
     */

    CorpState corpState = null;

    // 팝빌회원 사업자번호 (하이픈 '-' 제외 10 자리)
    String testCorpNum = "1234567890";

    if ( request.getParameter("CorpNum") != null ) {
        // 조회할 사업자번호
        String checkCorpNum = request.getParameter("CorpNum");

        try{
            corpState = closedownService.CheckCorpNum(testCorpNum, checkCorpNum);
        } catch (PopbillException pe){
            // 적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
            // 예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
            throw pe;
        }
    }
%>

    <body>
        <div id="content">
            <p class="heading1">휴폐업조회 API SDK - JSP Example.</p>
            <br/>
            <fieldset class="fieldset1">
                <legend>휴폐업조회 - 단건</legend>
                    <div class ="fieldset4">
                    <form method= "GET" id="corpnum_form" action="checkCorpNum.jsp">
                        <input class= "txtCorpNum left" type="text" placeholder="사업자번호 기재" id="CorpNum" name="CorpNum" value ='<%=corpState != null ? corpState.getCorpNum():""%>' tabindex=1/>
                        <p class="find_btn find_btn01 hand" onclick="search()" tabindex=2>조회</p>
                    </form>
                    </div>
            </fieldset>
            <%
                if ( corpState != null ) {
            %>
                <fieldset class ="fieldset2">
                    <legend>휴폐업조회 결과</legend>
                    <p class="info"> state : null (알수없음), 0 (등록되지 않은 사업자번호), 1 (사업중), 2 (폐업), 3 (휴업)</p>
                    <p class="info"> taxType : null (알수없음), 10 (일반과세자), 20 (면세과세자), 30 (간이과세자), 31 (간이과세자-세금계산서 발급사업자), 40 (비영리법인 또는 국가기관, 고유번호가 부여된 단체)</p>
                    <ul>
                        <li>corpNum (사업자번호) : <%=corpState.getCorpNum()%></li>
                        <li>taxType (과세유형) : <%=corpState.getTaxType()%></li>
                        <li>state (휴폐업상태) : <%=corpState.getState()%></li>
                        <li>stateDate (휴폐업일자) : <%=corpState.getStateDate()%></li>
                        <li>typeDate (과세유형 전환일자) : <%=corpState.getTypeDate()%></li>
                        <li>checkDate (확인일자) : <%=corpState.getCheckDate()%></li>
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
