/**
 *
 */
//namespace
var Mns = Mns || {};

Mns.Pump = function(node) {
	Mns.Pump.superclass.constructor.apply(this, [node]);
};

Mns.extend(Mns.Pump, Mns._El);

Mns.Pump.prototype._set = function(attr, val) {
	switch (attr) {
		case "b":
			return this.node.attr("stroke", val || "none");
		case "f":
			return this.node.attr("fill", val || "none");
	}
	return false;
};

Mns.Pump.prototype.rand = function() {
	this.set({
		f: Mns.randColor(),
		b: Mns.randInt(0, 10) ? null : Mns.randColor()
	});
};
