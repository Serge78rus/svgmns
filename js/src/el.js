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

