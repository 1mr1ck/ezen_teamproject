function createComment(user_id, b_no) {
	$('.cmt_list').empty();
	
	const content = $(".content").val();
	console.log(content);
	
	$.ajax({
		method : "get",
		url : "boardView?no=" + b_no,
		data : {
			content : content,
			b_no : b_no,
			user_id : user_id
		}
	}).done(function (response) {
		console.log(b_no);
		const list = JSON.parse(response);
		console.log("result", response);
		
		list.forEach(e => {
			const user_id = e.user_id;
			const content = e.content;
			
			$('.cmt_list').append(
				`<tr>
					<td>${user_id}</td>
					<td>${content}</td>
				</tr>`
			)
		})
	});
}