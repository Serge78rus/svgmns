/**
 *
 */

//namespace
var Mns = Mns || {};

Mns.Led = function(node) {
	Mns.Led.superclass.constructor.apply(this, [node]);
};

Mns.extend(Mns.Led, Mns._El);

Mns.Led.prototype._set = function(attr, val) {
	switch (attr) {
		case "b":
			return this.node.attr("stroke", val || "none");
		case "f":
			return this.node.attr("fill", val ? "url(#led_rg_" + val + ")" : "none");
	}
	return false;
};

Mns.Led.prototype.rand = function() {
	this.set({
		f: Mns.randColor(),
		b: Mns.randInt(0, 10) ? null : Mns.randColor()
	});
};
