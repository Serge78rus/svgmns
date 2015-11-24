/*
The MIT License (MIT)

Copyright (c) 2009...2015 Serge L. Ryadkow http://svgmnemo.ru

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

/**
 * mns.js
 */

//namespace
var Mns = {};

Mns.COLORS = ["black", "blue", "fuchsia", "gray", "green", "lime", "maroon",
              "navy", "olive", "purple", "red", "silver", "teal", "white", "yellow"];
Mns.opt = {};

//global methods

Mns.setup = function(opt) {
	for (var key in opt)
		this.opt[key] = opt[key];
////////////////
	if (this.rdy && this.opt.onRdy)
		this.opt.onRdy(this);
};

Mns.svgload = function(evt) {
	this.svg = $(evt.target);
	this.layers = {
		dyn0: this.svg.children("#dyn0"),
		stat: this.svg.children("#stat"),
		dyn: this.svg.children("#dyn"),
		hlp: this.svg.children("#hlp")
	};
	this.dyn = [];
	var obj = this;
	this.layers.dyn0.children().each(function() {
		var node = $(this), id = node.attr("id");
		if (id)
			switch(node.attr("class")) {
				case "level":
					obj.dyn[id] = new Mns.Level(node);
					break;
			}
	});
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
				case "fan":
					obj.dyn[id] = new Mns.Fan(node);
					break;
				case "pwr_a":
				case "pwr_d":
				case "pwr_b":
					obj.dyn[id] = new Mns.Pwr(node);
					break;
				case "arrow":
					obj.dyn[id] = new Mns.Arrow(node);
					break;
				case "label":
					obj.dyn[id] = new Mns.Label(node);
					break;
				case "display":
					obj.dyn[id] = new Mns.Display(node);
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
				case "meter120":
					obj.dyn[id] = new Mns.Meter120(node);
					break;
				case "meter240":
					obj.dyn[id] = new Mns.Meter240(node);
					break;
				case "meter360":
					obj.dyn[id] = new Mns.Meter360(node);
					break;
				case "svg":
					obj.dyn[id] = new Mns.Svg(node);
					break;
			}
	});
/////////////////////////////
	$("#tool_hlp").change(function() {Mns.checkhlp(this);});
	this.rdy = true;
	if (this.opt.onRdy)
		this.opt.onRdy(this);
};

Mns.buttonclick = function(id) {
//	alert("button " + id + " click");
	if (this.opt.onBtnClick)
		this.opt.onBtnClick(id);
};

Mns.showhlp = function(evt) {
	var el = $(evt.target.correspondingUseElement ? evt.target.correspondingUseElement : evt.target);
	if (+el.attr("y") + +el.attr("height") / 2 > 500)
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
 * util.js
 */

Mns.extend = function(child, parent) {
	var f = function() {};
	f.prototype = parent.prototype;
	child.prototype = new f();
	child.prototype.constructor = child;
	child.superclass = parent.prototype;
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
 * el.js
 */

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
 * pump.js
 */

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
 * led.js
 */

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


/**
 * label.js
 */

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
 * display.js
 */

Mns.Display = function(node) {
	Mns.Display.superclass.constructor.apply(this, [node]);
	this.use = node.children("use").first();
	this.text = node.children("text").first();
};

Mns.extend(Mns.Display, Mns._El);

Mns.Display.prototype._set = function(attr, val) {
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

Mns.Display.prototype.rand = function() {
	this.set({
		f: Mns.randColor(),
		b: Mns.randColor(),
		t: Mns.randStr(5)
	});
};


/**
 * switch.js
 */

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
 * gauge.js
 */

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


/**
 * svg.js
 */

Mns.Svg = function(node) {
	Mns.Svg.superclass.constructor.apply(this, [node]);
};

Mns.extend(Mns.Svg, Mns._El);

Mns.Svg.prototype._set = function(attr, val) {
	return this.node.attr(attr, val || "none");
};

Mns.Svg.prototype.rand = function() {
/*
	this.set({
		f: Mns.randColor(),
		b: Mns.randInt(0, 10) ? null : Mns.randColor()
	});
*/
};


/**
 * level.js
 */

Mns.Level = function(node) {
	Mns.Level.superclass.constructor.apply(this, [node]);
	this.front = node.children("use").first();
	this.back = node.children("use").last();
	this.y = +this.front.attr("y");
};

Mns.extend(Mns.Level, Mns._El);

Mns.Level.prototype._set = function(attr, val) {
	switch (attr) {
		case "b":
			return this.back.attr("fill", val ? val : "none");
		case "f":
			return this.front.attr("fill", val ? val : "none");
		case "v":
//			var v = this.s * (val ? +val : 0);
//			return this.front.attr("transform", "translate(0, " + (this.h - v) + ") scale(1, " + (val ? +val / 100 : 0) + ")");
			return this.back.attr("transform", "translate(0, " + (val ? this.y * val / 100 : 0) + ") scale(1, " + (val ? 1 - val / 100 : 1) + ")");

	}
	return false;
};

Mns.Level.prototype.rand = function() {
	this.set({
		v: this.val.v && this.val.v < 100 ? this.val.v + 1 : 1
	});
};



