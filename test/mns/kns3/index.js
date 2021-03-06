/**
 *
 */
var
	auto = [true, true, true],
	inp = [true, true, true],
	out = [false, false, false],
	queue = [1, 2, 3],
	l = 50, fi, fo, n = 0;

$(function() {
	Mns.setup({
		onRdy: init,
		onBtnClick: click
	});
});

function init() {
	Mns.dyn["1_sq"].set({a: -60});
	Mns.dyn["2_sq"].set({a: 0});
	Mns.dyn["3_sq"].set({a: 60});
	calcI();
	calcO();
	setInterval(function() {cycle();}, 1000);
}

function click(id) {
	var b = id.split("_");
	switch (b[1]) {
		case "v":
			vCntrl(+b[0], +b[2]);
			break;
		case "p":
			pCntrl(+b[0], b[2]);
			break;
		case "q":
			qCntrl(+b[0], +b[2]);
			break;
	}
}

function vCntrl(i, v) {
	if (v && !inp[i - 1] || !v && inp[i - 1]) {
		Mns.dyn[i + "_v"].set({f: "yellow"});
		setTimeout(function(){Mns.dyn[i + "_v"].set({f: v ? "lime" : "gray"});}, 1000);
		inp[i - 1] = v ? true : false;
		calcI();
	}
}

function pCntrl(i, v) {
	switch (v) {
		case "0":
			auto[i - 1] = false;
			Mns.dyn[i + "_sp"].set({a: -60});
			if (out[i - 1]) {
				Mns.dyn[i + "_p"].set({f: "gray"});
				out[i - 1] = false;
				calcO();
			}
			break;
		case "1":
			auto[i - 1] = false;
			Mns.dyn[i + "_sp"].set({a: 0});
			if (!out[i - 1]) {
				Mns.dyn[i + "_p"].set({f: "lime"});
				out[i - 1] = true;
				calcO();
			}
			break;
		case "a":
			auto[i - 1] = true;
			Mns.dyn[i + "_sp"].set({a: 60});
			break;
	}
}

function qCntrl(i, v) {
	queue[i - 1] = v;
	switch (v) {
		case 1:
			Mns.dyn[i + "_sq"].set({a: -60});
			break;
		case 2:
			Mns.dyn[i + "_sq"].set({a: 0});
			break;
		case 3:
			Mns.dyn[i + "_sq"].set({a: 60});
			break;
	}
}

function calcI() {
	var f = 0;
	for (var i = 0; i < 3; ++i)
		if (inp[i])
			f += 25;
	fi = f;
	Mns.dyn["i_f"].set({v: fi});
}

function calcO() {
	var f = 0;
	for (var i = 0; i < 3; ++i)
		if (out[i])
			f += 30;
	fo = f;
	Mns.dyn["o_f"].set({v: fo});
}

function cycle() {
	l += (fi - fo) * 0.1;
	if (l < 0)
		l = 0;
	if (l > 100)
		l = 100;
	Mns.dyn["t_l"].set({v: l});
	Mns.dyn["t_ll"].set({f: l < 5 ? "red" : "black"});
	Mns.dyn["t_hh"].set({f: l > 95 ? "red" : "black"});
	if (l >= 85)
		n = 3;
	else if (l >= 70) {
		if (n < 2)
			n = 2;
	} else if (l >= 55) {
		if (n < 1)
			n = 1;
	} else if (l <= 15)
		n = 0;
	var a = n;
	for (var i = 0; i < 3; ++i)
		if (out[i] && !auto[i])
			--a;
	if (a < 0)
		a = 0;
	var q = [];
	for (var i = 1; i <= 3; ++i)
		for (var j = 0; j < 3; ++j)
			if (queue[j] == i && auto[j])
				q.push(j);
	var f = false;
	for (var i = 0, ll = q.length; i < ll; ++i)
		if (a) {
			if (!out[q[i]]) {
				Mns.dyn[q[i] + 1 + "_p"].set({f: "lime"});
				out[q[i]] = true;
				f = true;
			}
			--a;
		} else if (out[q[i]]) {
			Mns.dyn[q[i] + 1 + "_p"].set({f: "gray"});
			out[q[i]] = false;
			f = true;
		}
	Mns.dyn["w"].set({f: a ? "red" : "#505050"});
	if (f)
		calcO();
}


