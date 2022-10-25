class cursorInit {
    Create(cursors) {
        for (var cursor in cursors) {
            var obj = cursors[cursor];
            if(obj.source && obj.ovl) {
                document.querySelector("#cursor")
                    .append(AR.Overlay({
                        ovl: obj.ovl,
                        source: obj.source,
                        id: cursor,
                        active: (cursor == cursors.default) ? true : false
                    })
                );
            }
        };
    }
    Set(type) {
        document.querySelectorAll("#cursor *").forEach(element => {
            element.style.visibility = "hidden";
        });
        document.querySelector(`#${type}`).style.visibility = "visible";
    }
}