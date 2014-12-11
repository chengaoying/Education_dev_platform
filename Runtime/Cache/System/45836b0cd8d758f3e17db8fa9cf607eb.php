<?php if (!defined('THINK_PATH')) exit();?><form id="edit_form" method="post" style="padding:10px">
<table class="editTable">
	<tr><th>广告位KEY</th><td><input type="hidden" name="id" value="<?php echo ($adSpace['id']); ?>"/><input type="text" id="asKey" name="asKey" value="<?php echo ($adSpace['asKey']); ?>"/><em>*</em></td></tr>
	<tr><th>广告位名称</th><td><input type="text" id="title" name="title" value="<?php echo ($adSpace['title']); ?>"/><em>*</em></td></tr>
	<tr><th>广告位类型</th><td><?php echo ($asTypeHtml); ?><em>*</em></td></tr>
	<tr><th>广告数量</th>	<td><input type="text" id="showNum" name="showNum" value="<?php echo ($adSpace['showNum']); ?>"/><em>*(1-10)</em></td></tr>
</table>
</form>