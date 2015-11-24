/**
 *
 */

$(function() {
	Mns.setup({
		onBtnClick: click
	});
});

function click(id) {
	var b = id.split("_");
	switch (b[1]) {
		case "b0":
			Mns.dyn[b[0] + "_v"].set({f: "yellow"});
			setTimeout(function(){
				Mns.dyn[b[0] + "_v"].set({f: "gray"});
				Mns.dyn[b[0] + "_p"].set({f: "gray"});
				var v = 80;
				setTimeout(function f(){
					if ((v *= 0.8) > 1)
						setTimeout(f, 50);
					else
						v = 0;
					Mns.dyn[b[0] + "_m"].set({v: v});
				}, 50);
			}, 1000);
			break;
		case "b1":
			Mns.dyn[b[0] + "_p"].set({f: "lime"});
			Mns.dyn[b[0] + "_v"].set({f: "yellow"});
			setTimeout(function(){Mns.dyn[b[0] + "_v"].set({f: "lime"});}, 1000);
			var v = 80;
			setTimeout(function f(){
				if ((v *= 0.8) > 1)
					setTimeout(f, 50);
				else
					v = 0;
				Mns.dyn[b[0] + "_m"].set({v: 80 - v});
			}, 50);
			break;
	}
}