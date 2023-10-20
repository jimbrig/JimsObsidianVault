/*
DataviewJS script to turn a list of events into a nice visual calendar representation.
Alternatively you can provide YAML start-date and end-date field names, and the script will find all
matching notes and display those as events.
Step 1:
Add a list to a note in this format:
- 2022-09-05 to 2022-09-16 | Conference in Houston
- 2022-10-04 to 2022-10-11 | [[Holiday in Bali]] | (this one is a link to a page)
- 2022-10-20 to 2022-10-23 | Weekend in Vermont
Step 2:
Download the Dataview script and save it wherever you store your script files:
https://gist.github.com/alangrainger/bd93671d5d6f249bc5c9fd96e4a30fa1
Step 3:
Add this Dataview snippet to the page, changing the location to your location from step 2:
```dataviewjs
dv.view('Scripts/Dataview/trip-calendar')
```
And you'll end up with a nice calendar of upcoming events:
![](https://i.imgur.com/qgIVHEC.png)
Alternatively you can provide YAML start-date and end-date fields as a configuration option,
and the script will find all notes with those fields, and use the dates for the calendar.
```dataviewjs
dv.view('Scripts/Dataview/trip-calendar', {
  yamlStartField: 'trip_start',
  yamlEndField: 'trip_end'
})
```
v1.0.4
*/

const colours = [
    "#004949",
    "#009292",
    "#490092",
    "#162556",
    "#2e6b9c",
    "#48a9d9",
    "#240c66",
    "#743fba",
    "#a451c7",
    "#79100e",
    "#b32d2d",
    "#d1593a",
];
const fontSize = "12px";

// CSS styles
const cssTransparent = "border:transparent;background:transparent;";
const cssTd = `font-size:${fontSize};`;
const cssTdBlank =
    cssTd +
    "background:transparent;border-left-color:transparent;border-right-color:transparent;";
const cssNoPadding = "margin:0;padding:0;";

const trips = [],
    now = moment(),
    ec = { count: 0 };
if (input?.yamlStartField) {
    // Get list of trips using YAML fields
    trips.push(
        ...dv
            .pages()
            .where(
                (x) => x[input.yamlStartField]?.ts && x[input.yamlEndField]?.ts > now
            )
            .array()
            .map((x) => {
                return {
                    start: moment(x[input.yamlStartField].ts),
                    end: moment(x[input.yamlEndField].ts),
                    title: x.file.name,
                    details: null,
                    path: x.file.path,
                };
            })
    );
} else {
    // Process trip data from markdown list
    const data = dv
        .current()
        .file.lists.values.filter((x) =>
            x.text.match(/^\d{4}-\d{2}-\d{2} to \d{4}-\d{2}-\d{2}/)
        );
    for (const trip of data) {
        const parts = trip.text.split("|").map((x) => x.trim());
        const [start, end] = parts[0]
            .match(/^(\d{4}-\d{2}-\d{2}).*?(\d{4}-\d{2}-\d{2})/)
            .slice(1, 3)
            .map((x) => moment(x));
        if (end > now) {
            const page = dv.page(dv.parse(parts[1]));
            trips.push({
                start,
                end,
                title: page?.file?.name || parts[1],
                details: parts[2],
                path: page?.file?.path,
            });
        }
    }
}
if (!trips.length) return;
trips.sort((a, b) => a.start - b.start);

/**
 * Keep colours consistent between repeats of the same event
 * @param {string} title
 * @returns {string}
 */
function eventColour(title) {
    if (!ec[title]) {
        ec[title] = colours[ec.count];
        ec.count = ec.count < colours.length - 1 ? ec.count + 1 : 0;
    }
    return `background:${ec[title]};border:${ec[title]};`;
}

/**
 * Compute the longest consecutive stretch of days inside a week for this trip
 * @param {Object} trip
 * @returns {{weeks: string[], length: number}}
 */
