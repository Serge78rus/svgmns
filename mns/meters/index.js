/**
 *
 */

var dyn = false;

$(function() {
	Mns.setup({
		onRdy: init,
		onBtnClick: click
	});
});

function init() {
	setInterval(function(){
		if (dyn)
			for (var id in Mns.dyn)
				switch (id) {
					case "dyn_b":
					case "dyn_l":
						break;
					default:
						Mns.dyn[id].rand();
				}
	}, 1000);
}

function click(id) {
	switch (id) {
		case "dyn_b":
			Mns.dyn["dyn_l"].set({f: (dyn = !dyn) ? "green" : "black"});
			break;
	}
}