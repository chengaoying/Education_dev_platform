<?php if (!defined('THINK_PATH')) exit();?><form id="edit_form" method="post" style="padding:10px">
<table class="editTable">
	<tr>
		<th>课程名称</th>
		<td>
			<input type="hidden" id="id" name="id" value="<?php echo ($course['id']); ?>"/>
			<input type="text" id="name" name="name" value="<?php echo ($course['name']); ?>"/><em>*</em>
		</td>
	</tr>
	<tr><th>所属栏目</th><td><?php echo ($channelHtml); ?> <em>*</em></td></tr>
	<tr><th>龄段</th><td><?php echo ($stageHtml); ?> <em>*</em></td></tr>
	<!-- <tr>
		<th>龄段</th>
		<td>
			<input id="stageId" class="easyui-combobox" name="stageId" data-options="valueField:'id',textField:'name',data:[{id:'',name:'请选择'}]" style="width:150px"/> <em>*</em>
		</td>
	</tr> -->
	
	<tr><th>出版商</th><td><?php echo ($pressHtml); ?> <em>*</em></td></tr>
	<tr><th>册数</th><td><?php echo ($volumeHtml); ?> <em>*</em></td></tr>
	<tr><th>类型</th><td><?php echo ($typeHtml); ?> <em>*</em></td></tr>
	<tr>
		<th>价格</th>
		<td>
			<input type="text" id="price" name="price" value="<?php echo ($course['price']); ?>"/><em>*</em>
		</td>
	</tr>
	<tr>
		<th>期中考试题库ID</th>
		<td>
			<input type="text" id="midLibId" name="midLibId" value="<?php echo ($course['midLibId']); ?>"/><em>*</em>
		</td>
	</tr>
	<tr>
		<th>期末考试题库ID</th>
		<td>
			<input type="text" id="finalLibId" name="finalLibId" value="<?php echo ($course['finalLibId']); ?>"/><em>*</em>
		</td>
	</tr>
	<tr>
		<th>知识点ID</th>
		<td>
			<input type="text" id="topicIds" name="topicIds" value="<?php echo ($course['topicIds']); ?>"/><em>*</em>
		</td>
	</tr>
	<tr>
		<th>关键字</th>
		<td>
			<input type="text" id="keys" name="keys" value="<?php echo ($course['keys']); ?>"/><em>*</em>
		</td>
	</tr>
	<tr>
		<th>图片地址</th>
		<td>
			<textarea name="imgUrl" id="imgUrl" cols="50" rows="3"><?php echo ($course['imgUrl']); ?></textarea>
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" 
				onclick="upfileDialog(1,'<?php echo ($thumb); ?>','课程图片：<?php echo ($course[name]); ?>',1,1,'#imgUrl','\r\n')"></a>
		</td>
	</tr>
	<tr>
		<th>链接地址</th>
		<td>
			<input type="text" id="linkUrl" name="linkUrl" value="<?php echo ($course['linkUrl']); ?>"/><em>*</em>
		</td>
	</tr>
	<tr>
		<th>课程描述</th>
		<td>
			<textarea name="description" id="description" cols="50" rows="3"><?php echo ($course['description']); ?></textarea>
		</td>
	</tr>
	<tr>
		<th>排序</th>
		<td><input type="text" id="sort" name="sort" value="<?php echo ($course['sort']); ?>"/></td>
	</tr>
	<tr><th>状态</th><td><?php echo ($statusHtml); ?> <em>*</em></td></tr>
</table>
</form>