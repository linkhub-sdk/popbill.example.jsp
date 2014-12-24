<%@page errorPage="/exception.jsp" %>
<jsp:useBean id="taxinvoiceService" scope="application" class="com.popbill.api.taxinvoice.TaxinvoiceServiceImp"/>
<jsp:setProperty name="taxinvoiceService" property="linkID" value="TESTER"/>
<jsp:setProperty name="taxinvoiceService" property="secretKey" value="MsXiW2kY/hIJY9m991GAJU/6NuEIx+a4wmesxr6lkiI="/>
<jsp:setProperty name="taxinvoiceService" property="test" value="true"/>