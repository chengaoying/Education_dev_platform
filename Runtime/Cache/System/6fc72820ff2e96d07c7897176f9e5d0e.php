<?php if (!defined('THINK_PATH')) exit();?><form id="edit_form" method="post" id="user_mt" class="easyui-tabs" data-options="fit:true,border:false">	
<table class="editTable">
	<tr>
		<th>ID</th>
		<td><?php echo ($user['id']); ?><input type="hidden" name="id" value="<?php echo ($user['id']); ?>"/></td>
	</tr>
	<tr>
		<th>用户ID</th>
		<td><?php echo ($user['userId']); ?><input type="hidden" name="userId" value="<?php echo ($user['userId']); ?>"/></td>
	</tr>
	<tr>
		<th>用户名</th>
		<td><?php echo ($user['userName']); ?><input type="hidden" name="userName" value="<?php echo ($user['userName']); ?>"/></td>
	</tr>
	<tr>
		<th>UserToken</th>
		<td><?php echo ($user['userToken']); ?><input type="hidden" name="userToken" value="<?php echo ($user['userToken']); ?>"/></td>
	</tr>
	<tr>
		<th>用户昵称</th>
		<td>
			<input type="text" name="nickName" value="<?php echo ($user['nickName']); ?>"/>
		</td>
	</tr>
	<tr>
		<th>元宝</th>
		<td>
			<input type="text" name="amount" value="<?php echo ($user['amount']); ?>"/>
		</td>
	</tr>
	<tr>
		<th>积分</th>
		<td>
			<input type="text" name="point" value="<?php echo ($user['point']); ?>"/>
		</td>
	</tr>
	<tr>
		<th>头像</th>
		<td>
			<input type="text" name="face" value="<?php echo ($user['face']); ?>"/>
		</td>
	</tr>
	<tr>
		<th>电话</th>
		<td>
			<input type="text" name="phone" value="<?php echo ($user['phone']); ?>"/>
		</td>
	</tr>
	<tr>
		<th>QQ</th>
		<td>
			<input type="text" name="qq" value="<?php echo ($user['qq']); ?>"/>
		</td>
	</tr>
	<tr>
		<th>邮箱</th>
		<td>
			<input type="text" name="email" value="<?php echo ($user['email']); ?>"/>
		</td>
	</tr>
	<tr>
		<th>邮箱</th>
		<td>
			<input type="text" name="address" value="<?php echo ($user['address']); ?>"/>
		</td>
	</tr>
	<tr>
		<th>机顶盒型号</th>
		<td>
			<input type="text" name="stbType" value="<?php echo ($user['stbType']); ?>"/>
		</td>
	</tr>
	<tr><th>注册时间</th><td><?php echo ($user['addTime']); ?></td></tr>
</table>
</form>