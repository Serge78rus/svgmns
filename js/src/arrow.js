/**
 * arrow.js 
 */

Mns.Arrow = function(node) {
	Mns.Arrow.superclass.constructor.apply(this, [node]);
};

Mns.extend(Mns.Arrow, Mns._El);

Mns.Arrow.prototype._set = function(attr, val) {
	switch (attr) {
		case "b":
			return this.node.attr("stroke", val || "none");
		case "f":
			return this.node.attr("fill", val || "none");
	}
	return false;
};

Mns.Arrow.prototype.rand = function() {
	this.set({
		f: Mns.randColor(),
		b: Mns.randInt(0, 10) ? null : Mns.randColor()
	});
};


