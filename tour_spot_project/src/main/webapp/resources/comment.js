function createComment(user_id, b_no) {
	alert(b_no);
	console.log(b_no);
	if (user_id != null) {
		return;
	}
	
	
	const content = $(".content").val();
	console.log(content);

	$.ajax({
		method: "get",
		url: "commentWriteAction",
		data: {
			content: content,
			b_no: b_no,
			user_id: user_id
		}
	}).done(function(response) {
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

function testfunc(user_id, b_no) {
	if (user_id == null) {
		return;
	}
	
	const content = $(".content").val();
	console.log(content);
	$.ajax({
		method: "POST",
		url: "commentWriteAction",
		data: {
			content: content,
			user_id: user_id,
			b_no : b_no
		}
	}).done(function(response) {
		const list = JSON.parse(response);
		console.log("response", list);
		
		$('.cmt_list').append(
			`<tr>
				<td>${user_id}</td>
				<td>${content}</td>
			</tr>`
		)
	});
}