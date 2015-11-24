/**
 *
 */
function tree_toggle(event) {
	event = event || window.event;
	var clickedElem = event.target || event.srcElement;
	if (!hasClass(clickedElem, "Expand"))
		return;
	var node = clickedElem.parentNode;
	if (hasClass(node, "ExpandLeaf"))
		return;
	var newClass = hasClass(node, "ExpandOpen") ? "ExpandClosed" : "ExpandOpen";
	var re =  /(^|\s)(ExpandOpen|ExpandClosed)(\s|$)/;
	node.className = node.className.replace(re, "$1" + newClass + "$3");
}

function hasClass(elem, className) {
	return new RegExp("(^|\\s)" + className+"(\\s|$)").test(elem.className);
}

