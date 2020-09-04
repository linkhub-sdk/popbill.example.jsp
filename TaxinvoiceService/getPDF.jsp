<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		<title>팝빌 SDK jsp Example.</title>
	</head>

<%@ include file="common.jsp" %>
<%@page import="com.popbill.api.PopbillException"%>
<%@page import="com.popbill.api.taxinvoice.MgtKeyType"%>

<%
	/*
	 * 1건의 전자세금계산서 PDF의 byte[]를 반환합니다.
	 */

	// 팝빌회원 사업자번호
	String testCorpNum = "1234567890";

	// 세금계산서 유형. SELL :매출 , BUY : 매입  , TRUSTEE : 수탁
	MgtKeyType keyType = MgtKeyType.SELL;

	// 세금계산서 문서번호
	String mgtKey = "20190107-001";

	byte[] pdfByte = null;
	try {

		pdfByte = taxinvoiceService.getPDF(testCorpNum, keyType, mgtKey);

	} catch (PopbillException pe) {
		//적절한 오류 처리를 합니다. pe.getCode() 로 오류코드를 확인하고, pe.getMessage()로 관련 오류메시지를 확인합니다.
		//예제에서는 exception.jsp 페이지에서 오류를 표시합니다.
		throw pe;
	}
	
	
	int code;
	String message = null;
	
	//파일 저장
	try {
		
		String filepath = "C:/pdf_test/PDF_Sample_Test/20200903_JSPTaxinvoice_TEST_T1.pdf";//저장할 파일 경로
		File outfile = new File(filepath);
		FileOutputStream fileoutputstream = new FileOutputStream(outfile);
		fileoutputstream.write(pdfByte);
		fileoutputstream.close();
			
		code = 1;
		message = filepath + "(저장성공)";
			
		} catch (IOException e) {
			throw e;
		}
%>
	<div id="content">
		<p class="heading1">Response</p>
		<br/>
		<fieldset class="fieldset1">
			<legend>세금계산서 PDF 다운로드</legend>
			<ul>
       	  		<li>응답코드 (code) : <%=code%></li>
  				<li>응답메시지 (message) : <%=message%></li>
			</ul>
		</fieldset>
	</div>
</html>
