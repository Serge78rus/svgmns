/**
 *
 */
var metar, mnsrdy;

$(function() {
	Mns.setup({onRdy: function() {
	  mnsrdy = true;
		init();
	}});


	$.getJSON("/getmetar", function(data) {
		metar = data;
		init();
	});
});


function init() {
  if (metar && mnsrdy) {
    var a = metar.gmt.split(" ");
		Mns.dyn["gmt"].set({t: a[0]});
		Mns.dyn["gmt1"].set({t: a[1]});

    a = metar.dt.split(" ");
		Mns.dyn["dt"].set({t: a[0]});
		Mns.dyn["dt1"].set({t: a[1]});

		Mns.dyn["wd"].set({t: metar.wd});
		Mns.dyn["w"].set({t: metar.w});
		Mns.dyn["wm"].set({t: metar.wm});
		Mns.dyn["wf1"].set({t: metar.wf1});
		Mns.dyn["wf2"].set({t: metar.wf2});
		Mns.dyn["t"].set({t: metar.t});
		Mns.dyn["dp"].set({t: metar.dp});
		Mns.dyn["rh"].set({t: metar.rh});
		Mns.dyn["p"].set({t: metar.p});

		Mns.dyn["l_t"].set({t: metar.t});
		Mns.dyn["g_t"].set({v: metar.t + 50});

		Mns.dyn["l_dp"].set({t: metar.dp});
		Mns.dyn["g_dp"].set({v: metar.dp + 50});

		Mns.dyn["l_p"].set({t: metar.p});
		Mns.dyn["l_p1"].set({t: metar.p * 0.75});
		Mns.dyn["g_p"].set({v: (metar.p - 850) / 2.5});

	}
}

