<?php if (!defined('THINK_PATH')) exit();?><form id="edit_form" method="post" style="padding:10px">
<table class="editTable">
	<tr>
		<th>课时名称</th>
		<td>
			<input type="hidden" id="id" name="id" value="<?php echo ($section['id']); ?>"/>
			<input type="text" id="name" name="name" value="<?php echo ($section['name']); ?>"/><em>*</em>
		</td>
	</tr>
	<tr>
		<th>所属知识点</th>
		<td>
			<input type="text" id="topicId" name="topicId" value="<?php echo ($section['topicId']); ?>"/><em>*</em>
		</td>
	</tr>
	<tr>
		<th>练习题库ID</th>
		<td>
			<input type="text" id="libId" name="libId" value="<?php echo ($section['libId']); ?>"/><em>*</em>
		</td>
	</tr>
	<tr>
		<th>预习ID列表</th>
		<td>
			<input type="text" id="previewList" name="previewList" value="<?php echo ($section['previewList']); ?>"/><em>*</em>
		</td>
	</tr>
	<tr>
		<th>正文ID列表</th>
		<td>
			<input type="text" id="lessonList" name="lessonList" value="<?php echo ($section['lessonList']); ?>"/><em>*</em>
		</td>
	</tr>
	<tr>
		<th>图片地址</th>
		<td>
			<textarea name="imgUrl" id="imgUrl" cols="50" rows="3"><?php echo ($section['imgUrl']); ?></textarea>
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" 
				onclick="upfileDialog(1,'<?php echo ($thumb); ?>','课时图片：<?php echo ($topic[name]); ?>',1,1,'#imgUrl','\r\n')"></a>
		</td>
	</tr>
	<tr>
		<th>知识点描述</th>
		<td>
			<textarea name="description" id="description" cols="50" rows="3"><?php echo ($section['description']); ?></textarea>
		</td>
	</tr>
	<tr>
		<th>排序</th>
		<td><input type="text" id="sort" name="sort" value="<?php echo ($section['sort']); ?>"/></td>
	</tr>
	<tr><th>状态</th><td><?php echo ($statusHtml); ?> <em>*</em></td></tr>
</table>
</form>