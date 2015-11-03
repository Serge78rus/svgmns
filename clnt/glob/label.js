/**
 *
 */
//namespace
var Mns = Mns || {};

Mns.Label = function(node) {
	Mns.Label.superclass.constructor.apply(this, [node]);
	this.use = node.children("use").first();
	this.text = node.children("text").first();
};

Mns.extend(Mns.Label, Mns._El);

Mns.Label.prototype._set = function(attr, val) {
	switch (attr) {
		case "b":
			return this.use.attr("fill", val || "none");
		case "f":
			return this.text.attr("fill", val || "none");
		case "t":
			return this.text.text(val || "");
	}
	return false;
};

Mns.Label.prototype.rand = function() {
	this.set({
		f: Mns.randColor(),
		b: Mns.randColor(),
		t: Mns.randStr(5)
	});
};
