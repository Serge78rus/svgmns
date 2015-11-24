/**
 *
 */
var auto = true, inp = true, out = false, l = 50, ff = false;

$(function() {
	Mns.setup({
		onRdy: init,
		onBtnClick: click
	});
	if (window.navigator.userAgent.match(/Firefox/))
		ff = true;
});

function init() {
	setInterval(function() {cycle();}, 1000);
}

function click(id) {
	//var el_id = Mns.svg[0].suspendRedraw(1000);

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
			inp = true;
			break;
		case "btnC":
			Mns.dyn["v"].set({f: "yellow"});
			setTimeout(function() {Mns.dyn["v"].set({f: "gray"});}, 3000);
			inp = false;
			break;
	}

	//Mns.svg[0].unsuspendRedraw(el_id);
/*
	setTimeout(function() {
		Mns.svg[0].forceRedraw();
	}, 1000);
*/
/*
	if (ff) {
		var e = $("embed"), w = e.width();
		e.width(w - 1);
		setTimeout(function() {
			e.width(w);
		}, 0);
	}
	*/
}

function dl() {
	return (inp ? 1 : 0) + (out ? -2 : 0);
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
		if (l < 30 && out)
			pump(false);
		else if (l > 70 && !out)
			pump(true);
}

function pump(s) {
	if (s) {
		Mns.dyn["p"].set({f: "lime"});
		Mns.dyn["u"].set({v: 61});
		Mns.dyn["i"].set({v: 81});
		tmr = setInterval(function() {iu();}, 100);
		out = true;
	} else {
		Mns.dyn["p"].set({f: "gray"});
		Mns.dyn["u"].set({v: 80});
		Mns.dyn["i"].set({v: 0});
		out = false;
	}
}

var tmr, cnt = 0;
function iu() {
	switch (++cnt) {
		case 1:
			Mns.dyn["u"].set({v: 69});
			Mns.dyn["i"].set({v: 65});
			break;
		case 2:
			Mns.dyn["u"].set({v: 73});
			Mns.dyn["i"].set({v: 57});
			break;
		case 3:
			Mns.dyn["u"].set({v: 75});
			Mns.dyn["i"].set({v: 53});
			break;
		case 4:
			Mns.dyn["u"].set({v: 75.5});
			Mns.dyn["i"].set({v: 51});
			break;
		case 5:
			Mns.dyn["u"].set({v: 75.75});
			Mns.dyn["i"].set({v: 50.5});
			break;
		default:
			Mns.dyn["u"].set({v: 76});
			Mns.dyn["i"].set({v: 50});
			clearInterval(tmr);
			cnt = 0;
	}
}

