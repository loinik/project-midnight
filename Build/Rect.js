class rect {
    New(x_start, y_start, x_end, y_end) {
        let width = x_end - x_start;
        let height = y_end - y_start;

        let obj = {
            "x": x_start,
            "y": y_start,
            "width": width,
            "height": height
        }

        return obj;
    }
}