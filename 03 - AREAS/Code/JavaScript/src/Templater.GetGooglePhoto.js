<%*

// You can create any number of resolution options that you want to select from
const resolutions = [
    {
        name: "Thumbnail", // A friendly name
        res: [350, 250], // Width by height. The image will maintain aspect ratio
    },
    {
        name: "Large",
        res: [1280, 720],
    },
];

// Prompt for the Google Photos share link
const link = await tp.system.prompt("Enter the Google Photos share link");
const types = {
    link: "As a link",
    remote: "As an image (remote)",
    local: "As an image (saved locally)",
};

if (link && link.startsWith("https://photos.app.goo.gl/")) {
    const type = await tp.system.suggester(
        Object.values(types),
        Object.keys(types)
    );
    if (type === "link") {
        return `[Link](${link})`;
    } else {
        // Prompt for the download size
        let size;
        if (resolutions.length === 1) {
            size = resolutions[0].res;
        } else {
            size = await tp.system.suggester(
                resolutions.map((x) => x.name),
                resolutions.map((x) => x.res)
            );
        }
        if (!size) return ""; // no resolution was selected

        // Fetch the actual photo image URL from the provided Google Photos link
        try {
            const raw = await requestUrl({ url: link });
            const html = raw.text;
            // Note: this line is written as a single-quoted RegExp because Templater has difficulty processing the regex otherwise
            const image = html.match(
                new RegExp(
                    '<img[^>]*?src="(https:[^"]+?)=w\\d+-h\\d+-no"[^>]*?alt=""[^>]*?>',
                    "s"
                )
            )[1];
            // Generate the download link for the thumbnail image file
            const thumbnail = `${image}=w${size[0]}-h${size[1]}-no`;
            if (type === "remote") {
                // For a remote image, use the Markdown syntax to embed the remote thumbnail file
                // and point the link to the remote fullsize image
                return `[![](${thumbnail})](${link})\n`;
            } else if (type === "local") {
                // For a local image, download the thumbnail image and save to the current note's folder
                const folder = tp.file.path(true).replace(/[^/]+$/, "");
                const filename =
                    moment().format("YYYY-MM-DD") +
                    "_google-photo_" +
                    moment().format("HHmmss") +
                    ".jpg";
                const imageData = await requestUrl({ url: thumbnail });
                await app.vault.adapter.writeBinary(
                    folder + filename,
                    imageData.arrayBuffer
                );
                // Return the link with local thumbnail pointing to remote fullsize image
                return `[![](${filename})](${link})\n`;
            }
        } catch (e) {
            // do nothing
        }
    }
}
return "";

%>
