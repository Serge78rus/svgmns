/**
 *
 */
//namespace
var Mns = Mns || {};

//Abstract base
Mns._Switch = function(node) {
	Mns._Switch.superclass.constructor.apply(this, [node]);
	this.pan = node.children("use").first();
	this.key = node.children("use").last();
	this.rx = +this.key.attr("x") + +this.key.attr("width") / 2;
	this.ry = +this.key.attr("y") + +this.key.attr("height") / 2;
};

Mns.extend(Mns._Switch, Mns._El);

Mns._Switch.prototype._set = function(attr, val) {
	switch (attr) {
		case "c":
			return this.pan.attr("stroke", val || "none");
		case "a":
			return this.key.attr("transform", "rotate(" + (val | 0) + "," + this.rx + "," + this.ry + ")");
	}
	return false;
};

//Switch2
Mns.Switch2 = function(node) {
	Mns.Switch2.superclass.constructor.apply(this, [node]);
};

Mns.extend(Mns.Switch2, Mns._Switch);

Mns.Switch2.prototype.rand = function() {
	this.set({
		c: Mns.randInt(0, 10) ? null : Mns.randColor(),
		a: Mns.randInt(0, 1) * 90 - 45
	});
};

//Switch3
Mns.Switch3 = function(node) {
	Mns.Switch3.superclass.constructor.apply(this, [node]);
};

Mns.extend(Mns.Switch3, Mns._Switch);

Mns.Switch3.prototype.rand = function() {
	this.set({
		c: Mns.randInt(0, 10) ? null : Mns.randColor(),
		a: Mns.randInt(-1, 1) * 60
	});
};