function getLongestWeek(trip) {
    let weeks = {};
    for (let i = 0; i <= trip.end.diff(trip.start, "days"); i++) {
        const week = trip.start.clone().add(i, "days").format("MMWW");
        weeks[week] = weeks[week] ? weeks[week] + 1 : 1;
    }
    weeks = Object.keys(weeks)
        .map((x) => {
            return { week: x, count: weeks[x] };
        })
        .sort((a, b) => b.count - a.count)
        .filter((x, _, a) => x.count === a[0].count);
    return {
        weeks: weeks.map((x) => x.week),
        length: weeks[0].count,
    };
}

/**
 * Generate an HTML element
 * @param {string} element
 * @param {string|number|null} [contents]
 * @param {Object} [attributes]
 * @returns {string}
 */
function el(element, contents = "", attributes = {}) {
    return `<${element} ${Object.keys(attributes)
        .map((k) => k + `="${attributes[k]}"`)
        .join(" ")}>${contents}</${element}>`;
}

function createMonth(date, events) {
    const theMonth = moment(date).startOf("month");
    const endOfMonth = theMonth.clone().endOf("month");
    // Get just the events this month
    events = events.filter((x) => x.start < endOfMonth && x.end > theMonth);
    // Compute the longest week(s) for each event
    for (const event of events) {
        event.w = getLongestWeek(event);
    }
    let html = "<p><b>" + theMonth.format("MMMM YYYY") + "</b></p>"; // Month heading
    html += "<table>";

    // Day of the week header row
    html += el(
        "tr",
        ["M", "T", "W", "T", "F", "S", "S"]
            .map((day) => el("th", day, { style: cssTd }))
            .join("")
    );
    // Blank cells at start of month
    html +=
        "<tr>" +
        el("td", "&nbsp;", { style: cssTdBlank }).repeat(+theMonth.format("E") - 1);

    // Render the month
    let skip = 0,
        title,
        lastTitle;
    const lastDay = ~~endOfMonth.format("D");
    for (let i = 0; i < lastDay; i++) {
        if (skip) {
            i += skip - 1;
            skip = 0;
        } // Event cell uses colspan, so skip the rest of the days for this week
        const day = theMonth.clone().add(i, "days"),
            colspan = {},
            event = events.filter((e) => e.start <= day && e.end >= day)[0],
            today = day.isSame(now, "day") ? "background:#55f;" : null,
            colour = event ? eventColour(event.title) : today || "opacity:0.3;";
        title = i + 1;
        if (event) {
            title = "&nbsp;";
            if (event.w.weeks.includes(day.format("MMWW"))) {
                skip = event.w.length;
                colspan.colspan = skip;
            }
            if (skip && lastTitle !== event.title) {
                title = event.path
                    ? el("a", event.title + " ↗", {
                        href: event.path,
                        class: "internal-link",
                        style: "color:white;font-weight:bold;",
                    })
                    : event.title;
                lastTitle = event.title;
            }
        }
        html += el("td", title, { style: cssTd + colour, ...colspan });
        if (skip + +day.format("E") > 6) {
            // It's a Sunday, close off the week
            html += `</tr><tr>`;
        }
    }
    html += "</tr></table>";
    return html;
}

// Generate the calendar
let html = `<table style="${cssTransparent}">`;
const startMonth = now.clone().startOf("month");
const months = trips.slice(-1)[0].end.diff(startMonth, "months");
const columns = window.innerWidth < 800 ? 1 : 2; // 1 column on mobile, 2 on desktop
for (let i = 0; i <= months; i += columns) {
    html += el(
        "tr",
        [0, 1]
            .slice(0, columns)
            .map((x) =>
                el("td", createMonth(startMonth.clone().add(i + x, "months"), trips), {
                    style: cssTransparent,
                })
            )
            .join(""),
        { style: cssNoPadding }
    );
}
html += "</table>";
dv.el("div", html);
