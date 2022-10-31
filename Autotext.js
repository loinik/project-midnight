class autotextInit {
    Create(text) {
        Object.entries(text).forEach(([key, value]) => {
            autotext_Temp[key] = value;
        }); 
    }
}

class autotextBoot {
    Load() {
        autotext = autotext_Temp;
    }
}