/**
 * fan.js 
 */

Mns.Fan = function(node) {
	Mns.Fan.superclass.constructor.apply(this, [node]);
	this.back = node.children("use").first();
	this.front = node.children("use").last();
};

Mns.extend(Mns.Fan, Mns._El);

Mns.Fan.prototype._set = function(attr, val) {
	switch (attr) {
		case "b":
			return this.back.attr("stroke", val || "none");
		case "f":
			this.back.attr("fill", val ? "url(#ball_rg_" + val + ")" : "none");
			return this.front.attr("fill", val ? "url(#fan_lg_" + val + ")" : "none");
	}
	return false;
};

Mns.Fan.prototype.rand = function() {
	this.set({
		f: Mns.randColor(),
		b: Mns.randInt(0, 10) ? null : Mns.randColor()
	});
};


