/**
 * @function formatCompactNumber
 * @description Formats a number in a compact format, e.g. 1,000,000 becomes 1M.
 * @details Utilizes the Intl.NumberFormat API Constructor to create a formatter object that formats numbers according
 *          to user's locale and options specified in the constructor. See the Reference links below for more details.
 * @param {number} number (Required) The number to format.
 * @param {string} locale (Optional) The locale to use. Defaults to "en".
 * @param {Object} options (Optional) The options to use. Defaults to { notation: "compact" }.
 * @returns {string} Formatted Number String.
 * @author Jimmy Briggs <jimmy.briggs@jimbrig.com>>
 * @example
 * > formatCompactNumber(1000000);
 * > "1M"
 * @link https://www.freecodecamp.org/news/format-compact-numbers-with-javascript/
 * @link https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl
 * @link https://norbertlindenberg.com/2012/12/ecmascript-internationalization-api/index.html
 */
function formatCompactNumber(number, locale = "en", options = { notation: "compact" }) {
	const formatter = Intl.NumberFormat(locale, options);
	return formatter.format(number);
};
