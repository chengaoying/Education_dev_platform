<?php if (!defined('THINK_PATH')) exit();?><form id="edit_form" method="post" style="padding:10px">
    <div style="width:100%;text-align: center;font-size: 16px">数据删除后无法恢复，</div>
    <div style="width:100%;text-align: center;font-size: 16px">确定要删除数据吗？</div>
    <div style="width:100%;text-align: center;font-size: 16px;margin-top: 10px">删除本身文件？
    	<input type="hidden" name="url" value="<?php echo ($upfile['url']); ?>" />
    	<input type="hidden" name="id" value="<?php echo ($upfile['id']); ?>" />
    	<input type="checkbox" name="delFile" checked="checked" style="width:18px;height:18px;" />
    </div>
    <input type="submit">
</form>