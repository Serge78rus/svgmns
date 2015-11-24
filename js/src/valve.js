/**
 * valve.js
 */

Mns.Valve = function(node) {
	Mns.Valve.superclass.constructor.apply(this, [node]);
};

Mns.extend(Mns.Valve, Mns._El);

Mns.Valve.prototype._set = function(attr, val) {
	switch (attr) {
		case "b":
			return this.node.attr("stroke", val || "none");
		case "f":
			return this.node.attr("fill", val || "none");
	}
	return false;
};

Mns.Valve.prototype.rand = function() {
	this.set({
		f: Mns.randColor(),
		b: Mns.randInt(0, 10) ? null : Mns.randColor()
	});
};


