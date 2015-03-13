<?php if (!defined('THINK_PATH')) exit();?><form id="edit_form" method="post" style="padding:10px">
<table class="editTable">
	<tr>
		<th>名称</th>
		<td>
			<input type="hidden" id="id" name="id" value="<?php echo ($chrageMode['id']); ?>"/>
			<input type="text" id="name" name="name" value="<?php echo ($chrageMode['name']); ?>"/><em>*</em>
		</td>
	</tr>
	<tr>
		<th>关键字</th>
		<td>
			<input type="text" id="cKey" name="cKey" value="<?php echo ($chrageMode['cKey']); ?>"/><em>*</em>
		</td>
	</tr>
	<tr>
		<th>计费类型</th>
		<td><?php echo ($typeHtml); ?></td>
	</tr>
	<tr>
		<th>计费id</th>
		<td>
			<input type="text" id="chargeId" name="chargeId" value="<?php echo ($chrageMode['chargeId']); ?>"/><em>*</em>
		</td>
	</tr>
	<tr>
		<th>价格</th>
		<td>
			<input type="text" id="price" name="price" value="<?php echo ($chrageMode['price']); ?>"/><em>*</em>
		</td>
	</tr>
	<tr>
		<th>描述</th>
		<td>
			<input type="text" id="desc" name="desc" value="<?php echo ($chrageMode['desc']); ?>"/><em>*</em>
		</td>
	</tr>
	<tr><th>状态</th><td><?php echo ($statusHtml); ?> <em>*</em></td></tr>
</table>
</form>