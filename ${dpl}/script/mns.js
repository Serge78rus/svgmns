/**
 *
 */
//namespace
var Mns = Mns || {};

Mns.COLORS = ["black", "blue", "fuchsia", "gray", "green", "lime", "maroon",
              "navy", "olive", "purple", "red", "silver", "teal", "white", "yellow"];
Mns.opt = {};

//global methods

Mns.setup = function(opt) {
	for (var key in opt)
		this.opt[key] = opt[key];
	$("#tool_hlp").change(function() {Mns.checkhlp(this);});
////////////////
	if (this.rdy && this.opt.onRdy)
		this.opt.onRdy(this);
};

Mns.svgload = function(evt) {
	this.svg = $(evt.target);
	this.layers = {
		stat: this.svg.children("#stat"),
		dyn: this.svg.children("#dyn"),
		hlp: this.svg.children("#hlp")
	};
	this.dyn = [];
	var obj = this;
	this.layers.dyn.children().each(function() {
		var node = $(this), id = node.attr("id");
		if (id)
			switch(node.attr("class")) {
				case "pump":
					obj.dyn[id] = new Mns.Pump(node);
					break;
				case "led":
					obj.dyn[id] = new Mns.Led(node);
					break;
				case "valve":
				case "valve_b":
				case "valve_w":
					obj.dyn[id] = new Mns.Valve(node);
					break;
				case "label":
					obj.dyn[id] = new Mns.Label(node);
					break;
				case "switch2":
					obj.dyn[id] = new Mns.Switch2(node);
					break;
				case "switch3":
					obj.dyn[id] = new Mns.Switch3(node);
					break;
				case "gauge":
					obj.dyn[id] = new Mns.Gauge(node);
					break;
			}
	});
/////////////////////////////
	this.rdy = true;
	if (this.opt.onRdy)
		this.opt.onRdy(this);
};

Mns.buttonclick = function(id) {
//	alert("button " + id + " click");
};

Mns.showhlp = function(evt) {
	var el = $(evt.target.correspondingUseElement ? evt.target.correspondingUseElement : evt.target);
	if (+el.attr("y") + +el.attr("height") / 2 > 50)
		$("#help_top").addClass("show").children("p").text(el.children("desc").text());
	else
		$("#help_bottom").addClass("show").children("p").text(el.children("desc").text());
};
Mns.hidehlp = function(evt) {
	$("#help_top").removeClass("show");
	$("#help_bottom").removeClass("show");
};

Mns.checkhlp = function(cb) {
	if (this.layers)
		this.layers.hlp.attr("display", $(cb).attr("checked") ? "block" : "none");
//		this.layers.hlp.attr("visibility", $(cb).attr("checked") ? "visible" : "hidden");
};

Mns.rand = function(el) {
	if (el === undefined)
		el = this.dyn;
	if (Mns.isArray(el))
		for (var key in el)
			el[key].rand();
	else
		el.rand();
};


/**
 *
 */
//namespace
var Mns = Mns || {};

Mns.extend = function(Child, Parent) {
	var F = function() {};
	F.prototype = Parent.prototype;
	Child.prototype = new F();
	Child.prototype.constructor = Child;
	Child.superclass = Parent.prototype;
};

Mns.randInt = function(min, max) {
	return Math.floor(Math.random() * (max - min + 1)) + min;
};

Mns.randColor = function() {
	return Mns.COLORS[Mns.randInt(0, 14)];
};

Mns.randStr = function(len) {
	var s = "";
	for (var i = 0; i < len; ++i)
		s += i ? String.fromCharCode(Mns.randInt(0x61, 0x7a)) :
				String.fromCharCode(Mns.randInt(0x41, 0x5a));
	return s;
};

Mns.isArray = function(a) {
  return (typeof a == "object") && (a instanceof Array);
};


/**
 *
 */
//namespace
var Mns = Mns || {};

//Abstract base
Mns._El = function(node) {
	this.node = node;
	this.id = node.attr("id");
	this.cls = node.attr("class");
	this.val = {};
};

Mns._El.prototype.set = function(val) {
	for (var key in val)
		if (val[key] !== undefined && val[key] !== this.val[key])
			if (!this._set(key, this.val[key] = val[key]))
				throw Error("Invalid attr: " + key + " for Mns.El class: " +
						this.cls + " id:" + this.id);
};

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
/**
 *
 */
//namespace
var Mns = Mns || {};

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



/**
 *
 */

//namespace
var Mns = Mns || {};

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
