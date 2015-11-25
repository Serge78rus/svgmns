/**
 *
 */
$(function() {
	Mns.setup({
		onBtnClick: click
	});
});

function click(id) {
	alert("You press button " + id.replace("btn", ""));
}