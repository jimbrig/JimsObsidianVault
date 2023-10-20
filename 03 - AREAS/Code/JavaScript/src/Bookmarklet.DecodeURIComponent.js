javascript: void(() => {
    try {
        prompt('Decoded text:', decodeURIComponent(prompt('Decode URI Component:') ?? (function(){throw null;}())))
    } catch (e) {
        e && alert(e);
    }
})()
