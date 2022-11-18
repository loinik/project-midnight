class flagsInit {
    Create(fl) {
        Object.entries(fl).forEach(([key, value]) => {
            Flags[key] = (value) ? value : false;
        });
    }
}