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


