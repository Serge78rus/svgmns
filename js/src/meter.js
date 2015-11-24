/**
 * meter.js
 */

//Abstract base
Mns._Meter = function(node) {
	Mns._Meter.superclass.constructor.apply(this, [node]);
	this.ptr = node.children("g").children("use").first();
	this.rx = +this.ptr.attr("x") + +this.ptr.attr("width") / 2;
	this.ry = +this.ptr.attr("y") + +this.ptr.attr("height") / 2;
};

Mns.extend(Mns._Meter, Mns._El);

Mns._Meter.prototype.rand = function() {
	this.set({
		v: this.val.v && this.val.v < 100 ? this.val.v + 1 : 1
	});
};

//Meter120
Mns.Meter120 = function(node) {
	Mns.Meter120.superclass.constructor.apply(this, [node]);
};

Mns.extend(Mns.Meter120, Mns._Meter);

Mns.Meter120.prototype._set = function(attr, val) {
	switch (attr) {
		case "v":
			return this.ptr.attr("transform", "rotate(" + (val ? val * 1.2 - 60 : -60) + "," +
					this.rx + "," + this.ry + ")");
	}
	return false;
};

//Meter240
Mns.Meter240 = function(node) {
	Mns.Meter240.superclass.constructor.apply(this, [node]);
};

Mns.extend(Mns.Meter240, Mns._Meter);

Mns.Meter240.prototype._set = function(attr, val) {
	switch (attr) {
		case "v":
			return this.ptr.attr("transform", "rotate(" + (val ? val * 2.4 - 120 : -120) + "," +
					this.rx + "," + this.ry + ")");
	}
	return false;
};

//Meter360
Mns.Meter360 = function(node) {
	Mns.Meter360.superclass.constructor.apply(this, [node]);
};

Mns.extend(Mns.Meter360, Mns._Meter);

Mns.Meter360.prototype._set = function(attr, val) {
	switch (attr) {
		case "v":
			return this.ptr.attr("transform", "rotate(" + (val ? val * 3.6 - 180 : -180) + "," +
					this.rx + "," + this.ry + ")");
	}
	return false;
};


