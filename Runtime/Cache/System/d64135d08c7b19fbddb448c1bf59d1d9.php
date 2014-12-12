<?php if (!defined('THINK_PATH')) exit();?><script>
     
     $("#adClass").combobox({  
		onSelect:function(param){
			if(param.value == '1'){
				$("#ad_apId").show(); $("#ad_id").show();
			}else{
            	$("#ad_apId").hide(); $("#ad_id").hide();
            }
		}
     });
     $("#adType").combobox({
    	 onSelect:function(param){    		
    		 if(param.value == '1'){
    			$("#ad_image").hide(); $("#ad_video").show();
    		 }else{
    			$("#ad_image").show(); $("#ad_video").hide();
    		 }
    	 }
     });
     
     $(function(){     	
     	$("#adClass").combobox("select","<?php echo ($ad['adClass']); ?>");
     	$("#adType").combobox("select","<?php echo ($ad['adType']); ?>");
      });
      
</script>
<form id="edit_form" method="post" style="padding:10px">
    <table class="editTable">
        <tr><th>广告位</th><td><input type="hidden" name="id" value="<?php echo ($ad['id']); ?>"/><?php echo ($adSpaceHtml); ?><em>*</em></td></tr>
        <tr><th>广告分类</th><td><?php echo ($adClassHtml); ?><em>*</em></td></tr>
        <tr id="ad_apId" style="display:none;"><th>广告商</th><td><?php echo ($apHtml); ?><em>*</em></td></tr>
        <tr id="ad_id"  style="display:none;"><th>外部ID</th><td><input type="text" id="adId" name="adId" value="<?php echo ($ad['adId']); ?>"/><em>*</em></td></tr>
        <tr><th>广告标题</th><td><input type="text" id="title" name="title" value="<?php echo ($ad['title']); ?>"/><em>*</em></td></tr>
        <tr><th>广告类型</th><td><?php echo ($adTypeHtml); ?><em>*</em></td></tr>          
        <tr id="ad_image"><th>广告图片</th><td><input type="text" id="image" name="image" value="<?php echo ($ad['content']); ?>" style="width:200px" /><a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="upfileDialog(1,'<?php echo ($thumb); ?>','广告图片-<?php echo ($ad['title']); ?>',0,0,'#image')"></a></td></tr>
        <tr id="ad_video" style="display:none;"><th>视频流</th><td><textarea id="video" name="video" style="width:280px;height:30px"><?php echo ($ad['content']); ?></textarea></td></tr>
        <tr><th>链接地址</th><td><textarea id="linkUrl" name="linkUrl" style="width:280px;height:30px"><?php echo ($ad['linkUrl']); ?></textarea></td></tr>
        <tr><th>排序</th><td><input type="text" id="sort" name="sort" value="<?php echo ($ad['sort']); ?>"/></td></tr>
        <tr><th>跳转时间</th><td><input type="text" id="time" name="time" value="<?php echo ($ad['time']); ?>"/>(单位为秒)</td></tr>
        <tr><th>状态</th><td><?php echo ($statusHtml); ?><em>*</em></td></tr>
    </table>
</form>