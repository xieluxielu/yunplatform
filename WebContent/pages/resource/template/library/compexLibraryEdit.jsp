<%@ page language="java" contentType="text/html; charset=utf-8"	pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+ "://"+request.getServerName() + ":"+request.getServerPort()+path;
%>
<%@include file="/pages/core/compexDomainEdit.jsp"%>
<script type="text/javascript" src="/js/cloudstong/yun.base_template.js">
</script>
<script type="text/javascript">
<!--		
	$(function(){
		//修改默认的保存方法
		$('#BC').attr('onclick', 'eventFormTemplateBC()');
		//添加表单模版的所属类型,模版的行数\列数
		$('#tabDivId form').append('<input type="hidden" value="0" name="sys_template-tbl_type"/>');
		$('#tabDivId form').append('<input type="hidden" value="0" name="sys_template-tbl_tds"/>');
		$('#tabDivId form').append('<input type="hidden" value="0" name="sys_template-tbl_trs"/>');
		//模版来源默认为"自定义"
		$("input[name='sys_template-tbl_designType']").each(function() {
			if (this.value == '1') { 
				this.checked = true;
			}
		});
		//将自定义代码放入指定区域
		$('#tabDivId table').append($('#tbl_designType-1 tbody').html());
		//删除自定义代码
		$('#tbl_designType-1').html('');
		//初始化模版设计视图
		templateInit();
		viewContent();
		ns.common.mouseForButton();
	});
//-->
</script>
<table id="tbl_designType-1"  style="display: none">
	<tbody>
		<tr id="templateDesignTr">
			<td class="Input_Table_Label" align="left">
				布局设计
			</td>
			<td colspan="3" align="left" width="90%">
				<table width="650px" cellspacing="0" cellpadding="2" border="0"
					class="Input_Table">
					<tr>
						<td>
							表格
						</td>
						<td width="85%">
							<input type="text" id="rowSize" value="0"
								style="width: 100px; height: 15px;" maxlength="100"
								class="required" />
							行
							<input type="text" id="columnSize" value="4"
								style="width: 100px; height: 15px;" maxlength="100" />
							列
							<!-- <span class="star">*</span> -->&nbsp;&nbsp;在
							<input id="tr_num" size='2' value="0" class="required" />
							行后插入
						</td>
						<td width="5%">
							<input type="button" id="" name="" class="listbutton" value="确定"
								onclick="setTable()" />
						</td>
					</tr>
					<tr>
						<td>
							合并
						</td>
						<td>
							<input type="text" id="rowMergeStart"
								style="width: 100px; height: 15px;" maxlength="100" />
							行
							<input type="text" id="colMergeStart"
								style="width: 100px; height: 15px;" maxlength="100" />
							列 ~
							</br>
							</br>
							<input type="text" id="rowMergeEnd"
								style="width: 100px; height: 15px;" maxlength="100" />
							行
							<input type="text" id="colMergeEnd"
								style="width: 100px; height: 15px;" maxlength="100" />
							列
						</td>
						<td>
							<input type="button" id="" name="" class="listbutton" value="确定"
								onclick="setMerge()" />
						</td>
					</tr>
					<tr>
						<td>
							高度
						</td>
						<td title="如不设置行数,默认为设置所有行的高度">
							<input type="text" id="rowHeight"
								style="width: 100px; height: 15px;" maxlength="100" />
							行
							<input type="text" id="numHeight"
								style="width: 100px; height: 15px;" maxlength="100" />
							像素
						</td>
						<td>
							<input type="button" id="" name="" class="listbutton" value="确定"
								onclick="setHeight()" //>
						</td>
					</tr>
					<tr>
						<td>
							宽度
						</td>
						<td
							title="如不设置行列数,默认为设置所有列的宽度;如果不设置行数,默认为设置此列所有行宽度;如不设置列数,默认为设置行总宽度;">
							<input type="text" id="rowWidth"
								style="width: 100px; height: 15px;" maxlength="100" />
							行
							<input type="text" id="columnWidth"
								style="width: 100px; height: 15px;" maxlength="100" />
							列
							<input type="text" id="numWidth"
								style="width: 100px; height: 15px;" maxlength="100" />
							<select id="widthUnit" name="widthUnit">
								<option value="px">
									像素
								</option>
								<option value="%">
									百分比
								</option>
							</select>
						</td>
						<td>
							<input type="button" id="" name="" class="listbutton" value="确定"
								onclick="setWidth()" //>
						</td>
					</tr>
					<tr>
						<td>
							值设置
						</td>
						<td>
							<select id="labelSet" onchange="labelChange()">
								<option value="数据字段" selected="selected">
									数据字段
								</option>
								<option value="数据值">
									数据值
								</option>
								<option value="自定义文本">
									自定义文本
								</option>
								<option value="自定义样式">
									自定义样式
								</option>
							</select>
							<input type="text" name="cusText" id="cusText" />
							<select id="tdAlign">
								<option value="left" selected="selected">
									左对齐
								</option>
								<option value="center">
									居中
								</option>
								<option value="right">
									右对齐
								</option>
							</select>
						</td>
						<td>
							<input type="button" id="" name="" class="listbutton" value="确定"
								onclick="setTdValue()" //>
						</td>
					</tr>
				</table>
			</td>
		</tr>

		<tr id="templateDesign1Tr">
			<td class="Input_Table_Label" align="left">
				模板设计
			</td>
			<td colspan="3" align="left">
				<table id="templateView1" cellspacing="0" cellpadding="0" border="0"
					class="Input_Table" align="left" width="650px">
				</table>
			</td>
		</tr>
		<tr id="templateViewTr">
			<td class="Input_Table_Label" align="left">
				模板预览
			</td>
			<td colspan="3" align="left">
				<table id="templateView" cellspacing="0" cellpadding="0" border="0"
					class="Input_Table" align="left" width="650px">
				</table>
			</td>
		</tr>
		<tr id="fileTr">
			<td height="30" align="left" class="Input_Table_Label">
				模板文件
			</td>
			<td height="30" align="left">
				<input type="file" size="18" name="templateFile" class="required"
					id="templateFile">
				<!-- <span class="star">*</span> -->
				<input type="hidden" name="sys_template-tbl_templatefilename" value="" />
			</td>
			<td height="30" align="left" class="Input_Table_Label">
				效果图
			</td>
			<td height="30" align="left">
				<input type="file" size="17" name="pictureFile">
				<input type="hidden" name="sys_template-tbl_picfilename" value="" />
			</td>
		</tr>
	</tbody>
</table>