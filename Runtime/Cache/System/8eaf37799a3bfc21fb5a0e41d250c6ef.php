<?php if (!defined('THINK_PATH')) exit();?><form id="import_form" method="post" enctype="multipart/form-data">
    <table class="editTable">
        <tr><th>数据导入说明</th><td><em style="font-style: normal;">导入的资源包括：课程，知识点，课时，视频资源，题库资源，数据文件类型为excel表格。</em></td></tr>
        <tr>
		<th>excel文件</th>
		<td>
			<input type="text" name="fileUrl" id="fileUrl"  style="width:150px;"></input>
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" 
				onclick="upfileDialog(4,'','数据导入',0,1,'#fileUrl','\r\n')"></a>
		</td>
	</tr>
    </table>
</form>