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
					case "1":
						Mns.dyn[id].set({transform: "scale(" + (Math.random() * 2 + 0.3) + "," +
							(Math.random() * 2 + 0.3) + ")"});
						break;
					case "2":
						Mns.dyn[id].set({transform: "translate(" + Mns.randInt(0, 10) + "," +
								Mns.randInt(0, 10) + ")"});
						break;
					case "3":
						Mns.dyn[id].set({transform: "rotate(" + Mns.randInt(-180, 180) + ", 12.5, 76)"});
						break;
					case "4":
					case "5":
						Mns.dyn[id].set({
							fill: Mns.randColor(),
							stroke: Mns.randColor()
						});
						break;
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