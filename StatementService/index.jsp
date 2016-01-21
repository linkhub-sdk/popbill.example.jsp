<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/main.css" media="screen" />
		
		<title>팝빌 SDK jsp Example.</title>
	</head>

	<body>

		<div id="content">

			<p class="heading1">팝빌 전자명세서 SDK jsp Example.</p>
			
			<br/>

			<fieldset class="fieldset1">
				<legend>팝빌 기본 API</legend>

				<fieldset class="fieldset2">
					<legend>회원사 정보</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/StatementService/checkCorpIsMember.jsp">checkCorpIsMember</a> - 연동회원사 가입 여부 확인</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/checkID.jsp">checkID</a> - 아이디 중복확인</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/joinMember.jsp">joinMember</a> - 연동회원사 가입 요청</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/getBalance.jsp">getBalance</a> - 연동회원사 잔여포인트 확인</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/getPartnerBalance.jsp">getPartnerBalance</a> - 파트너 잔여포인트 확인</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/getPopbillURL.jsp">getPopbillURL</a> - 팝빌 SSO URL 요청</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/registContact.jsp">registContact</a> - 담당자 등록</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/listContact.jsp">listContact</a> - 담당자 목록 확인</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/updateContact.jsp">updateContact</a> - 담당자 정보 수정</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/getCorpInfo.jsp">getCorpInfo</a> - 회사정보 확인</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/updateCorpInfo.jsp">updateCorpInfo</a> - 회사정보 수정</li>
					</ul>
				</fieldset>

			</fieldset>
			
			<br />
			
			<fieldset class="fieldset1">
				<legend>전자명세서 관련 API</legend>
				
				<fieldset class="fieldset2">
					<legend>등록/수정/확인/삭제</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/StatementService/checkMgtKeyInUse.jsp">checkMgtKeyInUse</a> - 문서관리번호의 등록/사용여부 확인</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/registIssue.jsp">registIssue</a> - 전자명세서 즉시발행</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/register.jsp">register</a> - 전자명세서 등록</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/update.jsp">update</a> - 전자명세서 수정</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/getInfo.jsp">getInfo</a> - 전자명세서 상태/요약 정보 확인</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/getInfos.jsp">getInfos</a> - 다량(최대 1000건)의 전자명세서 상태/요약 정보 확인</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/getDetailInfo.jsp">getDetailInfo</a> - 전자명세서 상세 정보 확인</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/delete.jsp">delete</a> - 전자명세서 삭제</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/getLogs.jsp">getLogs</a> - 전자명세서 문서이력 확인</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/attachFile.jsp">attachFile</a> - 전자명세서 첨부파일 추가</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/getFiles.jsp">getFiles</a> - 전자명세서 첨부파일 목록확인</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/deleteFile.jsp">deleteFile</a> - 전자명세서 첨부파일 1개 삭제</li>
					</ul>
				</fieldset>
				
				<fieldset class="fieldset2">
					<legend>처리 프로세스</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/StatementService/issue.jsp">issue</a> - 전자명세서 발행 처리</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/cancelIssue.jsp">cancelIssue</a> - 전자명세서 발행취소 처리</li>
					</ul>
				</fieldset>
				
				<fieldset class="fieldset2">
					<legend>부가 기능</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/StatementService/sendEmail.jsp">sendEmail</a> - 처리 프로세스에 대한 이메일 재전송 요청</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/sendSMS.jsp">sendSMS</a> - 알림 문자메시지 재전송 요청</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/sendFAX.jsp">sendFAX</a> - 전자명세서에 대한 팩스 전송 요청</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/FAXSend.jsp">FAXSend</a> - 전자명세서 선팩스 전송</li>
					</ul>
				</fieldset>
				
				<fieldset class="fieldset2">
					<legend>팝빌 전자명세서 SSO URL 기능</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/StatementService/getURL.jsp">getURL</a> - 전자명세서 관련 SSO URL 확인</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/getPopUpURL.jsp">getPopUpURL</a> - 해당 전자명세서의 팝빌 화면을 표시하는 URL 확인</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/getPrintURL.jsp">getPrintURL</a> - 해당 전자명세서의 팝빌 인쇄 화면을 표시하는 URL 확인</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/getMassPrintURL.jsp">getMassPrintURL</a> - 다량(최대100건)의 전자명세서 인쇄 화면을 표시하는 URL 확인</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/getEPrintURL.jsp">getEPrintURL</a> - 해당 전자명세서의 공급받는자용 팝빌 인쇄 화면을 표시하는 URL 확인</li>
						<li><a href="${pageContext.request.contextPath}/StatementService/getMailURL.jsp">getMailURL</a> - 해당 전자명세서의 전송메일상의 "보기" 버튼에 해당하는 URL 확인</li>
					</ul>
				</fieldset>
				
				<fieldset class="fieldset2">
					<legend>기타</legend>
					<ul>
						<li><a href="${pageContext.request.contextPath}/StatementService/getUnitCost.jsp">getUnitCost</a> - 전자명세서 발행 단가 확인</li>
					</ul>
				</fieldset>
			</fieldset>
		 </div>
	</body>
</html>