/**
 *
 */

$(function() {
	Mns.setup({
		onRdy: function() {
			var f = false, l = 50;
			setInterval(function() {
				Mns.dyn["l"].set({v: f ? --l : ++l});
				Mns.dyn["ll"].set({v: l});
				if (l < 30 && f) {
					Mns.dyn["p"].set({f: "gray"});
					f = false;
				}	else if (l > 70 && !f) {
					Mns.dyn["p"].set({f: "lime"});
					f = true;
				}
			}, 1000);
		}
	});
});

