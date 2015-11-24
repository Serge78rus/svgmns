/**
 * svg.js
 */

Mns.Svg = function(node) {
	Mns.Svg.superclass.constructor.apply(this, [node]);
};

Mns.extend(Mns.Svg, Mns._El);

Mns.Svg.prototype._set = function(attr, val) {
	return this.node.attr(attr, val || "none");
};

Mns.Svg.prototype.rand = function() {
/*
	this.set({
		f: Mns.randColor(),
		b: Mns.randInt(0, 10) ? null : Mns.randColor()
	});
*/
};


