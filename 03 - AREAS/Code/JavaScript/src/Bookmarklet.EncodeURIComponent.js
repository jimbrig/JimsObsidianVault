javascript: void(() => {
    try {
        prompt('Decoded text:', encodeURIComponent(prompt('Encode URI Component:') ?? (function(){throw null;}())))
    } catch (e) {
        e && alert(e);
    }
})()
