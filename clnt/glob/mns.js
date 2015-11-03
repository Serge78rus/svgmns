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


