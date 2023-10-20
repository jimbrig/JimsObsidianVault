javascript: void(async () => {
    try {
        prompt('Selected HEX color:', (await new EyeDropper().open()).sRGBHex);
    } catch (e) {
        alert(e);
    }
})()
