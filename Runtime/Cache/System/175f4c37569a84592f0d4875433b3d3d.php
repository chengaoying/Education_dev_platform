<?php if (!defined('THINK_PATH')) exit();?><form id="edit_form" method="post" style="padding:10px">
<table class="editTable">
	<tr>
		<th>龄段名称</th>
		<td>
			<input type="hidden" id="id" name="id" value="<?php echo ($stage['id']); ?>"/>
			<input type="text" id="name" name="name" value="<?php echo ($stage['name']); ?>"/><em>*</em>
		</td>
	</tr>
	<tr>
		<th>龄段key</th>
		<td>
			<input type="text" id="sKey" name="sKey" value="<?php echo ($stage['sKey']); ?>"/><em>*</em>
		</td>
	</tr>
	<tr>
		<th>所属顶级分类</th>
		<td><?php echo ($classHtml); ?><em>*</em></td>
	</tr>
	<tr>
		<th>图片地址</th>
		<td>
			<textarea name="imgUrl" id="imgUrl" cols="50" rows="3"><?php echo ($stage['imgUrl']); ?></textarea>
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" 
				onclick="upfileDialog(1,'','龄段图片：<?php echo ($stage[name]); ?>',1,1,'#imgUrl','\r\n')"></a>
		</td>
	</tr>
	<tr>
		<th>排序</th>
		<td><input type="text" id="sort" name="sort" value="<?php echo ($stage['sort']); ?>"/></td>
	</tr>
	<tr><th>状态</th><td><?php echo ($statusHtml); ?> <em>*</em></td></tr>
</table>
</form>