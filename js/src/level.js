/**
 * level.js
 */

Mns.Level = function(node) {
	Mns.Level.superclass.constructor.apply(this, [node]);
	this.front = node.children("use").first();
	this.back = node.children("use").last();
	this.y = +this.front.attr("y");
};

Mns.extend(Mns.Level, Mns._El);

Mns.Level.prototype._set = function(attr, val) {
	switch (attr) {
		case "b":
			return this.back.attr("fill", val ? val : "none");
		case "f":
			return this.front.attr("fill", val ? val : "none");
		case "v":
//			var v = this.s * (val ? +val : 0);
//			return this.front.attr("transform", "translate(0, " + (this.h - v) + ") scale(1, " + (val ? +val / 100 : 0) + ")");
			return this.back.attr("transform", "translate(0, " + (val ? this.y * val / 100 : 0) + ") scale(1, " + (val ? 1 - val / 100 : 1) + ")");

	}
	return false;
};

Mns.Level.prototype.rand = function() {
	this.set({
		v: this.val.v && this.val.v < 100 ? this.val.v + 1 : 1
	});
};



