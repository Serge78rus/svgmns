/**
 *
 */
var auto = true, inp = false, out = true, l = 50;

$(function() {
	Mns.setup({
		onRdy: init,
		onBtnClick: click
	});
});

function init() {
	setInterval(function() {cycle();}, 1000);
}

function click(id) {
	switch (id) {
		case "btn0":
			Mns.dyn["sw"].set({a: -60});
			pump(false);
			auto = false;
			break;
		case "btn1":
			Mns.dyn["sw"].set({a: 0});
			pump(true);
			auto = false;
			break;
		case "btnA":
			Mns.dyn["sw"].set({a: 60});
			auto = true;
			break;
		case "btnO":
			Mns.dyn["v"].set({f: "yellow"});
			setTimeout(function() {Mns.dyn["v"].set({f: "lime"});}, 3000);
			out = true;
			break;
		case "btnC":
			Mns.dyn["v"].set({f: "yellow"});
			setTimeout(function() {Mns.dyn["v"].set({f: "gray"});}, 3000);
			out = false;
			break;
	}
}

function dl() {
	return (inp ? 2 : 0) + (out ? -1 : 0);
}

function cycle() {
	l += dl();
	if (l < 0)
		l = 0;
	if (l > 100)
		l = 100;
	Mns.dyn["l"].set({v: l});
	Mns.dyn["ll"].set({f: l < 10 ? "red" : "black"});
	Mns.dyn["hh"].set({f: l > 90 ? "red" : "black"});
	if (auto)
		if (l > 70 && inp)
			pump(false);
		else if (l < 30 && !inp)
			pump(true);
	if (inp)
		Mns.dyn["press"].set({v: 50 + Math.random() * 4 - 2});

}

function pump(s) {
	if (s) {
		Mns.dyn["p"].set({f: "lime"});
		Mns.dyn["pl"].set({f: "lime"});
		Mns.dyn["press"].set({v: 50});
		inp = true;
	} else {
		Mns.dyn["p"].set({f: "gray"});
		Mns.dyn["pl"].set({f: "black"});
		Mns.dyn["press"].set({v: 0});
		inp = false;
	}
}

