function createCmt(b_no) {

	const id = $(".user_id").val();
	const content = $(".content").val();
	console.log(content);
	$.ajax({
		method: "POST",
		url: "commentWriteAction",
		data: {
			content: content,
			b_no: b_no
		}
	}).done(function(response) {
		const list = JSON.parse(response);
		console.log("response", list);

		var lists = document.getElementById("cmt_list");
		var output = "";


		list.forEach(e => {
			const cmt_user_id = e.user_id;
			const b_no = e.b_no;
			const content = e.content;
			const c_no = e.c_no;

			output += '<tr>';
			output += '<td class="id">' + cmt_user_id + '</td>';
			output += '<td class="content">' + content + '</td>';
			if (id == (cmt_user_id)) {
				output += '<td><button name="update-cmt" onclick="updateCmt(' + b_no + ', ' + c_no + ')">수정</button></td>';
				output += '<td><button name="delete-cmt" onclick="deleteCmt(' + b_no + ', ' + c_no + ')">삭제</button></td>';
			};
			output += '</tr>';

			lists.innerHTML = output;

		});
	});
}

// 삭제
function deleteCmt(b_no, c_no) {
	$('.cmt_list').empty();

	const id = $(".user_id").val();
	const content = $(".content").val();
	$.ajax({
		method: "POST",
		url: "commentDeleteAction",
		data: {
			content: content,
			b_no: b_no,
			c_no: c_no
		}
	}).done(function(response) {
		const list = JSON.parse(response);
		console.log("response", list);

		var lists = document.getElementById("cmt_list");
		var output = "";


		list.forEach(e => {
			const cmt_user_id = e.user_id;
			const b_no = e.b_no;
			const content = e.content;
			const c_no = e.c_no;

			output += '<tr>';
			output += '<td class="id">' + cmt_user_id + '</td>';
			output += '<td class="content">' + content + '</td>';
			if (id == (cmt_user_id)) {
				output += '<td><button name="update-cmt" onclick="updateCmt(' + b_no + ', ' + c_no + ')">수정</button></td>';
				output += '<td><button name="delete-cmt" onclick="deleteCmt(' + b_no + ', ' + c_no + ')">삭제</button></td>';
			};
			output += '</tr>';

			lists.innerHTML = output;

		});

	});
}