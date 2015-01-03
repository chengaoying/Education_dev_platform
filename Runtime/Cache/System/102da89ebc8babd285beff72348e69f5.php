<?php if (!defined('THINK_PATH')) exit();?><form id="edit_form" method="post" style="padding:10px">
<table class="editTable">
	<tr><th width='100'>附件类型</th><td><?php echo ($upfile['fileType']); ?>
            <input type="hidden" name="id" value="<?php echo ($upfile['id']); ?>" />
        </td></tr>
    <tr><th>附件地址</th><td><a href="http://localhost:8500/upfiles/<?php echo ($upfile['url']); ?>" target="_blank"><?php echo ($upfile['url']); ?></a></td></tr>
    <tr><th>附件大小</th><td><?php echo ($upfile['size']); ?></td></tr>
    <tr><th>附件备注</th><td><input type="text" name="memo" value="<?php echo ($upfile['memo']); ?>" /></td></tr>
    <tr><th>添加时间</th><td><?php echo ($upfile['addTime']); ?></td></tr>
</table>
</form>