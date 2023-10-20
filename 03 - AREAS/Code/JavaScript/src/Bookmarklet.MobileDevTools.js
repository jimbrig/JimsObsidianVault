javascript: void(() => {
    const script = document.createElement('script');
    script.crossOrigin = 'anonymous';
    script.integrity = 'sha256-Zz2LCa5JP/pTvQZgI64e/nH4Wp84M2rLGUb2AtrGtPY=';
    script.onload = () => eruda.init();
    script.src = 'https://cdn.jsdelivr.net/npm/eruda@2.4.1/eruda.js';
    document.head.appendChild(script);
})();
