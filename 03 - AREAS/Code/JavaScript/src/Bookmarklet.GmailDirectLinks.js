javascript: (async function () {
    try {
        messageId = document
            .querySelector("div[data-legacy-message-id]")
            .getAttribute("data-legacy-message-id");
        user = location.pathname.match(/\/u\/(\d)/)[1];
        await navigator.clipboard.writeText(
            "https://mail.google.com/mail/u/" + user + "/#inbox/" + messageId
        );
    } catch (e) {
        console.error(e);
    }
})();
