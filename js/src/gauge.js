/**
 * gauge.js
 */

Mns.Gauge = function(node) {
	Mns.Gauge.superclass.constructor.apply(this, [node]);
	this.back = node.children("use").first();
	this.front = node.children("use").last();
	this.h = +this.back.attr("height");
	this.y = +this.back.attr("y");
	this.s = this.h / 100;
};

Mns.extend(Mns.Gauge, Mns._El);

Mns.Gauge.prototype._set = function(attr, val) {
	switch (attr) {
		case "b":
			return this.back.attr("fill", val ? "url(#tube_lg_" + val + ")" : "none");
		case "f":
			return this.front.attr("fill", val ? "url(#tube_lg_" + val + ")" : "none");
		case "v":
			var v = this.s * (val ? +val : 0);
			return this.front.attr("height", v).attr("y", this.y + this.h - v);
	}
	return false;
};

Mns.Gauge.prototype.rand = function() {
	this.set({
//		f: Mns.randColor(),
//		b: Mns.randColor(),
		v: this.val.v && this.val.v < 100 ? this.val.v + 1 : 1
	});
};

