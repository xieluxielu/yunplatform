<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+ "://"+request.getServerName() + ":"+request.getServerPort()+path;
%>
<html>
<head>
<script type="text/javascript">
	$(function() {
		fSelfWidth = '${form.width}';
		fSelfHeight = '${form.height}';
		selfXjTitle = '${form.xjTitle}';
		selfWhTitle = '${form.whTitle}';
		//新建ACTION URL
		xjUrl = "<%=basePath%>/pages/resource/checkboxMgtadd.action?formId=${formId}&model=${model}&op=new";
		//批量删除ACTION URL
		plscUrl = "<%=basePath%>/pages/resource/checkboxMgtdelete.action?model=${model}&formId=${formId}";
		ljscUrl = "<%=basePath%>/pages/resource/checkboxMgtlogicDelete.action?model=${model}&formId=${formId}";
		bzUrl = "<%=basePath%>/pages/resource/compexshowListHelp.action?listId=${listId}";
		mrUrl = "<%=basePath%>/pages/resource/compexisDefault.action?mainTable=${model}&colName=tbl_isdefault&";
	});
</script>
</head>
<c:set var="listurl" value="/pages/resource/checkboxMgtlist.action"></c:set>
<c:set var="viewurl" value="/pages/resource/checkboxMgtview.action"></c:set>
<%@include file="/pages/core/commonList.jsp"  %>
</html>
