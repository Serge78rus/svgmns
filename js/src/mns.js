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

