/**
 *
 */
$(function() {
	Mns.setup({
		onBtnClick: click
	});
});

function click(id) {
	alert("Вы нажали кнопку " + id.replace("btn", ""));
}