/**
 * pwr.js 
 */

Mns.Pwr = function(node) {
	Mns.Pwr.superclass.constructor.apply(this, [node]);
};

Mns.extend(Mns.Pwr, Mns._El);

Mns.Pwr.prototype._set = function(attr, val) {
	switch (attr) {
		case "b":
			return this.node.attr("stroke", val || "none");
		case "f":
			return this.node.attr("fill", val || "none");
	}
	return false;
};

Mns.Pwr.prototype.rand = function() {
	this.set({
		f: Mns.randColor(),
		b: Mns.randInt(0, 10) ? null : Mns.randColor()
	});
};


